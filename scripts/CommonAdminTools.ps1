#--- Create a folder for bin installs ---
Write-Host ""
Write-Output "Creating BIN folder on C:\" -ForegroundColor Green
Write-Host "------------------------------------" -ForegroundColor Green
New-Item -Path C:\bin -ItemType "directory"

Write-Host ""
Write-Host "Installing Common Admin Applications..." -ForegroundColor Green
Write-Host "------------------------------------" -ForegroundColor Green

if (Check-Command -cmdname 'git') {
    Write-Host "Git is already installed, checking new version..."
    choco upgrade git -y
}
else {
    Write-Host ""
    Write-Host "Installing Git for Windows..." -ForegroundColor Green
	choco install git.install --params "/GitAndUnixToolsOnPath /NoGitLfs /SChannel /NoAutoCrlf"
    RefreshEnv
}

# Tools with installers placed in the BIN folder.
Write-Host ""
Write-Output "Installing Special Apps into C:\bin folder." -ForegroundColor Green
Write-Host "------------------------------------" -ForegroundColor Green

choco install lockhunter

# node is installing to custom path correctly
if (Check-Command -cmdname 'node') {
    Write-Host "Node.js is already installed, checking new version..."
    choco upgrade nodejs -y
}
else {
    Write-Host ""
    Write-Host "Installing Node.js..." -ForegroundColor Green
    #choco install nodejs -y --params "/InstallDir:C:\bin\nodejs"
    choco install -y nodejs.install -ia "'INSTALLDIR=C:\bin\nodejs'" #working
}

choco install openssl.light --params "/InstallDir:C:\bin\openssl" #working


# Unmodified choco installs
# -------------------------
choco install 7zip.install -y
choco install chocolatey-core.extension -y
choco install filezilla -y
choco install github-desktop -y
choco install glogg -y
choco install notepadplusplus.install -y
choco install paint.net -y
choco install rdcman -y
choco install softerraldapbrowser -y
choco install sql-server-management-studio -y
choco install teamviewer -y
choco windowsfeatures TelnetClient
choco install vscode -y
choco install chocolatey-vscode -y
choco install vscode-ansible -y
choco install vscode-icons -y
choco install vscode-mssql -y
choco install vscode-powershell -y
choco install vscode-python -y
choco install vscode-yaml -y
#choco install visualstudio2019community -y
choco install vlc -y
choco install windirstat -y
choco install winmerge -y
choco install winscp -y