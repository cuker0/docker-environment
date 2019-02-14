
# command to build the container':'

docker build -t echteler/node:x86_64 --rm .

# command to run the container':'

docker run -it --name node echteler/node:x86_64
docker run -d --name node echteler/node:x86_64