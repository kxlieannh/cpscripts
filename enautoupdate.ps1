# Start Windows Update service and set it to automatically start
Set-Service -Name wuauserv -StartupType Automatic
Start-Service -Name wuauserv

# Confirm the service status
Get-Service -Name wuauserv
Write-Host "Automatic Updates service has been enabled and started."

