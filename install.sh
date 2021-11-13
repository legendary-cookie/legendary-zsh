#!/bin/bash
if [[ -z "$(which zsh)" ]]; then
	echo "You have to install zsh first!"
	exit 1
fi

if [[ -z "$DOTFILES" ]]; then
	echo "You already installed this config / the directory already exists!"
	exit 1
fi

git clone --recurse-submodules -j8 https://github.com/legendary-cookie/zsh-dotfiles $HOME/.dotfiles

cat > $HOME/.zshenv <<- EOF
export XDG_CONFIG_HOME="\$HOME/.config"
export XDG_DATA_HOME="\$XDG_CONFIG_HOME/local/share"
export XDG_CACHE_HOME="\$XDG_CONFIG_HOME/cache"

export MAKEFLAGS="-j\$(nproc)"
export EDITOR="nvim"
export VISUAL="nvim"

export ZDOTDIR="\$HOME/.dotfiles"
export DOTFILES="\$HOME/.dotfiles"

export HISTFILE="\$ZDOTDIR/.zhistory"    # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file
EOF
