#!/bin/bash

# Update package lists
echo "Updating package lists..."
sudo apt update

# Upgrade all installed packages
echo "Upgrading all installed packages..."
sudo apt upgrade -y

# Perform a distribution upgrade
echo "Performing a distribution upgrade..."
sudo apt dist-upgrade -y

# Clean up unnecessary packages and files
echo "Cleaning up unnecessary packages and files..."
sudo apt autoremove -y
sudo apt clean

echo "System updates complete!"
