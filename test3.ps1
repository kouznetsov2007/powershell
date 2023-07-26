Write-Host "----" -ForegroundColor Green

$str = "abckuku123"

$find = "kuku"

$pos = $str.IndexOf($find)


if($pos -gt -1){
    $str1 = $str.Substring(0,$pos)
    $pos2 = $pos + $find.Length
    $str2 = $str.Substring($pos2,$str.Length - $pos2)

    Write-Host $str1 -NoNewline
    Write-Host $find -NoNewline -BackgroundColor DarkMagenta
    Write-Host $str2 
    
}

