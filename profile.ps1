# Set alias R
$RPath443 = 'C:\Program Files\R\R-4.4.3\bin\R.exe'
$RPath442 = 'C:\Program Files\R\R-4.4.2\bin\R.exe'

Remove-Item alias:R -ErrorAction SilentlyContinue

if (Test-Path $RPath443) {
    Set-Alias -Name 'R' -Value $RPath443
} elseif (Test-Path $RPath442) {
    Set-Alias -Name 'R' -Value $RPath442
} else {
    Write-Host "No R executable found at expected locations." -ForegroundColor Red
}
