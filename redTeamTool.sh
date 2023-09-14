#!/bin/bash

if [[ $EUID -ne 0 ]]; then
	echo "Must be run as root."
	exit 1
fi

running=$(systemctl list-units --type=service --state=running | tail -n +2 | head -n -4 | awk '{print $1}')

for service in $running; do
	echo "Stopping: $service"
	#systemctl stop "$service"
done
