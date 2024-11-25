if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
    Write-Host "Chocolatey not found. Installing Chocolatey..." -ForegroundColor Yellow

    # Install Chocolatey using the official script
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

    if (Get-Command choco -ErrorAction SilentlyContinue) {
        Write-Host "Chocolatey installed successfully." -ForegroundColor Green
    } else {
        Write-Host "Failed to install Chocolatey." -ForegroundColor Red
        exit 1
    }
} else {
    Write-Host "Chocolatey is already installed." -ForegroundColor Green
}

# Update Chocolatey to the latest version
Write-Host "Updating Chocolatey to the latest version..." -ForegroundColor Yellow
choco upgrade chocolatey -y

# Install the required package(s)
$packages = @("googlechrome", "firefox", "git", "zalo")  # List of packages to install

foreach ($package in $packages) {
    if (-not (choco list --local-only | Select-String $package)) {
        Write-Host "Installing $package..." -ForegroundColor Yellow
        choco install $package -y
    } else {
        Write-Host "$package is already installed." -ForegroundColor Green
    }
}

Write-Host "All operations completed." -ForegroundColor Cyan
