
# command to build the container':'

docker build -t echteler/httpd:x86_64 --rm .

# command to run the container':'

docker run -d -p80:80 --name httpd echteler/httpd:x86_64