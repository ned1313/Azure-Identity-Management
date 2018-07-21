#Log into Azure
Connect-AzureAD

#Get all the device related commands
Get-Command -Module AzureAD "*application*"

#Get all existing applications
Get-AzureADApplication

#Create a new application
$app = New-AzureADApplication -DisplayName "Marketing App"  -IdentifierUris "http://marketing.contosoned.xyz"

$app | Format-List

New-AzureADServicePrincipal -AppId $app.AppId

