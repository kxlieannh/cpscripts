#!/bin/bash
echo "Configuring log rotation..."
sudo apt-get install -y logrotate
sudo logrotate /etc/logrotate.conf
echo "Log rotation configured successfully!
