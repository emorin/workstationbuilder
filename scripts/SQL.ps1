###############################
#### SQL Development Tools ####
###############################

Write-Host ""
Write-Host "Installing SQL Development Applications..." -ForegroundColor Gray
Write-Host "------------------------------------" -ForegroundColor Gray

$ChocoInstalls = @(
    'sql-server-management-studio'
    'sqltoolbelt'
)
InstallChocoPackages $ChocoInstalls
