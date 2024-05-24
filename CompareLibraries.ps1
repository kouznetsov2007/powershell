cls

. "$($PSScriptRoot)\Functions\ConvertToHashtable.ps1"

. "$($PSScriptRoot)\Functions\FindFile.ps1"

$path = "C:\Program Files\Adobe"
$ext = "dll" 

$file = FindFile $path $ext

$dict = @{}

foreach($f in $file){
    $fileinfo = Get-Item $f
    if (-not($dict.ContainsKey($fileinfo.Name))){
        $dict[$fileinfo.Name] = @{}
    }
    $version = $fileinfo.VersionInfo.ProductVersion
    if($null -eq $version){
        $version = "EMPTY"
    }
    if(-not($dict[$fileinfo.Name].ContainsKey($version))){
        $dict[$fileinfo.Name][$version] = @()
    }
    $dict[$fileinfo.Name][$version] = $dict[$fileinfo.Name][$version] + $f
}

$dictjson = $dict|ConvertTo-Json
$dictjson|Out-File "D:\temp\dictconverted1.json"
$golden = Get-Content -Path "D:\temp\dictconverted.json"

$reference = $golden|ConvertFrom-Json|ConvertTo-Hashtable 

foreach($d in $dict.Keys){
    if(-not($reference.Contains($d))){
        Write-Host $d
        foreach($v in $dict[$d].Keys){
            Write-Host "    " $v
            foreach($f in $dict[$d][$v]){
                Write-Host "        " $f
            }
        }
    }
}

Write-Host "Different versions of library" -BackgroundColor Green

$Currentfile = ""

foreach($d in $dict.Keys){
    if($reference.ContainsKey($d)){
        foreach($v in $dict[$d].Keys){
            if(-not($reference[$d].ContainsKey($v))){ 
                if($Currentfile -ne $d){    
                    $Currentfile = $d
                    Write-Host  $Currentfile -ForegroundColor Magenta
                }
            Write-Host "New Version  :" $v 

                if($reference.ContainsKey($d)){
                    foreach($v in $reference[$d].Keys){
                        Write-Host "Old version  :"$v
                    }
                }
            }
        }
    }
}