#!/bin/bash

# Backup SSH configuration
echo "Backing up SSH configuration..."
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak

# Disable root login and enforce key-based authentication
echo "Securing SSH configuration..."
sudo sed -i 's/^PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config
sudo sed -i 's/^#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sudo sed -i 's/^#PubkeyAuthentication yes/PubkeyAuthentication yes/' /etc/ssh/sshd_config

# Restart SSH service
echo "Restarting SSH service..."
sudo systemctl restart sshd

echo "SSH configuration secured!"
