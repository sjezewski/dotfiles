export PS1="\D{%y-%m-%d}[\A:\D{%S}]:\[\033[38;5;70m\]\W\[$(tput sgr0)\]\[\033[38;5;237m\]:\[$(tput sgr0)\]\[\033[38;5;203m\]\$?\[$(tput sgr0)\]\[\033[38;5;237m\]\\$\[$(tput sgr0)\]"

export PATH=/usr/local/go/bin:$PATH
export PATH=/usr/local/bin:$PATH
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/dotfiles/scripts
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="$HOME/google-cloud-sdk/bin/:$PATH"
export PATH="$PATH:/usr/local/cuda-8.0/bin"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/lib/nvidia-375"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/cuda-8.0/lib64"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/lib/x86_64-linux-gnu" #to get libcuda.so
export GOROOT="/usr/local/go"
export PFX=github.com/pachyderm/pachyderm
export PSRC="$GOPATH/src/$PFX"
export IDENTITY="docker-server" # In the osx.sh file, set this to 'client'
export DOCKER_MACHINE_NAME=scoobymachine
export DOCKER_MACHINE_HOME="/home/docker-user"
export ICEBOX="/media/icebox"
export IB=$ICEBOX

# For nodejs on thinkpad:
export PATH=$PATH:$HOME/lib/node-v7.3.0-linux-x64/bin

alias reinit="source $HOME/.bash_profile"
alias profile="nvim $HOME/dotfiles/profile/.profile"
alias p="cd $PSRC"
alias d="cd $HOME/pachyderm/workspace/dash"
alias cb="xsel --clipboard"
alias key="cat $HOME/pachyderm/workspace/dash/paywall/customerTokens/pachydermEngineering-activation-code.txt | xsel --clipboard"
alias token=key
alias klog="$HOME/dotfiles/scripts/kubetail"
alias ci="travis_build.rb | xargs open $1"
alias ci-latest="travis_build.rb latest | xargs open $1"
alias dms="$HOME/dotfiles/scripts/dm-rsync.sh $DOCKER_MACHINE_NAME"
alias c="cd $HOME/pachyderm/workspace/demos"
alias monitors="reset-monitors.sh"

# notification helpers
alias hmm="notify.sh 1"
alias win="notify.sh 4"
alias lose="notify.sh 3"

source $HOME/dotfiles/profile/.functions.sh
source $HOME/dotfiles/profile/pachyderm.sh

alias dm="docker-machine ssh $DOCKER_MACHINE_NAME"

init_docker_machine $DOCKER_MACHINE_NAME

source $HOME/dotfiles/ext_scripts/context/context.sh

# ubuntu python path:
export PATH="$PATH:$HOME/.local/bin"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting


### FOR CLIENT DEMOS

export PATH=/home/sjezewski/miniconda3/bin:$PATH

export PATH=$PATH:/home/sjezewski/tmp/gurobi/gurobi751/linux64/bin
