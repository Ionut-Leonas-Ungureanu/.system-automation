#!/bin/bash

source ./utils.sh

ORIGINAL_DIR=$(pwd)

if ! is_installed stow; then
	install_package stow
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
	# Bash
	rm ~/.bashrc
	stow bash

	# Tools
	stow starship
	stow nvim
	stow tmux
	
	# git -C "$REPO_PATH" restore .
else
	echo "Failed to clone repository from: $REPO_URL"
fi

cd "$ORIGINAL_DIR"
