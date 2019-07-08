# Build Instructions:
docker build -t echteler/alpine:x86_64 --rm .

# Run instructions:
docker run -d --name alpine echteler/alpine:x86_64
docker run -it --name alpinearm32v7 echteler/alpine:x86_64 /bin/sh

  
  
taken from: <https://github.com/gliderlabs/docker-alpine/blob/rootfs/library-3.9/x86_64/versions/library-3.9/x86_64/rootfs.tar.xz>

SourceCode can be found here: 
https://github.com/echtelerp/docker-environment/tree/master/arch_arm32v7