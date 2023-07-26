Write-Host "----" -ForegroundColor Green


$items=Get-ChildItem -Path "D:\test.txt" #-Recurse

$R = @('kuku','rock','roll')


foreach ($i in $items){
    $contents=Get-Content -Path $i.FullName

   $p=0
   $line=0

   $nn = $false

   foreach($c in $contents){ 
      $p=$p+1
      $line=$line+1
      foreach($find in $R){
         $pos = $c.IndexOf($find)
         if($c.contains($find)){
            if(-not $nn){
               $nn = $true
               Write-Host $i.FullName  -BackgroundColor Green
            }
            if($pos -gt -1){
               $c1 = $c.Substring(0,$pos)
               $pos2 = $pos + $find.Length
               $c2 = $c.Substring($pos2,$c.Length - $pos2)
               
               Write-Host $c1 -NoNewline
               Write-Host $find -NoNewline -BackgroundColor  Yellow
               Write-Host $c2
               Write-Host 'Pos :'$p  -ForegroundColor DarkRed -NoNewline
               Write-Host ' Line :'$line -ForegroundColor Cyan
               
               
            }
         }
      }
   }
}   
     
    