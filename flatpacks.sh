#!/bin/bash

FLATPACKS=(
	"com.mattjakeman.ExtensionManager"
	"md.obsidian.Obsidian"
	"org.gnome.Screenshot"
	"com.mattjakeman.ExtensionManager"
	"Rider"
)

echo "Installing flatpacks"
for pak in "${FLATPACKS[@]}";
do
	if ! flatpak list | grep -i "$pak" &> /dev/null; then
		flatpak install --noninteractive "$pak"
	fi
done
