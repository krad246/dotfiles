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

DOTFILES_ROOT="$(dirname ${BASH_SOURCE[@]})"
_ "$DOTFILES_ROOT/.functions"
strict_env _ "$DOTFILES_ROOT/.exports"
strict_env _ "$DOTFILES_ROOT/.paths"
strict_env _ "$DOTFILES_ROOT/.aliases"
strict_env _ "$DOTFILES_ROOT/.shopts"
strict_env _ "$DOTFILES_ROOT/.completions"
_ "$DOTFILES_ROOT/.imports"

unset -f _
