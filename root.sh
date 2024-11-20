#!/bin/bash

# Disable root login over SSH
echo "Disabling root login over SSH..."
sudo sed -i 's/^PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
sudo sed -i 's/^#PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
sudo sed -i 's/^#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config

# Restart SSH service to apply changes
echo "Restarting SSH service..."
sudo systemctl restart sshd

echo "Root login over SSH has been disabled!
