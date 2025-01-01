[CmdletBinding()]
param (
    [Parameter(Mandatory)]
    [string]
    [ValidateSet("1.21.3","1.21.4")]
    $GameVersion,
    [Parameter(Mandatory)]
    [ValidateSet("Survival","Creative")]
    [string]
    $GameMode,
    [Parameter(Mandatory)]
    [ValidateSet("Peaceful","Easy","Medium","Hard")]
    [string]
    $GameDifficulty,
    [Parameter(Mandatory)]
    [ValidateRange(25565,25665)]
    [int]
    $ServerPort,
    [Parameter(Mandatory)]
    [string]
    $ServerName,
    [Parameter()]
    [string]
    $ServerDescription
)

$script:path_base = $PSScriptRoot
$script:server_jars_directory_path = "$path_base/jar_src"
$script:server_config_templates_directory = "$path_base/templates"
$script:servers_base_directory = "$path_base/server_jar/1.21"
$script:new_server_base_directory = "$script:servers_base_directory/$ServerName"
$script:new_server_jar_to_use = "$script:server_jars_directory_path/server_$GameVersion.jar"
$script:server_config_template_files = @("ops.json","server.properties","eula.txt")

function Set-ServerDirectoryAndBaseFiles {
    param (
        [Parameter(Mandatory)]
        [string]
        [ValidateSet("1.21.3","1.21.4")]
        $ServerJar,
        [Parameter(Mandatory)]
        [string]
        $ServerBaseDirectory
    )
    New-Item -Path $ServerBaseDirectory -ItemType Directory -Force
    Copy-Item -Path $ServerJar -Destination $ServerBaseDirectory -Force
    foreach($config_template_file in $script:server_config_template_files){
        $config_template_file_path = "$script:server_config_templates_directory/$config_template_file"
        Copy-Item -Path $config_template_file_path -Destination $ServerBaseDirectory -Force
        if($config_template_file -like "*server.properties*"){
            $PropertiesFile = Get-Item "$ServerBaseDirectory/$config_template_file"
        }
    }
    return $PropertiesFile
}

function Set-ServerProperties {
    param (
        [Parameter(Mandatory)]
        [ValidateSet("Survival","Creative")]
        [string]
        $GameMode,
        [Parameter(Mandatory)]
        [ValidateSet("Peaceful","Easy","Medium","Hard")]
        [string]
        $GameDifficulty,
        [Parameter(Mandatory)]
        [ValidateRange(25565,25665)]
        [int]
        $ServerPort,
        [Parameter()]
        [string]
        $ServerDescription,
        [Parameter(Mandatory)]
        [string]
        $ServerPropertiesFile
    )
    $ServerProperties = Get-Content -Path $ServerPropertiesFile
    $ConfiguredServerProperties = $ServerProperties.Replace('<<<game_mode>>>',$GameMode).Replace('<<<game_difficulty>>>',$GameDifficulty).Replace('<<<server_port>>>',[string]$ServerPort).Replace('<<<server_description>>>',$ServerDescription)
    Set-Content -Path $ServerPropertiesFile -Value $ConfiguredServerProperties -Force
}

if(!(Test-Path -Path $script:new_server_base_directory)){
    $ServerPropertiesFile = Set-ServerDirectoryAndBaseFiles -ServerJar $script:new_server_jar_to_use -ServerBaseDirectory $script:new_server_base_directory
    Set-ServerProperties -GameMode $GameMode -GameDifficulty $GameDifficulty -ServerPort $ServerPort -ServerDescription $ServerDescription -ServerPropertiesFile $ServerPropertiesFile
}