#!/bin/bash

source utils.sh

install_package tmux

if [[ ! -d ~/.tmux/plugins/tpm ]]; then
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
	rm -rf ~/.tmux/plugins/tpm
fi
