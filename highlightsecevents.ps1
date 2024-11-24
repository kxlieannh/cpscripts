# Define the Event IDs to highlight
$eventIDs = @(4625, 4720, 4728, 4672, 4688, 4648)

# Log file for storing highlighted events
$logFile = "C:\Logs\SecurityEvents.log"

# Create the log file directory if it doesn't exist
if (-not (Test-Path -Path "C:\Logs")) {
    New-Item -ItemType Directory -Path "C:\Logs"
}

# Fetch the Security events
$securityEvents = Get-WinEvent -LogName Security -FilterHashtable @{Id=$eventIDs} -MaxEvents 50

# Process and log the events
foreach ($event in $securityEvents) {
    # Extract relevant information
    $eventTime = $event.TimeCreated.ToString("yyyy-MM-dd HH:mm:ss")
    $eventID = $event.Id
    $message = $event.Message -replace "`r`n", " "

    # Format the log entry
    $logEntry = "$eventTime - Event ID: $eventID`nMessage: $message`n---"

    # Write to the log file
    Add-Content -Path $logFile -Value $logEntry
}

Write-Host "Highlighted Security Events logged to $logFile." -ForegroundColor Green
