$MinecraftServers = @(
    @{
        Name = "Duo";
        Port = "25590"
    },
    @{
        Name = "Palissade";
        Port = "25591"
    },
    @{
        Name = "Terracotta";
        Port = "25565"
    },
    @{
        Name = "Frost";
        Port = "25596"
    },
    @{
        Name = "Flat";
        Port = "25577"
    },
    @{
        Name = "New Start";
        Port = "25588"
    },
    @{
        Name = "Portal House";
        Port = "25595"
    },
    @{
        Name = "Trains";
        Port = "25566"
    },
    @{
        Name = "Infected";
        Port = "25599"
    },
    @{
        Name = "Forteresse";
        Port = "25574"
    },
    @{
        Name = "Dot3";
        Port = "25589"
    }
)
$nmapScan = nmap.exe --version-light -p 25565-25600 192.168.2.33
$nmapResults = ($nmapScan -split "`n" | Select-Object -Skip 5) -join "`n"
$nmapResults = ($nmapResults -split "`n" | Where-Object {$_ -notmatch "MAC Address"} | Select-Object -First ($nmapResults -split "`n").IndexOf(($nmapResults -split "`n" | Where-Object {$_ -match "MAC Address"}))) -join "`n"
$nmapResults = $nmapResults.TrimEnd("`n")

foreach($Server in $MinecraftServers){
    $ServerName = $Server.Name
    $ServerPort = $Server.Port
    if($nmapResults -like "*$ServerPort*"){
        Write-Host "Le monde $ServerName est disponible sur 192.168.2.33:$ServerPort"
    }
}