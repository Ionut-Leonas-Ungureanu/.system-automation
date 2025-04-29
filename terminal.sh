#!/bin/bash

source ./utils.sh

# install ghostty
if ! is_installed "ghostty"; then
	dnf copr enable pgdev/ghostty -y
	dnf install ghostty -y
fi

# install starship
if ! is_installed "starship"; then
	dnf copr enable atim/starship -y
	dnf install starship -y
fi
