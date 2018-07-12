#Log into Azure
Connect-AzureAD

#Get all the groups in Azure AD Tenant
Get-AzureADGroup

#Get the Information Technology Group
$group = Get-AzureADGroup -SearchString "Information Technology"

#Get all members and the owner
Get-AzureADGroupMember -ObjectId $group.ObjectId

Get-AzureADGroupOwner -ObjectId $group.ObjectId

#Create a new group
$group = @{
    DisplayName = "Ford Group"
    MailEnabled = $false
    MailNickName = "FordGroup"
    SecurityEnabled = $true
}

$newGroup = New-AzureADGroup @group

#Update the group description
Set-AzureADGroup -ObjectId $newGroup.ObjectId -Description "Group for Ford to use."

#Set Ford as the owner
$ford = Get-AzureADUser -Filter "DisplayName eq 'Ford Prefect'"

Add-AzureADGroupOwner -ObjectId $newGroup.ObjectId -RefObjectId $ford.ObjectId

#Add users to the group
$users = Get-AzureADUser -Filter "State eq 'PA'"

foreach($user in $users){
    Add-AzureADGroupMember -ObjectId $newGroup.ObjectId -RefObjectId $user.ObjectId
}

#AzureADPreview Only
$dynamicGroup = @{
    DisplayName = "Marketing Group"
    MailEnabled = $false
    MailNickName = "MarketingGroup"
    SecurityEnabled = $true
    Description = "Dynamic group for Marketing"
    GroupTypes = "DynamicMembership"
    MembershipRule = "(user.department -contains ""Marketing"")"
    MembershipRuleProcessingState = "On"
}

New-AzureADMSGroup @dynamicGroup

