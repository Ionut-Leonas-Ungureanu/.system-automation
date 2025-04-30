#!/bin/bash

clear

# Exit on error
set -e
f
# Update system
dnf update -y

# setup ghostty with starship and configuration - use stow?
source terminal.sh

# setup dev tools: dotnet, nvm, node, angular

# setup editors: nvim vscode rider

# setup docker

# setup stow
source dotfiles.sh

# one drive
source ./one-drive.sh
setup_one_drive

# flatpacks
source ./flatpacks.sh

# gnome extensions
source ./gnome/gnome-extensions.sh

echo "Finished :)"
