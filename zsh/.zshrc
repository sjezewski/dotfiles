# Path to your oh-my-zsh installation.
export ZSH=/Users/jdoliner/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)
plugins=(aws)
plugins=(boot2docker)
plugins=(brew)
plugins=(brew-cask)
plugins=(colored-man)
plugins=(colorize)
plugins=(docker)
plugins=(docker-compose)
plugins=(golang)
plugins=(history)
plugins=(history-substring-search)
plugins=(mosh)
plugins=(ssh-agent)
plugins=(sudo)
plugins=(tmux)
plugins=(tmuxinator)
plugins=(torrent)
plugins=(osx)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/go/bin:/Users/jdoliner/go/bin"
export GOPATH=~/go
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
unsetopt EQUALS

# The next line updates PATH for the Google Cloud SDK.
source '/Users/jdoliner/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
source '/Users/jdoliner/google-cloud-sdk/completion.zsh.inc'


function create_docker_machine () {
    docker-machine create \
        --driver google \
        --google-disk-size 100 \
        --google-disk-type pd-ssd \
        --google-machine-type n1-standard-16 \
        --google-zone us-central1-c \
        --google-project jd-dev2 \
        --engine-storage-driver devicemapper \
        dev
}

function create_local_docker_machine () {
    docker-machine create \
        --driver virtualbox \
        --engine-storage-driver devicemapper \
        local-dev
}

function create_gke_cluster () {
    gcloud container clusters create \
        --machine-type n1-standard-16 \
        --num-nodes 1 \
        cluster
    gcloud container clusters get-credentials cluster
}

function docker_cleanup () {
    docker rm -v $(docker ps -a -q)
    docker rmi $(docker images -a -q -f dangling=true)
}

export GO15VENDOREXPERIMENT=1
