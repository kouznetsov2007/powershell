. "$($PSScriptRoot)\..\Functions\FindFile.ps1"

Write-Host "Start FindFileTests $(Get-Date)" -ForegroundColor Blue

$TestFolder="D:\temp\FindFileTests\"

if (-not (Test-Path $TestFolder)){
    New-Item -ItemType Directory -Path $TestFolder
}

New-Item -Path "$($TestFolder)file1.txt"
New-Item -ItemType Directory -Path "$($TestFolder)directoryA"
New-Item -Path "$($TestFolder)directoryA\file3.txt"
New-Item -Path "$($TestFolder)directoryA\file3.jpg"

$test = @(FindFile $TestFolder "txt")
if ($test.Length -eq 2){
    Write-Host "Test 1 passed" -ForegroundColor Green
}else {
    Write-Host "Test 1 Failed. Expected value: 2" -ForegroundColor Red
}

$test = @(FindFile $TestFolder "jpg")
if ($test.Length -eq 1){
    Write-Host "Test 2 passed"-ForegroundColor Green
}else {
    Write-Host "Test 2 Failed. Expected value: 1" -ForegroundColor Red
}

Remove-Item -Path $TestFolder -Recurse
Write-Host "End FindFileTests $(Get-Date)" -ForegroundColor Blue