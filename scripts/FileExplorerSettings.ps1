#--- Configuring Windows properties ---
#--- Windows Features ---
# -----------------------------------------------------------------------------
# Show hidden files, Show protected OS files, Show file extensions
Write-Host ""
Write-Output "Showing hidden files, protected OS files, and file extensions..." -ForegroundColor Green
Write-Host "------------------------------------" -ForegroundColor Green
Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions -EnableShowFullPathInTitleBar -EnableExpandToOpenFolder -DisableOpenFileExplorerToQuickAccess
# -----------------------------------------------------------------------------
# adds things back in your left pane like recycle bin
Write-Host ""
Write-Output "Adding things in your left pane like recycle bin..." -ForegroundColor Green
Write-Host "------------------------------------" -ForegroundColor Green
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name NavPaneShowAllFolders -Value 1
# -----------------------------------------------------------------------------
# enable item checkboxes
Write-Host ""
Write-Output "Setting explorer item checkboxes..." -ForegroundColor Green
Write-Host "------------------------------------" -ForegroundColor Green
# Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name AutoCheckSelect -Type DWord -Value 1 -Force
New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name AutoCheckSelect -PropertyType DWord -Value 1 -Force
# -----------------------------------------------------------------------------
# taskbar where window is open for multi-monitor
Write-Host ""
Write-Output "Setting the taskbar where window is open for multi-monitor..." -ForegroundColor Green
Write-Host "------------------------------------" -ForegroundColor Green
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name MMTaskbarMode -Value 2
# -----------------------------------------------------------------------------

