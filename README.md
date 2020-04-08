# ngrok_ssh
ngrok enabled docker container with telegram notifications for knowing the random url given

It uses amd64 by default, if you want other architecture (e.g. ARM for a raspberry) see https://ngrok.com/download to get desired url and edit Dockerfile

Environment variables:
BOT_TOKEN: Telegram bot token, see https://medium.com/@ManHay_Hong/how-to-create-a-telegram-bot-and-send-messages-with-python-4cf314d9fa3e to see how to create a bot and get token and chat ID
BOT_CHATID: Telegram chat ID (see above)
NGROK_TOKEN: ngrok account token, see https://ngrok.com/ to get one
COMMAND: tcp or http, tls is not tested, may work
PORT: ngrok listen port

Suggested docker-compose:

version: '3'
services:
  ngrok_ssh:
    env_file:
      - settings.env
    build: ./
    restart: always
    container_name: ngrok_ssh
    network_mode: "host"
