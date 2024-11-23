#!/bin/bash
echo "Setting up logging for unauthorized connections..."

# Create a new chain for logging
sudo iptables -N LOGGING

# Log and drop unauthorized connections
sudo iptables -A INPUT -m conntrack --ctstate INVALID -j LOGGING
sudo iptables -A LOGGING -m limit --limit 2/min -j LOG --log-prefix "IPTables-Dropped: " --log-level 4
sudo iptables -A LOGGING -j DROP

# Save the iptables rules
sudo iptables-save | sudo tee /etc/iptables/rules.v4

echo "Logging for unauthorized connections set up successfully!"

