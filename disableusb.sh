#!/bin/bash
echo "Disabling USB storage..."
echo "blacklist usb-storage" | sudo tee /etc/modprobe.d/usb-storage.conf
sudo update-initramfs -u
echo "USB storage disabled successfully!"
