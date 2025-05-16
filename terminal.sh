#!/bin/bash

source ./utils.sh

# install ghostty
if ! is_installed "ghostty"; then
	sudo dnf copr enable pgdev/ghostty -y
	sudo dnf install ghostty -y
fi

# install starship
if ! is_installed "starship"; then
	sudo dnf copr enable atim/starship -y
	sudo dnf install starship -y
fi

# uninstall gnome terminal
sudo dnf remove ptyxis
