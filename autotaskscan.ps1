# Create a task to run the script every hour
$taskName = "UnusualProcessScan"
$scriptPath = "C:\Scripts\ProcessScan.ps1"

# Define the task action
$action = New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument "-File $scriptPath"

# Set the trigger (runs hourly)
$trigger = New-ScheduledTaskTrigger -RepetitionInterval (New-TimeSpan -Hours 1) -AtStartup

# Register the task
Register-ScheduledTask -TaskName $taskName -Trigger $trigger -Action $action -Description "Scans for unusual processes"
