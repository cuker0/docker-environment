FROM scratch

LABEL maintainer "Philipp Echteler"
LABEL Version "1.0"
LABEL TAG "ARM BAse Image"
LABEL Architecture "x86_64"


ADD rootfs.tar.xz /
# ensure UTC instead of the default GMT
COPY UTC /etc/localtime
CMD ["/bin/sh"]
