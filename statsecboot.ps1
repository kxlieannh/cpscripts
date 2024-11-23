# Check Secure Boot status using WMI
$secureBoot = Get-WmiObject -Namespace "Root\CIMv2\security\Microsoft\Uefi" -Class Win32_SecureBootSetting

if ($secureBoot) {
    $secureBootStatus = $secureBoot.SecureBootEnabled
    if ($secureBootStatus -eq $true) {
        Write-Host "Secure Boot is enabled on this system."
    } else {
        Write-Host "Secure Boot is disabled on this system."
    }
} else {
    Write-Host "Unable to retrieve Secure Boot status. This system may not support Secure Boot."
}
