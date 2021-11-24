#Set the time zone and resync the time
Write-Host ""
Write-Output "Setting the Time Zone to CST and syncing time..." -ForegroundColor Green
Write-Host "------------------------------------" -ForegroundColor Green
Set-TimeZone -Name "Mountain Standard Time"
w32tm /resync /rediscover 
# -----------------------------------------------------------------------------
# Disable Xbox Gamebar
Write-Host ""
Write-Output "Disable XBox Gamer Bar..." -ForegroundColor Green
Write-Host "------------------------------------" -ForegroundColor Green
Disable-GameBarTips
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" -Name AppCaptureEnabled -Type DWord -Value 0
Set-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name GameDVR_Enabled -Type DWord -Value 0
# -----------------------------------------------------------------------------
# Privacy: Let apps use my advertising ID: Disable
Write-Host ""
Write-Output "Disabling Advertising ID..." -ForegroundColor Green
Write-Host "------------------------------------" -ForegroundColor Green
If (-Not (Test-Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo")) {
    New-Item -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo | Out-Null
}
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo -Name Enabled -Type DWord -Value 0
# -----------------------------------------------------------------------------
Write-Host ""
Write-Host "Restarting Explorer" -ForegroundColor Yellow
Write-Host "------------------------------------" -ForegroundColor Yellow
Stop-Process -ProcessName Explorer
# -----------------------------------------------------------------------------
#--- Enable developer mode on the system ---
Set-ItemProperty -Path HKLM:\Software\Microsoft\Windows\CurrentVersion\AppModelUnlock -Name AllowDevelopmentWithoutDevLicense -Value 1
# -----------------------------------------------------------------------------
Write-Host ""
Write-Host "Enabling Remote Desktop..." -ForegroundColor Green
Write-Host "------------------------------------" -ForegroundColor Green
Enable-RemoteDesktop
# -----------------------------------------------------------------------------
