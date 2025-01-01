$ServersPropertiesFiles = Get-ChildItem -Path . -Recurse -Filter "server.properties"
foreach($ServerPropertiesFile in $ServersPropertiesFiles){
    $Properties = Get-Content -Path $ServerPropertiesFile
    for($i=0; $i -lt $Properties.Length; $i++){
        if ($Properties[$i] -like "enable-command-block=false"){
            $Properties[$i] = "enable-command-block=true"
        }
    }
    $Properties | Set-Content -Path $ServerPropertiesFile
}