#################################
#### Other Application Tools ####
#################################

Write-Host ""
Write-Host "Installing Other Applications..." -ForegroundColor Gray
Write-Host "------------------------------------" -ForegroundColor Gray

$ChocoInstalls = @(
    'snagit'
    'paint.net'
    'vlc'
    'displayFusion'
    'evernote'
    'logitech-camera-settings'
    'logitech-options'
    'mkvtoolnix'
    'mp3tag'
    'musicbee'
    'picard'
    'powerchute-personal'
    'streamdeck'
)
InstallChocoPackages $ChocoInstalls
