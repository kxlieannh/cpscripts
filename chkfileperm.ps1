# Define the path to the file/folder
$filePath = "C:\path\to\your\file_or_folder"

# Get the ACL (Access Control List) of the file/folder
$acl = Get-Acl $filePath

# Display the permissions
$acl.Access | ForEach-Object {
    Write-Host "User/Group: $($_.IdentityReference)"
    Write-Host "Permission: $($_.FileSystemRights)"
    Write-Host "Type: $($_.AccessControlType)"
    Write-Host "Is Inherited: $($_.IsInherited)"
    Write-Host "----"
}
