
Write-Host "----" -ForegroundColor Green


$items=Get-ChildItem -Path "D:\video\Kino_kollekciya\Foto.txt" -Recurse

foreach ($i in $items){
    Write-Host $i.FullName -ForegroundColor DarkBlue
    $contents=Get-Content -Path $i.FullName
    $s=$true
    foreach($c in $contents){ 
       if($c.Length -eq 0) {
        continue
       }
        if ($s) {
            Write-Host $c -ForegroundColor DarkYellow
            $s=$false 
            
    
        }else{
            Write-Host $c -ForegroundColor Red
            $s=$true
        }
    }
    
    
}

#Write-Host "hello world"