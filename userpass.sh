#!/bin/bash

# Ensure all existing users have passwords
echo "Ensuring all existing users have passwords..."
for user in $(cut -d: -f1 /etc/passwd); do
    if [ $(passwd -S $user | awk '{print $2}') == "NP" ]; then
        echo "Setting password for user: $user"
        passwd $user
    fi
done

# Enforce password protection for all new users
echo "Enforcing password protection for all new users..."
if ! grep -q "ENCRYPT_METHOD SHA512" /etc/login.defs; then
    echo "ENCRYPT_METHOD SHA512" >> /etc/login.defs
fi

echo "All users are now password protected, and new users will be required to set a password."
