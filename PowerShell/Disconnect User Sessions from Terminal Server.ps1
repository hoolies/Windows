$username = Read-Host "Type the username that you would like to check"
$computer = Read-Host "Enter the computer name that you would like to check"
$qur = quser /server:$computer 2>&1
Write-Output $qur
$csv = $qur | ForEach-Object -Process { $_ -replace '\s{2,}',',' }
$quo = $csv | ConvertFrom-Csv
$usersession = $quo | Where-Object -FilterScript {$_.USERNAME -like $username}
$answer = Read-Host "Do you want to log off the user"
If ($answer -eq 'y'){
    logoff $usersession.ID /server:$computer
    Write-Output "The $username has been logged off the $computer"
}
