#!/bin/bash

mater_server=121.199.2.102
master_user=postgres
local_backup_path=/data/postgresql

start_pg_basebackup() {
    # pg_basebackup -D /data/postgresql -Fp -Xs -v -P -h 121.199.2.102 -U postgres
    pg_basebackup -D $local_backup_path -Fp -Xs -v -P -h $mater_server -U $master_user
}

main() {
    start_pg_basebackup
}

main
