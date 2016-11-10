#!/bin/bash

if [ ! -f "config.json" ]; then
    echo "config.json not found. Copy default file."
    cp -p ../.default/config.json .
fi
if [ ! -f "package.json" ]; then
    echo "package.json not found. Copy default file."
    cp -p ../.default/package.json .
fi

echo "Install homebridge ....."
npm install
echo "Done !!!"

sed -i "s/rlimit-nproc=3/#rlimit-nproc=3/" /etc/avahi/avahi-daemon.conf
dbus-daemon --system
avahi-daemon -D

eval $1