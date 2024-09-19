#!/bin/bash

_wait_launch() {
    name=$1
    status=$(get_log_status $name)
    counter=0
        while [ $status -lt 1 ]; do
            counter=$((counter + 5))
            sleep 5
            status=$(get_log_status $name)
            if [ $counter -ge 80 ]; then break; fi;
        done
    bash lib/after.sh $name
}


get_log_status() {
    docker logs $name | grep 'Reloading nginx configuration' | wc -l
}
