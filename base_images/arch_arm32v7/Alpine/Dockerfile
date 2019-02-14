FROM scratch

LABEL maintainer "Philipp Echteler"
LABEL Version "1.0"
LABEL TAG "ARM Base Image"
LABEL Architecture "ARM32V7"


ADD rootfs.tar.gz /
# ensure UTC instead of the default GMT
COPY UTC /etc/localtime
CMD ["/bin/sh"]
