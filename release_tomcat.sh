#!/bin/sh

# Script For 190 Server

target_service=tomcat
tomcat_service_path=/opt/apache-tomcat-8.5.23/bin/startup.sh
process_id=$(ps -elf | grep $target_service | grep -v grep | awk '{ print $1 }')
process_count=$(ps -elf | grep tomcat | grep -v grep | wc -l)

tomcat_service_release() {
    if [ $process_count -ge 1 ]; then
        echo "Kill $process_id now ......"
        kill -9 $process_id
        sleep 2
        echo "Kill $process_id complete"
        
        sh $tomcat_service_path
    fi
}

main() {
    tomcat_service_release
}

main