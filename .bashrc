#!/usr/bin/env bash

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
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

# set up a basic standard library to pull from
_ "$HOME/.functions"

# discover exports we want (including paths)
_ "$HOME/.exports"

# pull in additional libraries and tools
_ "$HOME/.paths"

# then pull in the rest
_ "$HOME/.aliases"
_ "$HOME/.shopts"
_ "$HOME/.completions"

eval "$(starship init bash)"
eval "$(direnv hook bash)"

_ "$HOME/.imports"

unset -f _

# make less more friendly for non-text input files, see lesspipe(1)
# [ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
