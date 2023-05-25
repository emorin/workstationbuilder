##############################
#### System Configuration ####
##############################

#Set the time zone and resync the time
Write-Host ""
Write-Host "Setting the Time Zone to CST and syncing time..." -ForegroundColor Green
Write-Host "------------------------------------" -ForegroundColor Green
Set-TimeZone -Name "Mountain Standard Time"
# w32tm /resync /rediscover 
# -----------------------------------------------------------------------------

# Disable Xbox Gamebar
# Write-Host ""
# Write-Host "Disable XBox Gamer Bar..." -ForegroundColor Green
# Write-Host "------------------------------------" -ForegroundColor Green
# Disable-GameBarTips
# Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" -Name AppCaptureEnabled -Type DWord -Value 0
# Set-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name GameDVR_Enabled -Type DWord -Value 0

#Write-Host ""
#Write-Host "Disabling Xbox features..."
#Get-AppxPackage "Microsoft.XboxApp" | Remove-AppxPackage
#Get-AppxPackage "Microsoft.XboxIdentityProvider" | Remove-AppxPackage
#Get-AppxPackage "Microsoft.XboxSpeechToTextOverlay" | Remove-AppxPackage
#Get-AppxPackage "Microsoft.XboxGameOverlay" | Remove-AppxPackage
#Get-AppxPackage "Microsoft.Xbox.TCUI" | Remove-AppxPackage
#New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR -Name AppCaptureEnabled -PropertyType DWord -Value 0 -Force
#New-ItemProperty -Path HKCU:\System\GameConfigStore -Name GameDVR_Enabled -PropertyType DWord -Value 0 -Force
#New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\GameBar -Name ShowStartupPanel -PropertyType DWord -Value 0 -Force

# Set-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name "GameDVR_Enabled" -Type DWord -Value 0
# If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR")) {
#     New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR" | Out-Null
# }
# Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR" -Name "AllowGameDVR" -Type DWord -Value 0
# Disable-GameBarTips
# Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" -Name AppCaptureEnabled -Type DWord -Value 0
# -----------------------------------------------------------------------------

# Disable Bing Search
#Write-Host ""
#Write-Host "Disable Bing Search..." -ForegroundColor Green
#Write-Host "------------------------------------" -ForegroundColor Green
# Disable-BingSearch
#if (-not (Test-Path -Path HKCU:\SOFTWARE\Policies\Microsoft\Windows\Explorer))
#{
#    New-Item -Path HKCU:\SOFTWARE\Policies\Microsoft\Windows\Explorer -Force
#}
#New-ItemProperty -Path HKCU:\SOFTWARE\Policies\Microsoft\Windows\Explorer -Name DisableSearchBoxSuggestions -PropertyType DWord -Value 1 -Force
# -----------------------------------------------------------------------------

# Privacy: Let apps use my advertising ID: Disable
#Write-Host ""
#Write-Host "Disabling Advertising ID..." -ForegroundColor Green
#Write-Host "------------------------------------" -ForegroundColor Green
# If (-Not (Test-Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo")) {
#     New-Item -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo | Out-Null
# }
# Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo -Name Enabled -Type DWord -Value 0
#if (-not (Test-Path -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo))
#{
#    New-Item -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo -Force
#}
#New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo -Name Enabled -PropertyType DWord -Value 1 -Force
# -----------------------------------------------------------------------------

Write-Host ""
Write-Host "Enable Windows and App to Dark Mode..." -ForegroundColor Green
Write-Host "------------------------------------" -ForegroundColor Green
New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme -PropertyType DWord -Value 0 -Force
New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name SystemUsesLightTheme -PropertyType DWord -Value 0 -Force
# -----------------------------------------------------------------------------

#Write-Host ""
#Write-Host "Disable Windows Welcome Experience..." -ForegroundColor Green
#Write-Host "------------------------------------" -ForegroundColor Green
#New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager -Name SubscribedContent-310093Enabled -PropertyType DWord -Value 0 -Force
# -----------------------------------------------------------------------------

#Write-Host ""
#Write-Host "Disable Windows Tips..." -ForegroundColor Green
#Write-Host "------------------------------------" -ForegroundColor Green
#New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager -Name SubscribedContent-338389Enabled -PropertyType DWord -Value 0 -Force
# -----------------------------------------------------------------------------

#Write-Host ""
#Write-Host "Disable Settings Suggested Content..." -ForegroundColor Green
#Write-Host "------------------------------------" -ForegroundColor Green
#New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager -Name SubscribedContent-338393Enabled -PropertyType DWord -Value 0 -Force
#New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager -Name SubscribedContent-353694Enabled -PropertyType DWord -Value 0 -Force
#New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager -Name SubscribedContent-353696Enabled -PropertyType DWord -Value 0 -Force
# -----------------------------------------------------------------------------

Write-Host ""
Write-Host "Removing Default Printers Not Used..." -ForegroundColor Green
Write-Host "------------------------------------" -ForegroundColor Green
Remove-Printer -Name "Microsoft XPS Document Writer" -ErrorAction:SilentlyContinue
Remove-Printer -Name "Fax" -ErrorAction:SilentlyContinue
# -----------------------------------------------------------------------------

Write-Host ""
Write-Host "Restarting Explorer..." -ForegroundColor Yellow
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
