#!/bin/bash

source utils.sh

install_packages pipx

# Install gnome-extensions-cli only if not already installed
if ! command -v ~/.local/bin/gext &> /dev/null; then
  pipx install gnome-extensions-cli --system-site-packages
fi

EXTENSIONS=(
	"impatience@gfxmonk.net"
	"blur-my-shell@aunetx"
	"just-perfection-desktop@just-perfection"
	"appindicatorsupport@rgcjonas.gmail.com"
)

for ext in "${EXTENSIONS[@]}";
do
	if ! gext list | grep "$ext" &> /dev/null; then
		echo "Installing extension: $ext"
		gext install "$ext"
	fi
done

SCRIPT_DIR=$(dirname "$(realpath "$0")")
echo "DIR>> $SCRIPT_DIR"

dconf load /org/gnome/shell/extensions/ < "$SCRIPT_DIR/gnome-settings.dconf"

# to get the settings use:
# dconf dump /org/gnome/shell/extensions/ > gnome-extensions-settings.conf
