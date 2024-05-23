cls
<#$TestArray = @("1","2","3","4","5")
$testDict = @{test = "smth"; check = "smthelse"}


$jsondict = $testDict|ConvertTo-Json
$jsonarray = $TestArray|ConvertTo-Json

Write-Host $jsonarray
Write-Host $jsondict#> 

$content = Get-Content -Path "D:\temp\novaya\bezimyanniy.txt"
$jsonfile = $content|ConvertTo-Json
$jsonfile|Out-File "D:\temp\novaya\bezimyanniy.json"
Write-Host $jsonfile