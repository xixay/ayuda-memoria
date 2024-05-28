#!/bin/bash
remote_host="172.16.22.234"
remote_port="5432"
remote_db="sispoa_conaud_pruebas2"
remote_user="postgres"
remote_password="postgres"
local_db="bd_cge_poa_conaud_administracion_local"
local_user="postgres"
local_password="postgres"
backup_file="backup_$(date '+%Y%m%d_%H%M%S').sql"

# Especificar la ruta completa de pg_dump y pg_restore para PostgreSQL 16
pg_dump_path="/usr/bin/pg_dump"  # Asegúrate de que esta es la ruta correcta después de la instalación
pg_restore_path="/usr/bin/pg_restore"  # Asegúrate de que esta es la ruta correcta después de la instalación

# Verificar si pg_dump existe en la ruta especificada
if [ ! -f "$pg_dump_path" ]; then
    echo "Error: $pg_dump_path no existe."
    exit 1
fi

# Realizar la copia de seguridad
PGPASSWORD=$remote_password $pg_dump_path -h $remote_host -p $remote_port -U $remote_user -d $remote_db -w -F c -f $backup_file

# Verificar si el archivo de respaldo se creó correctamente
if [ ! -f "$backup_file" ]; then
    echo "Error: No se pudo crear el archivo de respaldo $backup_file."
    exit 1
fi

# Restaurar la copia de seguridad
PGPASSWORD=$local_password $pg_restore_path -h localhost -p 5432 -U $local_user -d $local_db -w -c -j 4 $backup_file

# Eliminar el archivo de respaldo (si se desea)
# rm $backup_file

# Notificar la finalización del proceso
notify-send "Copia de seguridad y restauración completadas" "El proceso de copia de seguridad y restauración se completó correctamente."

##################################INstalacion de postgres 16########################################
# Agregar el repositorio oficial de PostgreSQL para la versión 16
#sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

# Importar la llave del repositorio
#wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

# Actualizar la lista de paquetes
#sudo apt-get update

# Instalar el cliente de PostgreSQL 16
#sudo apt-get install postgresql-client-16



#Verificar la versión de pg_dump y pg_restore
#pg_dump --version
#pg_restore --version

