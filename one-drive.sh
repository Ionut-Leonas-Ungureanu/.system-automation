#!/bin/bash

source ./utils.sh

setup_one_drive() {
	if ! is_installed "onedrive"; then
		dnf install "onedrive" -y
	fi

	if ! is_installed "cronie"; then
		dnf install "cronie" -y
		systemctl enable crond
		systemctl start crond
	fi
			
	# one drive sync
	sudo -u "$SUDO_USER" crontab -l 2>/dev/null | {
		cat
		echo "0 18 * * * onedrive --sync"
	} | sudo -u "$SUDO_USER" crontab -
}
