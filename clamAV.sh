#!/bin/bash

# Install ClamAV and ClamAV daemon
echo "Installing ClamAV and ClamAV daemon..."
sudo apt-get update
sudo apt-get install -y clamav clamav-daemon

# Update ClamAV virus definitions
echo "Updating ClamAV virus definitions..."
sudo systemctl stop clamav-freshclam
sudo freshclam
sudo systemctl start clamav-freshclam

# Create a directory for ClamAV logs
echo "Creating directory for ClamAV logs..."
sudo mkdir -p /var/log/clamav
sudo chown clamav:clamav /var/log/clamav

# Create a script for daily scans
echo "Creating script for daily scans..."
sudo tee /usr/local/bin/daily_clamav_scan.sh > /dev/null <<EOL
#!/bin/bash
LOG_FILE="/var/log/clamav/daily_scan.log"
SCAN_DIR="/"

echo "Starting daily ClamAV scan..." >> \$LOG_FILE
date >> \$LOG_FILE
clamscan -r \$SCAN_DIR --exclude-dir="^/sys" --exclude-dir="^/proc" --exclude-dir="^/dev" --exclude-dir="^/run" --exclude-dir="^/mnt" --exclude-dir="^/media" --exclude-dir="^/lost+found" >> \$LOG_FILE
echo "Daily ClamAV scan completed." >> \$LOG_FILE
date >> \$LOG_FILE
EOL

# Make the script executable
echo "Making the daily scan script executable..."
sudo chmod +x /usr/local/bin/daily_clamav_scan.sh

# Schedule the daily scan using cron
echo "Scheduling the daily scan using cron..."
(crontab -l 2>/dev/null; echo "0 2 * * * /usr/local/bin/daily_clamav_scan.sh") | crontab -

echo "ClamAV setup complete!"
