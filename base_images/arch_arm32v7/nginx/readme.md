
# Build Container

docker build -t echteler/nginx:arm32v7 --rm .  

# Run container

docker run -d -p80:80 --name nginx echteler/nginx:arm32v7