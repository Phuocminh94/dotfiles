if (Get-Command git -ErrorAction SilentlyContinue) {
    # Generate SSH keys
    ssh-keygen -t rsa -b 4096 -C "buiphuocminh94a@gmail.com"

    # Start SSH agent and add SSH private key
    Start-Service ssh-agent

    # Display SSH public key
    Write-Host "Your SSH public key is:"
    Get-Content ~/.ssh/id_rsa.pub | Set-Clipboard

    # Redirect to setting page
    Start-Process "https://github.com/settings/keys"
}
