# Disable unnecessary services (example: Windows Remote Management)
Set-Service -Name WinRM -StartupType Disabled
Stop-Service -Name WinRM

# Disable Windows Remote Desktop
Set-Service -Name TermService -StartupType Disabled
Stop-Service -Name TermService

# Disable Windows Defender Antivirus (if not required)
Set-MpPreference -DisableRealtimeMonitoring $true
