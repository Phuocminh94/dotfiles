# Set alias R
$RPath443 = 'C:\Program Files\R\R-4.4.3\bin\R.exe'
$RPath450 = 'C:\Program Files\R\R-4.5.0\bin\R.exe'

Remove-Item alias:R -ErrorAction SilentlyContinue

if (Test-Path $RPath443) {
    Set-Alias -Name 'R' -Value $RPath443
} elseif (Test-Path $RPath450) {
    Set-Alias -Name 'R' -Value $RPath450
} else {
    Write-Host "No R executable found at expected locations." -ForegroundColor Red
}
