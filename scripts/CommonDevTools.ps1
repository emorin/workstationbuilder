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

# # Visual Studio 2019
# choco install visualstudio2019enterprise --cacheLocation="$ChocoCachePath"
# choco install visualstudio2019-workload-visualstudioextension --cacheLocation="$ChocoCachePath"
# choco install visualstudio2019-workload-manageddesktop --cacheLocation="$ChocoCachePath"
# choco install visualstudio2019-workload-netweb --cacheLocation="$ChocoCachePath" # ASP.NET and web development
# choco install visualstudio2019-workload-netcoretools --cacheLocation="$ChocoCachePath" # .NET Core cross-platform development
# choco install visualstudio2019-workload-node --cacheLocation="$ChocoCachePath" #Node.js development
# choco install visualstudio2019-workload-azure --cacheLocation="$ChocoCachePath"
