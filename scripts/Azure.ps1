############################
#### Azure Applications ####
############################

Write-Host ""
Write-Host "Installing Azure Applications..." -ForegroundColor Gray
Write-Host "------------------------------------" -ForegroundColor Gray

$ChocoInstalls = @(
    'azure-cli'
    'azure-data-studio'
    'microsoftazurestorageexplorer'
    'azure-data-studio-sql-server-admin-pack'
    'azuredatastudio-powershell'
    'az.powershell'
)
InstallChocoPackages $ChocoInstalls

npm i -g azure-functions-core-tools@4 --unsafe-perm true
# choco install azure-functions-core-tools-4 --params "'/x64'"

Install-Module -Name Az -Scope CurrentUser -Repository PSGallery -Force
