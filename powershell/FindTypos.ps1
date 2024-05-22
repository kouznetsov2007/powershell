cls

. "$($PSScriptRoot)\Functions\FindFile.ps1"
 
. "$($PSScriptRoot)\Functions\ErrorsInFile.ps1"

$path = "D:\temp\"
$ext = "txt" 

$filesfound = FindFile $path $ext

$errors = @("Create On", "Create By", "can not")

$result = @()

foreach($file in $filesfound){
    $errorsfound = ErrorsInFile $errors $file
    $result = $result + $errorsfound 
}

$CurrentName = ""

foreach($res in $result){
    if($CurrentName -ne $res.FileName){
        $CurrentName = $res.FileName
        Write-Host $CurrentName
    }
        Write-Host "$($res.Line),$($res.Position) : $($res.ErrorText)"
} 