#!/bin/bash

CONTAINER_NAME=$1
HOST_PORT=$2
CONTAINER_IP=$3

mkdir -p $(pwd)/../orbeonforms-containers-shared-dir/$CONTAINER_NAME #dir for each liferay containers shared folders
SHARED_FOLDER=$(pwd)/../orbeonforms-containers-shared-dir/$CONTAINER_NAME

mkdir -p $(pwd)/../orbeonforms-exist-data
EXIST_DATA=$(pwd)/../orbeonforms-exist-data


if [ "x$CONTAINER_NAME" = "x" ]; then
    {
        CONTAINER_NAME=fzl_orbeonforms
        HOST_PORT=8070
        CONTAINER_IP=192.168.33.170
    }
fi


echo "Running... orbeonforms/docker-run.sh <$CONTAINER_NAME> at host port <$HOST_PORT> and ip <$CONTAINER_IP>."
IMG_NAME=wagnermarques/fzl_orbeonforms:0.0.1


docker run \
       --name "$CONTAINER_NAME" -h "$CONTAINER_HOST_NAME" \
       --net fzl_network_bridge --ip "$CONTAINER_IP" \
       -v "$SHARED_FOLDER":/orbeonforms-containers-shared-dir/$CONTAINER_NAME \
       -v "$EXIST_DATA":/exist_data \
       -p "$HOST_PORT":8080 \
       -d "$IMG_NAME"
       

echo Container name: $CONTAINER_NAME
echo Container ip: $CONTAINER_IP
echo Container host ports:  $HOST_PORT
echo SHARED_FOLDER: $SHARED_FOLDER
echo http://localhost:$HOST_PORT


