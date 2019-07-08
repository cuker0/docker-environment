
# command to build the container':'

docker build -t echteler/telegraf:arm32v7 --rm .

# command to run the container':'

docker run -d -p8125:8125 -p8092:8092 -p8094:8094 --name telegraf echteler/telegraf:arm32v7
docker run -it -p8125:8125 -p8092:8092 -p8094:8094 --name telegraf echteler/telegraf:arm32v7