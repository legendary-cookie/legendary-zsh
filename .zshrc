# Prompt setup
_comp_options+=(globdots) # With hidden files
source $ZDOTDIR/completion.zsh
source $ZDOTDIR/aliases

update_prompt () {
	if [ $? -eq 0 ]; then
		PROMPT='%B%F{110}%n@%m %F{117}%~%b%f $ '
	else
		PROMPT='%B%F{110}%n@%m %F{117}%~ %F{red}%? %b%f $ '
	fi

	if [ -d "$PWD/.git" ]; then
		RPROMPT="[%B%F{cyan}$(git rev-parse --abbrev-ref HEAD)"
		if [[ $(git diff --stat) != '' ]]; then
			RPROMPT+="*"
		fi
		RPROMPT+="%b%f]"
	else
		RPROMPT=""
	fi
}

typeset -a precmd_functions
precmd_functions+=(update_prompt)

source $DOTFILES/plugins.zsh
source $DOTFILES/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
