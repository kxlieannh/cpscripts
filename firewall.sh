#!/bin/bash

# Enable UFW
echo "Enabling UFW..."
sudo ufw enable

# Allow SSH
echo "Allowing SSH..."
sudo ufw allow ssh

# Allow HTTP and HTTPS
echo "Allowing HTTP and HTTPS..."
sudo ufw allow http
sudo ufw allow https

# Deny all other incoming connections
echo "Denying all other incoming connections..."
sudo ufw default deny incoming

# Allow all outgoing connections
echo "Allowing all outgoing connections..."
sudo ufw default allow outgoing

echo "Firewall configuration complete!"
