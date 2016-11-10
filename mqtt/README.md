# cFlat - mqtt broker 

## Developement

### Init
```
mkdir -p mqtt/{config,data,log}
chmod -R 777 mqtt
```

### Build
```
docker build -t cghome/cflat-mqtt mqtt
```

### Run - Production
```
docker run -it --rm -p 1883:1883 -p 9001:9001 --name cflat-mqtt cghome/cflat-mqtt

or:

docker-compose up -d mqtt
```

### Run - Development
```
docker run -it --rm -p 1883:1883 -p 9001:9001 -v ${HOME}/mqtt:/data --name cflat-mqtt-dev cghome/cflat-mqtt

or:

docker-compose -f docker-compose.dev.yml -f docker-compose.yml up -d mqtt-brocker
```