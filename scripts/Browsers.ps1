##################
#### Browsers ####
##################

Write-Host ""
Write-Host "Installing Browsers..." -ForegroundColor Gray
Write-Host "------------------------------------" -ForegroundColor Gray

$ChocoInstalls = @(
    'googlechrome'
    'firefox'
    'lastpass'
)
InstallChocoPackages $ChocoInstalls
