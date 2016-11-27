#!/bin/bash
set -e
cd $(dirname $0)

ACTION=$1; shift; 
ARGS=$@

if [ -z "$action" ]; then
    echo "usage: $0 <init|prod|dev|debug|down|logs>";
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

_prod() {
  docker-compose -f dcp.prod.yml up -d $args
}

_dev() {
  docker-compose -f dcp.dev.yml -f dcp.prod.yml up -d $args
}

_debug() {
  docker-compose -f dcp.dbg.yml -f dcp.dev.yml -f dcp.prod.yml up -d $args
}

_down() {
  docker-compose down $args
}

_logs() {
  docker-compose logs -t $args
}

eval _$action