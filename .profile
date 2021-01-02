#!/bin/sh

# Default programs
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="palemoon"
export PAGER="less"
export HISTSIZE="INFINITE"
export WM="dwm"
export COLORTERM="truecolor"

# ~/ Clean-up
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export HISTFILE="$XDG_DATA_HOME/bash_history"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GOPATH="$XDG_DATA_HOME/go"
export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history"

export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"
export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"

export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export LESSHISTFILE="-"

# Adds `~/.local/bin` to $PATH
export PATH="$XDG_DATA_HOME/npm-global/bin:$HOME/.local/bin:$PATH"

pgrep startx >/dev/null || startx "$XDG_CONFIG_HOME/X11/xinitrc" -- -keeptty &> "$XDG_DATA_HOME/xorg/xorg.log"

[ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"
