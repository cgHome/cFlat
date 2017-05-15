#!/bin/bash

# Set default environment
if [ -z "$NODE_ENV" ]; then
    export NODE_ENV=production
fi

echo "Config homebridge"
if [ ! -f "$HOME/homebridge.sh" ]; then
    cp -pv $CFG/homebridge.sh $HOME
    chmod +x $HOME/homebridge.sh
fi
if [ ! -f "$HOME/package.json" ]; then
    rm -rf node_modules
    cp -pv $CFG/package.json $HOME
fi
if [ ! -f "$HOME/pm2.config.js" ]; then
    cp -pv $CFG/pm2.config.js $HOME
fi
if [ ! -f "$HOME/data/config.json" ]; then
    rm -rf data
    mkdir -p $HOME/data
    cp -pv $CFG/config.json $HOME/data
fi

echo "Install homebridge ....."
npm install
echo "done ....."

echo "Start avahi (bonjour)"
su-exec root sed -i "s/rlimit-nproc=3/#rlimit-nproc=3/" /etc/avahi/avahi-daemon.conf
su-exec root sed -i "/^use-ipv6=/s/=.*/=no/" /etc/avahi/avahi-daemon.conf
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
