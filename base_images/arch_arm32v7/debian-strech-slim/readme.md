
# command to build the container':'

docker build -t echteler/debian:arm32v7 --rm .

# command to run the container':'

docker run -it --name debian echteler/debian:arm32v7

# Source for files':'

<https://github.com/debuerreotype/docker-debian-artifacts/blob/dist-arm32v7/stretch/slim/rootfs.tar.xz>
