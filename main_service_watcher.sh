#!/bin/bash
# Powered by Ryan Chow
# Date: 2018/04/12

service_path=/root/xpayv3_restart.sh
service_name=python

display_service_list() {
    service_result=$(ps -elf | grep $service_name | grep -v grep)
    echo $service_result
}

check_main_service() {
    echo ">>>#############################################################"
    echo "Checking $service_name now ......"
    service_list=$(ps -elf | grep $service_name | grep -v grep | wc -l)
    if [ $service_list -ne 0 ]; then
        echo "$service_name running successful"
    else
        echo "$service_name has been running invalid"
        python /home/shell/system_service_watcher.py
    fi
    echo "#############################################################<<<"
}

restart_service() {
    echo "Restarting $service_path now......"
    sh $service_path
    sleep 5
}

main_service_watcher() {
    echo ">>>#############################################################"
    echo "Checking $service_name now ......"
    service_list=$(ps -elf | grep $service_name | grep -v grep | wc -l)
    if [ $service_list -ne 0 ]; then
        echo "$service_name running successful"
    else
        echo "$service_name has been running invalid"
        restart_service
    fi
    echo "#############################################################<<<"
}

main() {
    display_service_list
    main_service_watcher
    check_main_service
}

main
