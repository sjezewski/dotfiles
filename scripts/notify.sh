#!/bin/bash

echo $?

export variant="left-think"
export message="hmm"

if [ $1 -eq "2" ]; then
    variant="right-think"
fi

if [ $1 -eq "3" ]; then
    variant="think"
    message="..."
fi

if [ $1 -eq "4" ]; then
    variant="smile"
    message="!!!"
fi

if [[ ! -z $2 ]]; then 
    message=$2
fi

image="~/dotfiles/scripts/notify/radical-ed-$variant.png"
notify-send -i ~/dotfiles/scripts/notify/radical-ed-$variant.png  $message

