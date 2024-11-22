
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

- Windows OS/server


Current Comments:

winaudit.ps1 - Running into issues running/testing the script, review script.

review issue: Script failed giving a error from line 1 with the "@echo off"

That was the only error I got from that script but it states that the "off" is a unexpected token 
while with the "@echo" it says that "@" cant be used to represent a variable and also "@echo" can only be used as an argument to a command.
Ill look into it more but thats the only issues im having trouble with -MG

windef.ps1 - Successfully tested/ran script. No issues.

winpass.ps1 - Successfully tested/ran script. No issues.

winfire.ps1 - Uncerain about success of script. one issue.

review issue: the only issue I see is on line 17 it gives me a error that says "LogDropped" is a parameter that cant be found (cant tell if script worked completely or not) -MG

winlsp.ps1 - Successfully tested/ran script. one minor issue with script

review issue: On line 74 it states that Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" does not exists so look into that, everything else though seem to work so good on that. -MG




