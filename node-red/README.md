# cFlat - node-red

A visual tool for wiring the Internet of Things, based on Alpine Linux

## Documentation

- [Docu](http://nodered.org/)
- [Docker - image](https://github.com/cgHome/cflat/blob/master/node-red/Dockerfile)

## CLI interface

### Build

```sh
docker build -t cghome/cflat-node-red node-red
# or:
./cflat.sh build node-red
```

### Usage

```sh
# Init
rm -rf node-red && mkdir -p node-red
# or:
./cflat.sh init

# Run
docker run -it --rm --name node-red -p 1880:1880 -v ${HOME}/node-red:/data cghome/cflat-node-red
# or:
./cflat.sh [prod|dev|debug] node-red
```