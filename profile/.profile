export PS1="\[\033[38;5;70m\]\W\[$(tput sgr0)\]\[\033[38;5;237m\]:\[$(tput sgr0)\]\[\033[38;5;203m\]\$?\[$(tput sgr0)\]\[\033[38;5;237m\]\\$\[$(tput sgr0)\]"

export PATH=/usr/local/go/bin:$PATH
export PATH=/usr/local/bin:$PATH
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/dotfiles/scripts
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="$HOME/google-cloud-sdk/bin/:$PATH"
export GOROOT="/usr/local/go"
export PFX=github.com/pachyderm/pachyderm
export PSRC="$GOPATH/src/$PFX"
export IDENTITY="docker-server" # In the osx.sh file, set this to 'client'
export DOCKER_MACHINE_NAME=scoobymachine
export DOCKER_MACHINE_HOME="/home/docker-user"

alias reinit="source $HOME/.bash_profile"
alias profile="nvim $HOME/dotfiles/profile/.profile"
alias p="cd $PSRC"
alias c="clear"
alias klog="$HOME/dotfiles/scripts/kubetail"
alias ci="travis_build.rb | xargs open $1"
alias ci-latest="travis_build.rb latest | xargs open $1"
alias dms="$HOME/dotfiles/scripts/dm-rsync.sh $DOCKER_MACHINE_NAME"

source $HOME/dotfiles/profile/.functions.sh
source $HOME/dotfiles/profile/pachyderm.sh

alias dm="docker-machine ssh $DOCKER_MACHINE_NAME"

init_docker_machine $DOCKER_MACHINE_NAME

source $HOME/dotfiles/ext_scripts/context/context.sh
