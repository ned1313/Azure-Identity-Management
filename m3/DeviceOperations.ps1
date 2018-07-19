#Log into Azure
Connect-AzureAD

#Get all the device related commands
Get-Command -Module AzureAD "*device*"

#Get all existing Azure AD devices
Get-AzureADDevice -All

#Get Device configuration info
$device = Get-AzureADDevice -All -Top 1
Get-AzureADDeviceConfiguration