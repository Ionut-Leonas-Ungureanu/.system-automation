#!/bin/bash

source ./utils.sh

ORIGINAL_DIR=$(pwd)

if ! is_installed stow; then
	sudo dnf install stow -y
fi

REPO_URL="https://github.com/Ionut-Leonas-Ungureanu/.dotfiles.git"
REPO_PATH="$ORIGINAL_DIR/../.dotfiles"

if [ -d "$REPO_PATH" ]; then
	echo "Repository $REPO_PATH exists. Skipping clone."
else
	git clone "$REPO_URL" "$REPO_PATH"
fi

if [ $? -eq 0 ]; then
	cd "$REPO_PATH" || exit
	stow bash --adopt
	stow ghostty --adopt
	stow starship --adopt
	stow nvim --adopt
	stow tmux --adopt
	git -C "$REPO_PATH" restore .
else
	echo "Failed to clone repository from: $REPO_URL"
fi

cd "$ORIGINAL_DIR"
