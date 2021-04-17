# Set the Path of the files
$path = Read-Host "Enter the path"

# Select Algorithm
$algo =  Read-Host "Select Algorith accepted valuese: SHA1, SHA256, SHA384, SHA512, MD5"

# Get the all the files in the folder and the subfolders
$files = Get-ChildItem -Path $path -Name -Recurse -Force

# Create a loop to generate a hash
foreach ($file in $files){
    # Writes the Hash and the path\filename
    $hash = Get-FileHash $path\$file -Algorithm $algo
    Write-Output $hash
    }
