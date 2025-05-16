#!/bin/bash

clear

# Exit on error
set -e

# Update system
sudo dnf update -y

# setup ghostty with starship and configuration - use stow?
echo "Setup the terminal..."
source terminal.sh

source packages.conf
# install system package's
echo "Install system packages..."
install_packages "${SYSTEM_PACKAGES[@]}"

echo "Install dev tools..."
install_packages "${DEV_TOOLS[@]}"

# install dotnet
echo "Install dotnet..."
curl -L https://dot.net/v1/dotnet-install.sh -o dotnet-install.sh
sudo chmod +x dotnet-install.sh
./dotnet-install.sh
rm dotnet-install.sh

# setup docker

# setup stow
source dotfiles.sh

# one drive
#source ./one-drive.sh
#setup_one_drive

# flatpacks
source flatpacks.sh

# gnome extensions
source gnome/gnome-extensions.sh

echo "Finished :)"
