#!/bin/bash

BASEDIR=$(dirname $0)
cd $BASEDIR

VERSION=$(<VERSION)
IMAGE_NAME=homebridge-v$VERSION

ACTION=$1

if [ -z "$ACTION" ];
  then
    echo "usage: $0 <build|run|stop|start|remove|rerun|attach|push|logs>";
    exit 1;
fi

_build() {
  # Build
  docker build --tag="cghome/cflat-homebridge:$VERSION" .
}

_run() {
  # Run (first time)
  docker run -d --net=host -p 51826:51826 -v /etc/homebridge:/root/.homebridge --name $IMAGE_NAME cghome/cflat-homebridge:$VERSION
}

_stop() {
  # Stop
  docker stop $IMAGE_NAME
}

_start() {
  # Start (after stopping)
  docker start $IMAGE_NAME
}

_remove() {
  # Remove
  docker rm $IMAGE_NAME
}

_rerun() {
  _stop
  _remove
  _run
}

_attach() {
  docker exec -ti $IMAGE_NAME bash
}

_logs() {
  docker logs $IMAGE_NAME
}

_push() {
  docker push cghome/cflat-homebridge:$VERSION
}

_debug() {
  # Run (first time)
  echo "please go to /root and start run.sh"
  docker run -ti --entrypoint /bin/bash --net=host -p 51826:51826 -v /etc/homebridge:/root/.homebridge --name $IMAGE_NAME cghome/cflat-homebridge:$VERSION 
}

eval _$ACTION