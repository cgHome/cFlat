#!/bin/bash

# Set default environment
if [ -z "$NODE_ENV" ]; then
    export NODE_ENV=production
fi

mkdir -p $HOME/plugins $HOME/data

if [ ! -f "$HOME/package.json" ]; then
    echo "package.json not found. Copy default file."
    rm -rf plugins/*
    cp -p $APP/.config/.npmrc $HOME
    cp -p $APP/.config/package.json $HOME
fi
if [ ! -f "$HOME/data/config.json" ]; then
    echo "config.json not found. Copy default file."
    cp -p $APP/.config/config.json $HOME/data
fi

# Install plugins
# npm install

# Start bonjour
su-exec root sed -i "s/rlimit-nproc=3/#rlimit-nproc=3/" /etc/avahi/avahi-daemon.conf 
su-exec root dbus-daemon --system
su-exec root avahi-daemon -D

echo ""
echo "============================================"
echo "  Start homebridge in ${NODE_ENV} mode"
echo ""
echo "  - Command: $1"
echo "============================================"
echo ""

eval $1
