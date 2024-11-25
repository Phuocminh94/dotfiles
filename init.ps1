# Create PYTHON env and activate it
#if (!(Get-Command python -ErrorAction SilentlyContinue)) {
#	python -m venv PYTHON
#	. 'C:\Users\buiph\PYTHON\Scripts\Activate.ps1'
#}

#$profilePath = $PROFILE
#$targetFile = "$HOME/dotfiles/profile.ps1"


# Check if the user's profile script exists
#if (!(Test-Path $PROFILE)) {
	#Write-Host 'Profile does not exist!'
	#New-Item -ItemType File $PROFILE -Force 
    #New-Item -ItemType SymbolicLink -Path $destinationFolder -Target $sourceFolder
    #New-Item -ItemType SymbolicLink -Path $targetFile -Target $PROFILE
    #New-Item -ItemType File -Path $PROFILE
    #New-Item -ItemType SymbolicLink -Path "$HOME\dotfiles\profile.ps1" -Target $PROFILE

	#$content = Get-Content -Path 'C:\Users\buiph\dotfiles\aliases.ps1'
	#Add-Content -Path $PROFILE -Value $content


	#"# Export PostgresSQL to PATH" >> $PROFILE
	#'$env:PATH += '';C:\Program Files\PostgreSQL\16\bin''' | Out-File -FilePath $PROFILE -Append

	#"# Activate PYTHON env" >> $PROFILE
	#". 'C:\Users\buiph\PYTHON\Scripts\Activate.ps1'" >> $PROFILE
#}

# Check if the profile file exists
if (!(Test-Path $PROFILE)) {
    Write-Host 'Profile does not exist!'

    New-Item -ItemType SymbolicLink -Path $PROFILE -Target "$HOME\dotfiles\profile.ps1"
    Write-Host "Symbolic link created from $HOME\dotfiles\profile.ps1 to $PROFILE"
} else {
    Write-Host "Profile already exists at $PROFILE"
}


# Chocolateley
. .\choco.ps1

