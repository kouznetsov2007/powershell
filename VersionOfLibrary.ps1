cls

. "$($PSScriptRoot)\Functions\FindFile.ps1"

<#FileVersion

ProductVersion#>

$path = "C:\Program Files\Adobe"
$ext = "dll"

$files = FindFile $path $ext

#$path = (Get-Item "C:\Program Files\Adobe\Adobe InDesign 2021\UpdaterNotifications.dll")

$libraries = @()

foreach($f in $files){
    $fileinfo = Get-Item $f
    $library = New-Object -Typename PSObject -Property @{
        Version = $fileinfo.VersionInfo.FileVersion
        Fullname = $fileinfo.FullName
        Name = $fileinfo.Name
        ProductVersion = $fileinfo.VersionInfo.ProductVersion
    }
    $libraries = $libraries + $library
}

$libraries = $libraries | Sort-Object -Property Name, Version, FullName 

$CurrentN = ""
$CurrentV = ""

foreach($l  in $libraries){
    if($CurrentN -ne $l.Name){
        Write-Host ""
        $CurrentN = $l.Name
        $CurrentV = ""
        Write-Host $CurrentN -ForegroundColor Green
    }
    if($CurrentV -ne $l.ProductVersion){
        $CurrentV = $l.ProductVersion
        Write-Host "    "$CurrentV -ForegroundColor DarkYellow
    }
    Write-Host "        "$l.Fullname
}
