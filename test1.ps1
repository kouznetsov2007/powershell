
Write-Host "----" -ForegroundColor Green


$items=Get-Content -Path "D:\*.txt" -ReadCount

foreach ($i in $items){
    Write-Host $i.FullName

    
    Break
}

#Write-Host "hello world"