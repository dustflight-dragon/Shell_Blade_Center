#!/bin/sh

package_name=ymf_web.zip
docker_name=nginx_container

project_source_path=/home/deploy
project_dest_path=/var/www/html/ymf_web

deploy_docker_service() {
    echo "Checking deploy file ......"
    if [ -f $project_source_path/$package_name ]; then
        docker cp $project_source_path/$package_name $docker_name:$project_dest_path
        docker exec -it $docker_name /bin/bash
        unzip $project_dest_path/$package_name
    fi
    echo "Check Complete"
}

main() {
    echo "Start Deploy ......"
    deploy_docker_service
    echo "Deploy Complete"
}

main
