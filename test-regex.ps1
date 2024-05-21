Write-Host "------ $(Get-Date)" -ForegroundColor DarkBlue

$str="bhjggh lab1000-wad1 gjd hram04521-inkv jg LAB003-Wad1 hdk hram1-inkv LAB-DB02\DB01 hg lab99-wad1 HRAM652-INKV fgfgfhf"
$reg="lab\d{1,3}\-wad1" , "hram\{2,5}\-inkv"
foreach($a in $reg){

    $ms=[regex]::Matches($str,$a,[Text.RegularExpressions.RegexOptions]::IgnoreCase)
    
    foreach ($m in $ms){
    Write-Host $m -ForegroundColor Green
    }
}
