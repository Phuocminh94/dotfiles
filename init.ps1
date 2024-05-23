# Create PYTHON env and activate it
if (!(Get-Command python -ErrorAction SilentlyContinue)) {
	python -m venv PYTHON
	. 'C:\Users\buiph\PYTHON\Scripts\Activate.ps1'
}


# Check if the user's profile script exists
if (!(Test-Path $PROFILE)) {
	Write-Host 'Profile does not exist. Creating ...'
	New-Item -ItemType File $PROFILE -Force 


	"# Export PostgresSQL to PATH" >> $PROFILE
	'$env:PATH += '';C:\Program Files\PostgreSQL\16\bin''' | Out-File -FilePath $PROFILE -Append

	"# Activate PYTHON env" >> $PROFILE
	". 'C:\Users\buiph\PYTHON\Scripts\Activate.ps1'" >> $PROFILE

	$content = Get-Content -Path 'C:\Users\buiph\dotfiles\aliases.ps1'
	Add-Content -Path $PROFILE -Value $content
}
