# AUR publishing

Each package has its own `PKGBUILD`, `.SRCINFO`, and 0BSD license for the AUR
packaging files. `mekle` builds the tagged source archive. `mekle-bin` uses the
x86_64 and aarch64 Linux assets from the GitHub release. `mekle-git` builds the
current `main` branch.

Each AUR package includes a pacman install hook. It copies the packaged
configuration template to `/etc/xdg/mekle/config.toml` only when no file is
there. Upgrades leave an existing system config alone. The system config remains
after uninstalling the package.

The Publish workflow updates `mekle` and `mekle-bin` after it creates a tagged
GitHub release. The AUR workflow updates `mekle-git` on every push to `main`.
It can also be run manually to republish either channel. `prepare.sh` updates
the version and release checksums. The pinned
`KSXGitHub/github-actions-deploy-aur` action regenerates `.SRCINFO` and pushes
the three package files to AUR.

## Set up AUR access

1. Use a dedicated SSH key pair, such as `~/.ssh/aur` and `~/.ssh/aur.pub`.
   Create one with `ssh-keygen -t ed25519 -f ~/.ssh/aur -N ''` if needed.
2. Add `~/.ssh/aur.pub` to the SSH public keys in your AUR account.
3. Add the full contents of `~/.ssh/aur` as the GitHub Actions repository secret
   `AUR_SSH_PRIVATE_KEY`.

The three package names were unregistered when this automation was added, so
the first successful push creates their AUR repositories. An existing package
owned by another account cannot be updated with this key.

To publish the existing `v0.1.0` release after configuring the key, run the
`AUR` workflow with channel `release` and version `0.1.0`. Run it with channel
`git` to publish the current `main` commit immediately. Later releases and
pushes use the automatic triggers.
