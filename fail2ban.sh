#!/bin/bash
echo "Installing and configuring Fail2Ban..."
sudo apt-get install -y fail2ban
sudo systemctl enable fail2ban
sudo systemctl start fail2ban
echo "Fail2Ban installed and configured successfully!"
