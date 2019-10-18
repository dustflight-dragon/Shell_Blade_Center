#!/bin/bash
# Powered by Ryan Chow
# Date: 2018/04/09

process_name=python
process_path=/root
process_file=xpayv3_start.sh

system_process_watcher() {
    while true
    do
        process_list=`ps -elf | grep $process_name | grep -v grep` | wc -l
        if [ $process_list -eq 0 ]; then
            ps -ef | grep python | grep -v grep | awk '{ print "kill -9" $2 }' | sh
            nohup python /opt/Xpay/projects/app.py >> /var/log/xpayv3.log 2 > &1 &
            sleep 1
        fi
    done
}

main() {
    system_process_watcher
}

main
