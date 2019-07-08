ARG NODE_VERSION=arm32v7

FROM echteler/node:${NODE_VERSION}

LABEL maintainer "Philipp Echteler"
LABEL Version "1.0"
LABEL TAG "NodeRed with git"
LABEL Architecture "ARM32V7"

#Install git to use NodeRed Projects feature
RUN apk add --no-cache openssl
RUN apk add --no-cache git
RUN apk add --no-cache samba
# RUN apk add --no-cache python

# Home directory for Node-RED application source code.
RUN mkdir -p /usr/src/node-red

# User data directory, contains flows, config and nodes.
RUN mkdir /data
RUN mkdir /data/lib
RUN mkdir /data/lib/flows
RUN mkdir /data/lib/themes

# Make Assets directory
RUN mkdir /usr/src/app
RUN mkdir /usr/src/app/assets
RUN mkdir /usr/src/app/styling

#copy assets into directory

#copy settings.js file to /data directory
COPY config/settings.js /data

#copy flow file from local dir to host to /data
COPY flows/flows.json /data

#copy flows to library
COPY lib/flows /data/lib/flows/
COPY lib/themes /data/lib/themes/

#copy theme Styling to Theme Library
COPY lib/themes /data/lib/themes/

#change the Workdir. 
WORKDIR /usr/src/node-red

# Add node-red user so we aren't running as root.
RUN adduser -h /usr/src/node-red -D -H node-red \
    && chown -R node-red:node-red /data \
    && chown -R node-red:node-red /usr/src/node-red \
    && chown -R node-red:node-red /usr/src/app/assets
    
USER node-red

# package.json contains Node-RED NPM module and node dependencies
COPY package.json /usr/src/node-red/
RUN npm install --verbose

# User configuration directory volume
VOLUME /data

#ports to use with docker
EXPOSE 1880

# Environment variable holding file path for flows configuration
ENV FLOWS=flows.json
ENV NODE_PATH=/usr/src/node-red/node_modules:/data/node_modules

CMD ["npm", "start", "--", "--userDir", "/data"]