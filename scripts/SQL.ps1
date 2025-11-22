###############################
#### SQL Development Tools ####
###############################

Write-Host ""
Write-Host "Installing SQL Development Applications..." -ForegroundColor Gray
Write-Host "------------------------------------" -ForegroundColor Gray

$ChocoInstalls = @(
    'sqltoolbelt'
)

choco upgrade sql-server-management-studio --params "'--all'" -y --cacheLocation "$ChocoCachePath"

InstallChocoPackages $ChocoInstalls
