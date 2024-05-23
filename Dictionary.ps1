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

$reference = $dictjson|ConvertFrom-Json|ConvertTo-Hashtable
Write-Host $reference


foreach ($i in $reference.Keys){
    Write-Host $i
    foreach ($y in $reference[$i].Keys){
        Write-Host $"---> $($y)"
        foreach ($z in $reference[$i][$y]){
            Write-Host "------------> $($z)"
        }
    }
}


<#foreach($r in $reference){

    }
}#>

<#foreach($k in $dict.Keys){
    if($dict[$k].Count -gt 1){
        Write-Host ""
        Write-Host $k
        foreach($v in $dict[$k].Keys){
            Write-Host $v
        foreach($f in $dict[$k][$v]){
            Write-Host $f
            }
        }
    }
}#>
