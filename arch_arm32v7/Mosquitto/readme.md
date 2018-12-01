#Build Container:
docker build -t echteler/mosquitto:arm32v7 --rm .

#Run container
docker run -d -p1883:1883 --name mosquitto echteler/mosquitto:arm32v7



docker build -t mqtt:latest .
docker run -d -p 1883:1883 -p 9001:9001 --name MQTT mqtt:latest
docker exec -it bash

https://github.com/eclipse/mosquitto/tree/1853bfc678c255367e7c2c2f138da7bf47054117/docker/1.5
