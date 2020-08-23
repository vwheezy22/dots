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
