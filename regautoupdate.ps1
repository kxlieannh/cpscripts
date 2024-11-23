# Set the registry key for automatic updates
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU"

# Create registry key if it doesn't exist
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

# Set Automatic Updates to "Notify for download and auto install"
Set-ItemProperty -Path $registryPath -Name "NoAutoUpdate" -Value 0
Set-ItemProperty -Path $registryPath -Name "AUOptions" -Value 4  # 4 = Notify for download and install

Write-Host "Automatic Updates has been configured to notify for download and auto-install."
