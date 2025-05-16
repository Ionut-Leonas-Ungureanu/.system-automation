#!/bin/bash

is_installed() {
	dnf list --installed "$1" &> /dev/null
}

install_packages() {
	packages=("$@")
	to_install=()

	for pkg in "${packages[@]}"; do
		if ! is_installed "$pkg"; then
			to_install+=("$pkg")
		fi
	done

	if [ "${#to_install[@]}" -ne 0 ]; then
		sudo dnf install "${to_install[@]}" -y
	fi
}
