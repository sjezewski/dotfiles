#!/bin/bash

# Eg. 8080 for kubectl
# or  30650 for pachctl

PORT=$1
FLAGS=$2

if [ -z $PORT ]
then
    PORT=8080
fi

if [ -z $FLAGS ]
then
    FLAGS="-fTNL"
fi

ps -ef | grep "docker/machine" | grep ":$PORT" | grep -v grep | cut -f 4 -d " " | while read -r pid
do
       kill $pid
done

docker-machine ssh dev $FLAGS $PORT:localhost:$PORT
