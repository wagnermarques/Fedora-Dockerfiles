#!/bin/bash

CONTAINER_NAME=fzl_android;
IMG_NAME=wagnermarques/fzl_android-java-oracle-8-fed27-vnc:0.0.1;

#Change this to provide directory to cotainer create your projects
HOST_DIR_FOR_WORKSPACE="/home/wagner/wagnerdocri@gmail.com2/fzlbpms/fzlStudio/workspaces/fzl_android"

docker rm $CONTAINER_NAME

docker run \
       --name $CONTAINER_NAME -d -p 5901:5901 \
       -h fzl_android -v $HOST_DIR_FOR_WORKSPACE:/default_workspace \
       --net fzl_network_bridge --ip 192.168.33.159  $IMG_NAME

docker logs $CONTAINER_NAME

# sometimes the containers still not already up to be connected with vncviewer
# so, wait and issue this command below again at yout prompt
vncviewer 192.168.33.159:1
