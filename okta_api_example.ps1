Import-Module Okta
#Output User's Unique ID
$User = oktaGetUserbyID -oOrg dev1 -uid ericspreher@hotmail.com
Write-Host $User.id