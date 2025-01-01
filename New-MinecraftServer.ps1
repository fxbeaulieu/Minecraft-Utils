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
$script:servers_base_directory = "$path_base/server_jar/1.21"

function Set-ServerDirectoryAndBaseFiles {
    param (
        [Parameter(Mandatory)]
        [string]
        [ValidateSet("1.21.3","1.21.4")]
        $GameVersion,
        [Parameter(Mandatory)]
        [string]
        $ServerName
    )
    
}

if(!(Test-Path -Path "$script:servers_base_directory/$ServerName")){
    Set-ServerDirectoryAndBaseFiles -GameVersion $GameVersion -ServerName $ServerName
}