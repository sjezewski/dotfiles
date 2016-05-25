export PATH=/usr/local/go/bin:$PATH
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/dotfiles/scripts
export GOPATH=$HOME/go

alias reinit="source $HOME/dotfiles/docker-machine/.profile"

function sync-docker-machine() {
	DOCKER_MACHINE_IP=`docker-machine ip dev`
	PACHYDERM_SRC="$GOPATH/src/github.com/pachyderm/pachyderm"
	REMOTE_PACHYDERM_SRC="/home/docker-user/go/src/github.com/pachyderm/pachyderm"
	SSH_COMMAND="ssh -F /dev/null -o BatchMode=yes -o PasswordAuthentication=no -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o LogLevel=quiet -o ConnectionAttempts=3 -o ConnectTimeout=10 -o ControlMaster=no -o ControlPath=none -o IdentitiesOnly=yes -i $HOME/.docker/machine/machines/dev/id_rsa -p 22" 
	RSYNC_FLAGS=-avzh
	# I was adding this ... but only for paths that needed sudo ... --rsync-path='sudo rsync'

	sudo rsync $RSYNC_FLAGS -e "$SSH_COMMAND" $1 docker-user@$DOCKER_MACHINE_IP:$2
}


# The next line updates PATH for the Google Cloud SDK.
source '/home/docker-user/dotfiles/google-cloud-sdk/path.bash.inc'

# The next line enables shell command completion for gcloud.
source '/home/docker-user/dotfiles/google-cloud-sdk/completion.bash.inc'
