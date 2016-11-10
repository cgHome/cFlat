FROM cghome/rpi-alpine-node:latest

MAINTAINER Chris Gross <cgHome@gmx.net>

##################################################
# Install packages                               #
##################################################

USER root

RUN apk add --no-cache \
        dbus \
        avahi-dev \
	make \
        python \ 
    	g++

RUN mkdir -p /var/run/dbus

##################################################
# Install Service                                #
##################################################

WORKDIR /home/app
# RUN chown -R docker /home

# USER docker

COPY run.sh /home
COPY default /home/.default

##################################################
# Start                                          #
##################################################

EXPOSE 8765 51826
VOLUME ["/home/app"]

ENTRYPOINT ["../run.sh"]
# CMD ["npm run prod"]