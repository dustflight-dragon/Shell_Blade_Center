#!/bin/bash
# Powered By Ryan Chow

date_time=`date +%Y%m%d%H%M%S`
backup_file_name="postgres_backup_"$date_time".dmp"
backup_db_name=order_pay

create_backup_dir() {
        backup_target_dir=/home/backup/postgres/$date/
        if [ ! -d $backup_target_dir ]; then
            mkdir -p $backup_target_dir
        fi
}

postgres_backup() {
        pg_dump -h localhost -p 38765 -U postgres order_pay > /home/backup/postgres/postgres_backup_20180424.dmp
        # pg_dump -h localhost -p 5432 -U postgres $backup_db_name > /$backup_target_dir/$backup_file_name
}

postgres_backup_all() {
        pg_dump -h localhost -p 38765 -U postgres order_pay > /home/backup/postgres/postgres_backup_20180424.dmp
        # pg_dumpall -h localhost -p 5432 -U postgres $backup_db_name > /$backup_target_dir/$backup_file_name".sql"
}

main() {
        export PGPASSWORD=xlife123
        echo "System Starting Backup Postgres Data"
        echo "#>>>==============================================<<<#"
        echo "######################################################"
        create_backup_dir
        postgres_backup
        echo "######################################################"
        echo "#>>>==============================================<<<#"
        echo "Backup Successful!"
        # postgres_backup_all
}

main
