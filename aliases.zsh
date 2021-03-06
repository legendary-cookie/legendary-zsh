# Own aliases
# 
# Author: https://github.com/legendary-cookie
alias nv="nvim"
alias vi="nvim"
alias vim="nvim"
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias ls="ls --color=auto"
alias ll="ls -lah"
alias tarthis="tar --zstd -cvf"
alias pinstall="sudo pacman -S"
alias pupdate="sudo pacman -Syu"
alias prettyjson='python -m json.tool'
alias hex="hexedit"
alias listsecretkeys="gpg --list-secret-keys --keyid-format=long"
function createpatch () {
	diff -Naur $1 $2 > $3
	return 0
}
# Aliases for git
#
# Author: https://github.com/bossjones
alias gcl='git clone'
alias gpr='git pull --rebase'
alias __git_find_subcommand='__git_find_on_cmdline'
alias g='git'
alias ga='git add'
alias gall='git add .'
alias gb='git branch'
alias gba='git branch -a'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gci='git commit --interactive'
alias gcl='git clone'
alias gcm='git commit -v -m'
alias gco='git checkout'
alias gcount='git shortlog -sn'
alias gcp='git cherry-pick'
alias gdel='git branch -D'
alias get='git'
alias gexport='git archive --format zip --output'
alias gl='git pull'
alias gll='git log --graph --pretty=oneline --abbrev-commit'
alias gm='git merge'
alias gmu='git fetch origin -v; git fetch upstream -v; git merge upstream/master'
alias gp='git push'
alias gpo='git push origin'
alias gpp='git pull && git push'
alias gpr='git pull --rebase'
alias gs='git status'
alias gsl='git shortlog -sn'
alias gss='git status -s'
alias gst='git status'
alias gup='git fetch && git rebase'
alias gus='git reset HEAD'
alias gw='git whatchanged'
