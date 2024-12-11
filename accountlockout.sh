#!/bin/bash

# Configure account lockout policy
echo "Configuring account lockout policy..."

# Install necessary package
sudo apt-get install libpam-modules -y

# Set account lockout threshold to 5 failed attempts
sudo sed -i '/pam_tally2.so/ s/^#//g' /etc/pam.d/common-auth
sudo sed -i '/pam_tally2.so/ s/deny=[0-9]*/deny=5/' /etc/pam.d/common-auth

# Set account lockout duration to 10 minutes (600 seconds)
sudo sed -i '/pam_tally2.so/ s/unlock_time=[0-9]*/unlock_time=600/' /etc/pam.d/common-auth

# Set account lockout reset time to 10 minutes (600 seconds)
sudo sed -i '/pam_tally2.so/ s/reset=[0-9]*/reset=600/' /etc/pam.d/common-auth

echo "Account lockout policy configured successfully!"
