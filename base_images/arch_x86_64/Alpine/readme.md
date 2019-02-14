# Build Instructions:
docker build -t echteler/alpine:x86_64 --rm .

# Run instructions:
docker run -d --name alpine echteler/alpine:x86_64
docker run -it --name alpinearm32v7 echteler/alpine:x86_64 /bin/sh

  
  
taken from: https://github.com/gliderlabs/docker-alpine/tree/c14b86580b9f86f42296050ec7564faf6b6db9be/versions/library-3.8/armhf

SourceCode can be found here: 
https://github.com/echtelerp/docker-environment/tree/master/arch_arm32v7