# Get active TCP connections
$connections = Get-NetTCPConnection | Where-Object {
    $_.State -eq 'Established'
}

# Fetch the list of processes linked to each connection
$connections | ForEach-Object {
    $process = Get-Process -Id $_.OwningProcess -ErrorAction SilentlyContinue
    if ($process) {
        [PSCustomObject]@{
            RemoteAddress = $_.RemoteAddress
            RemotePort    = $_.RemotePort
            ProcessName   = $process.ProcessName
            LocalAddress  = $_.LocalAddress
        }
    }
} | Format-Table -AutoSize
