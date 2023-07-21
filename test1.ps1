
Write-Host "----" -ForegroundColor Green


$items=Get-ChildItem -Path "D:\test.txt" -Recurse

$find="kuku"

foreach ($i in $items){
    Write-Host $i.FullName -ForegroundColor DarkBlue
    $contents=Get-Content -Path $i.FullName
    
    foreach($c in $contents){ 
       if($c.Length -eq 0) {
        continue
       } 
       
       if($c.Contains($find)){
        $c -replace $find , 'poka'
        }
    }
    
    
}

#Write-Host "hello world"