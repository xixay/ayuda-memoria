#!/bin/bash
remote_host="172.16.22.239"
remote_port="5432"
remote_db="bd_cge_poa_conaud"
remote_user="usr_app_poa"
remote_password="4ppP0a"
local_db="bd_cge_poa_conaud_local"
local_user="postgres"
local_password="postgres"
backup_file="backup_$(date '+%Y%m%d_%H%M%S').sql"
PGPASSWORD=$remote_password pg_dump -h $remote_host -p $remote_port -U $remote_user -d $remote_db -w -F c -f $backup_file
PGPASSWORD=$local_password pg_restore -h localhost -p 5432 -U $local_user -d $local_db -w -c -j 4 $backup_file
#rm $backup_file
notify-send "Backup and Restore Completed" "The backup and restore process has completed successfully."
