#!/bin/bash

echo "Thank you for using this program powered by Ryan Chow"

echo "Python Service Checking Now..."

redis_file=redis-server
redis_server_path=/usr/bin/
redis_config_path=/etc/redis/redis_2046.conf

service_name=python
service_file=service.py
service_number="ps -elf | grep $service_name | grep -v grep | wc -l"

bill_script_path=/root/Bill
order_notify_sciprt_path=/root/order_notify

if [ $redis_process -lt 1 ]; then
    $redis_file $redis_config_path
fi

if [ $service_number -le 1 ]; then

    chmod -R +x $bill_script_path/$service_file
    chmod -R +x $order_notify_sciprt_path/$service_file

    python $bill_script_path/$service_file
    python $order_notify_sciprt_path/$service_file
fi

echo "Python Service Ran Complete!"