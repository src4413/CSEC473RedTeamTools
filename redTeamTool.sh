#!/bin/bash

if [[ $EUID -ne 0 ]]; then #ensures that the user is root
	echo "Must be run as root."
	exit 1
fi

running=$(systemctl list-units --type=service --state=running | tail -n +2 | head -n -4 | awk '{print $1}') #obtains all the running services on the machine

for service in $running; do #for loop to loop through all the services
	echo "Stopping: $service"
	systemctl stop "$service" #command to stop the service
done
