
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

winrdp.ps1 - Successfully tested/ran script. No issues.

autotaskscan.ps1 - Sucessfully tested/ran script. One issue.

need a valid argument/file paths before executing this script. -kh

chkfileperm.ps1 - Successfully tested/ran script. No issues.

chkpermalldir.ps1 - Successfully tested/ran script. No issues.

dissharedmemsql.ps1 - Review Script. Failed test/run script.

script showed that no valid moduel file was found in any moduel directory. will revist this issue. - kh

disusbstorage.ps1 - Succesfully tested/ran script. No issues.

enautoupdate.ps1 - Successfully tested/ran script. No issues.

highlightsecevents.ps1 - Review Script. Failed test/run script.

Get-WinEvent is giving an error stating "Get-WinEvent : Parameter set cannot be resolved using the specified named parameters." will revist issue if possible. -kh

intemoni.ps1 - Script untested. 

logunauthconn.ps1- Partial Success on testing/running script. 

Script giving issue with write-event log, displaying source name "NetworkMonitor" does not exist on "localhost" Issue on line 36. Unsure if i should change it, being that it could mess with the EventID too. Will open issue for this script. -kh

monsharedmem.ps1 - Sucessfully tested/ran script.

regautoupdate.ps1 - Sucessfully tested/ran script.

restsharedmem.ps1 - Failed test/run script.

Script is stating that I cannot call a method on a "null-valued expermission". Also stating that Set-Acl cannot bind arguemnt to "Acl-Object" being that it is null. I havent come across an error like this yet, so i will review it at a point. -kh

rmfileperm.ps1 - Failed test/run script. 

Arguemnt in line 12 could not be translated. -kh

scansusnetconn.ps1 - Sucessfully tested/ran script. No issues.

scansusprocess.ps1 - Sucessfully tested/ran script. No issues.

setfileperm.ps1 - Partial Success on testing/running script. 

Arguemnt "SetAccessRule" could not be translated. Line 15. Noticing that thisiis the same error issue as rmfileperm.ps1 -kh

sha256base.ps1 - Successfully tested/ran script. No issues

This script gave nothing saying it sucessfully executed, but after reviewing the script, i added a modification on the VM and saw it being completed. Im not gonna change the script on GitHub as of now, I just wanted to make sure it worked. and it does. -kh


