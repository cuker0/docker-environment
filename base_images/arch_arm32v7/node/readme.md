#command to build the container: 
docker build -t echteler/node:arm32v7 --rm .

#command to run the container: 
docker run -it --name node echteler/node:arm32v7
docker run -d --name node echteler/node:arm32v7

#infos: 

original Dockerfile file: https://github.com/nodejs/docker-node
