#!/usr/bin/env bash

# enable color support of ls and also add handy aliases
if has dircolors; then
    export LS_COLORS="$(vivid generate molokai)"
fi

# -------------------------------------------------------------------------------------------------
alias ls='command \lsd -AFh --header --hyperlink auto '
alias l='ll '
alias ll='ls -l '
alias la='ls -1'
alias lr='ls -R --depth '
alias lt='lr '

# -------------------------------------------------------------------------------------------------
alias cat='command \bat '
export BAT_THEME="MonokaiExtended"

# -------------------------------------------------------------------------------------------------
alias 

# -------------------------------------------------------------------------------------------------
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
