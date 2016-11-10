# cFlat - homebridge

## Developement

### Build
```
docker build -t cghome/cflat-homebridge homebridge
```

### Run - Production
```
docker run -it --rm --net host -p 51826:51826 -p 8080:8765 -v ${HOME}/homebridge:/home --name cflat-homebridge cghome/cflat-homebridge

or:

docker-compose up -d
```

### Run - Development
```
docker run -it --rm --net host -p 5353:5353 -p 51826:51826 -p 8080:8765 -v ${HOME}/homebridge:/home --name cflat-homebridge-dev cghome/cflat-homebridge

or:

docker-compose ....
```