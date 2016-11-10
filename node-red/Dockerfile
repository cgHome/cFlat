FROM cghome/rpi-alpine-node:latest

MAINTAINER Chris Gross <cgHome@gmx.net>

##################################################
# Install packages                               #
##################################################

RUN apk add --no-cache --virtual .build-deps \
        make \
        gcc \
        g++ \
        python \
        linux-headers 

##################################################
# Install Service                                #
##################################################

# Home directory for Node-RED application source code.
RUN mkdir -p /usr/src/node-red

WORKDIR /usr/src/node-red

# Add node-red user so we aren't running as root.
RUN adduser -h /usr/src/node-red -H -D node-red \
    && chown -R node-red:node-red /usr/src/node-red \
    && mkdir -p /data && chown -R node-red:node-red /data

# package.json contains Node-RED NPM module and node dependencies
USER node-red
COPY package.json /usr/src/node-red/
RUN npm install

##################################################
# Remove unused packages                         #
##################################################

USER root
RUN apk del .build-deps

##################################################
# Start                                          #
##################################################

USER node-red

# User configuration directory volume
EXPOSE 1880

# Environment variable holding file path for flows configuration
ENV FLOWS=flows.json

CMD ["npm", "start", "--", "--userDir", "/data"]