# syntax=docker/dockerfile:1

FROM openjdk:21-buster

LABEL version="1.21.1 v18"

RUN apt-get update && apt-get install -y curl unzip jq && \
    adduser --uid 99 --gid 100 --home /data --disabled-password minecraft

COPY launch.sh /start.sh
RUN chmod +x /start.sh

USER minecraft

VOLUME /data
WORKDIR /data
 
EXPOSE 25565/tcp

CMD ["/start.sh"]
 
