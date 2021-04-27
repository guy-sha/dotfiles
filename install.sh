#!/bin/bash

if [ -z "$HOME" ]; then
	echo "No \$HOME"; exit 1;
fi

DOTFILES=$HOME/dotfiles
SCRIPTS=$HOME/bin

GITCLONE="git clone --depth=1"

cd "$HOME" || exit
rm -rf "$DOTFILES"
git clone https://github.com/guy-sha/dotfiles.git "$DOTFILES"
cd "$DOTFILES" || exit

rm -rf \
	"$SCRIPTS" \
	"$HOME/.zshrc"

mkdir -p \
	"$SCRIPTS"

ln -s "$DOTFILES/zshrc" "$HOME/.zshrc"

ZSHPLUGS=(
	"zsh-completions"
	"zsh-syntax-highlighting"
)

for INDEX in ${!ZSHPLUGS[*]}; do
	ZSHPLUG="${ZSHPLUGS[$INDEX]}"
	$GITCLONE "https://github.com/zsh-users/$ZSHPLUG.git" "$SCRIPTS/$ZSHPLUG"
done

cd "$HOME" || exit

echo "Finished"

