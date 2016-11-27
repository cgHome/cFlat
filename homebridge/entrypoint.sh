#!/bin/bash

# Set default environment
if [ -z "$NODE_ENV" ]; then
    export NODE_ENV=production
fi

echo "Config homebridge"
if [ ! -f "$HOME/package.json" ]; then
    echo "--> package.json not found (Copy default file)."
    rm -rf node_modules
    cp -pv $CFG/package.json $HOME
fi
if [ ! -f "$HOME/homebridge.sh" ]; then
    cp -pv $CFG/homebridge.sh $HOME
fi
if [ ! -f "$HOME/data/config.json" ]; then
    echo "--> config.json not found (Copy default file)."
    rm -rf data
    mkdir -p $HOME/data
    cp -pv $CFG/config.json $HOME/data
fi

echo "Install homebridge ....."
npm install

echo "Start avahi (bonjour)"
su-exec root sed -i "s/rlimit-nproc=3/#rlimit-nproc=3/" /etc/avahi/avahi-daemon.conf 
su-exec root dbus-daemon --system
su-exec root avahi-daemon -D

echo "=========================================="
echo "Start homebridge in >> ${NODE_ENV} << mode"
echo "- Command:     $@"
echo "- Config-Path: $CFG"
echo "- Home:        $HOME"
echo "=========================================="
echo ""

eval $@
