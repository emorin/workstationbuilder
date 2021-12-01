# 1. Install Chocolatey & Boxstarter
<# From PowerShell ADMINISTRATOR session run
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://boxstarter.org/bootstrapper.ps1')); Get-Boxstarter -Force
#>


# 2. From Same PowerShell, run this:
<#
### With User Credentials
$cred=Get-Credential domain\username
Install-BoxstarterPackage -PackageName https://gist.githubusercontent.com/flcdrg/87802af4c92527eb8a30/raw/boxstarter-bare.ps1 -Credential $cred
### End 

Install-BoxstarterPackage -PackageName https://raw.githubusercontent.com/emorin/workstationbuilder/main/box-builder.ps1

Install-BoxstarterPackage -PackageName https://raw.githubusercontent.com/emorin/workstationbuilder/main/box-builder.ps1 -DisableReboots
#>

# Boxstarter options
$Boxstarter.RebootOk=$true # Allow reboots?
$Boxstarter.NoPassword=$false # Is this a machine with no login password?
$Boxstarter.AutoLogin=$true # Save my password securely and auto-login after a reboot

######################################
#### make sure we're not bothered ####
######################################

Disable-UAC

### HACK Workaround choco / boxstarter path too long error
## https://github.com/chocolatey/boxstarter/issues/241
$ChocoCachePath = "$env:USERPROFILE\AppData\Local\Temp\chocolatey"
New-Item -Path $ChocoCachePath -ItemType Directory -Force

######################################
#### helper functions ####
######################################
# Get the base URI path from the ScriptToCall value
$bstrappackage = "-bootstrapPackage"
$helperUri = $Boxstarter['ScriptToCall']
$strpos = $helperUri.IndexOf($bstrappackage)
$helperUri = $helperUri.Substring($strpos + $bstrappackage.Length)
$helperUri = $helperUri.TrimStart("'", " ")
$helperUri = $helperUri.TrimEnd("'", " ")
$helperUri = $helperUri.Substring(0, $helperUri.LastIndexOf("/"))
$helperUri += "/scripts"
write-host "helper script base URI is $helperUri"

function Check-Command($cmdname) {
    return [bool](Get-Command -Name $cmdname -ErrorAction SilentlyContinue)
}

function executeScript {
    Param ([string]$script)
    write-host "executing $helperUri/$script ..."
	iex ((new-object net.webclient).DownloadString("$helperUri/$script"))
}

function chocoAppInstall {
    Param(  
        [string]$chocolateyAppList
    )

    if ([string]::IsNullOrWhiteSpace($chocolateyAppList) -eq $false){   
      
        $appsToInstall = $chocolateyAppList -split "," | ForEach-Object { "$($_.Trim())" }

        foreach ($app in $appsToInstall)
        {
            Write-Host ""
            Write-Output "Installing $app" -ForegroundColor Green
            Write-Host "------------------------------------" -ForegroundColor Green
            & choco upgrade $app -y --cacheLocation="$ChocoCachePath" | Write-Output
        }
    }
}

function chocoWindowsFeature {
    Param(  
        [string]$dismAppList    
    )

    if ([string]::IsNullOrWhiteSpace($dismAppList) -eq $false){
        Write-Host "DISM Features Specified"    

        $appsToInstall = $dismAppList -split "," | ForEach-Object { "$($_.Trim())" }

        foreach ($app in $appsToInstall)
        {
            Write-Host "Installing $app"
            & choco install $app /y /source windowsfeatures | Write-Output
        }
    }
}

$ConfirmPreference = "None" #ensure installing powershell modules don't prompt on needed dependencies

#--- Setting up Windows ---
executeScript "SystemConfiguration.ps1";
executeScript "FileExplorerSettings.ps1";
executeScript "RemoveDefaultApps.ps1";
executeScript "CommonAdminTools.ps1";
# executeScript "CommonDevTools.ps1";


# # Update Windows and reboot if necessary
# $section = "WindowsUpdate"
# try {
#     #Give it a few minutes, may be working on another update?
#     if ( -not ($section -in $reboots) ) { start-sleep -s 180 }
#     Enable-MicrosoftUpdate
#     Install-WindowsUpdate -AcceptEula
# }
# catch {
#     # Try one more reboot...
#     $section = "0x80240016Error"
#     if ( -not ($section -in $reboots) ) { Add-Content $reboot_log $section ; Invoke-Reboot } 
# }
# if ( -not ($section -in $reboots) ) { Add-Content $reboot_log $section ; Invoke-Reboot } 


# # Windows features
# choco install Microsoft-Hyper-V-All -source windowsfeatures
# choco install IIS-WebServerRole IIS-NetFxExtensibility45 IIS-HttpCompressionDynamic IIS-WindowsAuthentication IIS-ASPNET45 IIS-IIS6ManagementCompatibility -source windowsfeatures
# choco install Containers -source windowsfeatures
# choco install Microsoft-Windows-Subsystem-Linux -source windowsfeatures

# # Remove unwanted Store apps
# Get-AppxPackage Facebook.Facebook | Remove-AppxPackage -ErrorAction SilentlyContinue
# Get-AppxPackage TuneIn.TuneInRadio | Remove-AppxPackage -ErrorAction SilentlyContinue
# Get-AppxPackage Microsoft.MinecraftUWP | Remove-AppxPackage -ErrorAction SilentlyContinue
# Get-AppxPackage Microsoft.MicrosoftSolitaireCollection | Remove-AppxPackage -ErrorAction SilentlyContinue
# Get-AppxPackage KeeperSecurityInc.Keeper | Remove-AppxPackage -ErrorAction SilentlyContinue
# Get-AppxPackage 2FE3CB00.PicsArt-PhotoStudio | Remove-AppxPackage -ErrorAction SilentlyContinue
# Get-AppxPackage 9E2F88E3.Twitter | Remove-AppxPackage -ErrorAction SilentlyContinue
# Get-AppxPackage -AllUser -Name *Twitter | Remove-AppxPackage -ErrorAction SilentlyContinue
# Get-AppxPackage -AllUser -Name *MarchofEmpires | Remove-AppxPackage -ErrorAction SilentlyContinue
# Get-AppxPackage -AllUser -Name king.com.* | Remove-AppxPackage -ErrorAction SilentlyContinue
# Get-AppxPackage -AllUser -Name Microsoft.3DBuilder | Remove-AppxPackage -ErrorAction SilentlyContinue
# Get-AppxPackage -AllUser -Name *Bing* | Remove-AppxPackage -ErrorAction SilentlyContinue
# Get-AppxPackage -AllUser -Name Microsoft.Office.Word | Remove-AppxPackage -ErrorAction SilentlyContinue
# Get-AppxPackage -AllUser -Name Microsoft.Office.PowerPoint | Remove-AppxPackage -ErrorAction SilentlyContinue
# Get-AppxPackage -AllUser -Name Microsoft.Office.Excel | Remove-AppxPackage -ErrorAction SilentlyContinue
# Get-AppxPackage -AllUser -Name Microsoft.MicrosoftOfficeHub | Remove-AppxPackage -ErrorAction SilentlyContinue
# Get-AppxPackage -AllUser -Name DellInc.PartnerPromo | Remove-AppxPackage -ErrorAction SilentlyContinue
# Get-AppxPackage -AllUser -Name Microsoft.Office.OneNote | Remove-AppxPackage -ErrorAction SilentlyContinue
# Get-AppxPackage -AllUser -Name Microsoft.MicrosoftSolitaireCollection | Remove-AppxPackage -ErrorAction SilentlyContinue
# Get-AppxPackage -AllUser -Name Microsoft.SkypeApp | Remove-AppxPackage -ErrorAction SilentlyContinue
# Get-AppxPackage -AllUser -Name Microsoft.YourPhone | Remove-AppxPackage -ErrorAction SilentlyContinue
# Get-AppxPackage -AllUser -Name *XBox* | Remove-AppxPackage -ErrorAction SilentlyContinue
# Get-AppxPackage -AllUser -Name Microsoft.MixedReality.Portal | Remove-AppxPackage -ErrorAction SilentlyContinue
# Get-AppxPackage -AllUser -Name Microsoft.Microsoft3DViewer | Remove-AppxPackage -ErrorAction SilentlyContinue
# Get-AppxPackage -AllUser -Name SpotifyAB.SpotifyMusic | Remove-AppxPackage -ErrorAction SilentlyContinue
# Get-AppxPackage -AllUser -Name Microsoft.MSPaint | Remove-AppxPackage -ErrorAction SilentlyContinue # Paint3D

# Write-Host "Temp: $($env:temp)"

# chocoAppInstall "googlechrome,firefox";

# # cup firefox --cacheLocation="$ChocoCachePath"
# # choco pin add -n=firefox

# cup 7zip --cacheLocation="$ChocoCachePath"
# cup azure-cli --cacheLocation="$ChocoCachePath"
# cup azure-functions-core-tools-3 --cacheLocation="$ChocoCachePath" --params "'/x64'"
# cup becyicongrabber --cacheLocation="$ChocoCachePath"
# choco install cascadia-code-nerd-font --cacheLocation="$ChocoCachePath"

# if ((get-wmiobject Win32_ComputerSystem).manufacturer -like "*Dell*") {
#     cup dellcommandupdate-uwp --cacheLocation="$ChocoCachePath"
# }

# cup eartrumpet --cacheLocation="$ChocoCachePath"

# cup git --cacheLocation="$ChocoCachePath"

# cup hwinfo --cacheLocation="$ChocoCachePath"

# if ((get-wmiobject Win32_ComputerSystem).manufacturer -like "*Lenovo*") {
#     cup lenovo-thinkvantage-system-update --cacheLocation="$ChocoCachePath"
# }
# cup paint.net --cacheLocation="$ChocoCachePath"
# # cup mousewithoutborders --cacheLocation="$ChocoCachePath"

# cup msbuild-structured-log-viewer --cacheLocation="$ChocoCachePath"
# cup nodejs --cacheLocation="$ChocoCachePath"
# cup nuget.commandline --cacheLocation="$ChocoCachePath"
# # cup NugetPackageExplorer --cacheLocation="$ChocoCachePath" # Use Store version
# choco install office365business --cacheLocation="$ChocoCachePath" --params='/exclude:"Access Groove Lync OneDrive"'

# cup nvm --cacheLocation="$ChocoCachePath"
# cup PDFXchangeEditor --cacheLocation="$ChocoCachePath" --params '"/NoDesktopShortcuts /NoUpdater"'
# cup python2 --cacheLocation="$ChocoCachePath" # Required by some NPM/Node packages (eg node-sass)

# # This will conflict with earlier font packages, so make sure it happens after a reboot
# cup FiraCode --cacheLocation="$ChocoCachePath" # font

# cup pingplotter --cacheLocation="$ChocoCachePath"
# cup powershell-core --cacheLocation="$ChocoCachePath"

# cup rocolatey --cacheLocation="$ChocoCachePath"
# cup rss-builder --cacheLocation="$ChocoCachePath"
# cup slack --cacheLocation="$ChocoCachePath"

# cup tortoisegit --cacheLocation="$ChocoCachePath"
# # cup tortoisesvn --cacheLocation="$ChocoCachePath"
# #cup vagrant --cacheLocation="$ChocoCachePath" # Not sure why, but Boxstarter gets in a loop thinking this fails with 3010 (which should be fine)
# cup vscode --cacheLocation="$ChocoCachePath"
# #choco pin add -n=visualstudiocode
# cup vswhere --cacheLocation="$ChocoCachePath"
# cup windirstat --cacheLocation="$ChocoCachePath"
# cup yarn --cacheLocation="$ChocoCachePath"
# cup zoom --cacheLocation="$ChocoCachePath"
# cup zoomit --cacheLocation="$ChocoCachePath"

# cup sql-server-management-studio --cacheLocation="$ChocoCachePath"
# # SSMS installer includes azure data studio
# # cup azure-data-studio --cacheLocation="$ChocoCachePath"

# # Visual Studio 2019
# choco install visualstudio2019enterprise --cacheLocation="$ChocoCachePath"
# choco install visualstudio2019-workload-visualstudioextension --cacheLocation="$ChocoCachePath"
# choco install visualstudio2019-workload-manageddesktop --cacheLocation="$ChocoCachePath"
# choco install visualstudio2019-workload-netweb --cacheLocation="$ChocoCachePath" # ASP.NET and web development
# choco install visualstudio2019-workload-netcoretools --cacheLocation="$ChocoCachePath" # .NET Core cross-platform development
# choco install visualstudio2019-workload-node --cacheLocation="$ChocoCachePath" #Node.js development
# choco install visualstudio2019-workload-azure --cacheLocation="$ChocoCachePath"

# cup dotUltimate --cacheLocation="$ChocoCachePath" --params "'/NoCpp /NoTeamCityAddin /NoRider'"

# # choco install docker-desktop --cacheLocation="$ChocoCachePath"

# # $docker = "C:\Program Files\Docker\Docker\Resources\bin\docker.exe"

# # Install-Module posh-git -AllowPrerelease -Force

# # C:\windows\system32\inetsrv\appcmd.exe unlock config -section:windowsAuthentication
# # C:\windows\system32\inetsrv\appcmd.exe unlock config -section:anonymousAuthentication

# # Note: There are ususally VS Solution-specific config file in .vs\config\applicationhost.config too
# # & "C:\Program Files\IIS Express\appcmd.exe" unlock config -section:windowsAuthentication
# # & "C:\Program Files\IIS Express\appcmd.exe" unlock config -section:anonymousAuthentication

# #PowerShell help
# # Update-Help -ErrorAction SilentlyContinue

# # Install after other packages, so integration will work
# cup beyondcompare --cacheLocation="$ChocoCachePath"
# cup beyondcompare-integration --cacheLocation="$ChocoCachePath"

# Update-ExecutionPolicy RemoteSigned
# Set-WindowsExplorerOptions -EnableShowFileExtensions -EnableExpandToOpenFolder

# # No SMB1 - https://blogs.technet.microsoft.com/filecab/2016/09/16/stop-using-smb1/
# Disable-WindowsOptionalFeature -Online -FeatureName smb1protocol

# Enable-RemoteDesktop

# Install-WindowsUpdate -AcceptEula -GetUpdatesFromMS

# # Cleanup reboot log temp file
# Remove-Item $reboot_log -Force

#--- reenabling critial items ---
Enable-UAC
Enable-MicrosoftUpdate
Install-WindowsUpdate -acceptEula