#!/usr/bin/env bash

set -euxo pipefail

current() {
    aptitude search '~i !~M' -F '%p' --disable-columns 
}

default() {
    version="$(grep -oP 'VERSION="\K[0-9\.]+' /etc/os-release)"
    arch="$(dpkg --print-architecture)"
    
    manifest="https://old-releases.ubuntu.com/releases/$version/ubuntu-$version-desktop-$arch.manifest"
    wget -qO - "$manifest" | cut -f1 | cut -d: -f1
}

manifest_path="${1:-$PWD/manifests/}"
mkdir -p "$manifest_path"

installed_manifest="$manifest_path/current.manifest"
default_manifest="$manifest_path/default.manifest"

current | sort -u > "$installed_manifest"
default | sort -u > "$default_manifest"

user_manifest="$manifest_path/user.manifest"
comm -23 "$installed_manifest" "$default_manifest" > "$user_manifest"
