ARG VERSION=arm32v7

FROM echteler/alpine:${VERSION}

# Add tags and stuff...
LABEL maintainer "Philipp Echteler"
LABEL Version "1.0"
LABEL TAG "portainer"

ENV PORTAINER_VERSION=1.19.2 \
    PORTAINER_HOME=/var/lib/portainer

RUN set -ex && \
    apk add --no-cache --virtual .build-deps wget tar && \
    #mkdir ${PORTAINER_HOME} && \
    #addgroup -S portainer && \
    #adduser -S -D -g "" -G portainer -s /bin/sh -h ${PORTAINER_HOME} portainer && \
    #chown portainer:portainer ${PORTAINER_HOME} && \
    mkdir /opt && \
    cd /opt && \
    wget --no-verbose https://github.com/portainer/portainer/releases/download/${PORTAINER_VERSION}/portainer-1.19.2-linux-arm.tar.gz && \
    tar xvpfz portainer-${PORTAINER_VERSION}-linux-arm.tar.gz && \
    mkdir /data && \
    apk del .build-deps
EXPOSE 9000
VOLUME [ "/data" ]
#CMD ["/opt/portainer/portainer --template-file "/opt/portainer/templates.json""]
ENTRYPOINT [ "/opt/portainer/portainer" ]

