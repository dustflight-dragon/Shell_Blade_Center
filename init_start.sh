#!/bin/bash
# Powered By Ryan Chow
# Date: 2018-06-11

postgres_path=/etc/init.d/postgresql
redis_path=/etc/init.d/redis-server

start_postgresql() {
    `ps -elf | grep postgres | grep -v grep`
    if [ $? -ne 0 ]; then
        $postgres_path start
    else
        echo "$postgres_path is running !"
    fi
}

start_redis() {
    `ps -elf | grep redis | grep -v grep`
    if [ $? -ne 0 ]; then
        $redis_path start
    else
        echo "$start_redis is running !"
    fi
}

start_gitlab() {
    `gitlab reconfigure`
}

init_start() {
    start_postgresql
    sleep 1
    start_redis
    sleep 1
    start_gitlab
    sleep 5
}

main() {
    init_start
}

main