# Define the path to the file where the known good hashes are stored
$hashFile = "C:\path\to\your\file_hashes.txt"

# Define the log file where changes will be recorded
$logFile = "C:\path\to\your\integrity_log.txt"

# Read the baseline hash data
$baselineHashes = Get-Content $hashFile

# Loop through each line in the hash file and check the file integrity
foreach ($line in $baselineHashes) {
    $parts = $line.Split(' ')
    $filePath = $parts[0]
    $expectedHash = $parts[1]

    if (Test-Path $filePath) {
        # Calculate the current hash of the file
        $currentHash = (Get-FileHash $filePath -Algorithm SHA256).Hash

        # Check if the current hash matches the expected hash
        if ($currentHash -ne $expectedHash) {
            # Log the integrity failure
            $message = "$(Get-Date) - File integrity compromised: $filePath. Expected: $expectedHash, Found: $currentHash"
            $message | Out-File -Append $logFile
            Write-Host $message
        }
    } else {
        # Log the missing file
        $message = "$(Get-Date) - File not found: $filePath"
        $message | Out-File -Append $logFile
        Write-Host $message
    }
}
