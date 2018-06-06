Enable-RemoteDesktop
Set-WindowsExplorerOptions -enableshowHiddenFilesFoldersDrives -enableshowProtectedOSFiles -enableshowFileExtensions

$Packages = 'git',`
            'poshgit',`
            'visualstudiocode',`
            'notepadplusplus',`
            'nodejs',`
            'FiraCode',`
            'SourceTree',`
            'keepass',`
            'cmdermini',`
            '7zip',`
            'ngrok.portable',`
            'winscp',`
            'GoogleChrome',`
            'paint.net',`
            'rapidee',`
            'sharex',`
            'SwissFileKnife',`
            'sysinternals',`
            'rufus',
            'openvpn'

ForEach ($PackageName in $Packages)
{cinstm $PackageName -y}
