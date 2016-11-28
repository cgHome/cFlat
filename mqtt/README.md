# cFlat - mqtt

Mosquitto is an message broker service that uses the MQTT protocol to send and receive messages, typically with IOT (Internet of Things) devices.

## Documentation

- [Docu](https://mosquitto.org/)
- [Docker - image](https://hub.docker.com/r/broodzak/rpi-mosquitto/)

## Build

```sh
./cflat.sh build mqtt
# or:
docker build -t cghome/cflat-mqtt mqtt
```

## Usage

```sh
# Init
./cflat.sh init
# or:
rm -rf mkidir && mkdir -p mqtt/{config,data,log}
chmod -R 777 mqtt

# Run
./cflat.sh [prod|dev|debug] mqtt
# or:
docker run -it --rm -p 1883:1883 -p 9001:9001 --name mqtt cghome/cflat-mqtt
```