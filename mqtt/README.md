# cFlat - mqtt

Mosquitto is an message broker service that uses the MQTT protocol to send and receive messages, typically with IOT (Internet of Things) devices.

## Documentation

- [Docu](https://mosquitto.org/)
- [Docker - image](https://hub.docker.com/r/broodzak/rpi-mosquitto/)

## CLI interface

### Build

```sh
# Init
rm -rf mqtt && mkdir -p mqtt
# or:
./cflat.sh init

#Build
docker build -t cghome/cflat-mqtt mqtt
# or:
./cflat.sh build mqtt
```

### Usage

```sh
# Init
rm -rf mkidir && mkdir -p mqtt/{config,data,log} && chmod -R 777 mqtt
# or:
./cflat.sh init

# Run
docker run -it --rm --name mqtt -p 1883:1883 -p 9001:9001 cghome/cflat-mqtt
# or:
./cflat.sh prod|dev|debug mqtt
```