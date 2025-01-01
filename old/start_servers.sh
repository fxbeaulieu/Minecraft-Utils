#!/bin/bash

start_server() {
    local server_name=$1
    local server_path="$HOME/server_jar/1.21/$server_name"
    local server_jar=$2
    local screen_name="minecraft_$server_name"

    echo "Starting $server_name server..."
    cd "$server_path"
    if [ "$server_name" == "flat" ]; then
        sudo screen -dmS "$screen_name" java -Xms1G -Xmx2G -jar $server_jar nogui
    elif [ "server_name" == "new_start" ]; then
        sudo screen -dmS "$screen_name" java -Xms1G -Xmx2G -jar $server_jar nogui
    elif [ "server_name" == "dot3" ]; then
        sudo screen -dmS "$screen_name" java -Xms1G -Xmx2G -jar $server_jar nogui
    elif [ "server_name" == "palissade" ]; then
        sudo screen -dmS "$screen_name" java -Xms1G -Xmx2G -jar $server_jar nogui
    elif [ "server_name" == "portal_house" ]; then
        sudo screen -dmS "$screen_name" java -Xms1G -Xmx2G -jar $server_jar nogui
    elif [ "server_name" == "frost" ]; then
        sudo screen -dmS "$screen_name" java -Xms1G -Xmx2G -jar $server_jar nogui
    elif [ "server_name" == "creative" ]; then
        sudo screen -dmS "$screen_name" java -Xms1G -Xmx2G -jar $server_jar nogui
    else
        sudo screen -dmS "$screen_name" java -Xms1G -Xmx2G -jar $server_jar nogui --bonusChest
    fi
}
#if [ "$1" == "infected" ]; then
#    start_server "infected" "vanilla.jar"
if [ "$1" == "forteresse" ]; then
    start_server "forteresse" "vanilla.jar"
elif [ "$1" == "trains" ]; then
    start_server "trains" "server_1.21.3.jar"
elif [ "$1" == "duo" ]; then
    start_server "duo" "server.jar"
elif [ "$1" == "terracotta" ]; then
    start_server "terracotta" "server.jar"
elif [ "$1" == "flat" ]; then
    start_server "flat" "server.jar"
elif [ "$1" == "new_start" ]; then
    start_server "new_start" "server_1.21.4.jar"
elif [ "$1" == "dot3" ]; then
    start_server "dot3" "server_1.21.4.jar"
elif [ "$1" == "palissade" ]; then
    start_server "palissade" "server_1.21.3.jar"
elif [ "$1" == "portal_house" ]; then
    start_server "portal_house" "server_1.21.4.jar"
elif [ "$1" == "frost" ]; then
    start_server "frost" "server_1.21.3.jar"
elif [ "$1" == "creative" ]; then
    start_server "creative" "server_1.21.4.jar"
elif [ "$1" == "all" ]; then
#    start_server "infected" "vanilla.jar"
    start_server "portal_house" "server_1.21.4.jar"
    start_server "forteresse" "vanilla.jar"
    start_server "trains" "server_1.21.3.jar"
    start_server "duo" "server.jar"
    start_server "terracotta" "server.jar"
    start_server "flat" "server.jar"
    start_server "dot3" "server_1.21.3.jar"
    start_server "palissade" "server_1.21.3.jar"
    start_server "new_start" "server_1.21.4.jar"
    start_server "frost" "server_1.21.3.jar"
    start_server "creative" "server_1.21.4.jar"
else
    echo "Unknown Server"
    exit 1
fi