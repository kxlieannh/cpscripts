# Define the file paths you want to monitor
$filePaths = @(
    "C:\Windows\System32\kernel32.dll",
    "C:\Windows\System32\notepad.exe"
)

# Path to save the hashes
$hashFile = "C:\path\to\your\file_hashes.txt"

# Create or clear the hash file
Clear-Content $hashFile

# Loop through each file and calculate the hash
foreach ($file in $filePaths) {
    if (Test-Path $file) {
        # Calculate the SHA256 hash
        $hash = Get-FileHash $file -Algorithm SHA256
        # Save the file path and hash to the hash file
        "$($file) $($hash.Hash)" | Out-File -Append $hashFile
    } else {
        Write-Host "File not found: $file"
    }
}
