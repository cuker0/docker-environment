#command to build the container: 
docker build -t echteler/portainer:arm32v7 --rm .

#command to run the container: 
docker run -d -p9000:9000 --name portainer echteler/portainer:arm32v7
docker run -it -p9000:9000 --name portainer echteler/portainer:arm32v7

# Documentation 
