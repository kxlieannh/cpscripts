# Define CPU and Memory thresholds
$cpuThreshold = 10     # Example: Processes using more than 10% CPU
$memThreshold = 200MB  # Example: Processes using more than 200MB memory

# Get all processes and filter based on thresholds
$processes = Get-Process | Where-Object {
    ($_.CPU -gt $cpuThreshold) -or ($_.WS -gt $memThreshold)
}

# Display suspicious processes
if ($processes) {
    Write-Host "Potentially unusual processes found:" -ForegroundColor Yellow
    $processes | Format-Table Name, CPU, WS, StartTime, Path
} else {
    Write-Host "No unusual processes detected." -ForegroundColor Green
}
