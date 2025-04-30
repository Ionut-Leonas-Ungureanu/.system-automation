#!/bin/bash

source ./utils.sh

if ! is_installed "stow"; then
	dnf install "stow" -y
fi

REPO_URL="https://github.com/Ionut-Leonas-Ungureanu/.dotfiles.git"
REPO_PATH="$HOME/.dotfiles"

if [ -d "$REPO_PATH" ]; then
	echo "Repository $REPO_PATH exists. Skipping clone."
else
	git clone "$REPO_URL" "$REPO_PATH"
fi

if mycmd; then
	cd "$REPO_PATH" || exit
	stow bash
	stow ghostty
	stow starship
	stow nvim
else
	echo "Failed to clone repository."
fi
