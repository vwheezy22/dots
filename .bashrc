#!/bin/sh

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Mega flex
neofetch --gtk2 off --gtk3 off --speed_shorthand on --cpu_temp on --memory_percent on

# Load aliases
[ -f "$XDG_CONFIG_HOME/aliasrc" ] && . "$XDG_CONFIG_HOME/aliasrc"

# PS1 customization
PS1='\[\e[0;38;5;166m\][\[\e[0;38;5;111m\]\W\[\e[0m\]:\[\e[0;96m\]$(git branch 2>/dev/null | grep '"'"'^*'"'"' | colrm 1 2)\[\e[m\] \[\e[0;1;38;5;185m\]\u\[\e[0;38;5;34m\]@\[\e[0;1;38;5;31m\]\h\[\e[0;38;5;166m\]]\[\e[0m\]λ\[\e0 '

# Cd by typing directory
shopt -s autocd

# Vim bindings
set -o vi

# Man page customization
# Start blinking
export LESS_TERMCAP_mb=$(tput bold; tput setaf 2) # green
# Start bold
export LESS_TERMCAP_md=$(tput bold; tput setaf 2) # green
# Start stand out
export LESS_TERMCAP_so=$(tput bold; tput setaf 3) # yellow
# End standout
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
# Start underline
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 1) # red
# End Underline
export LESS_TERMCAP_ue=$(tput sgr0)
# End bold, blinking, standout, underline
export LESS_TERMCAP_me=$(tput sgr0)

LS_COLORS='di=01;34:ln=01;36:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:or=41;36;01:ow=01;34:ex=01;32:*.tar=01;31:*.tgz=01;31:*.lzma=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.gz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.rar=01;31:*.7z=01;31'
export LS_COLORS

# run-help() {
#     help "$READLINE_LINE" 2>/dev/null || man "$READLINE_LINE";
# }

# bind -m vi-insert -x '"\eh": run-help'
