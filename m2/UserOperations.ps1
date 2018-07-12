#Log into Azure
Connect-AzureAD

$domain = "ContosoNed.onmicrosoft.com"
$PasswordProfile = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile
$PasswordProfile.Password = "agxsFX72xwsSAi"

#Find an existing user
Get-AzureADUser -SearchString "PA"

Get-AzureADUser -Filter "State eq 'PA'"

#Creating a new user
$user = @{
    City = "Philadelphia"
    Country = "United States"
    Department = "Information Technology"
    DisplayName = "Ford Prefect"
    GivenName = "Ford"
    JobTitle = "Technical Writer"
    UserPrincipalName = "FoPrefect@$domain"
    PasswordProfile = $PasswordProfile
    PostalCode = "19001"
    State = "PA"
    StreetAddress = "42 Hitchhiker Highway"
    Surname = "Prefect"
    TelephoneNumber = "215-867-5309"
    MailNickname = "FoPrefect"
    AccountEnabled = $true
    UsageLocation = "US"
}

$newUser = New-AzureADUser @user

$newUser | Format-List
