# Set permissions on a specific shared memory object (example name)
$objectName = "Global\\SharedMemoryExample"

# Retrieve the object and apply security settings
$acl = Get-Acl -Path "\\?\Global\$objectName"
$rule = New-Object System.Security.AccessControl.FileSystemAccessRule("Everyone", "Read", "Deny")
$acl.AddAccessRule($rule)

Set-Acl -Path "\\?\Global\$objectName" -AclObject $acl
Write-Host "Permissions updated: Restricted shared memory access to $objectName."
