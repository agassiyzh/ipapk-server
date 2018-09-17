FROM node:alpine

WORKDIR /app

LABEL maintainer="Zhuohui <shupian@2dfire.com>"

ARG TZ='Asia/Shanghai'
USER root

RUN apt-get update \
    && apt-get install -y libc6 lib32stdc++6 lib32gcc1 lib32ncurses5 lib32z1 sqlite3\
    && yarn add ipapk-server

EXPOSE 443

ADD  entrypoint.sh ./entrypoint.sh

ENTRYPOINT ["bash", "./entrypoint.sh"]