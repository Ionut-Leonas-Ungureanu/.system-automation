#!/bin/bash

FLATPACKS=(
	"ExtensionsManager"
	"Obsidian"
	"Screenshot"
	"Brave"
	"Rider"
)

echo "Installing flatpacks"
for pak in "${FLATPACKS[@]}";
do
	if ! flatpack list | grep -i "$pak" &> /dev/null; then
		echo "Installing flatpak: $pak"
		flatpak install --noninteractive "$pak"
	fi
done
