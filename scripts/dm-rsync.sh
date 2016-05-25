#!/bin/bash

DOCKER_MACHINE_IP=`docker-machine ip dev`
PACHYDERM_SRC="$GOPATH/src/github.com/pachyderm/pachyderm"
REMOTE_PACHYDERM_SRC="/home/docker-user/go/src/github.com/pachyderm/pachyderm"
SSH_COMMAND="ssh -F /dev/null -o BatchMode=yes -o PasswordAuthentication=no -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o LogLevel=quiet -o ConnectionAttempts=3 -o ConnectTimeout=10 -o ControlMaster=no -o ControlPath=none -o IdentitiesOnly=yes -i $HOME/.docker/machine/machines/dev/id_rsa -p 22" 
RSYNC_FLAGS=-avzh
# I was adding this ... but only for paths that needed sudo ... --rsync-path='sudo rsync'

sudo rsync $RSYNC_FLAGS -e "$SSH_COMMAND" ~/tmp/bar docker-user@$DOCKER_MACHINE_IP:/home/docker-user/bar
