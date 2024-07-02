#!/bin/bash
remote_host="172.16.75.101"
remote_port="5432"
remote_db="bd_cge_controleg_210223"
remote_user="usr_controleg"
remote_password="CGE*C0ntr0l3g*4dmin"
local_db="bd_cge_controleg_190223_local"
local_user="postgres"
local_password="postgres"
backup_file="backup_$(date '+%Y%m%d_%H%M%S').sql"
PGPASSWORD=$remote_password pg_dump -h $remote_host -p $remote_port -U $remote_user -d $remote_db -w -F c -f $backup_file
PGPASSWORD=$local_password pg_restore -h localhost -p 5432 -U $local_user -d $local_db -w -c -j 4 $backup_file
#rm $backup_file
notify-send "Copia de seguridad y restauración completadas" "El proceso de copia de seguridad y restauración se completó correctamente".

