# mekle

**Your projects, ready to find.**

The name `mekle` comes from Latvian *meklē*, meaning "search" or "look for".

[![crates.io version](https://img.shields.io/crates/v/mekle)](https://crates.io/crates/mekle)
[![CI status](https://github.com/kristoferssolo/mekle/actions/workflows/ci.yml/badge.svg)](https://github.com/kristoferssolo/mekle/actions/workflows/ci.yml)

Find coding projects under your source directories, including ones you've
never opened. Mekle recognizes Git repositories and project files, remembers
the projects you visit, and keeps your pinned favorites at the top.

```sh
mekle ~/src ~/work # Find project roots
m                  # Pick a project and jump there, after shell setup
```

Use the path list in your own scripts, or pick a project with the built-in
shell integration for Bash, Zsh, Fish, and Elvish.

[Quick start](#quick-start) / [Shell setup](#jump-to-a-project) / [Configuration](#configuration) / [CLI reference](#usage)

## Install

With Rust and Cargo installed:

```sh
cargo install mekle
```

## Quick start

```sh
# Find projects under your source directories
mekle ~/src ~/work

# Record a visit so a project ranks higher next time
mekle add ~/src/mekle

# Keep a project above unpinned results
mekle pin ~/src/mekle
```

Running `mekle` without paths searches the current directory by default. Set
`search_dirs` in `~/.config/mekle/config.toml` to search your usual locations:

```toml
search_dirs = ["~/src", "~/work"]
```

If you set `XDG_CONFIG_HOME`, use `$XDG_CONFIG_HOME/mekle/config.toml` instead.

## Jump to a project

`mekle init <SHELL>` defines `m`, which lists projects in `fzf`, changes to the
selected directory, and records the visit. Add the command for your shell to
its startup file:

<details>
<summary>Bash</summary>

Add this to the end of your shell config, usually `~/.bashrc`:

```bash
eval "$(mekle init bash)"
```

</details>

<details>
<summary>Zsh</summary>

Add this to the end of your shell config, usually `~/.zshrc`:

```zsh
eval "$(mekle init zsh)"
```

</details>

<details>
<summary>Fish</summary>

Add this to the end of your shell config, usually `~/.config/fish/config.fish`:

```fish
mekle init fish | source
```

</details>

<details>
<summary>Elvish</summary>

Add this to the end of your shell config, usually `~/.config/elvish/rc.elv`:

```elvish
eval (mekle init elvish | slurp)
```

</details>

Start a new shell to use `m`.

`m` accepts search paths and options such as `--depth` and `--exclude`.

For example, `m ~/src` opens the picker, changes to the selected project,
and records the visit. Ordinary `cd` commands do not update mekle's history.
Use the default path output with `m`; `--json` and `--null` are for scripts.

## Usage

```text
mekle [OPTIONS] [PATHS]... [COMMAND]
```

- `-d, --depth <DEPTH>` limits traversal depth (default: `5`).
- `-n, --max-results <MAX_RESULTS>` limits output.
- `-v, --verbose` prints progress to stderr.
- `--json` prints one JSON object per line.
- `-0, --null` prints uncontracted paths separated by NUL bytes.
- `--exclude <PATTERN>` skips entries matching a gitignore-style pattern,
  relative to each search directory. Repeatable, and appended to the
  configured `exclude` list.
- `PATHS` replaces configured search directories (default: `.`).

The default output prints one path per line and shortens paths under `$HOME` to
`~/...`. JSON and NUL output do not shorten paths.

```sh
mekle
mekle --depth 3 ~/src
mekle --verbose ~/src ~/work
mekle --json ~/src
mekle -0 ~/src | xargs -0 -n1 printf '%s\n'
mekle --exclude target/ --exclude '**/vendor/' ~/src
```

### Output for scripts

JSON output is newline-delimited. Each record has `path`, `score`, `frecency`,
`last_used`, `pinned`, and `markers`. `last_used` is a Unix timestamp, or
`null` for a project that is not in the history. Untracked projects have a
score and frecency of `0`, and a pinned directory that discovery never
classified has an empty `markers` list.

## Project ranking

`mekle add <PATH>` records a project visit. Results are ordered as follows:

1. Pinned projects, ranked by recent and frequent use.
2. Other visited projects, ranked the same way.
3. Projects with no history, sorted by path.

This combination of frequency and recency is called frecency. A project's
first recorded visit gives it a score of `1`; each later visit adds `1`. The
time since the last visit adjusts that score:

| Last visit | Weight |
| --- | ---: |
| Less than one hour ago | `score * 4` |
| Less than one day ago | `score * 2` |
| Less than one week ago | `score / 2` |
| One week ago or older | `score / 4` |

When the sum of stored scores exceeds `10,000`, mekle reduces all scores to
about 90 percent of that limit and removes unpinned entries that fall below `1`.

### Pinned projects

Pin a project to keep it above all unpinned results, even when you have not
opened it recently.

```sh
mekle pin ~/src/mekle
mekle unpin ~/src/mekle
```

Both commands take any directory inside a project and resolve it to the same
root `mekle add` would record, so `mekle pin .` works from anywhere in the
tree. A pinned project ranks above every unpinned one whatever its frecency,
pinned projects rank against each other by frecency, and aging never drops a
pinned project. Pinning a project mekle has not seen records it with a score of
`1`; unpinning leaves the score and the last visit alone.

A pin is listed whether or not the search would have found it. That covers a
project outside every search directory, and a plain directory that holds no
marker file at all, so `mekle pin ~/notes` puts `~/notes` at the top of the
list. Such a directory is reported with an empty `markers` list, since nothing
classified it as a project. A pin whose directory no longer exists is left out
of the listing rather than reported; `mekle history prune` clears it for good,
and `mekle history remove` drops a pinned entry like any other.

Because an explicit pin outranks a pattern, a pinned project is listed even
when `exclude` would have skipped it.

History is stored at `$XDG_DATA_HOME/mekle/history.toml`, falling back to
`$HOME/.local/share/mekle/history.toml`.

### Managing history

```sh
mekle history list
mekle history show ~/src/mekle
mekle history set ~/src/mekle 20
mekle history adjust ~/src/mekle 5
mekle history adjust ~/src/mekle -5
mekle history remove ~/src/mekle
mekle history prune
mekle history clear
```

`list` and `show` print tab-separated raw score, weighted score, time since the
last visit, `pinned` or `-`, and path. `set` creates a missing entry.
`adjust` requires an existing entry and removes it when the result falls
below `1`. `prune` removes entries whose project paths no longer exist. `clear` removes the entire
history. Removing history does not hide a project from discovery. Use
`exclude` to skip it in future searches.

## Shell completions

`mekle completions <SHELL>` generates completions for Bash, Elvish, Fish, or
Zsh. With `bash-completion` installed, add the Bash script to its per-user
completion directory:

```sh
mkdir -p "${XDG_DATA_HOME:-$HOME/.local/share}/bash-completion/completions"
mekle completions bash >"${XDG_DATA_HOME:-$HOME/.local/share}/bash-completion/completions/mekle"
```

Start a new shell to load it.

## Configuration

Built-in defaults come from [`config/config.toml`](config/config.toml). User
configuration is read from `$XDG_CONFIG_HOME/mekle/config.toml`, falling back
to `$HOME/.config/mekle/config.toml`.

Configured fields replace their defaults; command-line options override both.
A leading `~` in `search_dirs` expands to `$HOME`.

```toml
search_dirs = ["~/src", "/home/me/work"]
depth = 5
exclude = ["target/", "**/vendor/", "/archive/", "*.generated.toml"]
```

To customize project detection, set `marker_files` or `workspace_files`. Each
list replaces the corresponding built-in list, so start with the
[default configuration](config/config.toml) if you want to extend it.

`exclude` holds gitignore-style patterns interpreted relative to each search
directory. Following gitignore rules, a pattern without a slash, such as
`*.generated.toml`, matches at any depth, while a pattern containing a slash,
such as `skip/Cargo.toml` or `/archive/`, matches only relative to the search
directory (`**/skip/Cargo.toml` matches at any depth). Excluded directories
are pruned and excluded files are skipped, on top of ignore files. Explicitly
pinned projects are still listed even if they match an exclusion.

## How projects are detected

Mekle recognizes a Git repository by its `.git` directory. It also recognizes
worktrees and submodules whose `.git` file points to an existing Git directory.
It skips `.git` contents during discovery.

`Cargo.toml`, `package.json`, and Deno manifests resolve to their workspace or
Git root. Build files resolve to the highest matching ancestor before a Git
boundary. Other markers resolve to their enclosing Git repository, or their
own directory when none exists.

Direct children of a project remain separate results; deeper descendants are
folded into their ancestor.
