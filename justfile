export RUST_LOG := env("RUST_LOG", "mekle=debug")
export RUST_BACKTRACE := env("RUST_BACKTRACE", "1")
export RUST_SPANTRACE := env("RUST_SPANTRACE", "1")

set shell := ["bash", "-euo", "pipefail", "-c"]

alias a := audit
alias b := build
alias c := check
alias f := fmt
alias i := install
alias r := run
alias rr := run-release
alias t := test

# List available recipes
default:
    @just --list

# Run the full pre-commit workflow
[group("checks")]
ci: fmt check

# Run formatting, Clippy, test, and documentation checks
[group("checks")]
check: fmt-check clippy test doc

# Format the workspace
[group("checks")]
fmt:
    cargo fmt --all

# Fail if anything is unformatted
[group("checks")]
fmt-check:
    cargo fmt --all -- --check

# Lint all workspace targets
[group("checks")]
clippy:
    cargo clippy --workspace --all-features --all-targets -- --deny warnings

# Run the test suite
[group("checks")]
test *ARGS:
    cargo nextest run --workspace --all-features {{ ARGS }}

# Build documentation, including private items
[group("checks")]
doc *ARGS:
    RUSTDOCFLAGS="-D warnings" cargo doc \
        --workspace \
        --all-features \
        --document-private-items \
        --no-deps \
        {{ ARGS }}

# Run mekle
[group("run")]
run *ARGS:
    cargo run -- {{ ARGS }}

# Run an optimized build of mekle
[group("run")]
run-release *ARGS:
    cargo run --release -- {{ ARGS }}

# Build the entire workspace
[group("build")]
build:
    cargo build --workspace --all-features

# Build the entire workspace in release mode
[group("build")]
build-release:
    cargo build --release --workspace --all-features

# Install mekle from this checkout
[group("build")]
install:
    cargo install --path . --locked

# Watch the workspace during development
[group("development")]
watch:
    bacon

# Run benchmarks
[group("development")]
bench *ARGS:
    cargo bench --bench benchmark -- {{ ARGS }}

# Show dependency updates without modifying Cargo.lock
[group("dependencies")]
outdated:
    cargo update --dry-run --verbose

# Update dependencies within Cargo.toml constraints
[group("dependencies")]
update:
    cargo update

# Audit dependencies for known advisories
[group("dependencies")]
audit:
    cargo audit

# cliff.toml falls back to GITHUB_REPOSITORY for links when the branch has no upstream
# Regenerate CHANGELOG.md; pass --tag vX.Y.Z to name unreleased changes
[group("release")]
changelog *ARGS:
    origin="$(git remote get-url origin 2>/dev/null || true)"; repo="${origin#*github.com[:/]}"; repo="${repo#443/}"; \
        GITHUB_REPOSITORY="${GITHUB_REPOSITORY:-${repo%.git}}" git cliff --output CHANGELOG.md {{ ARGS }}

# Remove build artifacts
[group("maintenance")]
clean:
    cargo clean

# mise builds cargo tools outside the checkout, where rust-toolchain.toml does not apply,
# so RUSTUP_TOOLCHAIN passes the repository toolchain to them.
# Install the Rust toolchain and the tools pinned in mise.toml
[group("maintenance")]
setup:
    rustup toolchain install
    toolchain="$(rustup show active-toolchain)"; RUSTUP_TOOLCHAIN="${toolchain%% *}" mise install
