#command to build the container: 
docker build -t echteler/debian:arm32v7 --rm .

#command to run the container: 
docker run -it --name debian echteler/debian:arm32v7



