# Import SQL Server Management Objects (SMO)
Import-Module SqlServer

# Connect to the SQL Server instance
$server = New-Object Microsoft.SqlServer.Management.Smo.Server("(local)")

# Disable the Shared Memory protocol
$server.Configuration.NetworkProtocols | Where-Object { $_.Name -eq "SharedMemory" } | ForEach-Object {
    $_.IsEnabled = $false
    $_.Alter()
    Write-Host "Shared Memory protocol has been disabled for SQL Server."
}
