#!/bin/bash

BASEDIR=$(dirname $0)
cd $BASEDIR

IMAGE_NAME=cghome/cflat-docker-ui
CONTAINER_NAME=docker-ui

ACTION=$1
shift; ARGS=$@

if [ -z "$ACTION" ];
  then
    echo "usage: $0 <build|run|stop|start|remove|rerun|attach|push|logs>";
    exit 1;
fi

_build() {
  docker build -t $IMAGE_NAME .
}

_run() {
  docker run -d \
    -p 9000:9000 \
    -v /var/run/docker.sock:/var/run/docker.sock \
    --name $CONTAINER_NAME \
    $IMAGE_NAME $ARGS
}

_stop() {
  # Stop
  docker stop $CONTAINER_NAME
}

_start() {
  # Start (after stopping)
  docker start $CONTAINER_NAME
}

_remove() {
  # Remove
  docker rm $CONTAINER_NAME
}

_rerun() {
  _stop
  _remove
  _run
}

_attach() {
  docker exec -ti $CONTAINER_NAME bash
}

_logs() {
  docker logs $CONTAINER_NAME
}

_push() {
  docker push $IMAGE_NAME:$ARGS[0]
}

eval _$ACTION