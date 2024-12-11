#!/bin/bash

# Disable FTP service
echo "Disabling FTP service..."

# Stop the FTP service if it's running
sudo systemctl stop vsftpd

# Disable the FTP service from starting on boot
sudo systemctl disable vsftpd

# Remove the FTP server package
sudo apt-get remove --purge vsftpd -y

# Verify that the FTP service is disabled
sudo systemctl status vsftpd

echo "FTP service has been disabled and removed!"
