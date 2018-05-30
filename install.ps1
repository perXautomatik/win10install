Install-WindowsUpdate -AcceptEula
Update-ExecutionPolicy Unrestricted
Move-LibraryDirectory "Personal" "$env:UserProfile\skydrive\documents"
Set-ExplorerOptions -showHidenFilesFoldersDrives -showProtectedOSFiles -showFileExtensions
Set-TaskbarSmall
Enable-RemoteDesktop
Set-StartScreenOptions -EnableBootToDesktop

#---- TEMPORARY ---
Disable-UAC

# Privacy: Let apps use my advertising ID: Disable
If (-Not (Test-Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo")) {
    New-Item -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo | Out-Null
}
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo -Name Enabled -Type DWord -Value 0

# WiFi Sense: HotSpot Sharing: Disable
If (-Not (Test-Path "HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting")) {
    New-Item -Path HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting | Out-Null
}
Set-ItemProperty -Path HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting -Name value -Type DWord -Value 0

# WiFi Sense: Shared HotSpot Auto-Connect: Disable
Set-ItemProperty -Path HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots -Name value -Type DWord -Value 0

# Start Menu: Disable Bing Search Results
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search -Name BingSearchEnabled -Type DWord -Value 0
# To Restore (Enabled):
# Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search -Name BingSearchEnabled -Type DWord -Value 1

# Disable Xbox Gamebar
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" -Name AppCaptureEnabled -Type DWord -Value 0
Set-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name GameDVR_Enabled -Type DWord -Value 0

# Turn off People in Taskbar
If (-Not (Test-Path "HKCU:SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People")) {
    New-Item -Path HKCU:SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People | Out-Null
}
Set-ItemProperty -Path "HKCU:SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" -Name PeopleBand -Type DWord -Value 0

# Use the Windows 7-8.1 Style Volume Mixer
If (-Not (Test-Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\MTCUVC")) {
	New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" -Name MTCUVC | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\MTCUVC" -Name EnableMtcUvc -Type DWord -Value 0

# To Restore (Windows 10 Style Volume Control):
#Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\MTCUVC" -Name EnableMtcUvc -Type DWord -Value 1

###############################
# Windows 10 Metro App Removals
# These start commented out so you choose
# Just remove the # (comment in PowerShell) on the ones you want to remove
###############################
# Be gone, heathen!
#Get-AppxPackage king.com.CandyCrushSaga | Remove-AppxPackage
# Bing Weather, News, Sports, and Finance (Money):
#Get-AppxPackage Microsoft.BingWeather | Remove-AppxPackage
#Get-AppxPackage Microsoft.BingNews | Remove-AppxPackage
#Get-AppxPackage Microsoft.BingSports | Remove-AppxPackage
#Get-AppxPackage Microsoft.BingFinance | Remove-AppxPackage
# Xbox:
#Get-AppxPackage Microsoft.XboxApp | Remove-AppxPackage
# Windows Phone Companion
#Get-AppxPackage Microsoft.WindowsPhone | Remove-AppxPackage
# Solitaire Collection
#Get-AppxPackage Microsoft.MicrosoftSolitaireCollection | Remove-AppxPackage
# People
#Get-AppxPackage Microsoft.People | Remove-AppxPackage
# Groove Music
#Get-AppxPackage Microsoft.ZuneMusic | Remove-AppxPackage
# Movies & TV
#Get-AppxPackage Microsoft.ZuneVideo | Remove-AppxPackage
# OneNote
#Get-AppxPackage Microsoft.Office.OneNote | Remove-AppxPackage
# Photos
#Get-AppxPackage Microsoft.Windows.Photos | Remove-AppxPackage
# Sound Recorder
#Get-AppxPackage Microsoft.WindowsSoundRecorder | Remove-AppxPackage
# Mail & Calendar
#Get-AppxPackage microsoft.windowscommunicationsapps | Remove-AppxPackage
# Skype (Metro version)
#Get-AppxPackage Microsoft.SkypeApp | Remove-AppxPackage

#--- Restore Temporary Settings ---
Enable-UAC

# Disable defrag (no need when having an SSD)
Get-ScheduledTask -TaskName *defrag* | Disable-ScheduledTask

# Boxstarter specific
cinstm boxstarter.common
cinstm boxstarter.winconfig

# Chocolatey related
cinstm ChocolateyGUI

refreshenv

# Frameworks, etc.
cinstm flashplayerplugin -y
cinstm jre8 -y
cinstm dotnet4.5 -y
cinstm vcredist2010 -y
cinstm adobeshockwaveplayer -y
cinstm adobeair -y
cinstm silverlight -y

# Programs
cinstm firefox -y
cinstm 7zip -y
cinstm git -y
cinstm vlc -y
cinstm filezilla -y
cinstm paint.net -y
cinstm malwarebytes -y
cinstm steam -y
cinstm f.lux -y
cinstm skype -y
cinstm qbittorrent -y
cinstm everything -y
cinstm googledrive -y
cinstm dropbox -y
cinstm teamviewer -y

Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Steam\steam.exe"
Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Mozilla Firefox\firefox.exe"
