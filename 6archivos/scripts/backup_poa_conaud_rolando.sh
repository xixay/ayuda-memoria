#!/bin/bash
remote_host="172.16.22.234"
remote_port="5432"
remote_db="db_poa_update_a"
remote_user="postgres"
remote_password="postgres"
local_db="bd_cge_poa_conaud_administracion_local"
local_user="postgres"
local_password="postgres"
backup_file="backup_$(date '+%Y%m%d_%H%M%S').sql"

# Especificar la ruta completa de pg_dump
pg_dump_path="/home/richard_teran/usr/bin/pg_dump"

# Realizar la copia de seguridad
PGPASSWORD=$remote_password $pg_dump_path -h $remote_host -p $remote_port -U $remote_user -d $remote_db -w -F c -f $backup_file

# Restaurar la copia de seguridad
PGPASSWORD=$local_password pg_restore -h localhost -p 5432 -U $local_user -d $local_db -w -c -j 4 $backup_file

# Eliminar el archivo de respaldo (si se desea)
# rm $backup_file

# Notificar la finalización del proceso
notify-send "Copia de seguridad y restauración completadas" "El proceso de copia de seguridad y restauración se completó correctamente."


#!/bin/bash
#remote_host="172.16.22.234"
#remote_port="5432"
#remote_db="db_poa_conaud_soportes"
#remote_user="postgres"
#remote_password="postgres"
#local_db="bd_cge_poa_conaud_administracion_local"
#local_user="postgres"
#local_password="postgres"
#backup_file="backup_$(date '+%Y%m%d_%H%M%S').sql"
#PGPASSWORD=$remote_password pg_dump -h $remote_host -p $remote_port -U $remote_user -d $remote_db -w -F c -f $backup_file
#PGPASSWORD=$local_password pg_restore -h localhost -p 5432 -U $local_user -d $local_db -w -c -j 4 $backup_file
#rm $backup_file
#notify-send "Copia de seguridad y restauración completadas" "El proceso de copia de seguridad y restauración se completó correctamente."
