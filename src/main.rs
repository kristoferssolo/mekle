use color_eyre::{
    config::HookBuilder,
    eyre::{Result, WrapErr},
};
use mekle::{
    completions,
    config::{Config, HistoryCommand, Invocation, ProjectAction, cli_command},
    error::Error,
    finder::{ProjectFinder, root::RootResolver},
    history::{History, HistoryEntry, ScoreChange},
    output::{include_pinned, rank_projects, write_entries, write_projects},
    paths,
};
use std::{
    io::{stderr, stdout},
    path::{Path, PathBuf},
};
use tracing::{Level, info};
use tracing_subscriber::{EnvFilter, FmtSubscriber};

fn main() -> Result<()> {
    HookBuilder::default()
        .display_location_section(false)
        .display_env_section(false)
        .install()?;

    match Invocation::load().wrap_err("Failed to load arguments")? {
        Invocation::Find(config) => find_projects(config),
        Invocation::Completions(shell) => {
            completions::generate(shell, &mut cli_command(), &mut stdout())?;
            Ok(())
        }
        Invocation::Init(shell) => {
            print!("{}", shell.init());
            Ok(())
        }
        Invocation::Project {
            action,
            path,
            config,
        } => change_project(action, &path, &config),
        Invocation::History(command) => manage_history(command),
    }
}

fn find_projects(config: Config) -> Result<()> {
    init_logging(config.verbose)?;

    // A broken history should fail before the scan, not after it. It is read
    // again afterwards so a long scan cannot rank with stale scores.
    open_history()?;

    // Ranking needs the complete result set, so the limit is applied last.
    let max_results = config.max_results;
    let output = config.output;
    let mut projects = ProjectFinder::new(config)
        .find_project_details()
        .wrap_err("Failed to find projects")?;

    let history = open_history()?.entries()?;
    include_pinned(&mut projects, &history)?;
    let mut projects = rank_projects(projects, &history);
    if let Some(max) = max_results {
        projects.truncate(max.get());
    }

    let stdout = stdout();
    write_projects(
        &mut stdout.lock(),
        &projects,
        output,
        paths::home().as_deref(),
    )?;
    Ok(())
}

/// Applies `action` to the project `path` belongs to.
///
/// Errors surface in a fixed order per action: `add` reports an unusable
/// history before a missing path, while `pin` and `unpin` do the opposite.
fn change_project(action: ProjectAction, path: &Path, config: &Config) -> Result<()> {
    init_logging(config.verbose)?;
    match action {
        ProjectAction::Add => {
            let mut history = open_history()?;
            history.record(&resolve_project(path, config)?)?;
        }
        ProjectAction::Pin => {
            let project = resolve_project(path, config)?;
            open_history()?.pin(&project)?;
        }
        ProjectAction::Unpin => {
            let project = resolve_project(path, config)?;
            open_history()?.unpin(&project)?;
        }
    }
    Ok(())
}

/// Resolves a directory the user named to the project root discovery reports
/// for it, which is the path history records under.
fn resolve_project(path: &Path, config: &Config) -> Result<PathBuf> {
    if !path.is_dir() {
        return Err(Error::PathNotFound(path.to_path_buf()).into());
    }

    let project = RootResolver::from_config(config).resolve_directory(&paths::normalize(path)?)?;
    info!(
        "Resolved {} to project {}",
        path.display(),
        project.display()
    );
    Ok(project)
}

fn manage_history(command: HistoryCommand) -> Result<()> {
    let mut history = open_history()?;
    match command {
        HistoryCommand::List => print_entries(history.entries()?)?,
        HistoryCommand::Show { path } => {
            let path = paths::normalize(&path)?;
            let entry = history
                .entries()?
                .into_iter()
                .find(|entry| entry.path == path)
                .ok_or(Error::HistoryEntryNotFound(path))?;
            print_entries([entry])?;
        }
        HistoryCommand::Set { path, score } => {
            history.update(&paths::normalize(&path)?, ScoreChange::Set(score))?;
        }
        HistoryCommand::Adjust { path, delta } => {
            history.update(&paths::normalize(&path)?, ScoreChange::Adjust(delta))?;
        }
        HistoryCommand::Remove { path } => {
            history.update(&paths::normalize(&path)?, ScoreChange::Remove)?;
        }
        HistoryCommand::Prune => history.prune()?,
        HistoryCommand::Clear => history.clear()?,
    }
    Ok(())
}

fn open_history() -> Result<History> {
    let path = paths::history_file().ok_or(Error::HistoryLocationNotFound)?;
    Ok(History::open(path)?)
}

fn print_entries(entries: impl IntoIterator<Item = HistoryEntry>) -> Result<()> {
    let stdout = stdout();
    write_entries(&mut stdout.lock(), entries, paths::home().as_deref())?;
    Ok(())
}

/// Logs to stderr, keeping stdout free for results.
///
/// `RUST_LOG` takes precedence when set; otherwise only errors are shown, or
/// info too with `--verbose`.
fn init_logging(verbose: bool) -> Result<()> {
    let level = if verbose { Level::INFO } else { Level::ERROR };
    let filter = EnvFilter::builder()
        .with_default_directive(level.into())
        .from_env_lossy();
    let subscriber = FmtSubscriber::builder()
        .with_env_filter(filter)
        .with_writer(stderr)
        .finish();

    tracing::subscriber::set_global_default(subscriber).wrap_err("Failed to set up logging")
}
