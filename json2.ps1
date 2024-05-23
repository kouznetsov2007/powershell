function ConvertTo-Hashtable {
    [CmdletBinding()]
    [OutputType('hashtable')]
    param (
        [Parameter(ValueFromPipeline)]
        $InputObject
    )
    process {
        ## Return null if the input is null. This can happen when calling the function
        ## recursively and a property is null
        if ($null -eq $InputObject) {
            return $null
        }
        ## Check if the input is an array or collection. If so, we also need to convert
        ## those types into hash tables as well. This function will convert all child
        ## objects into hash tables (if applicable)
        if ($InputObject -is [System.Collections.IEnumerable] -and $InputObject -isnot [string]) {
            $collection = @(
                foreach ($object in $InputObject) {
                    ConvertTo-Hashtable -InputObject $object
                }
            )
            ## Return the array but don't enumerate it because the object may be pretty complex
            Write-Output -NoEnumerate $collection
        } elseif ($InputObject -is [psobject]) { ## If the object has properties that need enumeration
            ## Convert it to its own hash table and return it
            $hash = @{}
            foreach ($property in $InputObject.PSObject.Properties) {
                $hash[$property.Name] = ConvertTo-Hashtable -InputObject $property.Value
            }
            $hash
        } else {
            ## If the object isn't an array, collection, or other object, it's already a hash table
            ## So just return it.
            $InputObject
        }
    }
}


$a=@{}
$a["keyLevel1"]=@{}
$a["keyLevel1"]["keyLevel2"]=@()
$a["keyLevel1"]["keyLevel2"]=$a["keyLevel1"]["keyLevel2"]+"sometext"

Write-Host "A"
foreach ($i in $a.Keys){
    Write-Host $i
    foreach ($y in $a[$i].Keys){
        Write-Host $"---> $($y)"
        foreach ($z in $a[$i][$y]){
            Write-Host "------------> $($z)"
        }
    }
}
Write-Host ""

Write-Host "JSON"
$json=$a | ConvertTo-Json
Write-Host $json
Write-Host ""


Write-Host "B"
#$b=Get-FromJson $json
#$b=ConvertTo-HashTable $json #| ConvertFrom-Json -As hashtable
$b=$json | ConvertFrom-Json | ConvertTo-HashTable

foreach ($i in $b.Keys){
    Write-Host $i
    foreach ($y in $b[$i].Keys){
        Write-Host $"---> $($y)"
        foreach ($z in $b[$i][$y]){
            Write-Host "------------> $($z)"
        }
    }
}
Write-Host ""