#!/bin/bash

BASEDIR=$(dirname $0)
cd $BASEDIR

image=cghome/cflat-docker-ui
container=docker-ui

action=$1; shift
args=$@

if [ -z "$action" ];
  then
    echo "usage: $0 <build|push|run|prod|stop|start|remove|restart|exec|bash|logs>";
    exit 1;
fi

##################################################
# Privat function                                #
##################################################

_isContainerRunning(){
  #containerRunning=$(docker inspect --format="{{ .State.Running }}" $container 2> /dev/null)
  if [ "$containerRunning" == "false" ]; then
    echo "ERROR - ${container} is not running."
    exit 2
  fi
}

##################################################
# Public function                                #
##################################################

_build() {
  docker build -t $image .
}

_push() {
  docker push $image:$args[0]
}

_run() {
  _prod
}

_prod() {
  docker run -d \
    --name $container \
    -p 9000:9000 \
    -v /var/run/docker.sock:/var/run/docker.sock \
    $image $args
}

_start() {
  docker start $container
}

_stop() {
  docker stop $container
}

_remove() {
  docker rm $container
}

_restart() {
  _stop
  _remove
  _run
}

_exec() {
  _isContainerRunning
  docker exec -ti $container $args
}

_bash() {
  _isContainerRunning
  docker exec -ti $container bash $args
}

_logs() {
  _isContainerRunning
  docker logs $container -t $args
}

eval _$action