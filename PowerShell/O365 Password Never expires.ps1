# Type the credentials
$cred = Get-Credentials

# Connect to Office 365 with the admin credentials
Connect-MsolService -credential $cred

# Reads the username
$user = Read-Host 'Enter the user that the password will not expire'

# Set the password to not expire
Set-MsolUser -UserPrincipalName $user -PasswordNeverExpires $true

# Replace email@provider.com with the actual email to see if the change is done
Get-MsolUser -UserPrincipalName $user | Select PasswordNeverExpires

pause
