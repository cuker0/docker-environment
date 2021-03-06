ARG VERSION=arm32v7

FROM echteler/alpine:${VERSION}

ARG VERSION=1.0.47
ARG URL=https://download.pureftpd.org/pub/pure-ftpd/releases/pure-ftpd-$VERSION.tar.gz

LABEL maintainer "Philipp Echteler"
LABEL Version "1.0"
LABEL TAG "sftp Server"
LABEL Architecture "ARM32V7"

ENV PUBLIC_HOST         localhost
ENV MIN_PASV_PORT       30000
ENV MAX_PASV_PORT       30009
ENV UID                 1000
ENV GID                 1000
ENV DEFAULT_USR         "username"
ENV DEFAULT_PWD         "password"
#install the pure ftpd base server
RUN set -ex && \
    apk add --no-cache --virtual .build-deps \
                                build-base \
                                curl \
                                tar && \
                                cd /tmp && \
                                curl -sSL $URL | tar xz --strip 1 && \
                                ./configure \
                                    --prefix=/usr \
                                    --sysconfdir=/etc/pureftpd \
                                    --with-minimal \
                                    --with-throttling \
                                    --with-puredb \
                                    --with-rfc2640 \
                                    --with-peruserlimits && \
                                make install-strip && \
                                cd .. && \
                                rm -rf /tmp/* && \
                                apk del .build-deps
#install expect to add automatic user configuration 
RUN apk add --no-cache expect
#Copy config file in Container
COPY pure-ftpd.conf /etc/pureftpd
#Copy entry point file in Container
COPY entrypoint.sh /usr/bin/entrypoint.sh
#Add Volumes 
VOLUME /home/ftpuser /etc/pureftpd
#Add ports to expose
EXPOSE 21 $MIN_PASV_PORT-$MAX_PASV_PORT

ENTRYPOINT ["/usr/bin/entrypoint.sh"]

CMD /usr/sbin/pure-ftpd \
                        -P $PUBLIC_HOST \
                        -p $MIN_PASV_PORT:$MAX_PASV_PORT \
                        -l puredb:/etc/pureftpd/pureftpd.pdb \
                        -E \
                        -j \
                        -R
