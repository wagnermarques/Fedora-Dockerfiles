#!/bin/bash
CONTAINER_NAME=$1
COMMAND_TO_RUN=$2
docker exec -it $CONTAINER_NAME $COMMAND_TO_RUN
