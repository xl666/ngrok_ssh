FROM alpine

RUN apk add --no-cache \
  curl \
  unzip \
  bash \
  grep

ENV PORT="22"
ENV BOT_TOKEN=""
ENV BOT_CHATID=""
ENV NGROK_TOKEN=""
ENV COMMAND="tcp"

RUN mkdir -p /ngrok
RUN mkdir -p /logs

WORKDIR /ngrok

RUN curl https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip -o ngrok.zip

RUN unzip ngrok.zip && rm ngrok.zip

COPY ./iniciar.sh .
RUN chmod +x ./iniciar.sh

ENTRYPOINT [ "./iniciar.sh" ]