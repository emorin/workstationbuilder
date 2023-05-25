######################################
#### Common Development Tools ####
######################################

Write-Host ""
Write-Host "Installing Common Development Applications..." -ForegroundColor Gray
Write-Host "------------------------------------" -ForegroundColor Gray

Write-Host ""
Write-Host "Installing Git for Windows..." -ForegroundColor Green
choco upgrade git.install --cacheLocation="$ChocoCachePath" --params "/GitAndUnixToolsOnPath /NoGitLfs /SChannel /NoAutoCrlf /WindowsTerminal"
RefreshEnv
Update-SessionEnvironment #refreshing env due to Git install

# Tools with installers placed in the Utilities folder.
Write-Host ""
Write-Host "Installing Special Apps into $UtilPath folder." -ForegroundColor Green
Write-Host "------------------------------------" -ForegroundColor Green
choco upgrade openssl.light --cacheLocation="$ChocoCachePath" --params "/InstallDir:$UtilPath\openssl"

$ChocoInstalls = @(
    'ngrok'
    'docker-desktop'
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
