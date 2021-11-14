#!/bin/bash

AURMODE="NO"

if [[ -z "$(which zsh)" ]]; then
	echo "You have to install zsh first!"
	exit 1
fi

if [[ ! -z "$DOTFILES" ]]; then
	echo "You already installed this config / the directory already exists!"
	exit 1
fi

echo "This script will overwrite your .zshenv (any other zsh file won't be overwritten as we set the ZDOTDIR!). Really continue? [y/N]"
read yesno

if [ "$yesno" == "y" ] || [ "$yesno" == "Y" ]; then

	if [ "$AURMODE" == "YES" ]; then
		SOURCE="${BASH_SOURCE[0]}"
		while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
			DIR="$(cd -P "$(dirname "$SOURCE")" >/dev/null 2>&1 && pwd)"
			SOURCE="$(readlink "$SOURCE")"
			[[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
		done
		DIR="$(cd -P "$(dirname "$SOURCE")" >/dev/null 2>&1 && pwd)"

		git clone --recurse-submodules $DIR $HOME/.dotfiles
	else
		git clone --recurse-submodules https://github.com/legendary-cookie/zsh-dotfiles $HOME/.dotfiles
	fi
	cat >$HOME/.zshenv <<-EOF
		export XDG_CONFIG_HOME="\$HOME/.config"
		export XDG_DATA_HOME="\$XDG_CONFIG_HOME/local/share"
		export XDG_CACHE_HOME="\$XDG_CONFIG_HOME/cache"

		export MAKEFLAGS="-j\$(nproc)"
		export EDITOR="nvim"
		export VISUAL="nvim"
		export USER_HOME=\$HOME
		export GRADLE_USER_HOME=\$USER_HOME/.gradle
		export JAVA_HOME="/usr/lib/jvm/default"
		export GOPATH=\$HOME/go
		export PATH=\$PATH:\$GOPATH/bin

		export ZDOTDIR="\$HOME/.dotfiles"
		export DOTFILES="\$HOME/.dotfiles"
		export HISTFILE="\$ZDOTDIR/.zhistory"    # History filepath
		export HISTSIZE=10000                   # Maximum events for internal history
		export SAVEHIST=10000                   # Maximum events in history file
	EOF

fi
