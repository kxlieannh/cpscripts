#!/bin/bash

# Enable IPv4 TCP SYN cookies
echo "Enabling IPv4 TCP SYN cookies..."

# Check if the necessary package is installed
sudo apt-get install -y procps

# Enable SYN cookies
sudo sysctl -w net.ipv4.tcp_syncookies=1

# Make the change persistent across reboots
echo "net.ipv4.tcp_syncookies = 1" | sudo tee -a /etc/sysctl.conf

# Apply the changes
sudo sysctl -p

echo "IPv4 TCP SYN cookies have been enabled!"
