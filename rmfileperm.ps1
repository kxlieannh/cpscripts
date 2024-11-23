# Define the file/folder path and user/group
$filePath = "C:\path\to\your\file_or_folder"
$userOrGroup = "DOMAIN\User"  # Can also be a group name like "Everyone"

# Get the ACL (Access Control List) of the file/folder
$acl = Get-Acl $filePath

# Create the FileSystemAccessRule object for the user or group
$accessRule = New-Object System.Security.AccessControl.FileSystemAccessRule($userOrGroup, "FullControl", "Allow")

# Remove the rule from the ACL
$acl.RemoveAccessRule($accessRule)

# Apply the modified ACL to the file/folder
Set-Acl $filePath $acl

Write-Host "Permission has been removed for $userOrGroup on $filePath"
