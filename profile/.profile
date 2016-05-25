export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/go/bin:$PATH
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/dotfiles/scripts
export GOPATH=$HOME/go
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export GOROOT="/usr/local/go"
export PFX=github.com/pachyderm/pachyderm
export PSRC="$GOPATH/src/$PFX"

alias reinit="source $HOME/.bash_profile"
alias profile="emacs $HOME/dotfiles/profile/.profile"
alias p="cd $PSRC"
alias c="clear"
alias kc="kubectl"
alias klog="$HOME/dotfiles/scripts/kubetail"
alias ci="travis_build.rb | xargs open $1"
alias ci-latest="travis_build.rb latest | xargs open $1"

source $PSRC/contributing/bash_helpers
source $HOME/dotfiles/profile/.functions.sh

init_docker_machine
ctx sean-dev







