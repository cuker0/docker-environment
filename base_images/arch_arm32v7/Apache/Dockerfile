ARG VERSION=arm32v7

FROM echteler/httpd:${VERSION}

LABEL maintainer "Philipp Echteler"
LABEL Version "1.0"
LABEL TAG "sftp Server"
LABEL Architecture "ARM32V7"



#Copy directory public-html to container /usr/local/apace2/htdocs
COPY ./public-html/ /usr/local/apache2/htdocs/