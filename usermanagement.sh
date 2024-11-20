#!/bin/bash

# Ensure all users have strong passwords
echo "Ensuring all users have strong passwords..."
sudo apt-get install -y libpam-pwquality
sudo sed -i 's/# minlen = 9/minlen = 12/' /etc/security/pwquality.conf
sudo sed -i 's/# dcredit = 1/dcredit = -1/' /etc/security/pwquality.conf
sudo sed -i 's/# ucredit = 1/ucredit = -1/' /etc/security/pwquality.conf
sudo sed -i 's/# ocredit = 1/ocredit = -1/' /etc/security/pwquality.conf
sudo sed -i 's/# lcredit = 1/lcredit = -1/' /etc/security/pwquality.conf

# Lock inactive user accounts
echo "Locking inactive user accounts..."
sudo usermod -L $(sudo awk -F: '$7 ~ /nologin/ {print $1}' /etc/passwd)

# Remove unnecessary user accounts
echo "Removing unnecessary user accounts..."
for user in $(awk -F: '{ if ($3 >= 1000) print $1 }' /etc/passwd); do
    if [ "$user" != "your_username" ]; then
        sudo userdel -r $user
    fi
done

echo "User management tasks complete!"
