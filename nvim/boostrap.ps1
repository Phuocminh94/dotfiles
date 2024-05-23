$sourceFolder = "C:\Users\buiph\dotfiles\nvim"
$destinationFolder = "C:\Users\buiph\AppData\Local\nvim"

if (!(Test-Path $sourceFolder)) {
    Write-Host "Source folder does not exist."
    exit
}

if (!(Test-Path $destinationFolder)) {
    Write-Host "Destination folder does not exist. Creating it..."
    New-Item -ItemType Directory -Path $destinationFolder -Force
}

Copy-Item -Path $sourceFolder\* -Destination $destinationFolder -Recurse -Force

Write-Host "Symbolic link created from $sourceFolder to $destinationFolder"
