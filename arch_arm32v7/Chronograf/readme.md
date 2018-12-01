#command to build the container: 
docker build -t echteler/chronograf:arm32v7 --rm .

#command to run the container: 
docker run -d -p8888:8888 --name chronograf echteler/chronograf:arm32v7