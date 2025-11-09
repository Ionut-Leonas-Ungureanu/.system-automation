#!/bin/bash

update_system() {
	sudo pacman -Syu --noconfirm
}

is_installed() {
	pacman -Qi "$1" &> /dev/null
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
		sudo pacman -S --noconfirm "${to_install[@]}"
	fi
}

install_package() {	
	if ! is_installed "$1"; then
		sudo pacman -S --noconfirm "$1"
	fi
}

print() {
	while [[ "$#" -gt 0 ]]; do
		case $2 in
			warn|warning)
				echo -e "\e[33m$1\e[0m"
				shift
				;;
			err|error)
				echo -e "\e[31m$1\e[0m"
				;;
			*)
				echo -e $1
				;;
		esac
		shift
	done
}
