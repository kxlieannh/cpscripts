# Define the shared memory object name
$objectName = "Global\SharedMemoryExample"

# Import necessary .NET namespaces
Add-Type -AssemblyName System.IO

# Open the existing shared memory object
try {
    $mmf = [System.IO.MemoryMappedFiles.MemoryMappedFile]::OpenExisting($objectName)
} catch {
    Write-Host "Error: Unable to access the shared memory object '$objectName'. It may not exist or you may lack permissions."
    exit
}

# Retrieve the current security settings
$security = $mmf.GetAccessControl()

# Create a new access rule to deny read access to 'Everyone'
$rule = New-Object System.Security.AccessControl.AccessRule(
    "Everyone",                    # User or group
    [System.IO.MemoryMappedFiles.MemoryMappedFileRights]::Read,  # Rights to deny
    [System.Security.AccessControl.AccessControlType]::Deny      # Deny rule
)

# Add the rule to the security settings
$security.AddAccessRule($rule)

# Apply the updated security settings
$mmf.SetAccessControl($security)

# Confirm the update
Write-Host "Permissions updated: Restricted shared memory access to '$objectName'."
