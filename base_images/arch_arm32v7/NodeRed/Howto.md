
# Build Container':'

docker build -t echteler/nodered:arm32v7 --rm .

#Run container
docker run -d -p1880:1880 --name nodered echteler/nodered:arm32v7
docker run -d -p1880:1880 --name nodered echteler/nodered:balluff_arm


command to run the Container: docker run (-d) (-p 1880:1880) (--name NodeRedTesting) (nodered:test)
#command clean: 
docker run -d -p1880:1880 --name NodeRed echteler/noderedpe:latest
remove brackets

bash into container: docker exec -it NodeRedTesting /bin/sh

copy files from container:
docker cp <containerId>:/file/path/within/container /host/path/target 
sudo docker cp 902:/data/settings.js /PeDev/export

flow file need to be copyed to /data
settings file needs to be copied to /data

additional nodes: inside container...
$ cd /data
$ npm install node-red-node-smooth
node-red-node-smooth@0.0.3 node_modules/node-red-node-smooth
$ exit
$ docker stop mynodered
$ docker start mynodered

mount /data to Host: 
$ docker run -it -p 1880:1880 -v ~/.node-red:/data --name mynodered nodered/node-red-docker

additional nodes: if mounted...
$ cd ~/.node-red
$ npm install node-red-node-smooth
node-red-node-smooth@0.0.3 node_modules/node-red-node-smooth
$ docker stop mynodered
$ docker start mynodered

to update nodered version: 
edit package.json file 

,
        ,
        "node-red-contrib-smb":"*",
        "node-red-contrib-filebrowser":"*"


