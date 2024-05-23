cls
<#$TestArray = @("1","2","3","4","5")
$testDict = @{test = "smth"; check = "smthelse"}


$jsondict = $testDict|ConvertTo-Json
$jsonarray = $TestArray|ConvertTo-Json

Write-Host $jsonarray
Write-Host $jsondict#> 

<#$content = Get-Content -Path "D:\temp\novaya\bezimyanniy.txt"
$jsonfile = $content|ConvertTo-Json
$jsonfile|Out-File "D:\temp\novaya\bezimyanniy.json"
Write-Host $jsonfile#>
"$($PSScriptRoot)\Functions\ConvertToHashtable.ps1"



$file = Get-Content -Path "D:\temp\dictconverted.json"

$reference = $file|ConvertFrom-Json|ConvertTo-Hashtable
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
