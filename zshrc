#!/bin/zsh

export DOTFILES=$HOME/dotfiles
export INCLUDES=$HOME/bin

source $DOTFILES/aliases

source $INCLUDES/zsh-completions/zsh-completions.plugin.zsh
source $INCLUDES/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'

autoload -U compinit && compinit

