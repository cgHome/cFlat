# cFlat - node-red

## Developement

### Build
```
docker build -t cghome/cflat-node-red node-red
```

### Run - Production
```
docker run -it --rm -p 1880:1880 -v ${HOME}/node-red:/data --name cflat-node-red cghome/cflat-node-red

or:

docker-compose ....
```

### Run - Development
```
docker run -it --rm -p 1880:1880 -v ${HOME}/node-red:/data --name cflat-node-red-dev cghome/cflat-node-red

or:

docker-compose ....
```