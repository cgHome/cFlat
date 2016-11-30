FROM hypriot/rpi-alpine-scratch:v3.4

MAINTAINER Chris Gross <cgHome@gmx.net>

RUN apk add --no-cache \
            bash \ 
            ca-certificates 

ADD https://github.com/containous/traefik/releases/download/v1.1.1/traefik_linux-arm /traefik
RUN chmod +x /traefik

#RUN ln -sf /dev/stdout /var/log/traefik.log &&\
#    ln -sf /dev/stderr /var/log/access.log

EXPOSE 80 443 8080

ENTRYPOINT ["/traefik"]