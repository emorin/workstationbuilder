#######################
#### WSL Subsystem ####
#######################

Write-Host ""
Write-Host "Installing WSL Subsystem..." -ForegroundColor Gray
Write-Host "------------------------------------" -ForegroundColor Gray

wsl --install

RefreshEnv
