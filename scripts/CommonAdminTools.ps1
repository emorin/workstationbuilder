############################
#### Common Admin Tools ####
############################

Write-Host ""
Write-Host "Installing Common Admin Applications..." -ForegroundColor Gray
Write-Host "------------------------------------" -ForegroundColor Gray

#--- Create a folder for Utilities installs ---
Write-Host ""
Write-Output "Creating $UtilPath folder..." -ForegroundColor Green
Write-Host "------------------------------------" -ForegroundColor Green
If (-not (Test-Path $UtilPath)) {
    New-Item -Path $UtilPath -ItemType "directory"
    New-Item -Path $UtilPath -Name "UTILITIES_THAT_DON'T_HAVE_INSTALLER.txt" -ItemType "file" -Value "This folder is for tools that are NOT installed via an installer. Tools that are installed via an installer should be placed in default programs location."
}

$ChocoInstalls = @(
    'lockhunter'
    'chocolateygui'
    'chocolatey-core.extension'
    'powertoys'
    'wiztree'
    'klogg'
    'sizer'
    'teracopy'
    'sublimetext4'
    '7zip.install'
    'notepadplusplus.install'
    'putty.install'
    'autohotkey.install'
    'adobereader'
    'winmerge'
    'ueli'
)
InstallChocoPackages $ChocoInstalls

choco upgrade powershell-core --cacheLocation="$ChocoCachePath" --install-arguments='"ADD_FILE_CONTEXT_MENU_RUNPOWERSHELL=1 ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=1 REGISTER_MANIFEST=1 ENABLE_PSREMOTING=1"' --packageparameters '"/CleanUpPath"'
choco upgrade sysinternals --params "/InstallDir:$UtilPath\sysinternals"
choco upgrade nirlauncher --cacheLocation="$ChocoCachePath" --params="'/Sysinternals'"

# Tools with installers placed in the bin folder.
Add-EnvPath -Location 'User' -NewPath $UtilPath
Update-SessionEnvironment