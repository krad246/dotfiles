#!/usr/bin/env bash

script_path="$(realpath "${BASH_SOURCE[0]}")"
script_root="$(dirname "$script_path")"

PATH_add "$script_root/git-extra-commands"
