function cc() {
    echo "!!" | pbcopy
}

function duration() {
    export STARTTIME=$(date +%s)
    $@
    export ENDTIME=$(date +%s)
    # Time in seconds:
    echo $(( $ENDTIME - $STARTTIME ))
}


# Helper for searching pachyderm repo
function grep-code() {
    grep -R "$1" ./src/* | grep -v "vendor" | grep -v "~" | grep -v "#"
}

alias s="grep-code"

function clean_desktop() {
    mkdir -p $HOME/vdesktop/screenshots
    mv $HOME/Desktop/'Screen Shot'* $HOME/vdesktop/screenshots/
}

function split() {
    open -a iTerm $1
}
