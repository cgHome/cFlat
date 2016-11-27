FROM cghome/rpi-alpine-node:latest

MAINTAINER Chris Gross <cgHome@gmx.net>

##################################################
# Install packages                               #
##################################################

USER root

RUN apk --no-cache add \
        dbus \
        avahi-dev \
    	make \
        python \ 
    	g++

RUN mkdir -p /var/run/dbus

##################################################
# Install service configuration                  #
##################################################

ENV CFG=/usr/src/homebridge
ENV BIN=$HOME/node_modules/homebridge/bin

RUN mkdir -p $CFG

WORKDIR $CFG

COPY entrypoint.sh homebridge.sh $CFG/
COPY config $CFG/
RUN chown -R app:app $CFG

RUN npm install -g pm2

##################################################
# Start service                                  #
##################################################
USER app
WORKDIR $HOME

ENV NODE_ENV=production

EXPOSE 51826 8080 
EXPOSE 5858

ENTRYPOINT ["/usr/src/homebridge/entrypoint.sh"]
CMD ["npm run prod"]