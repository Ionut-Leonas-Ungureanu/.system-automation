#!/bin/bash

clear

# Exit on error
set -e

# Update system
dnf update -y

# setup ghostty with starship and configuration - use stow?
source terminal.sh

source ./packages.conf
# install system package's
install_packages SYSTEM_PACKAGES

# setup dev tools: dotnet, nvm, node, angular
install_packages DEV_TOOLS

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
