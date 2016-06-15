export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/go/bin:$PATH
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/dotfiles/scripts
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export GOROOT="/usr/local/go"
export PFX=github.com/pachyderm/pachyderm
export PSRC="$GOPATH/src/$PFX"
export IDENTITY="docker-server" # In the osx.sh file, set this to 'client'

alias reinit="source $HOME/.bash_profile"
alias profile="emacs $HOME/dotfiles/profile/.profile"
alias p="cd $PSRC"
alias c="clear"
alias kc="kubectl"
alias klog="$HOME/dotfiles/scripts/kubetail"
alias pc="pachctl"
alias ci="travis_build.rb | xargs open $1"
alias ci-latest="travis_build.rb latest | xargs open $1"
alias dms="$HOME/dotfiles/scripts/dm-rsync.sh"

source $PSRC/contributing/bash_helpers
source $HOME/dotfiles/profile/.functions.sh

alias dm="docker-machine ssh dev"

init_docker_machine
ctx sean-dev


