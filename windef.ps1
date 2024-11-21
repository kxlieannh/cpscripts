# Script to update Windows Defender definitions and run a quick scan
# Run as Administrator

# Function to check if Windows Defender is enabled
function Check-DefenderStatus {
    Write-Host "Checking Windows Defender status..." -ForegroundColor Green
    $defenderStatus = Get-MpComputerStatus
    if ($defenderStatus.AntispywareEnabled -eq $true -and $defenderStatus.AntivirusEnabled -eq $true) {
        Write-Host "Windows Defender is enabled." -ForegroundColor Cyan
        return $true
    } else {
        Write-Host "Windows Defender is disabled. Please enable it before running this script." -ForegroundColor Red
        return $false
    }
}

# Function to update Windows Defender
function Update-WindowsDefender {
    Write-Host "Updating Windows Defender definitions..." -ForegroundColor Green
    try {
        Update-MpSignature
        Write-Host "Windows Defender definitions updated successfully." -ForegroundColor Cyan
    } catch {
        Write-Host "Failed to update definitions. Error: $_" -ForegroundColor Red
    }
}

# Function to run a quick scan
function Run-QuickScan {
    Write-Host "Running a quick scan with Windows Defender..." -ForegroundColor Green
    try {
        Start-MpScan -ScanType QuickScan
        Write-Host "Quick scan completed successfully." -ForegroundColor Cyan
    } catch {
        Write-Host "Failed to run a quick scan. Error: $_" -ForegroundColor Red
    }
}

# Main Script Execution
if (Check-DefenderStatus) {
    Update-WindowsDefender
    Run-QuickScan
} else {
    Write-Host "Exiting script. Ensure Windows Defender is enabled and try again." -ForegroundColor Yellow
}
