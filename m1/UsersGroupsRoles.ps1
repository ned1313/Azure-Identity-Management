#Working with roles
Get-AzureADDirectoryRole

$CompanyAdminRole = Get-AzureADDirectoryRole | Where-Object {$_.DisplayName -eq "Company Administrator"}

Get-AzureADDirectoryRoleMember -ObjectId $CompanyAdminRole.ObjectId

Get-AzureADDirectoryRoleTemplate

$BillingAdminRoleTemplate = Get-AzureADDirectoryRoleTemplate | Where-Object {$_.DisplayName -eq "Helpdesk Administrator"}

#Activate the role
$BillingAdminRole = Enable-AzureADDirectoryRole -RoleTemplateId $BillingAdminRoleTemplate.ObjectId

$user = Get-AzureADUser -Top 1

Add-AzureADDirectoryRoleMember -RefObjectId $user.ObjectId -ObjectId $BillingAdminRole.ObjectId