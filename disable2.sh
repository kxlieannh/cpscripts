#!/bin/bash

# List of services to disable
services=("cups" "avahi-daemon" "bluetooth")

echo "Disabling unnecessary services..."
for service in "${services[@]}"; do
    if systemctl list-unit-files | grep -q "^${service}.service"; then
        sudo systemctl disable $service
        sudo systemctl stop $service
        echo "Disabled and stopped $service"
    else
        echo "Service $service does not exist on this system."
    fi
done

echo "Unnecessary services have been processed!"
