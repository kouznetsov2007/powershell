
Write-Host "----" -ForegroundColor Green


$items=Get-ChildItem -Path "D:\*.txt" -Recurse  

foreach ($i in $items){
    Write-Host $i.FullName

    
    Break
}

#Write-Host "hello world"
