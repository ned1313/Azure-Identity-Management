#Install the AzureAD Module
if(-not (Get-Module AzureAD)){
    Install-Module -Name AzureAD -Force
}

#Connect to the Azure AD tenant
Connect-AzureAD

#Get info about the current session
Get-AzureADCurrentSessionInfo

#Get Information about the tenant and domain
Get-AzureADTenantDetail

Get-AzureADDomain

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



