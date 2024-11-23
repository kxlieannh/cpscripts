#!/bin/bash
echo "Configuring secure boot settings..."
sudo apt-get install -y grub-efi-amd64-signed shim-signed
sudo grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=ubuntu --recheck
sudo update-grub
echo "Secure boot settings configured successfully!"
