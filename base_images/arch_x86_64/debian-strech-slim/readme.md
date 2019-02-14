
# command to build the container':'

docker build -t echteler/debian:x86_64 --rm .

# command to run the container':'

docker run -it --name debian echteler/debian:x86_64

# Source for files':'

<https://github.com/debuerreotype/docker-debian-artifacts/blob/dist-amd64/stretch/slim/rootfs.tar.xz>
