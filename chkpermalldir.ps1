# Define the directory path
$directoryPath = "C:\path\to\your\directory"

# Get all files and folders recursively
$items = Get-ChildItem -Path $directoryPath -Recurse

foreach ($item in $items) {
    $acl = Get-Acl $item.FullName
    Write-Host "Permissions for $($item.FullName):"
    $acl.Access | ForEach-Object {
        Write-Host "User/Group: $($_.IdentityReference)"
        Write-Host "Permission: $($_.FileSystemRights)"
        Write-Host "Type: $($_.AccessControlType)"
        Write-Host "Is Inherited: $($_.IsInherited)"
        Write-Host "----"
    }
}
