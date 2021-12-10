############################
#### Common Admin Tools ####
############################

Write-Host ""
Write-Host "Installing Common Admin Applications..." -ForegroundColor Gray
Write-Host "------------------------------------" -ForegroundColor Gray

#--- Create a folder for Utilities installs ---
Write-Host ""
Write-Output "Creating $UtilBinPath folder..." -ForegroundColor Green
Write-Host "------------------------------------" -ForegroundColor Green
New-Item -Path $UtilBinPath -ItemType "directory"

$ChocoInstalls = @(
    'lockhunter'
    'chocolateygui'
    'chocolatey-core.extension'
    'powertoys'
    'wiztree'
    'klogg'
    'sizer'
    'teracopy'
    '7zip.install'
    'notepadplusplus.install'
    'putty.install'
    'autohotkey.install'
)
InstallChocoPackages $ChocoInstalls

choco install powershell-core --cacheLocation="$ChocoCachePath" --install-arguments='"ADD_FILE_CONTEXT_MENU_RUNPOWERSHELL=1 ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=1 REGISTER_MANIFEST=1 ENABLE_PSREMOTING=1"' --packageparameters '"/CleanUpPath"'

# Tools with installers placed in the bin folder.
Write-Host ""
Write-Host "Installing Special Apps into $UtilBinPath folder." -ForegroundColor Green
Write-Host "------------------------------------" -ForegroundColor Green
choco upgrade openssl.light --cacheLocation="$ChocoCachePath" --params "/InstallDir:$UtilBinPath\openssl"

Add-EnvPath -Location 'User' -NewPath $UtilBinPath
Update-SessionEnvironment

# Write-Host ""
# Write-Host "Adding Sysinternal to the path" -ForegroundColor Green
# Write-Host "------------------------------------" -ForegroundColor Green
# setx /M PATH "$($env:path);C:\tools\sysinternals;C:\tools\terraform;C:\tools\wget"

