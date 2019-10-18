#!/bin/bash

# Script For 138 Server

service_name=mongodb

fix_server() {
    $(service $service_name stop)
    $(service $service_name start)
    process_status=$(ps -elf | grep $service_name | grep -v grep | wc -l)
    if [ $process_status -ge 1 ]; then
        echo "$service_name start complete"
    else
        echo "$service_name start invalid"
    fi

    $(docker exec -it xpay_debug /bin/bash)
    sleep 1
    sh /root/xpayv3.sh
    sleep 6
    echo "V3 restart complete"
}

main() {
    fix_server
}

main
