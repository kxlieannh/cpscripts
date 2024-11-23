#!/bin/bash
echo "Configuring automatic updates..."
sudo apt-get install -y unattended-upgrades
sudo dpkg-reconfigure --priority=low unattended-upgrades
echo "Automatic updates configured successfully!"
