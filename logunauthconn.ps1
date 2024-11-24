# Define trusted IP ranges and ports
$trustedIPs = @('192.168.1.0/24', '10.0.0.0/8', '127.0.0.1')
$trustedPorts = @(80, 443, 22)  # Adjust based on your environment

# Log file location
$logFile = "C:\Logs\UnauthorizedConnections.log"

# Create the log file directory if it doesn't exist
if (-not (Test-Path -Path "C:\Logs")) {
    New-Item -ItemType Directory -Path "C:\Logs"
}

# Fetch all active TCP connections
$connections = Get-NetTCPConnection | Where-Object { $_.State -eq 'Established' }

foreach ($conn in $connections) {
    $remoteIP = $conn.RemoteAddress
    $remotePort = $conn.RemotePort
    $process = Get-Process -Id $conn.OwningProcess -ErrorAction SilentlyContinue

    # Check if the connection is unauthorized
    $isTrustedIP = $trustedIPs | Where-Object { $remoteIP -like $_ }
    $isTrustedPort = $trustedPorts -contains $remotePort

    if (-not $isTrustedIP -or -not $isTrustedPort) {
        # Format the log entry
        $logEntry = "$(Get-Date) - Unauthorized Connection Detected:`n"
        $logEntry += "Remote IP: $remoteIP`nRemote Port: $remotePort`n"
        $logEntry += "Local Address: $($conn.LocalAddress)`nProcess: $($process.ProcessName)`n---"

        # Write to log file
        Add-Content -Path $logFile -Value $logEntry

        # Log to Windows Event Viewer
        $eventMessage = "Unauthorized connection detected from $remoteIP on port $remotePort."
        Write-EventLog -LogName "Application" -Source "NetworkMonitor" -EventId 102 -EntryType Warning -Message $eventMessage
    }
}

Write-Host "Unauthorized connection scan complete. Check $logFile for details." -ForegroundColor Green
