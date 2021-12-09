######################
#### System Fonts ####
######################

Write-Host ""
Write-Host "Installing System Fonts..." -ForegroundColor Gray
Write-Host "------------------------------------" -ForegroundColor Gray

$ChocoInstalls = @(
    'cascadiafonts'
    'cascadia-code-nerd-font'
    'firacode'
    'firacodenf'
    'jetbrainsmono'
    'jetbrainsmononf'
)

$MasterChocoInstalls += $ChocoInstalls

# chocoAppInstall $ChocoInstalls;
