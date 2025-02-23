# bash prompt
# export PS1="\D{%y-%m-%d}[\A:\D{%S}]:\[\033[38;5;70m\]\W\[$(tput sgr0)\]\[\033[38;5;237m\]:\[$(tput sgr0)\]\[\033[38;5;203m\]\$?\[$(tput sgr0)\]\[\033[38;5;237m\]\\$\[$(tput sgr0)\]"
# zsh prompt
PROMPT="%1d[%*]:%?$"

export PATH=$HOME/scripts:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/go/bin:$PATH
export GOROOT="/usr/local/go"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/.dotfiles/scripts
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="$HOME/google-cloud-sdk/bin/:$PATH"
export PATH="/usr/local/sbin:$PATH" #for brew
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$PYENV_ROOT/shims:${PATH}"
export PATH="$PATH:$HOME/scripts"

alias da="direnv allow"

alias reinit="source $HOME/.zshrc"
alias profile="vim $HOME/.dotfiles/profile/.profile"
alias cb="xsel --clipboard"
alias klog="$HOME/.dotfiles/scripts/kubetail"
alias ci="travis_build.rb | xargs open $1"
alias ci-latest="travis_build.rb latest | xargs open $1"
alias monitors="reset-monitors.sh"
alias h=heroku
alias vim-flush="rm -rf ~/.local/share/nvim/swap"
alias kc="kubectl"
alias pc="pachctl"
alias aws-login="aws sso login"
alias kxs="k9s --context $KCTX -n $KN"
export GMEET="https://meet.google.com/uui-xfzr-pba"
alias gmeet="echo $GMEET | pbcopy"
alias gmeetgo="open $GMEET"
export MMEET="https://teams.microsoft.com/l/meetup-join/19%3ameeting_M2U2NjUwNDYtZmI0My00ZWU0LWFmMDctNjYzZjFkOGYzNWNi%40thread.v2/0?context=%7b%22Tid%22%3a%22550a5da0-c8a6-4a79-bca1-41139de8dec7%22%2c%22Oid%22%3a%22d2455944-5f2e-4a73-baa1-20f1d25e1f5e%22%7d"
alias mmeet="echo '$MMEET' | pbcopy"
alias mmeetgo="open '$MMEET'"

# notification helpers
alias hmm="notify.sh 1"
alias win="notify.sh 4"
alias lose="notify.sh 3"

# iu/zome stuff
export PATH=${PATH}:$HOME/workspace/iubrach/bin

source $HOME/.dotfiles/profile/.functions.sh

# java / junit setup
export JUNIT_HOME="$HOME/lib/junit"
export CLASSPATH="$CLASSPATH:$JUNIT_HOME/junit4.10.jar:."
export M2_HOME=/opt/maven
export PATH=${M2_HOME}/bin:${PATH}

# CUDA CONFIG
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/lib/nvidia-375"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/cuda-8.0/lib64"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/lib/x86_64-linux-gnu" #to get libcuda.so
export PATH="$PATH:/usr/local/cuda-8.0/bin"

# python
#eval "$(pipenv --completion)"

# JOB SPECIFIC
# source $HOME/.dotfiles/profile/pachyderm.sh


# Digital Artefacts

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

alias dl="docker login docker.da.digitalartefacts.com"
export W="$HOME/workspace"
export BD="$W/baseline-dev"
export BP="$W/baseline-playbooks"
export BA="$W/baseline-analysis"
alias bd="cd $BD"
alias bp="cd $BP"
alias ba="cd $BA"
export PATH="$PATH:$W/baseline-dev/env/bin"
export PATH="$PATH:$W/scripts"
alias jn="pipenv run jupyter lab"

alias snowsql=/Applications/SnowSQL.app/Contents/MacOS/snowsql

## Initialize Helpers after script definitions

#eval "$(rbenv init -)"
#eval "$(direnv hook bash)"
eval "$(direnv hook zsh)"


