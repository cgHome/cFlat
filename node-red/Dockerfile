FROM cghome/rpi-alpine-node:latest

MAINTAINER Chris Gross <cgHome@gmx.net>

##################################################
# Install packages                               #
##################################################

USER root

RUN apk --no-cache add --virtual .build-deps \
        make \
        gcc \
        g++ \
        python \
        linux-headers 

##################################################
# Install Service                                #
##################################################

# Home directory for Node-RED application source code.
RUN mkdir -p /usr/src/node-red && chown -R app:app /usr/src/node-red \
    && mkdir -p /data && chown -R app:app /data

WORKDIR /usr/src/node-red

USER app
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

USER app

# User configuration directory volume
EXPOSE 1880

# Environment variable holding file path for flows configuration
ENV FLOWS=flows.json

CMD ["npm", "start", "--", "--userDir", "/data"]