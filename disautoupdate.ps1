# Stop the Windows Update service and set it to manual
Stop-Service -Name wuauserv
Set-Service -Name wuauserv -StartupType Manual

# Confirm the service status
Get-Service -Name wuauserv
Write-Host "Automatic Updates service has been disabled."
