# Define the file paths you want to monitor
$filePaths = @(
    "C:\Windows\System32\kernel32.dll",
    "C:\Windows\System32\notepad.exe"
)

# Path to save the hashes (use a directory with appropriate permissions)
$hashFolder = "C:\PathExample"
$hashFile = Join-Path $hashFolder "file_example.txt"

# Ensure the directory exists and set permissions
if (!(Test-Path $hashFolder)) {
    New-Item -ItemType Directory -Path $hashFolder -Force | Out-Null
}

# Grant write permission to the current user
$currentUser = "$env:USERNAME"
icacls $hashFolder /grant "${currentUser}:(OI)(CI)M" /inheritance:r | Out-Null

# Create or clear the hash file (handle permission errors)
try {
    Clear-Content $hashFile -ErrorAction Stop
} catch {
    Write-Host "Could not clear the hash file. Error: $_"
    exit 1  # Exit with an error code if clearing fails
}

# Loop through each file and calculate the hash
foreach ($file in $filePaths) {
    if (Test-Path $file) {
        try {
            # Calculate the SHA256 hash
            $hash = Get-FileHash $file -Algorithm SHA256
            # Save the file path and hash to the hash file
            "$($file) $($hash.Hash)" | Out-File -Append $hashFile -ErrorAction Stop
        } catch {
            Write-Host "Could not write hash for $file. Error: $_"
        }
    } else {
        Write-Host "File not found: $file"
    }
}

Write-Host "Hash calculation completed. Results saved to $hashFile."
