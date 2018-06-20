#Install AzureRM if doesn't exist
if(-not (Get-Module AzureRM)){
    Install-Module -Name AzureRM -Force
}

#Log into Azure
Add-AzureRMAccount

$data = import-csv -Path .\Fake_User_data.csv
$domain = "ContosoNed.onmicrosoft.com"
$password = "agxsFX72xwsSAi"

foreach($item in $data){
    $user = @{
        DisplayName = "$(item.GivenName) $($item.Surname)"
        UserPrincipalName = "$($item.Username)@$domain"
        Password = ConvertTo-SecureString $password –asplaintext –force
        MailNickname = $item.Username
    }

    New-AzureRMADUser @user
}


