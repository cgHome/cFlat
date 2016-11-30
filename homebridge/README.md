# cFlat - homebridge

HomeKit support for the impatient

## Documentation

- [Docu](https://github.com/nfarina/homebridge)
- [Docker - image](https://github.com/cgHome/cflat/blob/master/homebridge/Dockerfile)

## CLI interface

```sh
homebridge/homebridge.sh COMMAND [ARG...]
```

### Build

```sh
homebridge/homebridge.sh build
# or:
./cflat.sh build homebridge
```

### Usage

```sh
# Init
rm -rf- ~/homebridge && mkdir -p ~/homebridge
# or:
./cflat.sh init

# Run
homebridge/homebridge.sh prod|dev|debug [ARG...]
# or:
./cflat.sh prod|dev|debug homebridge
```