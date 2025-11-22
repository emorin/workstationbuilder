############################
#### AI Applications ####
############################

Write-Host ""
Write-Host "Installing AI Applications..." -ForegroundColor Gray
Write-Host "------------------------------------" -ForegroundColor Gray

$ChocoInstalls = @(
    'claude'
    'claude-code'
    'warp-terminal'
)
InstallChocoPackages $ChocoInstalls

// install chatgpt for windows from windows store using winget
winget install --id=ChatGPT.ChatGPT --source=msstore --accept-package-agreements --accept-source-agreements


# Ensure script stops on errors
$ErrorActionPreference = 'Stop'

# Optional: verify winget is available
if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Error "winget not found. Install/Update 'App Installer' from Microsoft Store first."
}

# Make sure the Microsoft Store source exists (adds or updates it)
winget source update --name msstore

# Install ChatGPT from Microsoft Store silently and accept agreements
winget.exe install `
    --id=9NT1R1C2HH7J `
    --source=msstore `
    --accept-package-agreements `
    --accept-source-agreements `
    --silent

# Optional: verify installation
winget list --source msstore | Where-Object { $_ -match 'ChatGPT' } | Out-Host

