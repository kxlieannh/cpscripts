# Ensure the script runs with administrative privileges
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Error "This script must be run as an Administrator."
    exit
}

# Define the audit policies to configure
$policies = @(
    @{Category="Account Logon"; Subcategory="Logon"; Setting="Success,Failure"},
    @{Category="Account Management"; Subcategory="User Account Management"; Setting="Success,Failure"},
    @{Category="System"; Subcategory="System Integrity"; Setting="Success,Failure"},
    @{Category="Object Access"; Subcategory="File System"; Setting="Success,Failure"},
    @{Category="Policy Change"; Subcategory="Audit Policy Change"; Setting="Success,Failure"},
    @{Category="Privilege Use"; Subcategory="Sensitive Privilege Use"; Setting="Success,Failure"}
)

# Apply the audit policies
foreach ($policy in $policies) {
    Write-Host "Configuring $($policy.Subcategory)..."
    auditpol /set /category:$($policy.Category) /subcategory:$($policy.Subcategory) /success:$($policy.Setting.Contains("Success")) /failure:$($policy.Setting.Contains("Failure"))
}

# Configure log size and retention policy
$maxLogSize = 104857600  # 100 MB (adjust as needed)
wevtutil sl Security /ms:$maxLogSize /rt:true  # Enable overwrite retention policy

# Verify the settings
Write-Host "`nVerifying configured policies:"
auditpol /get /category:*

Write-Host "`nLog configuration completed successfully." -ForegroundColor Green
