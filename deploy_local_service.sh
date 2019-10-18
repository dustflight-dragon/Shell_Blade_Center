#!/bin/sh
###
# deploy package
###
package_name=ymf_web.zip
package_release_name=ymf_web

###
# deploy destination file path
###
project_source_path=/home/deploy
project_dest_path=/var/www/html/ymf_web/xzg_wechat

###
# file backup path
###
backend_project_path=/opt/Xpay
static_project_path=/var/www/html/ymf_web
backend_file_name=backend_project_`date +%Y-%m-%d`
static_file_name=static_project_`date +%Y-%m-%d`
backend_backup_directory_path=/home/backup/$backend_file_name
static_backup_directory_path=/home/backup/$static_file_name

remove_project_path() {
    echo "Clean $project_dest_path"
    rm -rf $project_dest_path
    sleep 2
    echo "Clecn Complete"
    echo "##############################################################################"
}

create_backup_directory() {
    if [ ! -d $backend_backup_directory_path ]; then
        echo "Create directory $backend_backup_directory_path ......"
        mkdir -p $backend_backup_directory_path
        chmod -R 777 $backend_backup_directory_path
        echo "Create directory $backend_backup_directory_path complete"
        echo "##############################################################################"
    fi
    
    if [ ! -d $static_backup_directory_path ]; then
        echo "Create directory $static_backup_directory_path ......"
        mkdir -p $static_backup_directory_path
        chmod -R 777 $static_backup_directory_path
        echo "Create directory $static_backup_directory_path complete"
        echo "##############################################################################"
    fi
}

backup_file_system() {
    echo "$backend_project_path Backup to $backend_backup_directory_path"
    cp -r $backend_project_path $backend_backup_directory_path
    echo "$backend_project_path backup complete"
    echo "##############################################################################"
    sleep 1
    echo "$static_project_path Backup to $static_backup_directory_path"
    cp -r $static_project_path $static_backup_directory_path
    echo "$static_project_path backup complete"
    echo "##############################################################################"
}

deploy_docker_service() {
    echo "Checking deploy file ......"
    if [ -f $project_source_path/$package_name ]; then
        # cp $project_source_path/$package_name $project_dest_path
        # unzip $project_dest_path/$package_name -o $project_dest_path
        
        unzip $project_source_path/$package_name -d $project_dest_path
        echo "Start moving project files ......"
        mv $project_dest_path/$package_release_name/* $project_dest_path
        chmod -R 777 $project_dest_path
        echo "Moving project file complete"
    else
        echo "$project_source_path/$package_name is not exists"
    fi
    echo "Check Complete"
    echo "##############################################################################"
}

main() {
    # echo ================================================================================"
    # echo "##############################################################################"
    # remove_project_path
    # sleep 2
    # echo "##############################################################################"
    # echo ================================================================================"
    # echo ""
    
    echo "================================================================================"
    echo "##############################################################################"
    create_backup_directory
    sleep 1
    echo "##############################################################################"
    echo "================================================================================"
    echo ""
    
    echo "================================================================================"
    echo "##############################################################################"
    backup_file_system
    sleep 1
    echo "##############################################################################"
    echo "================================================================================"
    echo ""
    
    echo "================================================================================"
    echo "##############################################################################"
    echo "Start Deploy ......"
    deploy_docker_service
    echo "Deploy Complete"
    echo "##############################################################################"
    echo "================================================================================"
}

main
