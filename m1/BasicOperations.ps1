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



