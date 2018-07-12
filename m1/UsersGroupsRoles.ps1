#Working with roles
Get-AzureADDirectoryRole

$CompanyAdminRole = Get-AzureADDirectoryRole | Where-Object {$_.DisplayName -eq "Company Administrator"}

Get-AzureADDirectoryRoleMember -ObjectId $CompanyAdminRole.ObjectId

Get-AzureADDirectoryRoleTemplate

$SecurityAdminRoleTemplate = Get-AzureADDirectoryRoleTemplate | Where-Object {$_.DisplayName -eq "Security Administrator"}

#Activate the role
$SecurityAdminRole = Enable-AzureADDirectoryRole -RoleTemplateId $SecurityAdminRoleTemplate.ObjectId

$user = Get-AzureADUser -Top 1

Add-AzureADDirectoryRoleMember -RefObjectId $user.ObjectId -ObjectId $SecurityAdminRole.ObjectId