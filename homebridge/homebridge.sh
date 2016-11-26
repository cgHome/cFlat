#!/bin/bash

BASEDIR=$(dirname $0)
cd $BASEDIR

IMAGE_NAME=cghome/cflat-homebridge
CONTAINER_NAME=homebridge

ACTION=$1; shift
ARGS=$@

if [ -z "$ACTION" ]; then
    echo "usage: $0 <build|prod|dev|stop|start|remove|rerun|attach|push|logs>";
    exit 1;
fi

_build() {
  docker build -t $IMAGE_NAME .
}

_prod() {
  docker run -it --rm --net host \
    --name $CONTAINER_NAME \
    -p 51826:51826 -p 8080:8080 \
    -v ${HOME}/homebridge:/home \
    $IMAGE_NAME "${ARGS[0]}"
}

_dev() {
  # Set default commands
  if [ -z "$ARGS" ]; then
    ARGS[0]="npm run dev"
  fi  

  docker run -it --rm --net host \
      --name $CONTAINER_NAME \
      -e "NODE_ENV=development" \
      -p 51826:51826 -p 8080:8080 -p 5858:5858 \
      -v ${HOME}/homebridge:/home \
      $IMAGE_NAME "${ARGS[0]}"
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
