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
# Install Service                                #
##################################################

# Install homebridge-app
ENV APP=/usr/src/homebridge
RUN mkdir -p $APP 

WORKDIR $APP

COPY package.json entrypoint.sh $APP/
COPY config $APP/.config/
RUN chown -R app:app $APP

USER app
RUN npm install

WORKDIR $HOME

##################################################
# Start                                          #
##################################################

ENV NODE_ENV=production

EXPOSE 5858
EXPOSE 51826 8080 

#ENTRYPOINT ["${APP}/entrypoint.sh"]
CMD ["npm run prod"]