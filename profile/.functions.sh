function ssh_pod() {
    kubectl exec -ti $1 bash
}

function identity() {

	if [ $(uname -a | cut -f 1 -d " ") == "Darwin" ]; then
        echo "client"
    else
        echo "docker-machine"
	fi
}

function sync_docker_machine() {
	SSH_COMMAND="ssh -F /dev/null -o BatchMode=yes -o PasswordAuthentication=no -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o LogLevel=quiet -o ConnectionAttempts=3 -o ConnectTimeout=10 -o ControlMaster=no -o ControlPath=none -o IdentitiesOnly=yes -i $HOME/.docker/machine/machines/$DOCKER_MACHINE_NAME/id_rsa -p 22" 
	RSYNC_FLAGS=-avzh
    DOCKER_MACHINE_IP=`docker-machine ip $1`
	rsync $RSYNC_FLAGS -e "$SSH_COMMAND" $2 docker-user@$DOCKER_MACHINE_IP:$3
}

function dev_sync_docker_from_client() {
    if [ "$(identity)" == "client" ]
    then
        dev_sync_docker $1
    else
        echo "Can only sync from mac client -> docker machine"
    fi
}

function dev_sync_docker() {
    PACHYDERM_SRC="$GOPATH/src/github.com/pachyderm/pachyderm"
    REMOTE_PACHYDERM_SRC_DIR="$DOCKER_MACHINE_HOME/go/src/github.com/pachyderm"
	sync_docker_machine $1 $PACHYDERM_SRC $REMOTE_PACHYDERM_SRC_DIR
}

function start_my_day() {
	portforwarding
	dev_sync_docker	
}

function last_attack() {
    name=`cat $HOME/pachyderm/notes/attacks/.last`
    cat $HOME/pachyderm/notes/attacks/$name
}

function attack_complete() {
    name=''
    if [ -z "$1" ]; then
        name="attack-"
    else
        name="$1-"
    fi
    name+=`date +"%m_%d_%Y"`

    echo $name > ~/pachyderm/notes/attacks/.last
    echo "name: $name"
    cp ~/pachyderm/notes/attack ~/pachyderm/notes/attacks/$name

    rm ~/pachyderm/notes/attack
    touch ~/pachyderm/notes/attack
}

function pid() {
    omit=$2
    if [ -x $omit ]; then
        omit=""
    fi
    ps -ef | grep $1 | grep -v grep | grep -v omit | cut -f 4 -d " " 
}

function assasinate() {
    pid $1 | while read -r pid
    do
        kill -9 pid
    done
}

function cc() {
    echo "!!" | pbcopy
}

alias sandboxportforwarding="sudo docker-machine ssh dev -fTNL 650:localhost:30650"

function duration() {
    export STARTTIME=$(date +%s)
    $@
    export ENDTIME=$(date +%s)
    # Time in seconds:
    echo $(( $ENDTIME - $STARTTIME ))
}

function rethink-ui() {
    # The local admin port is set in the kube manifest around:
    # "spec": {
    #    "ports": [
    #      {
    #        "name": "admin-port",
    #        "port": 8080,
    #        "targetPort": 0,
    #        "nodePort": 32080
    #      },
    docker-machine ssh $DOCKER_MACHINE_NAME -fTNL 9989:localhost:32080
    open http://localhost:9989
}


function grep-code() {
    grep -R "$1" ./src/* | grep -v "vendor" | grep -v "~" | grep -v "#"
}

alias s="grep-code"

function clean_desktop() {
    mkdir -p $HOME/vdesktop/screenshots
    mv $HOME/Desktop/'Screen Shot'* $HOME/vdesktop/screenshots/
}

function plog() {
    kubectl get all | grep "po/pachd" | grep -v "pachd-init" | cut -f 1 -d " " | xargs kubectl logs $1 --previous
    echo "!!!!!!!!!!! RESTART BOUNDARY !!!!!!!!!!!"
    kubectl get all | grep "po/pachd" | grep -v "pachd-init" | cut -f 1 -d " " | xargs kubectl logs $1
}

function plog-init() {
    kubectl get all | grep "pachd-init" | cut -f 1 -d " " | xargs kubectl logs $1 --previous
    echo "!!!!!!!!!!! RESTART BOUNDARY !!!!!!!!!!!"
    kubectl get all | grep "pachd-init" | cut -f 1 -d " " | xargs kubectl logs $1
}

function ppod() {
    kubectl get all | grep "po/pachd" | grep -v "pachd-init" | cut -f 1 -d " "
}

