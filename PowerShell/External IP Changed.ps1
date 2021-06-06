# If your external ip is not static and you do not wish to use opendns or similar service
# This script is ment to be used in a schedule task and run every 15 min or so
# When the IP changes will send an email to the receipient.

# Set the path where the files will be saved
$path = "/home/"

(Invoke-WebRequest ifconfig.me/ip).Content > $path/eip.txt
$eip = Get-Content $path/eip.txt
$old = Get-Content $path/old.txt

if ($eip -notlike $old){

# Sender Credentials
$Username = "user@gmail.com"
$Password = "appspecificpassword"
$secureString = $Password | ConvertTo-SecureString -AsPlainText -Force 
$creds = New-Object System.Management.Automation.PSCredential -ArgumentList $userName, $secureString


$From = “user@gmail.com”

$To = “otheruser@gmail.com”

#$Attachment = 

$Subject = “This is your new ip $eip”

$Body = “<h1>Your new External IP is $eip </h1>”

$SMTPServer = “smtp.gmail.com”

$SMTPPort = “587”

#$creds = Get-Credential

Send-MailMessage -From $From -to $To -Subject $Subject -Body $Body -SmtpServer $SMTPServer -port $SMTPPort -Credential $creds -UseSsl -BodyAsHtml #-Attachments $Attachment

}

Get-content -Path $path/eip.txt > old.txt
