cls

#  ConvertToHashtable function copied from https://4sysops.com/archives/convert-json-to-a-powershell-hash-table/

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





<#foreach($d in $dict){
    if($dict.Contains($d) -and -not($reference.Contains($d))){

    }
}#>

<#foreach ($i in $reference.Keys){
    Write-Host $i
    foreach ($y in $reference[$i].Keys){
        Write-Host $"---> $($y)"
        foreach ($z in $reference[$i][$y]){
            Write-Host "------------> $($z)"
        }
    }
}#>

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
