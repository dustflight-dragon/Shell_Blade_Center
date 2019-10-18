#!/bin/bash

Date=$(date -d "yesterday" +%Y%m%d)
log_path=/var/log/xpay_product/xpayv3.log

function check_file_exists() {
    if [ ! -f $log_path ]; then
        echo "File not exists"
    fi
}

function cut_log_method() {
    mv $log_path $log_path_$Date
}

function main() {
    check_file_exists
    cut_log_method
}

main
