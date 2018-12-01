#! /bin/sh
#
# entrypoint.sh

set -e

[[ "$DEBUG" == "true" ]] && set -x

addgroup -g ${GID} -S ftpgroup && adduser -u ${UID} -G ftpgroup -h /home/ftpuser -D -s /sbin/nologin ftpuser

[[ $(stat -c %U /home/ftpuser) == "ftpuser" ]] || chown -R ftpuser /home/ftpuser
[[ $(stat -c %G /home/ftpuser) == "ftpgroup" ]] || chgrp -R ftpgroup /home/ftpuser

[[ -f /etc/pureftpd/pureftpd.passwd ]] && /usr/bin/pure-pw mkdb


# Set environment variables to create the default virtual users 

if [ "${DEFAULT_USR}" != "username" ]; then
    # Create user
    echo "Create new user : ${DEFAULT_USR} with Password ${DEFAULT_PWD}"
      expect -c "
        spawn pure-pw useradd ${DEFAULT_USR} -u ftpuser -d /home/ftpuser/${DEFAULT_USR}
        expect {
            Password { 
                send \"${DEFAULT_PWD}\r\"
                exp_continue
            }
            again { 
                send \"${DEFAULT_PWD}\r\"
                exp_continue 
            }
        }
    "

    # Update puredb
    echo "update puredb"
    pure-pw mkdb /etc/pureftpd/pureftpd.pdb
fi
exec "$@"