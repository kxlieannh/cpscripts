
# Run as Administrator

# Parameters
$MinimumPasswordLength = 12
$MaximumPasswordAge = 90       # Days
$MinimumPasswordAge = 1        # Days
$PasswordHistorySize = 24      # Number of remembered passwords
$PasswordComplexity = 1        # Enable complexity (0 = Disabled, 1 = Enabled)
$LockoutThreshold = 5          # Number of invalid login attempts
$LockoutDuration = 30          # Minutes
$ResetLockoutCounter = 30      # Minutes to reset lockout counter

# Set Password Policy
Write-Host "Configuring password policies..." -ForegroundColor Green

# Set minimum password length
net accounts /minpwlen:$MinimumPasswordLength

# Set maximum password age
net accounts /maxpwage:$MaximumPasswordAge

# Set minimum password age
net accounts /minpwage:$MinimumPasswordAge

# Set password history size
net accounts /uniquepw:$PasswordHistorySize

# Enable password complexity
if ($PasswordComplexity -eq 1) {
    secedit /export /cfg C:\SecTemp.cfg
    (Get-Content C:\SecTemp.cfg) -replace 'PasswordComplexity = 0', 'PasswordComplexity = 1' | Set-Content C:\SecTemp.cfg
    secedit /configure /db secedit.sdb /cfg C:\SecTemp.cfg
    Remove-Item C:\SecTemp.cfg
    Write-Host "Password complexity enabled." -ForegroundColor Cyan
} else {
    Write-Host "Password complexity is disabled." -ForegroundColor Yellow
}

# Set Account Lockout Policy
Write-Host "Configuring account lockout policies..." -ForegroundColor Green
secedit /export /cfg C:\SecTemp.cfg
(Get-Content C:\SecTemp.cfg) -replace 'LockoutBadCount = .*', "LockoutBadCount = $LockoutThreshold" |
    Set-Content C:\SecTemp.cfg
(Get-Content C:\SecTemp.cfg) -replace 'LockoutDuration = .*', "LockoutDuration = $LockoutDuration" |
    Set-Content C:\SecTemp.cfg
(Get-Content C:\SecTemp.cfg) -replace 'ResetLockoutCount = .*', "ResetLockoutCount = $ResetLockoutCounter" |
    Set-Content C:\SecTemp.cfg
secedit /configure /db secedit.sdb /cfg C:\SecTemp.cfg
Remove-Item C:\SecTemp.cfg

Write-Host "Password policies have been configured successfully." -ForegroundColor Green
