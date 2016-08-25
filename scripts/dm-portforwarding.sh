#!/bin/bash

# Eg. 8080 for kubectl
# or  30650 for pachctl

PORT=$1

if [ -z $PORT ]
then
    PORT=8080
fi

ps -ef | grep "docker/machine" | grep -v grep | cut -f 4 -d " " | while read -r pid
do
       kill $pid
done

docker-machine ssh dev -fTNL $PORT:localhost:$PORT

