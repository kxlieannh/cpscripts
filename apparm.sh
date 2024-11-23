#!/bin/bash
echo "Enabling AppArmor..."
sudo apt-get install -y apparmor apparmor-utils
sudo systemctl enable apparmor
sudo systemctl start apparmor
echo "AppArmor enabled successfully!"
