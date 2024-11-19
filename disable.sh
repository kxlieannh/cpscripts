#!/bin/bash

# List of services to disable
services=("cups" "avahi-daemon" "bluetooth")

echo "Disabling unnecessary services..."
for service in "${services[@]}"; do
    sudo systemctl disable $service
    sudo systemctl stop $service
done

echo "Unnecessary services have been disabled!"
