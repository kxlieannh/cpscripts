#!/bin/bash
echo "Securing shared memory..."
echo "tmpfs /run/shm tmpfs defaults,noexec,nosuid 0 0" | sudo tee -a /etc/fstab
sudo mount -o remount /run/shm
echo "Shared memory secured successfully!"
