#!/bin/bash

kubectl get all | grep pachd- | cut -f 1 -d " " | while read -r pod
do
    kubectl logs $pod | while read -r line
    do
        time=`echo "$line" | cut -f 1 -d " "`
        suffix=`echo "$line" | cut -f 2- -d " "`
        echo "$time :: POD($pod) :: $suffix"
    done
done