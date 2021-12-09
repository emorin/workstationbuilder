######################################
#### Common Development Tools ####
######################################

Write-Host ""
Write-Host "Installing Common Development Applications..." -ForegroundColor Gray
Write-Host "------------------------------------" -ForegroundColor Gray

chocoAppInstall "lockhunter,chocolateygui,7zip.install,notepadplusplus.install,chocolatey-core.extension,powertoys,putty.install,wiztree,klogg,autohotkey.install";

choco install -y vscode
choco install ngrok

Write-Host ""
Write-Host "Installing Git for Windows..." -ForegroundColor Green
choco upgrade git.install --cacheLocation="$ChocoCachePath" --params "/GitAndUnixToolsOnPath /NoGitLfs /SChannel /NoAutoCrlf /WindowsTerminal"
RefreshEnv

chocoAppInstall "lockhunter,chocolateygui,nodejs.install";

# Tools with installers placed in the Utilities folder.
Write-Host ""
Write-Host "Installing Special Apps into C:\Utilities folder." -ForegroundColor Green
Write-Host "------------------------------------" -ForegroundColor Green
choco upgrade openssl.light --cacheLocation="$ChocoCachePath" --params "/InstallDir:C:\Utilities\openssl" #working


# # Unmodified choco upgrades
# # -------------------------
# choco upgrade github-desktop -y
# choco upgrade paint.net -y
# choco upgrade sql-server-management-studio -y
# choco windowsfeatures TelnetClient
# choco upgrade vscode -y
# choco upgrade chocolatey-vscode -y
# choco upgrade vscode-ansible -y
# choco upgrade vscode-icons -y
# choco upgrade vscode-mssql -y
# choco upgrade vscode-powershell -y
# choco upgrade vscode-python -y
# choco upgrade vscode-yaml -y
# #choco upgrade visualstudio2019community -y
# choco upgrade vlc -y
# choco upgrade winmerge -y
