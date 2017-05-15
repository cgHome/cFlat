#!/bin/bash
set -e
cd $(dirname $0)

image=cghome/cflat-homebridge
container=homebridge

usage="usage: $0 <build|push|prod|dev|stop|start|remove|shutdown|restart|exec|bash|logs|installPlugins|uninstallPlugins>";

if [ "$#" == "0" ]; then
    echo "$usage"
    exit 1;
fi

action=$1; shift
args=$@

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
# Public function (CLI)                          #
##################################################

_build() {
  if [ ! -f "./Dockerfile" ]; then
    exit 1
  fi;
  docker build -t $image .
}

_push() {
  docker push $image:$args[0]
}

_prod() {
  docker run -it -d --net host \
    --name $container \
    -p 51826:51826 -p 8080:8080 \
    -v ${HOME}/homebridge:/home \
    $image $args
}

_dev() {
  # Set default command
  if [ -z "$args" ]; then
    args[0]="npm run dev"
  fi  

  docker run -it --rm --net host \
      --name $container \
      -e "NODE_ENV=development" \
      -p 51826:51826 -p 8080:8080 -p 5858:5858 \
      -v ${HOME}/homebridge:/home \
      $image $args
}

_start() {
  docker start $container
}

_stop() {
  docker stop $container
}

_remove() {
  docker rm $container $args
}

_shutdown() {
  _stop
  _remove
}

_restart() {
  _shutdown
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

_installPlugin() {
  _isContainerRunning
  docker exec -it $container npm install -S $args
}

_uninstallPlugin() {
  _isContainerRunning
  docker exec -it $container npm uninstall -S $args
}

_editConfig() {
  # read -r -p "Edit config.json file ? [y/N] " response
  # response=${response,,} 
  #if [[ $response =~ ^(yes|y)$ ]]; then 
      nano ./data/config.json
  #fi
}

eval _$action
