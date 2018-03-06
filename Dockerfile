FROM alpine
MAINTAINER Shamil Ganiev <samolander@yandex.ru>

WORKDIR /srv

COPY cmd.sh /usr/bin

RUN apk add --no-cache optipng bash git \
    && echo 'PS1="\[\e[1;32m\][\u@\h \[\e[1;34m\]\W \[\e[1;32m\]]\[\033[00m\] "' > /root/.bashrc 

CMD [ "cmd.sh" ]
