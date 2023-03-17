#!/usr/bin/env bash

script_path="$(realpath "${BASH_SOURCE[0]}")"
script_root="$(dirname "$script_path")"
subrepo="$script_root/git-subrepo"
launch="$subrepo/.rc"

# shellcheck disable=SC1090
. "$launch"
