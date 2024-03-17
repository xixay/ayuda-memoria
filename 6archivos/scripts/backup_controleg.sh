#!/bin/bash
remote_host="172.16.0.104"
remote_port="11000"
remote_db="bd_cge_controleg_dev"
remote_user="usr_controleg_dev"
remote_password="controleg"
local_db="bd_cge_controleg_local"
local_user="postgres"
local_password="postgres"
backup_file="backup_$(date '+%Y%m%d_%H%M%S').sql"
PGPASSWORD=$remote_password pg_dump -h $remote_host -p $remote_port -U $remote_user -d $remote_db -w -F c -f $backup_file
PGPASSWORD=$local_password pg_restore -h localhost -p 5432 -U $local_user -d $local_db -w -c -j 4 $backup_file
#rm $backup_file
notify-send "Respaldo y Restauración Completados" "El proceso de respaldo y restauración se ha completado exitosamente."
