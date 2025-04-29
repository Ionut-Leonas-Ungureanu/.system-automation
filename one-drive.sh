#!/bin/bash

source ./utils.sh

setup_one_drive() {
	if ! is_installed "onedrive"; then
		dnf install "onedrive" -y
	fi

	# sync on shutdown
	echo "[Unit]" > "/etc/systemd/system/one-drive-job.service"
	echo "Description=Run one drive sync at one-drive" >> "/etc/systemd/system/one-drive-job.service"
	echo "DefaultDependencies=no" >> "/etc/systemd/system/one-drive-job.service"
	echo "Before=one-drive.target" >> "/etc/systemd/system/one-drive-job.service"
	echo >> "/etc/systemd/system/one-drive-job.service"
	echo "[Service]" >> "/etc/systemd/system/one-drive-job.service"
	echo "Type=oneshot" >> "/etc/systemd/system/one-drive-job.service"
	echo "ExecStart=/bin/true" >> "/etc/systemd/system/one-drive-job.service"
	echo "ExecStop=/usr/bin/onedrive --sync" >> "/etc/systemd/system/one-drive-job.service"
	echo "RemainAfterExit=yes" >> "/etc/systemd/system/one-drive-job.service"
	echo >> "/etc/systemd/system/one-drive-job.service"
	echo "[Install]" >> "/etc/systemd/system/one-drive-job.service"
	echo "WantedBy=multi-user.target" >> "/etc/systemd/system/one-drive-job.service"
	systemctl daemon-reload
	systemctl enable one-drive-job.service
	systemctl status one-drive-job
}
