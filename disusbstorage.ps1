# Run as Administrator

# Registry path for USB storage control
$regPath = "HKLM:\SYSTEM\CurrentControlSet\Services\USBSTOR"

# Check if the USBSTOR service exists
if (Test-Path $regPath) {
    # Set the Start DWORD value to 4 (disabled)
    Set-ItemProperty -Path $regPath -Name "Start" -Value 4
    Write-Host "USB storage devices have been disabled." -ForegroundColor Green
} else {
    Write-Host "USBSTOR registry key not found. Ensure USB storage services exist." -ForegroundColor Red
}
