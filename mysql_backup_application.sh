#!/usr/bin/expect -f

set timeout 360

set datetime_now "date +%Y%m%d_%H%M%S" 
set hostname "localhost"
set username "root"
set password "1q2w3e4r!@#"
set backup_db1_listdb "listdb"
set backup_db2_todolist "todolist"
set backup_file_res_name "mysql_db_backup"
set backup_file_path "/usr/local/mysql_backup/"
# set backup_file_name ${backup_file_path}${backup_db1_listdb}_${datetime_now}.sql
set backup_file_name ${backup_file_path}${backup_file_res_name}.sql

send_user "Start MySQL Backup Process......"
send_user "\n"

spawn mysqldump -u $username -p --databases $backup_db1_listdb $backup_db2_todolist -r $backup_file_name 
# spawn mysqldump -u $username -p --databases $backup_db1_listdb $backup_db2_todolist > $backup_file_name 
# spawn mysqldump -h $hostname -u $username -p --all-databases > $backup_file_name 
expect {
    "(yes/no)?" {
        send "yes\n"
        expect "*password" { send "$password\n" }
    }
    "*password:" { 
        send "$password\n" 
    }
    # expect "100%"
    expect eof
}
sleep 2

send_user "\n"
send_user "MySQL Backup Process Complete !"
send_user "\n"
interact
