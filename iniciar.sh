#!/bin/bash

function checkInternetConn() {
    curl https://www.google.com &> /dev/null || {
	echo "No Internet connection";
	sleep 5;
	exit 1;
    }
    
}

checkInternetConn

./ngrok authtoken "$NGROK_TOKEN"
./ngrok "$COMMAND" --log "/logs/log.txt" "$PORT" &
sleep 3
#recuperar cadena conexion
conexion=$(cat /logs/log.txt  | grep -oP "url=\K.*")
curl -X POST \
     -H 'Content-Type: application/json' \
     -d '{"chat_id": "'"$BOT_CHATID"'", "text": "'"$conexion"'", "disable_notification": false}' \
     https://api.telegram.org/bot$BOT_TOKEN/sendMessage
wait
