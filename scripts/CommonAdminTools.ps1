# ### HACK Workaround choco / boxstarter path too long error
# ## https://github.com/chocolatey/boxstarter/issues/241
# $ChocoCachePath = "$env:USERPROFILE\AppData\Local\Temp\chocolatey"
# New-Item -Path $ChocoCachePath -ItemType Directory -Force

#--- Create a folder for Utilities installs ---
Write-Host ""
Write-Output "Creating Utilities folder on C:\" -ForegroundColor Green
Write-Host "------------------------------------" -ForegroundColor Green
New-Item -Path C:\Utilities -ItemType "directory"

Write-Host ""
Write-Host "Installing Common Admin Applications..." -ForegroundColor Green
Write-Host "------------------------------------" -ForegroundColor Green

# if (Check-Command -cmdname 'git') {
#     Write-Host "Git is already installed, checking new version..."
#     choco upgrade git -y
# }
# else {
    Write-Host ""
    Write-Host "Installing Git for Windows..." -ForegroundColor Green
	choco upgrade git.install --cacheLocation="$ChocoCachePath" --params "/GitAndUnixToolsOnPath /NoGitLfs /SChannel /NoAutoCrlf /WindowsTerminal"
    RefreshEnv
# }

chocoAppInstall "lockhunter,chocolateygui,nodejs.install";
# choco upgrade lockhunter --cacheLocation="$ChocoCachePath"
# choco upgrade chocolateygui --cacheLocation="$ChocoCachePath"

# node is installing to custom path correctly
# if (Check-Command -cmdname 'node') {
#     Write-Host "Node.js is already installed, checking new version..."
#     choco upgrade nodejs -y
# }
# else {
    # Write-Host ""
    # Write-Host "Installing Node.js..." -ForegroundColor Green
    # #choco upgrade nodejs -y --params "/InstallDir:C:\Utilities\nodejs"
    # choco upgrade -y nodejs.install --cacheLocation="$ChocoCachePath" #working
# }

# Tools with installers placed in the Utilities folder.
Write-Host ""
Write-Output "Installing Special Apps into C:\Utilities folder." -ForegroundColor Green
Write-Host "------------------------------------" -ForegroundColor Green
choco upgrade openssl.light --cacheLocation="$ChocoCachePath" --params "/InstallDir:C:\Utilities\openssl" #working


# # Unmodified choco upgrades
# # -------------------------
# choco upgrade 7zip.install -y
# choco upgrade chocolatey-core.extension -y
# choco upgrade filezilla -y
# choco upgrade github-desktop -y
# choco upgrade glogg -y
# choco upgrade notepadplusplus.install -y
# choco upgrade paint.net -y
# choco upgrade rdcman -y
# choco upgrade softerraldapbrowser -y
# choco upgrade sql-server-management-studio -y
# choco upgrade teamviewer -y
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
# choco upgrade windirstat -y
# choco upgrade winmerge -y
# choco upgrade winscp -y