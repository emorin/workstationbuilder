#################################
#### Other Application Tools ####
#################################

Write-Host ""
Write-Host "Installing Other Applications..." -ForegroundColor Gray
Write-Host "------------------------------------" -ForegroundColor Gray

# Standard tools for both personal and work use.
$ChocoInstalls = @(
    'snagit'
    'logitech-options-plus'
    'notion'
    'samsung-magician'
)
InstallChocoPackages $ChocoInstalls

# # Personal tools.
# $ChocoInstalls = @(
#     'paint.net'
#     'vlc'
#     'displayFusion'
#     'evernote'
#     'logitech-options'
#     'mkvtoolnix'
#     'mp3tag'
#     'musicbee'
#     'picard'
#     'cryptomator'
# )
# InstallChocoPackages $ChocoInstalls
