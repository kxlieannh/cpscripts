#!/bin/bash

# Install Lynis for system auditing
echo "Installing Lynis for system auditing..."
sudo apt-get install -y lynis

# Run Lynis audit
echo "Running Lynis audit..."
sudo lynis audit system

echo "System auditing tasks complete!"
