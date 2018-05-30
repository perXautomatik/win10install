Install-WindowsUpdate -AcceptEula
Update-ExecutionPolicy Unrestricted
Move-LibraryDirectory "Personal" "$env:UserProfile\skydrive\documents"
Set-ExplorerOptions -showHidenFilesFoldersDrives -showProtectedOSFiles -showFileExtensions
Set-TaskbarSmall
Enable-RemoteDesktop
Set-StartScreenOptions -EnableBootToDesktop

# Boxstarter specific
cinstm boxstarter.common
cinstm boxstarter.winconfig

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

Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Steam\steam.exe"
Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Mozilla Firefox\firefox.exe"
