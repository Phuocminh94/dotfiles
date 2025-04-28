# Check if the profile file exists
if (!(Test-Path $PROFILE)) {
    Write-Host 'Profile does not exist!'

    New-Item -ItemType SymbolicLink -Path $PROFILE -Target "$HOME\dotfiles\profile.ps1"
    Write-Host "Symbolic link created from $HOME\dotfiles\profile.ps1 to $PROFILE"
} else {
    Write-Host "Profile already exists at $PROFILE"
}
