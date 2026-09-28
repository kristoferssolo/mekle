#!/usr/bin/env bash
set -euo pipefail

package="${1:?package name required}"
case "$package" in
mekle | mekle-bin | mekle-git) ;;
*)
    echo "Unknown package: $package" >&2
    exit 1
    ;;
esac

repo_root="$(git rev-parse --show-toplevel)"
package_dir="$repo_root/aur/$package"
archive=''

cleanup() {
    if [[ -n "$archive" ]]; then rm -f "$archive"; fi
}
trap cleanup EXIT

if [[ "$package" == mekle-git ]]; then
    version="$(sed -n '/^\[package\]/,/^\[/{s/^version = "\([^"]*\)"/\1/p;}' "$repo_root/Cargo.toml" | head -n 1)"
    revision="$(git -C "$repo_root" rev-list --count HEAD)"
    commit="$(git -C "$repo_root" rev-parse --short=7 HEAD)"
    version="$version.r$revision.g$commit"
else
    version="${2:?release version required}"
fi

if [[ ! "$version" =~ ^[0-9]+\.[0-9]+\.[0-9]+(\.r[0-9]+\.g[0-9a-f]+)?$ ]]; then
    echo "Invalid package version: $version" >&2
    exit 1
fi

sed -i "s/^pkgver=.*/pkgver=$version/" "$package_dir/PKGBUILD"

if [[ "$package" == mekle ]]; then
    archive="$(mktemp)"
    curl -fL --retry 3 -o "$archive" "https://github.com/kristoferssolo/mekle/archive/refs/tags/v$version.tar.gz"
    checksum="$(sha256sum "$archive" | cut -d ' ' -f 1)"
    sed -i "s/^sha256sums=.*/sha256sums=('$checksum')/" "$package_dir/PKGBUILD"
elif [[ "$package" == mekle-bin ]]; then
    archive="$(mktemp)"
    curl -fL --retry 3 -o "$archive" "https://raw.githubusercontent.com/kristoferssolo/mekle/v$version/config/config.toml"
    checksum="$(sha256sum "$archive" | cut -d ' ' -f 1)"
    sed -i "s/^sha256sums=.*/sha256sums=('$checksum')/" "$package_dir/PKGBUILD"

    for arch in x86_64 aarch64; do
        asset="mekle-$version-$arch-unknown-linux-gnu.tar.gz"
        checksum_file="$(mktemp)"
        curl -fL --retry 3 -o "$checksum_file" "https://github.com/kristoferssolo/mekle/releases/download/v$version/$asset.sha256"
        read -r checksum filename <"$checksum_file"
        rm -f "$checksum_file"
        if [[ "$filename" != "$asset" || ! "$checksum" =~ ^[0-9a-f]{64}$ ]]; then
            echo "Invalid checksum for $asset" >&2
            exit 1
        fi
        sed -i "s/^sha256sums_$arch=.*/sha256sums_$arch=('$checksum')/" "$package_dir/PKGBUILD"
    done
fi
