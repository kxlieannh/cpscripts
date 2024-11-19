#!/bin/bash

# Set password policies
echo "Configuring password policies..."

# Maximum password age (30 days)
sudo sed -i 's/^PASS_MAX_DAYS.*/PASS_MAX_DAYS 30/' /etc/login.defs

# Minimum password age (7 days)
sudo sed -i 's/^PASS_MIN_DAYS.*/PASS_MIN_DAYS 7/' /etc/login.defs

# Password change warning (12 days before expiration)
sudo sed -i 's/^PASS_WARN_AGE.*/PASS_WARN_AGE 12/' /etc/login.defs

# Enforce strong passwords using PAM and libpam-cracklib
sudo apt install libpam-cracklib -y
sudo sed -i '/pam_cracklib.so/ s/^#//' /etc/pam.d/common-password
sudo sed -i '/pam_cracklib.so/ s/retry=3/retry=3 minlen=12 ucredit=-1 lcredit=-1 dcredit=-1 ocredit=-1/' /etc/pam.d/common-password

# Create a new user with password policies applied
read -p "Enter the username for the new user: " username
sudo adduser $username

echo "User and password policies have been configured successfully!"
