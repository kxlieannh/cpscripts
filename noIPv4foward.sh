#!/bin/bash

# Disable IPv4 forwarding
echo "Disabling IPv4 forwarding..."

# Check if the necessary package is installed
sudo apt-get install -y procps

# Disable IPv4 forwarding immediately
sudo sysctl -w net.ipv4.ip_forward=0

# Make the change persistent across reboots
echo "net.ipv4.ip_forward = 0" | sudo tee -a /etc/sysctl.conf

# Apply the changes
sudo sysctl -p

echo "IPv4 forwarding has been disabled!"
