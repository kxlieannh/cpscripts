
We are still working on these script. 
-
This is the HHS Cyberpatriot Script for the 2024-2025 year. 
For team members, !!DO NOT run these scripts outside of VMs or controlled enviorments.!!

What scripts are we currently including?:

- Applicaton Update
- Policies User/Passwords
- Firewall Based Scripts
- Automatic User Passwords
- Scripts for Media Realtion
- System Hardening
- Acoount Lockout Policies

Supported Operating Systems:

- Linux OS


Current Comments:

audit.sh - Successfully tested/ran script. No issues.

disable.sh - Running into issues running/testing the script, review script.

(Resolved 11/22/24) review issue: Script failed to disable certain units, "does not exist" errors. Failing to stop services.

disable2.sh - Partial Success on script running.

firewall.sh - Successfully tested/ran script, 

(Resolved 11/20/24) minor issue: be sure to use "sudo apt-get install ufw" before using script

I changed the script to install ufw at the start of the script. There is no longer any current issue with this script. -kh

password.sh - Partial Success on script running. 

review issue: every packet ran besides the "libpam-cracklib" packet. likely a issue with line 16, and should be revisited.

I attempted to correct the script issue, any change I made to line 16 gave me a "Unable to locate package libpam-cracklib" error. This line should be relooked at. -kh

ssh.sh - Successfully tested/ran script. No issues.

root.sh - Successfully tested/ran script. No issues.

sysupdates.sh - Successfully tested/ran script. No issues.

userman.sh - Successfully tested/ran script. No issues.

clamAV.sh - Successfully tested/ran script. No issues.

userpass.sh - Successfully tested/ran script. No issues.

secboot.sh - Successfully tested/ran script. No issues.

autoupdate.sh - Successfully tested/ran script. No issues.

apparm.sh - Successfully tested/ran script. No issues.

fail2ban.sh - Successfully tested/ran script. No issues.

securesm.sh - Successfully tested/ ran script. No issues.

configlog.sh - Successfully tested/ran script. No issues.

scanbadprocess.sh - Successfully tested/ran script. No issues.

logbadconnect.sh - Successfully tested/ran script. No issues.

