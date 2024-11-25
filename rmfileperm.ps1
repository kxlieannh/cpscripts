# Define the file/folder path and user/group
$filePath = "C:\path\to\your\file_or_folder"
$userOrGroup = "DOMAIN\User"  # Change as needed

# Get the ACL (Access Control List) of the file/folder
$acl = Get-Acl $filePath

# Remove all matching rules for the specified user/group
$acl.Access | Where-Object { $_.IdentityReference -eq $userOrGroup } | ForEach-Object {
    $acl.RemoveAccessRule($_)
}

# Apply the modified ACL to the file/folder
Set-Acl $filePath $acl

Write-Host "Permission has been removed for $userOrGroup on $filePath"

