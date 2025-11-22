######################################
#### Common Development Tools ####
######################################

Write-Host ""
Write-Host "Installing Common Development Applications..." -ForegroundColor Gray
Write-Host "------------------------------------" -ForegroundColor Gray

Write-Host ""
Write-Host "Installing Git for Windows..." -ForegroundColor Green
#choco upgrade git.install --cacheLocation="$ChocoCachePath" --params "/GitAndUnixToolsOnPath /NoGitLfs /SChannel /NoAutoCrlf /WindowsTerminal"
choco upgrade git.install --cacheLocation="$ChocoCachePath" --params "'/GitAndUnixToolsOnPath /NoGitLfs /SChannel /WindowsTerminal /NoAutoCrlf'"
RefreshEnv
Update-SessionEnvironment #refreshing env due to Git install

# Tools with installers placed in the Utilities folder.
Write-Host ""
Write-Host "Installing Special Apps into $UtilPath folder." -ForegroundColor Green
Write-Host "------------------------------------" -ForegroundColor Green
choco upgrade openssl.light --cacheLocation="$ChocoCachePath" --params "/InstallDir:$UtilPath\openssl"

$ChocoInstalls = @(
    'ngrok'
    'github-desktop'
    'jetbrainstoolbox'
    'NimbleText'
    'nodejs-lts'
    'postman'
    'oh-my-posh'
    'NSwagStudio'
    'typescript'
    'yarn'
    'vscode.install'
    'mkcert'
    'markdownmonster'
    'dotnetfx'
    'gitkraken'
    'linqpad'
    'another-redis-desktop-manager'
    'bicep'
    'WestwindWebSurge'
)
InstallChocoPackages $ChocoInstalls
RefreshEnv
Update-SessionEnvironment #refreshing env due to Git install

# # Visual Studio 2022
#choco upgrade visualstudio2022professional -y --cacheLocation "$($env:userprofile)\AppData\Local\Temp\chocolatey"
#choco upgrade visualstudio2022-workload-netweb -y --cacheLocation "$($env:userprofile)\AppData\Local\Temp\chocolatey"
#choco upgrade visualstudio2022-workload-azure -y --cacheLocation "$($env:userprofile)\AppData\Local\Temp\chocolatey"
#choco upgrade visualstudio2022-workload-node -y --cacheLocation "$($env:userprofile)\AppData\Local\Temp\chocolatey"
#choco upgrade visualstudio2022-workload-manageddesktop -y --cacheLocation "$($env:userprofile)\AppData\Local\Temp\chocolatey"
#choco upgrade visualstudio2022-workload-netcrossplat -y --cacheLocation "$($env:userprofile)\AppData\Local\Temp\chocolatey"
#choco upgrade visualstudio2022-workload-universal -y --cacheLocation "$($env:userprofile)\AppData\Local\Temp\chocolatey"
#choco upgrade visualstudio2022-workload-data -y --cacheLocation "$($env:userprofile)\AppData\Local\Temp\chocolatey"
#choco upgrade visualstudio2022-workload-office -y --cacheLocation "$($env:userprofile)\AppData\Local\Temp\chocolatey"

# # Visual Studio 2026
choco upgrade visualstudio2026professional -y --cacheLocation "$ChocoCachePath"
choco upgrade visualstudio2026-workload-netweb -y --cacheLocation "$ChocoCachePath"
choco upgrade visualstudio2026-workload-azure -y --cacheLocation "$ChocoCachePath"
choco upgrade visualstudio2026-workload-azurebuildtools -y --cacheLocation "$ChocoCachePath"
choco upgrade visualstudio2026-workload-python -y --cacheLocation "$ChocoCachePath"
choco upgrade visualstudio2026-workload-node -y --cacheLocation "$ChocoCachePath"
choco upgrade visualstudio2026-workload-manageddesktop -y --cacheLocation "$ChocoCachePath"
choco upgrade visualstudio2026-workload-netcrossplat -y --cacheLocation "$ChocoCachePath"
choco upgrade visualstudio2026-workload-universal -y --cacheLocation "$ChocoCachePath"
choco upgrade visualstudio2026-workload-data -y --cacheLocation "$ChocoCachePath"
choco upgrade visualstudio2026-workload-office -y --cacheLocation "$ChocoCachePath"
choco upgrade visualstudio2026-workload-manageddesktopbuildtools -y --cacheLocation "$ChocoCachePath"