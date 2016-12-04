#!/bin/bash
set -e
cd $(dirname $0)

usage="usage: $0 <init|build|prod|dev|debug|shutdown|logs>";

if [ "$#" == "0" ]; then
    echo "$usage"
    exit 1;
fi

action=$1; shift
args=$@

##################################################
# Privat function                                #
##################################################

##################################################
# Public function (CLI)                          #
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
  docker-compose -f docker-compose.prod.yml -f docker-compose.dev.yml up -d $args
}

_debug() {
  docker-compose -f docker-compose.prod.yml -f docker-compose.dev.yml -f docker-compose.debug.yml up -d $args
}

_shutdown() {
  docker-compose -f docker-compose.prod.yml -f docker-compose.dev.yml -f docker-compose.debug.yml down $args
}

_logs() {
  docker-compose -f docker-compose.prod.yml -f docker-compose.dev.yml -f docker-compose.debug.yml logs $args
}

_config() {
  docker-compose -f docker-compose.prod.yml -f docker-compose.dev.yml -f docker-compose.debug.yml config $args
}

eval _$action