# The application "PeopleView" will have the "PeopleViewReadyOnly" Role for Assignment to the application.
# This script will check all users' department and provision/deprovision them from the group based on the 
# HR deparment value.
Import-Module Okta
$PeopleViewReadOnlyGid = "00gl7n7mdWEK4hkv75d6"
#Interate though all of the users
$Users = oktaListUsers -oOrg dev1
# Check the Department. If HR then add PeopleViewReadOnly Group Else Remove
foreach ($u in $users)
{
    if ($u.profile.department -eq "HR") {
        Write-Host "Adding user " + $u.id + " from PeopleViewReadOnly group"
        oktaAddUseridtoGroupid -oOrg dev1 -uid $u.id -gid $PeopleViewReadOnlyGid
    } else {
        Write-Host "Removing user " + $u.id + " from PeopleViewReadOnly group"
        oktaDelUseridfromGroupid -oOrg dev1 -uid $u.id -gid $PeopleViewReadOnlyGid
    }
}