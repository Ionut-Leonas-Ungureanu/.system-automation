#!/bin/bash

is_installed() {
	dnf list installed "$1" &> /dev/null
}
