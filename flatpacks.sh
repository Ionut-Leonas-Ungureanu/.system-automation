#!/bin/bash

source utils.sh

install_package flatpak

FLATPACKS=(
	"com.brave.Browser"
	"md.obsidian.Obsidian"
)

echo "Installing flatpacks"
for pak in "${FLATPACKS[@]}";
do
	if ! flatpak list | grep -i "$pak" &> /dev/null; then
		flatpak install --noninteractive "$pak"
	fi
done
