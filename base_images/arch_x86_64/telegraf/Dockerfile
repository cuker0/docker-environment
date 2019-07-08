ARG VERSION=arm32v7

FROM echteler/alpine:${VERSION}

LABEL maintainer "Philipp Echteler"
LABEL Version "1.0"
LABEL TAG "influx telegraf"

RUN echo 'hosts: files dns' >> /etc/nsswitch.conf
RUN apk add --no-cache iputils ca-certificates net-snmp-tools procps lm_sensors && \
    update-ca-certificates

ENV TELEGRAF_VERSION 1.10.4

RUN set -ex && \
    apk add --no-cache --virtual .build-deps wget gnupg tar && \
    for key in \
        05CE15085FC09D18E99EFB22684A14CF2582E0C5 ; \
    do \
        gpg --keyserver ha.pool.sks-keyservers.net --recv-keys "$key" || \
        gpg --keyserver pgp.mit.edu --recv-keys "$key" || \
        gpg --keyserver keyserver.pgp.com --recv-keys "$key" ; \
    done && \
    wget --no-verbose https://dl.influxdata.com/telegraf/releases/telegraf-${TELEGRAF_VERSION}-static_linux_amd64.tar.gz.asc && \
    wget --no-verbose https://dl.influxdata.com/telegraf/releases/telegraf-${TELEGRAF_VERSION}-static_linux_amd64.tar.gz && \
    #wget --no-verbose  https://dl.influxdata.com/telegraf/releases/telegraf-${TELEGRAF_VERSION}_linux_armhf.tar.gz.asc && \
    #wget --no-verbose  https://dl.influxdata.com/telegraf/releases/telegraf-${TELEGRAF_VERSION}_linux_armhf.tar.gz && \
    #                  https://dl.influxdata.com/telegraf/releases/telegraf-1.9.0_linux_armhf.tar.gz
    #                  https://dl.influxdata.com/chronograf/releases/telegraf-1.9.0_linux_armhf.tar.gz
    gpg --batch --verify telegraf-${TELEGRAF_VERSION}_linux_armhf.tar.gz.asc telegraf-${TELEGRAF_VERSION}_linux_armhf.tar.gz && \
    mkdir -p /usr/src /etc/telegraf && \
    tar -C /usr/src -xzf telegraf-${TELEGRAF_VERSION}_linux_armhf.tar.gz && \
    #mv /usr/src/telegraf*/telegraf.conf /etc/telegraf/ && \
    chmod +x /usr/src/telegraf*/* && \
    cp -a /usr/src/telegraf*/* . && \
    rm -rf *.tar.gz* /usr/src /root/.gnupg && \
    apk del .build-deps
# User configuration directory volume
VOLUME /etc/telegraf
COPY config/telegraf.conf /etc/telegraf

EXPOSE 8125/udp 8092/udp 8094

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["telegraf"]
