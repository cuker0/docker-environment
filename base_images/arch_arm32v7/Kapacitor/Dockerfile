ARG VERSION=arm32v7

FROM echteler/alpine:${VERSION}

LABEL maintainer "Philipp Echteler"
LABEL Version "1.0"
LABEL TAG "influx kapacitor"

RUN echo 'hosts: files dns' >> /etc/nsswitch.conf
RUN apk add --no-cache ca-certificates && \
    update-ca-certificates

ENV KAPACITOR_VERSION 1.5.2

RUN set -ex && \
    apk add --no-cache --virtual .build-deps wget gnupg tar && \
    for key in \
        05CE15085FC09D18E99EFB22684A14CF2582E0C5 ; \
    do \
        gpg --keyserver ha.pool.sks-keyservers.net --recv-keys "$key" || \
        gpg --keyserver pgp.mit.edu --recv-keys "$key" || \
        gpg --keyserver keyserver.pgp.com --recv-keys "$key" ; \
    done && \
    #            wget  https://dl.influxdata.com/kapacitor/releases/kapacitor-${KAPACITOR_VERSION}_static_linux_armhf.tar.gz
    #                  https://dl.influxdata.com/kapacitor/releases/kapacitor-1.5.1_linux_armhf.tar.gz
    #wget --no-verbose https://dl.influxdata.com/kapacitor/releases/kapacitor-${KAPACITOR_VERSION}-static_linux_armhf.tar.gz.asc && \
    wget --no-verbose https://dl.influxdata.com/kapacitor/releases/kapacitor-${KAPACITOR_VERSION}_linux_armhf.tar.gz && \
    # gpg --batch --verify kapacitor-${KAPACITOR_VERSION}_linux_armhf.tar.gz && \
    mkdir -p /usr/src && \
    tar -C /usr/src -xvzf kapacitor-${KAPACITOR_VERSION}_linux_armhf.tar.gz && \
    rm -f /usr/src/kapacitor-*/kapacitor.conf && \
    chmod +x /usr/src/kapacitor-*/* && \
    cp -a /usr/src/kapacitor-*/* . && \
    rm -rf *.tar.gz* /usr/src /root/.gnupg && \
    apk del .build-deps
COPY kapacitor.conf /etc/kapacitor/kapacitor.conf

EXPOSE 9092

VOLUME /var/lib/kapacitor

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["kapacitord"]
