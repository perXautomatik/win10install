#After extracting Boxstarter.1.0.0.zip on MYCOMPUTER
.\setup.bat
Import-Module $env:appdata\boxstarter\Boxstarter.Chocolatey\Boxstarter.Chocolatey.psd1
#Create minimal nuspec and chocolateyInstall
New-BoxstarterPackage MyPackage
#Edit Install script to customize your environment
Notepad Join-Path $Boxstarter.LocalRepo "tools\ChocolateyInstall.ps1"
#Pack nupkg
Invoke-BoxstarterBuild MyPackage

#share Repo
Set-BoxstarterShare
#Or Copy to thumb drive G
Copy-Item $Boxstarter.BaseDir G:\ -Recurse

#Logon to your bare Windows install
\\MYCOMPUTER\Boxstarter\Boxstarter Mypackage

#Enter password when prompted and come back later to find all your apps installed
