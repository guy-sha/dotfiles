#!/bin/zsh

export DOTFILES=$HOME/dotfiles
export INCLUDES=$HOME/bin

# source $DOTFILES/aliases

source $INCLUDES/zsh-completions/zsh-completions.plugin.zsh
source $INCLUDES/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'

autoload -U compinit && compinit

setopt PROMPT_SUBST

git_prompt() {
	BRANCH=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/\* \(.*\)/\1/')

	if [ ! -z $BRANCH ]; then
		echo -n " %F{yellow}($BRANCH)%f"
	fi
}

PROMPT='%n:%B%F{244}%~$(git_prompt)%f%b$ '

