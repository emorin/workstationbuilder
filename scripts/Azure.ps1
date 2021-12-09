######################################
#### Azure Applications ####
######################################

Write-Host ""
Write-Host "Installing Azure Applications..." -ForegroundColor Gray
Write-Host "------------------------------------" -ForegroundColor Gray

choco install -y powershell-core
choco install -y azure-cli
Install-Module -Force Az
choco install -y microsoftazurestorageexplorer

choco install azuredatastudio-powershell
choco install az.powershell