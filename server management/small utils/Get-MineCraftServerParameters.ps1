[CmdletBinding()]
param (
    [Parameter(Mandatory)]
    [string]
    $PropertyName
)
$ServersPropertiesFiles = Get-ChildItem -Path . -Recurse -Filter "server.properties"
foreach($ServerPropertiesFile in $ServersPropertiesFiles){
    Write-Host $ServerPropertiesFile
    $Properties = Get-Content -Path $ServerPropertiesFile
    foreach($Property in $Properties){
        if ($Property -like "*$PropertyName*"){
            Write-Host "$ServerPropertiesFile : $Property `n"
        }
    }
}