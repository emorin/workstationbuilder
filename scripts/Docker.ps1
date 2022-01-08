######################################
#### Docker ####
######################################

Write-Host ""
Write-Host "Installing Docker Applications..." -ForegroundColor Gray
Write-Host "------------------------------------" -ForegroundColor Gray

# Enable-WindowsOptionalFeature -Online -FeatureName containers -All
# RefreshEnv

$ChocoInstalls = @(
    'docker-desktop'
)
InstallChocoPackages $ChocoInstalls
