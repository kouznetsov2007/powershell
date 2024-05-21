
function FindFile($path, $extension){
    if (-not ($path.EndsWith("\"))){
        $path = $path + "\"
    }
    $pp = $path + "*." + $extension

    $items = Get-ChildItem -Path $pp -Recurse

    $result = @() 

    foreach($i in $items){
        $result = $result + $i.FullName 
    }
    return $result
}
