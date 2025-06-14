#!/bin/bash

source ./utils.sh

help(){
	echo -e "Usage: run.sh [OPTIONS]"
	echo -e "Options:"
	echo -e "\t-h,  --help        Help"
	exit 1
}

menu(){
	while [[ "$#" -gt 0 ]]; do
		case $1 in
			-h|--help)
				help
				;;
			*)
				print "Option not recognized.\n" warn
				help
				;;
		esac
		shift
	done
}
