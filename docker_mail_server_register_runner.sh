#!/bin/bash

function start_application() {
    echo "Start Application"
    # foreach_register_mail_account    
    foreach_register_mail_account2    
    echo "Application Running Successful"
}

function foreach_register_mail_account() {
    i=1
    array_string=`cat /dev/urandom | strings -n 8`
    username=$array_string"@mail.com"
    password=$array_string
    while [ $i -le 100 ]; do
        `/etc/docker-mailserver/setup.sh email add $username $password` 
        sleep 1
        if [ $? -eq 0 ]; then
            `/etc/docker-mailserver/setup.sh email list` 
            echo "Email Created Successful"
        else
            echo "Email Created Invalid"
            exit 1            
        fi
    done
}

function foreach_register_mail_account2() {
    password=88888888
    for i in { 0..100 }
    username=mp$i@windsoft.cn
    do
        `/etc/docker-mailserver/setup.sh email add $username $password` 
        if [ $? -eq 0 ]; then
            echo $username
            echo "Email Created Successful"
        else
            echo "Email Created Invalid"
            exit 1            
        fi
    done
}

function main() {
    start_application
}

main