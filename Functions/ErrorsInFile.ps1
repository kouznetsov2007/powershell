function ErrorsInFile($errors, $file){
   
    $contents = Get-Content -Path $file
    $line = 0
    $result = @()

    foreach($c in $contents){ 
        $line = $line + 1 
        foreach($find in $errors){
            if($c.contains($find)){
                $pos = $c.IndexOf($find) + 1

                $errorr = New-Object -TypeName PSObject -Property @{
                    FileName = $file
                    Line = $line
                    Position = $pos
                    ErrorText = $find
                }
                $result = $result + $errorr
            }
        }
    }
    return $result
}




