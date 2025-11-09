#!/bin/bash

clear

# Exit on error
set -e

source utils.sh

help(){
	echo -e "Usage: run.sh [OPTIONS]"
	echo -e "Options:"
	echo -e "\t-a |--all		        run the entire setup"
	echo -e "\t-u |--update		        update system"
	echo -e "\t    --system-packages	setup system packages"
	echo -e "\t    --dev-tools	        setup dev tools"
	echo -e "\t    --dotnet		        install dotnet"
	echo -e "\t    --dotfiles           setup dotfiles"
	echo -e "\t    --tmux               setup tmux"
	echo -e "\t    --flatpacks          setup flatpacks"
	echo -e "\t-h |--help               help"
	exit 1
}

UPDATE=1
SETUP_SYSTEM_PACKAGES=1
SETUP_DEV_TOOLS=1
SETUP_DOTNET=1
SETUP_DOTFILES=1
SETUP_TMUX=1
SETUP_FLATPACKS=1
SETUP_HYPRLAND=1
SETUP_TERMINALS=1

while [[ "$#" -gt 0 ]]; do
	case $1 in
		-a|--all)
			UPDATE=0
			SETUP_SYSTEM_PACKAGES=0
			SETUP_DEV_TOOLS=0
			SETUP_DOTNET=0
			SETUP_DOTFILES=0
			SETUP_TMUX=0
			SETUP_FLATPACKS=0
			SETUP_HYPRLAND=0
			SETUP_TERMINALS=0
			;;
		-u|--update)
			UPDATE=0
			;;
		--system-packages)
			SETUP_SYSTEM_PACKAGES=0
			;;
		--dev-tools)
			SETUP_DEV_TOOLS=0
			;;
		--dotnet)
			SETUP_DOTNET=0
			;;
		--dotfiles)
			SETUP_DOTFILES=0
			;;
		--tmux)
			SETUP_TMUX=0
			;;
		--flatpacks)
			SETUP_FLATPACKS=0
			;;
		-h|--help)
			help
			;;
		*)
			print "Option not recognized.\n" warn
			help
			;;
	esac
	shift
done

if [ $UPDATE -eq 0 ]; then
	print "Updating the system..."
	update_system
fi

source packages.conf

if [ $SETUP_SYSTEM_PACKAGES -eq 0 ]; then
	print "Installing system packages..."
	install_packages "${SYSTEM_PACKAGES[@]}"
fi

if [ $SETUP_TERMINAL -eq 0 ]; then
	print "Installing terminal packages..."
	install_packages "${TERMINAL_PACKAGES[@]}"
fi

if [ $DEV_TOOLS -eq 0 ]; then
	print "Setting up dev tools..."
	install_packages "${DEV_TOOLS[@]}"
fi

if [ $SETUP_HYPRLAND -eq 0 ]; then
	print "Installing hyprland packages..."
	install_packages "${HYPRLAND_PACKAGES[@]}"
fi

if [ $SETUP_DOTNET -eq 0 ]; then
	print "Setting up dotnet..."
	source dotnet.sh
fi

# setup docker

if [ $SETUP_DOTFILES -eq 0 ]; then
	print "Setting up dotfiles..."
	source dotfiles.sh
fi

if [ $SETUP_TMUX -eq 0 ]; then
	print "Setting up tmux..."
	source tmux.sh
fi

if [ $SETUP_FLATPACKS -eq 0 ]; then
	print "Setting up flatpacks..."
	source flatpacks.sh
fi

print "Finished :)"
