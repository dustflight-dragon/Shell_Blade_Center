#!/bin/bash

php_fpm_service_name=php7.0-fpm
php_fpm_service_path=/etc/init.d/
mysql_service_name=mysql
nginx_service_name=nginx

function php_fpm_service_start() {
    $(ps -elf | grep $php_fpm_service_name | grep -v grep)
    if [ $? -ne 0 ]; then
        echo $php_fpm_service_name has been started
    else
        echo $php_fpm_service_name is starting ...
        $($php_fpm_service_path$php_fpm_service_name start)
        echo $php_fpm_service_name start complete
    fi
}

function mysql_service_start() {
    $(ps -elf | grep $mysql_service_name | grep -v grep)
    if [ $? -ne 0 ]; then
        echo $mysql_service_name has been started
    else
        echo $mysql_service_name is starting ...
        $(service $mysql_service_name start)
        echo $mysql_service_name start complete
    fi
}

function nginx_service_start() {
    $(ps -elf | grep $nginx_service_name | grep -v grep)
    if [ $? -ne 0 ]; then
        echo $nginx_service_name has been started
    else
        echo $nginx_service_name is starting ...
        $(service $nginx_service_name start)
        echo $nginx start complete
    fi
}

function main() {
    php_fpm_service_start
    mysql_service_start
    nginx_service_start
}

main
