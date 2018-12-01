#Source: 
https://hub.docker.com/r/gists/pure-ftpd/
https://download.pureftpd.org/pub/pure-ftpd/doc/README

#command to build the container: 
docker build -t echteler/ftpserver:arm32v7 --rm .

#command to run the container: 
docker run -d -p21:21 -p30000-30009:30000-30009 --name ftpserver -e DEFAULT_USR=balluff -e DEFAULT_PWD=balluff echteler/ftpserver:arm32v7

#Username for FTP access

#Password for FTP access


docker run \
        -d \
        --name ftpserver \
        -p 21:21 \
        -p 30000-30009:30000-30009 \
        -v $(pwd)/pureftpd:/etc/pureftpd \
        -v /your/data:/home/ftpuser \
        echteler/ftpserver:arm32v7


![](https://images.microbadger.com/badges/version/gists/pure-ftpd.svg) ![](https://images.microbadger.com/badges/image/gists/pure-ftpd.svg) ![](https://img.shields.io/docker/stars/gists/pure-ftpd.svg) ![](https://img.shields.io/docker/pulls/gists/pure-ftpd.svg)

#### Volume

- /home/ftpuser
- /etc/pureftpd

#### Environment:

| Environment   | Default value |
|---------------|---------------|
| PUBLIC_HOST   | localhost     |
| MIN_PASV_PORT | 30000         |
| MAX_PASV_PORT | 30009         |
| UID           | 1000          |
| GID           | 1000          |

#### Custom usage:

    docker run \
        -d \
        --name pure-ftpd \
        -p 21:21 \
        -p 30000-30009:30000-30009 \
        -v $(pwd)/pureftpd:/etc/pureftpd \
        -v /your/data:/home/ftpuser \
        gists/pure-ftpd

**since docker version 1.5 ports can be exported in range**

#### Compose example:

    pure-ftpd:
      image: gists/pure-ftpd
      container_name: pure-ftpd
      ports:
        - "21:21"
        - "30000-30009:30000-30009"
      volumes:
        - /your/data:/home/ftpuser
        - ./pureftpd:/etc/pureftpd
      restart: always

##### ftpuser permision

    docker exec -it pure-ftpd chown ftpuser:ftpuser -R /home/ftpuser

##### ftpuser is OS user, test_user is the FTP virtual user

    docker exec -it pure-ftpd pure-pw useradd test -m -u ftpuser -d /home/ftpuser/test

##### refresh pure-ftpd password file or the new ftp user is unable to login

    docker exec -it pure-ftpd pure-pw mkdb

#### pure-ftpd

/usr/sbin/pure-ftpd # path to pure-ftpd executable

    -C|--maxclientsperip                # num no more than num requests from the same ip
    -l|--login puredb:/etc/pureftpd.pdb # login file for virtual users
    -E|--noanonymous                    # only real users
    -j|--createhomedir                  # auto create home directory if it doesnt already exist
    -R|--nochmod                        # prevent usage of the CHMOD command
    -P IP/Host                          # setting for PASV support, passed in your the PUBLIC_HOST env var
    -p 30000:30009                      # PASV port ranges


