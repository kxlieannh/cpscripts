# Function to Disable or Enable the Built-in Administrator Account
function Set-AdministratorAccount {
    param (
        [bool]$Disable
    )

    if ($Disable) {
        # Disable Built-in Administrator account
        Disable-LocalUser -Name "Administrator"
        Write-Host "Built-in Administrator account has been disabled."
    } else {
        # Enable Built-in Administrator account
        Enable-LocalUser -Name "Administrator"
        Write-Host "Built-in Administrator account has been enabled."
    }
}

# Function to Block Microsoft Accounts (prevent users from using Microsoft accounts)
function Block-MicrosoftAccounts {
    # Registry key to block Microsoft accounts logon
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "NoConnectedUser" -Value 1
    Write-Host "Microsoft accounts are blocked for logon."
}

# Function to Disable Guest Account
function Set-GuestAccount {
    param (
        [bool]$Disable
    )

    if ($Disable) {
        # Disable Guest Account
        Disable-LocalUser -Name "Guest"
        Write-Host "Guest account has been disabled."
    } else {
        # Enable Guest Account
        Enable-LocalUser -Name "Guest"
        Write-Host "Guest account has been enabled."
    }
}

# Function to Limit Blank Password Use to Console Only
function Limit-BlankPasswords {
    # Set the local policy to restrict blank password logins to console logon only
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "AccountsNoLMHash" -Value 1
    Write-Host "Local account blank passwords are restricted to console logon only."
}

# Function to Rename Administrator Account
function Rename-AdministratorAccount {
    param (
        [string]$NewName
    )

    # Rename Administrator account
    Rename-LocalUser -Name "Administrator" -NewName $NewName
    Write-Host "Administrator account renamed to $NewName."
}

# Function to Rename Guest Account
function Rename-GuestAccount {
    param (
        [string]$NewName
    )

    # Rename Guest account
    Rename-LocalUser -Name "Guest" -NewName $NewName
    Write-Host "Guest account renamed to $NewName."
}

# Function to Set Permissions for Removable Media
function Set-RemovableMediaPermissions {
    # Allow only Administrators to format and eject removable media
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name "NoDrives" -Value 0x00000002
    Write-Host "Only administrators are allowed to format and eject removable media."
}

# Function to Prevent Users from Installing Printer Drivers
function Prevent-PrinterDriverInstallation {
    # Restrict non-admins from installing printer drivers
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Driver" -Name "DisablePrinterInstallation" -Value 1
    Write-Host "Users are prevented from installing printer drivers."
}

# Function to Restrict CD-ROM Access to Local Users Only
function Restrict-CDROMAccess {
    # Set the registry to restrict CD-ROM access to locally logged-on user
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name "NoCDROM" -Value 1
    Write-Host "CD-ROM access is restricted to locally logged-on users only."
}

# Function to Disable SMBv1
function Disable-SMBv1 {
    # Disable SMBv1 protocol for better security
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" -Name "SMB1" -Value 0
    Write-Host "SMBv1 protocol has been disabled."
}

# Function to Set Interactive Logon Policies
function Set-InteractiveLogonPolicies {
    # Example settings for Interactive Logon options
    # Set "Do not display user information when the session is locked"
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "DontDisplayLockedUserInfo" -Value 1
    Write-Host "User information will not be displayed when session is locked."
    
    # Set "Require CTRL+ALT+DEL before login"
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "DisableCAD" -Value 0
    Write-Host "CTRL+ALT+DEL will be required before login."

    # Set "Don't display last signed-in user"
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "DontDisplayLastUserName" -Value 1
    Write-Host "Last signed-in user will not be displayed."
}

# Function to Set Password Expiry Policy
function Set-PasswordExpiry {
    param (
        [int]$DaysBeforeExpiration
    )

    # Set the password expiration warning time to $DaysBeforeExpiration
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "PasswordExpiryWarning" -Value $DaysBeforeExpiration
    Write-Host "Password expiration warning set to $DaysBeforeExpiration days."
}

# Function to Prevent Anonymous Access to Network Shares
function Prevent-AnonymousNetworkAccess {
    # Restrict anonymous network access
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "RestrictAnonymous" -Value 1
    Write-Host "Anonymous network access has been restricted."
}

# Example of using the functions:
Set-AdministratorAccount -Disable $true
Block-MicrosoftAccounts
Set-GuestAccount -Disable $true
Limit-BlankPasswords
Rename-AdministratorAccount -NewName "NewAdminName"
Rename-GuestAccount -NewName "NewGuestName"
Set-RemovableMediaPermissions
Prevent-PrinterDriverInstallation
Restrict-CDROMAccess
Disable-SMBv1
Set-InteractiveLogonPolicies
Set-PasswordExpiry -DaysBeforeExpiration 5
Prevent-AnonymousNetworkAccess
