#command to build the container: 
docker build -t echteler/kapacitor:arm32v7 --rm .

#command to run the container: 
docker run -d -p9092:9092 --name kapacitor echteler/kapacitor:arm32v7