# command to build the container:
docker build -t echteler/httpd:arm32v7 --rm .

# command to run the container: 
docker run -d -p80:80 --name httpd echteler/httpd:arm32v7

<https://www-us.apache.org/dist/httpd/>
