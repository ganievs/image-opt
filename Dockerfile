FROM ubuntu
MAINTAINER Shamil Ganiev <samolander@yandex.ru>

RUN apt-get update -qqy && \
    apt-get install --no-install-recommends -qqy lsb-release && \
    \
    # Install OptiPNG
    echo "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe" > /etc/apt/sources.list && \
    apt-get remove --purge -y lsb-release $(apt-mark showauto) && \
    apt-get update -qqy && \
    apt-get install -qqy --no-install-recommends optipng && \
    \
    # cleanup
    apt-get autoremove -y && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /srv

CMD [ "/usr/bin/optipng", "-quiet", "-o7", "*.png" ]