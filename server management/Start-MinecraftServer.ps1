[CmdletBinding()]
param (
    [Parameter(Mandatory)]
    [string]
    $ServerName
)

$script:path_base = $PSScriptRoot
$script:servers_base_directory = "$path_base/server_jar/1.21"
$script:minecraft_servers = Get-ChildItem -Path $script:servers_base_directory -Directory -Force

if($script:minecraft_servers.Name -notcontains $ServerName){
    Write-Host -ForegroundColor Red "$ServerName not found"
    exit
}
else{
    Set-Location -Path "$script:servers_base_directory/$ServerName"
    $ScreenName = "Minecraft_$ServerName"
    $JarFiles = Get-ChildItem -Path "." -Filter "*.jar"
    if($JarFiles.Name -contains "server_1.21.4.jar"){
        $ServerJar = $JarFiles | Where-Object -Property Name -Contains "server_1.21.4.jar" | Select-Object -ExpandProperty Name
    }
    elseif($JarFiles.Name -contains "fabric_1.21.4.jar"){
        $ServerJar = $JarFiles | Where-Object -Property Name -Contains "fabric_1.21.4.jar" | Select-Object -ExpandProperty Name
    }
    elseif($JarFiles.Name -contains "server_1.21.3.jar"){
        $ServerJar = $JarFiles | Where-Object -Property Name -Contains "server_1.21.3.jar" | Select-Object -ExpandProperty Name
    }
    elseif($JarFiles.Name -contains "server.jar"){
        $ServerJar = $JarFiles | Where-Object -Property Name -Contains "server.jar" | Select-Object -ExpandProperty Name
    }
    elseif($JarFiles.Name -contains "vanilla.jar"){
        $ServerJar = $JarFiles | Where-Object -Property Name -Contains "vanilla.jar" | Select-Object -ExpandProperty Name
    }
    else{
        Write-Host -ForegroundColor Red "$ServerName .jar file not found or unknown .jar file name"
        exit
    }
    sudo screen -dmS $ScreenName java -Xms1G -Xmx2G -jar $ServerJar nogui
}