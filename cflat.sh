#!/bin/bash
set -e
cd $(dirname $0)

action=$1; shift; 
args=$@

if [ -z "$action" ]; then
    echo "usage: $0 <init|build|prod|dev|debug|down|logs>";
    exit 1;
fi

##################################################
# Privat function                                #
##################################################

##################################################
# Public function                                #
##################################################

_init() {
  # (Temp) init
  mkdir -p homebridge
  mkdir -p node-red
  mkdir -p mqtt/{config,data,log}
  chmod -R 777 mqtt
}

_build() {
  docker-compose -f docker-compose.prod.yml build $args
}

_prod() {
  docker-compose -f docker-compose.prod.yml up -d $args
}

_dev() {
  docker-compose -f docker-compose.dev.yml -f docker-compose.prod.yml up -d $args
}

_debug() {
  docker-compose -f docker-compose.dbg.yml -f docker-compose.dev.yml -f docker-compose.prod.yml up -d $args
}

_down() {
  docker-compose down $args
}

_logs() {
  docker-compose logs -t $args
}

eval _$action