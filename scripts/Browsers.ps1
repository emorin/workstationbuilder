##################
#### Browsers ####
##################

Write-Host ""
Write-Host "Installing Browsers..." -ForegroundColor Gray
Write-Host "------------------------------------" -ForegroundColor Gray

# chocoAppInstall "googlechrome,firefox";

$ChocoInstalls = @(
    'googlechrome'
    'firefox'
)
InstallChocoPackages $ChocoInstalls
