#######################
#### Hyper-V Tools ####
#######################

Write-Host ""
Write-Host "Installing HyperV..." -ForegroundColor Green
Write-Host "------------------------------------" -ForegroundColor Green

Enable-WindowsOptionalFeature -Online -FeatureName "Containers" -NoRestart -WarningAction SilentlyContinue -All
Enable-WindowsOptionalFeature -Online -FeatureName "VirtualMachinePlatform" -NoRestart -WarningAction SilentlyContinue -All
Enable-WindowsOptionalFeature -Online -FeatureName "Containers-DisposableClientVM" -All
Enable-WindowsOptionalFeature -Online -FeatureName "Microsoft-Hyper-V-All" -NoRestart -WarningAction SilentlyContinue -All

RefreshEnv
