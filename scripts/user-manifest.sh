#!/usr/bin/env bash
set -euo pipefail

script=$(realpath "$0")
script_dir=$(dirname "$script")

# shellcheck source-path=SCRIPTDIR
source "$script_dir/merge-manifests.sh"

current() {
    names <(dpkg-query --showformat='${Package}\n' --show)
}

recovery_root="${1:-/recovery}"
default() {
    recovery="$recovery_root"
    recovery_uuid="$(findmnt -n -o UUID "$recovery")"
    recovery_fs="$recovery/casper-$recovery_uuid/"

    base="$recovery_fs/filesystem.manifest"
    rem="$recovery_fs/filesystem.manifest-remove"
    names <(merge "$base" "$rem")
}

packages() {
    merge <(current) <(default "$recovery_root")
}

if [ "$0" = "${BASH_SOURCE[0]}" ]; then
    packages
fi

set +euo pipefail
