#!/usr/bin/env bash

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) exit 0 ;;
esac

# Anonymous source-if-exists function
_() {
    local file
    for file in "$@"; do
        if [ -f "$file" ] && [ -r "$file" ]; then
            # shellcheck disable=SC1090
            source "$file"
        fi
    done
}

ROOT="$(dirname $0)"
_ "$ROOT/.functions"
strict_env _ "$ROOT/.exports"
strict_env _ "$ROOT/.paths"
strict_env _ "$ROOT/.aliases"
_ "$ROOT/.shopts"
_ "$ROOT/.completions"
_ "$ROOT/.imports"

unset -f _
