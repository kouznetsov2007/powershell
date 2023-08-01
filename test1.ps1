
Write-Host "----" -ForegroundColor Green


$1=1
$2=2
for($i=3; $i -le 50; $i++){
    $n=$1+$2
    $1=$2
    $2=$n
}
Write-Host $2