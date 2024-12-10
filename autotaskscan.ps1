# Create a task to run the script every hour
$taskName = "UnusualProcessScan"
$scriptPath = "C:\Scripts\ProcessScan.ps1"

# Define the task action
$action = New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument "-NoProfile -WindowStyle Hidden -File `"$scriptPath`""

# Set the trigger (runs every hour)
$trigger = New-ScheduledTaskTrigger -Once -At (Get-Date).AddMinutes(1) `
    -RepetitionInterval (New-TimeSpan -Hours 1) -RepetitionDuration (New-TimeSpan -Days 1)

# Register the task
Register-ScheduledTask -TaskName $taskName -Trigger $trigger -Action $action -Description "Scans for unusual processes" -RunLevel Highest
