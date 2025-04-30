#!/bin/bash

EXTENSIONS=(
	"impatience@gfxmonk.net",
	"blur-my-shell@aunetx",
	"just-perfection-desktop@just-perfection",
	"appindicatorsupport@rgcjonas.gmail.com",
	"auto-move-windows@gnome-shell-extensions.gcampax.github.com",
	"apps-menu@gnome-shell-extensions.gcampax.github.com",
	"background-logo@fedorahosted.org",
	"launch-new-instance@gnome-shell-extensions.gcampax.github.com",
	"places-menu@gnome-shell-extensions.gcampax.github.com",
	"window-list@gnome-shell-extensions.gcampax.github.com",
)

for ext in "${EXTENSIONS[@]}";
do
	if ! gnome-extensions list | grep "$ext" &> /dev/null; then
		echo "Installing extension: $ext"
		gnome-extensions install "$ext"
	fi
done

SCRIPT_DIR=$(dirname "$(realpath "$0")")

dconf load /org/gnome/shell/extensions/ < "$SCRIPT_DIR/gnome-settings.dconf"

# to get the settings use:
# dconf dump /org/gnome/shell/extensions/ > gnome-extensions-settings.conf
