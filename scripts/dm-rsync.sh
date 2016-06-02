#!/bin/bash

export DOCKER_MACHINE_IP=`docker-machine ip dev`
export PACHYDERM_SRC="$GOPATH/src/github.com/pachyderm/pachyderm"
export DOCKER_MACHINE_HOME="/home/docker-user"
export REMOTE_PACHYDERM_SRC_DIR="$DOCKER_MACHINE_HOME/go/src/github.com/pachyderm"


function identity() {

	if [ $(uname -a | cut -f 1 -d " ") == "Darwin" ]; then
        echo "client"
    else
        echo "docker-machine"
	fi
}

function sync_docker_machine() {
	SSH_COMMAND="ssh -F /dev/null -o BatchMode=yes -o PasswordAuthentication=no -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o LogLevel=quiet -o ConnectionAttempts=3 -o ConnectTimeout=10 -o ControlMaster=no -o ControlPath=none -o IdentitiesOnly=yes -i $HOME/.docker/machine/machines/dev/id_rsa -p 22" 
	RSYNC_FLAGS=-avzh

	sudo rsync $RSYNC_FLAGS -e "$SSH_COMMAND" $1 docker-user@$DOCKER_MACHINE_IP:$2
}

function dev_sync_docker_from_client() {
    if [ "$(identity)" == "client" ]
    then
        dev_sync_docker
    else
        echo "Can only sync from mac client -> docker machine"
    fi
}

function dev_sync_docker() {
	sync_docker_machine $PACHYDERM_SRC $REMOTE_PACHYDERM_SRC_DIR
}

dev_sync_docker_from_client

