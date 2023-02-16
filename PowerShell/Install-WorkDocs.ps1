$installationpath = "C:\Program Files\Amazon\AWSWorkDocsDriveClient"
$source = "\\sharededrive" # place the WorkDocs client in a shared drive
$destination = "C:\ProgramData\SharedComputers"

if (Test-Path $installationpath){
    exit
} else {

    mkdir $destination
    

    robocopy $source $destination /MIR /Z /E /fft 

 
    cd $destination
 
    .\AWSWorkDocsDriveClient.msi /quiet /norestart
}
