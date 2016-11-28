# cFlat - Smart Home Gateway

cFlat is an integration platform on RPI for easy integration of various devices into the Apple Home Kit universe.

Note: **cFlat 0.0.x alpha is a preliminary release intended primarily for developers and advanced users only**


[GERMAN]:

(Anmerkung: Dieses Dokument ist eine Rohfassung,  aber um fünf Uhr Morgens kann man von mir keine grossen journalistische Ergüsse erwarten, Sorry)

cFlat ist eine Integrationsplattform zur vereinfachten Einbindung verschiedener Smart Home Geräte ins Apple Homekit Universum.
Die Plattform basiert auf  HypriotOS, diese Distribution wurde für den Einsatz von Docker optimiert. Das OS selbst, setzt auf einer Debian-basierten Distribution (Raspbian Lite) auf und ist somit auf allen Raspberry Pi. Modellen  (ARMv6 & ARMv7) und deren Artverwandten lauffähig.  

Um die Grösse der einzelnen Images so gering wie möglich zu halten, basieren diese, wenn möglich, auf Alpine Linux, deren Basisgrösse bei 5 MB liegt.

Es sind folgende Service/Komponenten implementiert:

- homebridge
- node-red
- mqtt (Brocker)
- docker-ui
- proxy
- watchtower (noch nicht implementiert)

## Environment

Es ist sind zwei Umgebungen implementiert, wobei diese in verschiedenen „Modi“ (prod/dev/debug) gestartet werden. Diese sind wenn nötig, als npm-scripts in den jeweiligen Services definiert (siehe cflat-homebridge).

1. Produktion

   - **prod-mode:**  → docker-compose.prod.yml → „npm run prod“

2. Development

   - **dev-mode:**   → docker-compose.dev.yml → „npm run dev“
   - **debug-mode:** → docker-compose.debug.yml → „npm run debug“

Die Compose Files sind so aufgebaut, dass sie die Definitionen voneinander „erben“ und somit nur die jeweilige Spezialisierung (es lebe der OO Gedanke) definiert werden muss.

**Hierarchie:**   Produktion (root) → Development → Debug

## Commando

Zur einfacheren handhabe des Systems, wird ein einfaches Script (cflat.sh) bereitgestellt, über das die Platform gesteuert werden kann.

```sh
# Init platform
./cflat.sh init
# Build platform
./cflat.sh build [args]
# Run platform in prod-mode
./cflat.sh prod [args]
# Run platform in dev-mode
./cflat.sh dev [args]
# Run platform in debug-mode
./cflat.sh debug [args]
# Shutdown platform
./cflat.sh down [args]
# View logfiles
./cflat.sh logs [args]
```

## Getting Started

1. Install hypriotOS on RPI [Documentation](http://blog.hypriot.com/post/releasing-HypriotOS-1-0/)

```sh
flash https://github.com/hypriot/image-builder-rpi/releases/download/[ver]/hypriotos-rpi-[ver].img.zip
# eg:
flash https://github.com/hypriot/image-builder-rpi/releases/download/v1.1.0/hypriotos-rpi-v1.1.0.img.zip
```

2. Login:

```sh
# (default-password 'hypriot')
ssh pirate@cFlat.local
# change default-password (important for security reason)
passwd
```

3. Clone github

```sh
git clone https://github.com/cgHome/cflat.git
```

4. Build cflat

```sh
# Init platform
./cflat.sh init
# Build platform
./cflat.sh build
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

### Setup samba-share

> For terminal hater

```sh
# Set samaba user & password
sudo smbpasswd -a pirate

# Save samba.conf
sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.bak

# Add to samba.conf
security = user

[pirate]
path = /home/pirate/
writeable = yes
guest ok = no

# Test samba.conf
testparm

# Restart samba to use the new configuration file.
sudo /etc/init.d/samba restart
```

## Used open source components

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

## Copyright and license

Copyright 2016, 2016 cgHome under [MIT License](LICENSE)