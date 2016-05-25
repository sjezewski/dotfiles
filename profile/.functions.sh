
function sync-docker-machine() {
	DOCKER_MACHINE_IP=`docker-machine ip dev`
	PACHYDERM_SRC="$GOPATH/src/github.com/pachyderm/pachyderm"
	REMOTE_PACHYDERM_SRC="/home/docker-user/go/src/github.com/pachyderm/pachyderm"
	SSH_COMMAND="ssh -F /dev/null -o BatchMode=yes -o PasswordAuthentication=no -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o LogLevel=quiet -o ConnectionAttempts=3 -o ConnectTimeout=10 -o ControlMaster=no -o ControlPath=none -o IdentitiesOnly=yes -i $HOME/.docker/machine/machines/dev/id_rsa -p 22" 
	RSYNC_FLAGS=-avzh
	# I was adding this ... but only for paths that needed sudo ... --rsync-path='sudo rsync'

	sudo rsync $RSYNC_FLAGS -e "$SSH_COMMAND" $1 docker-user@$DOCKER_MACHINE_IP:$2
}

function last-attack() {
    name=`cat $HOME/pachyderm/notes/attacks/.last`
    cat $HOME/pachyderm/notes/attacks/$name
}

function attack-complete() {
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
    echo !! | pbcopy
}

alias sandboxportforwarding="sudo docker-machine ssh dev -fTNL 650:localhost:30650"

function ctx() {
    kubectl config use-context $1
}

function duration() {
    export STARTTIME=$(date +%s)
    $@
    export ENDTIME=$(date +%s)
    # Time in seconds:
    echo $(( $ENDTIME - $STARTTIME ))
}
