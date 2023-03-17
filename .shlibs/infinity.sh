#!/usr/bin/env bash

script_path="$(realpath ${BASH_SOURCE[0]})"
script_root="$(dirname "$script_path")"
infinity="$script_root/bash-oo-framework"
launch="$infinity/your-script.sh"

. "$launch"
