#!/usr/bin/bash
# Author: Ryan Chow
# Update Date: 2018-10-17

date="date +%Y%m%d-%H%I%s"
process_name=php-fpm
php_process=$(ps -elf | grep -v grep | grep $process_name | wc -l)

start_application() {
    "Applicationn Startd on {{"$date"}} => "
    ">>>>>>========================================================================"
    php_fpm_watcher
    "========================================================================<<<<<<"
    "Applicationn Finished on {{"$date"}} => "

}

################################################################################
# Check php-fpm process running status
################################################################################
php_fpm_watcher() {
    if [ $php_process -eq 0 ]; then
        echo "$process_name is not running"
        echo "Starting $process_name ......"
        echo ""
        $(nohup /usr/sbin/php-fpm &)
        echo ""
        echo "$process_name start successfully"
    else
        echo "$process_name is running normally"
    fi
}

main() {
    echo ">>>================================================================"
    echo "############### Application Started At [$date] ############### "

    start_application

    echo "############### Application Finished At [$date] ############### "
    echo "================================================================<<<"
}

main
