#!/bin/bash
echo "Scanning for unusual processes and network activity..."

# Scan for unusual processes
echo "Unusual processes:"
ps aux --sort=-%mem | awk 'NR<=10{print $0}'

# Scan for unusual network activity
echo "Unusual network activity:"
sudo netstat -tulnp | grep -E '(:80|:443|:22)'

echo "Scan completed!"
