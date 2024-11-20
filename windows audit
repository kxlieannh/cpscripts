@echo off
:: Audit Script - Collect System Information
:: Created for basic system auditing

:: Define output file
set OUTPUT=audit_report.txt

:: Clear or create the output file
echo Generating audit report... > %OUTPUT%
echo ===================================================== >> %OUTPUT%
echo Audit Report Generated on %date% at %time% >> %OUTPUT%
echo ===================================================== >> %OUTPUT%
echo. >> %OUTPUT%

:: Gather system information
echo [System Information] >> %OUTPUT%
systeminfo >> %OUTPUT%
echo. >> %OUTPUT%

:: List user accounts
echo [User Accounts] >> %OUTPUT%
net user >> %OUTPUT%
echo. >> %OUTPUT%

:: List installed software
echo [Installed Software] >> %OUTPUT%
wmic product get name,version >> %OUTPUT%
echo. >> %OUTPUT%

:: List running processes
echo [Running Processes] >> %OUTPUT%
tasklist >> %OUTPUT%
echo. >> %OUTPUT%

:: List startup programs
echo [Startup Programs] >> %OUTPUT%
wmic startup get caption,command >> %OUTPUT%
echo. >> %OUTPUT%

:: List open network ports
echo [Open Network Ports] >> %OUTPUT%
netstat -an >> %OUTPUT%
echo. >> %OUTPUT%

:: List firewall configuration
echo [Firewall Configuration] >> %OUTPUT%
netsh advfirewall show allprofiles >> %OUTPUT%
echo. >> %OUTPUT%

:: Display completion message
echo Audit completed. Report saved to %OUTPUT%.
pause
