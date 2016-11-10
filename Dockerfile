FROM hypriot/rpi-alpine-scratch:edge

MAINTAINER Chris Gross <cgHome@gmx.net>

##################################################
# Install external tools                         #
##################################################

RUN apk update \
    && apk upgrade \
    && apk add \
        bash \
        bash-completion \ 
        nano \
        git \
        nodejs \
	    make \
        python \ 
    	g++ \
        dbus \
	    avahi-dev \
    && rm -rf /var/cache/apk/*

##################################################
# Start                                          #
##################################################

#USER root
RUN mkdir -p /var/run/dbus

COPY run.sh /home
COPY def /home/def

RUN mkdir /home/app
WORKDIR /home/app

EXPOSE 8765
EXPOSE 51826
VOLUME ["/home/app"]

ENTRYPOINT ["../run.sh"]
CMD ["npm run prod"]