# 1. Enable Windows Firewall for all profiles (Domain, Private, Public)
Set-NetFirewallProfile -Profile Domain,Private,Public -Enabled True

# 2. Set inbound connections to be blocked by default
Set-NetFirewallProfile -Profile Domain,Private,Public -DefaultInboundAction Block

# 3. Set outbound connections to be allowed by default
Set-NetFirewallProfile -Profile Domain,Private,Public -DefaultOutboundAction Allow

# 4. Disable file and printer sharing for increased security
Set-NetFirewallRule -DisplayGroup "File and Printer Sharing" -Enabled False

# 5. Enable logging for dropped packets
Set-NetFirewallProfile -Profile Domain,Private,Public -LogFileName "C:\Windows\System32\LogFiles\Firewall\pfirewall.log"
Set-NetFirewallProfile -Profile Domain,Private,Public -LogMaxSize 4096
Set-NetFirewallProfile -Profile Domain,Private,Public -LogAllowed False
Set-NetFirewallProfile -Profile Domain,Private,Public -LogDropped True

# 6. (Optional) Block specific ports (Example: Blocking Telnet and FTP ports for better security)
New-NetFirewallRule -DisplayName "Block Telnet" -Direction Inbound -Protocol TCP -LocalPort 23 -Action Block
New-NetFirewallRule -DisplayName "Block FTP" -Direction Inbound -Protocol TCP -LocalPort 21 -Action Block

# 7. (Optional) Block Windows Management Instrumentation (WMI) on Public networks
New-NetFirewallRule -DisplayName "Block WMI on Public" -Direction Inbound -Protocol TCP -LocalPort 135 -Profile Public -Action Block

# 8. Check firewall status to confirm settings
Get-NetFirewallProfile
