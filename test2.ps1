Write-Host "----" -ForegroundColor Green


$items=Get-ChildItem -Path "D:\test.txt" -Recurse

$find="kuku"

foreach ($i in $items){
    Write-Host $i.FullName -ForegroundColor DarkBlue
    $contents=Get-Content -Path $i.FullName}
    
    foreach($c in $contents){ 
       if($c.Length -gt 8) {
       Write-Host $c -ForegroundColor DarkCyan
       } else {
        Write-Host $c -ForegroundColor Magenta
       }
       
       
    }