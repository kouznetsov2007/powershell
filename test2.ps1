Write-Host "----" -ForegroundColor Green


$items=Get-ChildItem -Path "D:\test.txt" -Recurse

$R = @('kuku','rock','roll')


foreach ($i in $items){
    Write-Host $i.FullName -ForegroundColor DarkBlue
    $contents=Get-Content -Path $i.FullName

    
   foreach($c in $contents){         
      foreach($find in $R){
         if($c.contains($find)){
            Write-Host $c 
            Write-Host $contents.IndexOf($c) -ForegroundColor Red
            Write-Host $c.IndexOf("$find") -ForegroundColor DarkCyan
         }
      }
   }
}   
     
    