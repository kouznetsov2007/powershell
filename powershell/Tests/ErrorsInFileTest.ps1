cls

. "$($PSScriptRoot)\..\Functions\ErrorsInFile.ps1"

Write-Host "Start ErrorsInTextTest $(Get-Date)" -ForegroundColor Blue

$TestFile1 = "$($PSScriptRoot)\fileerrors1.txt"
$errors = @("Create On", "Create By",  "can not")
$test = ErrorsInFile $errors $TestFile1

if($test.Length -eq 3){
    Write-Host "Test 0 passed." -ForegroundColor Green 
}
else{
    Write-Host "Test 0 failed. expected value 3." -ForegroundColor Red
}

if($test[0].ErrorText -eq "Create On" -and $test[0].Position -eq 8 -and $test[0].Line -eq 3){
    Write-Host "Test 1 passed." -ForegroundColor Green
}
else{
    Write-Host "Test 1 failed." -ForegroundColor Red
}

if($test[1].ErrorText -eq "Create By" -and $test[1].Position -eq 8 -and $test[1].Line -eq 4){
    Write-Host "Test 2 passed." -ForegroundColor Green
}
else{
    Write-Host "Test 2 failed." -ForegroundColor Red
}

if($test[2].ErrorText -eq "can not" -and $test[2].Position -eq 16 -and $test[2].Line -eq 5){
    Write-Host "Test 3 passed." -ForegroundColor Green
}
else{
    Write-Host "Test 3 failed." -ForegroundColor Red
}

Write-Host "End ErrorsInFileTest $(Get-Date)" -ForegroundColor Blue