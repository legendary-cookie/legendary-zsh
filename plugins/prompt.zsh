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

prompt_custom_setup () {
	autoload -Uz add-zsh-hook
	add-zsh-hook precmd update_prompt
}

prompt_custom_setup
