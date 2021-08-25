export PFX=github.com/pachyderm/pachyderm
export PSRC="$GOPATH/src/$PFX"
alias pc="pachctl"

function portforwarding() {
         ps -ef | grep "docker/machine" | grep -v grep | cut -f 4 -d " " | while read -r pid
         do
                kill $pid
         done
         docker-machine ssh dev -fTNL 8080:localhost:8080 -L 30650:localhost:30650
}

function init_docker_machine() {
    name="$1"
    if [ -z "$1" ]
    then
        name=dev
    fi

    eval "$(docker-machine env $name)"
}

function create_docker_machine () {
    name="$1"
    project="$2"

    if [ -z "$1" ]
    then
        name=dev
        project=sean-dev
    fi

    docker-machine create \
        --driver google \
        --google-disk-size 50 \
        --google-disk-type pd-ssd \
        --google-machine-type n1-standard-1 \
        --google-zone us-central1-c \
        --google-project $project \
        $name
}
