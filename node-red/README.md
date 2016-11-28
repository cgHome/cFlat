# cFlat - node-red

A visual tool for wiring the Internet of Things, based on Alpine Linux

### Documentation

- [Docu](http://nodered.org/)
- [Docker - image](https://github.com/cgHome/cflat/blob/master/node-red/Dockerfile)

### Build

```sh
./cflat.sh build node-red
# or:
docker build -t cghome/cflat-node-red node-red
```

### Usage

```sh
# Init
./cflat.sh init
# or:
mkdir -p node-red

# Run
./cflat.sh [prod|dev|debug] mqtt
# or:
docker run -it --rm -p 1880:1880 -v ${HOME}/node-red:/data --name node-red cghome/cflat-node-red
```