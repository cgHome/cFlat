# cFlat - Smart Home Gateway

cFlat is an integration platform on RPI for easy integration of various devices into the Apple Home Kit universe.

[GERMAN]:

cFlat ist eine Integrationsplattform zur vereinfachten Einbindung verschiedener Geräte ins Apple Homekit Universum.

Die Plattform basiert auf HypriotOS und ist somit auf allen Raspberry PI lauf­fä­hig, wobei gemäss Dokumentation, diese auch mit Docker for Mac/Win funktionieren sollten (nicht getestet). Die einzelnen Docker-Images basieren auf Alpine Linux, deren Basisgrösse bei nur 5MB liegt.

...

## Concept

(ToDo)

## Quick start

(ToDo)

## Softwarestack

- [homebridge - HomeKit support for the impatient](https://github.com/nfarina/homebridge/)
- [Node-RED - A visual tool for wiring the Internet of Things](http://nodered.org/)
- [portainer - Simple management UI for Docker](http://portainer.io/)
- [mosquitto - MQTT - Broker](https://mosquitto.org/)
- [traefik - HTTP reverse proxy](https://traefik.io/)
- [hypriotOS - DockerOS for Raspberry Pi](https://github.com/hypriot/image-builder-rpi/releases/tag/v1.0.0)

## ToDo

- Dokumentation
- Run/Build - Docker-Scripts
- Base-Configuration
- SSL/TSL - Support

## Getting Started

1. Install hypriotOS on RPI [Documentation](http://blog.hypriot.com/post/releasing-HypriotOS-1-0/)

```sh
flash https://github.com/hypriot/image-builder-rpi/releases/download/[ver]/hypriotos-rpi-[ver].img.zip
eg:
flash https://github.com/hypriot/image-builder-rpi/releases/download/v1.1.0/hypriotos-rpi-v1.1.0.img.zip
```

2. Login:

```sh
# (default-password 'hypriot')
ssh pirate@cFlat.local
```

3. Clone github

```sh
```

4. cflat - commands

```sh
./cflat.sh <init|up|up-dev|down|logs>
```

## Install Development-System

### Install samba-client on RPI/hypriotOS

```sh
sudo apt-get update
sudo apt-get install smbclient cifs-utils
```

### Mount RPI to Dev-Server

```sh
sudo mount.cifs //[ip]/[repo] /mnt/smb/ -o user=[username],password=[password],rw,file_mode=0777,dir_mode=0777
e.g.: 
sudo mount.cifs //192.168.188.20/repo /mnt/smb/ -o user=Chris,rw,file_mode=0777,dir_mode=0777
```

## Note 

**cFlat 0.0.1 alpha is a preliminary release intended primarily for developers and advanced users only**

## Copyright and license

Copyright 2016, 2016 cgHome under [MIT License](LICENSE)