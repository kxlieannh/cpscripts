# Define the file/folder path and user/group
$filePath = "C:\path\to\your\file_or_folder"
$userOrGroup = "DOMAIN\User"  # Can also be a group name like "Everyone"

# Define the type of permission you want to assign (e.g., Read, Write, FullControl)
$permission = "Read"  # Options: "Read", "Write", "FullControl", etc.

# Get the ACL (Access Control List) of the file/folder
$acl = Get-Acl $filePath

# Create the FileSystemAccessRule object
$accessRule = New-Object System.Security.AccessControl.FileSystemAccessRule($userOrGroup, $permission, "Allow")

# Add the rule to the ACL
$acl.SetAccessRule($accessRule)

# Apply the modified ACL to the file/folder
Set-Acl $filePath $acl

Write-Host "Permission '$permission' has been granted to $userOrGroup on $filePath"
