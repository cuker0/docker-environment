#command to build the container: 
docker build -t echteler/apachewebserver:arm32v7 --rm .

#command to run the container: 
docker run -d -p80:80 --name webserver echteler/apachewebserver:arm32v7



