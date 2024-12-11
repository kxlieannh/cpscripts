#!/bin/bash

# Ensure null passwords do not authenticate
echo "Configuring PAM to disallow null passwords..."

# Install necessary package
sudo apt-get install libpam-modules -y

# Edit the PAM configuration to disallow null passwords
sudo sed -i '/pam_unix.so/ s/nullok//g' /etc/pam.d/common-auth

echo "Null passwords are now disallowed for authentication!"
