$homePath = $env:USERPROFILE
$sourceFolder = "$homePath\dotfiles\nvim"
$destinationFolder = "$homePath\AppData\Local\nvim"


# Check if the source folder exists
if (!(Test-Path $sourceFolder)) {
    Write-Host "Source folder does not exist."
    exit
}


# Check if the destination folder already exists
if (Test-Path $destinationFolder) {
    Write-Host "Destination folder already exists. Removing it..."
    Remove-Item -Recurse -Force -Path $destinationFolder
}


# Create the symbolic link
New-Item -ItemType SymbolicLink -Path $destinationFolder -Target $sourceFolder

Write-Host "Symbolic link created from $sourceFolder to $destinationFolder"
