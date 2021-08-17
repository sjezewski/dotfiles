export PS1="\D{%y-%m-%d}[\A:\D{%S}]:\[\033[38;5;70m\]\W\[$(tput sgr0)\]\[\033[38;5;237m\]:\[$(tput sgr0)\]\[\033[38;5;203m\]\$?\[$(tput sgr0)\]\[\033[38;5;237m\]\\$\[$(tput sgr0)\]"
export BASH_SILENCE_DEPRECATION_WARNING=1 # silence annoying zsh warning on login

export PATH=/usr/local/go/bin:$PATH
export PATH=/usr/local/bin:$PATH
export GOROOT="/usr/local/go"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/dotfiles/scripts
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="$HOME/google-cloud-sdk/bin/:$PATH"
export PATH="/usr/local/sbin:$PATH" #for brew

eval "$(rbenv init -)"
eval "$(direnv hook bash)"
alias da="direnv allow"

alias reinit="source $HOME/.bash_profile"
alias profile="vim $HOME/dotfiles/profile/.profile"
alias cb="xsel --clipboard"
alias klog="$HOME/dotfiles/scripts/kubetail"
alias ci="travis_build.rb | xargs open $1"
alias ci-latest="travis_build.rb latest | xargs open $1"
alias monitors="reset-monitors.sh"
alias h=heroku
alias vim-flush="rm -rf ~/.local/share/nvim/swap"
alias kc="kubectl"

# notification helpers
alias hmm="notify.sh 1"
alias win="notify.sh 4"
alias lose="notify.sh 3"

source $HOME/dotfiles/profile/.functions.sh

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

# JOB SPECIFIC
# source $HOME/dotfiles/profile/pachyderm.sh

