#Log into Azure
Connect-AzureAD

#Get all the device related commands
Get-Command -Module AzureAD "*device*"

#Get all existing Azure AD devices
Get-AzureADDevice | Format-List

#Get device owner and users
$device = Get-AzureADDevice

Get-AzureADDeviceRegisteredOwner -ObjectId $device.ObjectId
Get-AzureADDeviceRegisteredUser -ObjectId $device.ObjectId

$user = Get-AzureADUser -SearchString "Arthur Dent"

Add-AzureADDeviceRegisteredUser -ObjectId $device.ObjectId -RefObjectId $user.ObjectId

#Disable a device
Set-AzureADDevice -AccountEnabled:$false -ObjectId $device.ObjectId
