#!/bin/bash

# Definir variables para las bases de datos y el usuario
local_db="bd_cge_poa_conaud_local"
backup_db="bd_cge_poa_conaud_local_b"
backup_dir="/var/lib/postgresql/backups"
backup_file="$backup_dir/backup_$(date '+%Y%m%d_%H%M%S').sql"

# Especificar la ruta completa de pg_dump y pg_restore para PostgreSQL 16
pg_dump_path="/usr/bin/pg_dump"  # Asegúrate de que esta es la ruta correcta después de la instalación
pg_restore_path="/usr/bin/pg_restore"  # Asegúrate de que esta es la ruta correcta después de la instalación

# Verificar si pg_dump existe en la ruta especificada
if [ ! -f "$pg_dump_path" ]; then
    echo "Error: $pg_dump_path no existe."
    exit 1
fi

# Crear el directorio de respaldo si no existe
if [ ! -d "$backup_dir" ]; then
    sudo mkdir -p "$backup_dir"
    sudo chown postgres:postgres "$backup_dir"
fi

# Verificar si la base de datos de respaldo existe, si no, crearla
if ! sudo -u postgres psql -lqt | cut -d \| -f 1 | grep -qw $backup_db; then
    sudo -u postgres createdb $backup_db
    if [ $? -ne 0 ]; then
        echo "Error: No se pudo crear la base de datos $backup_db."
        exit 1
    fi
fi

# Realizar la copia de seguridad de la base de datos local
sudo -u postgres $pg_dump_path -d $local_db -F c -f $backup_file
if [ $? -ne 0 ]; then
    echo "Error: No se pudo crear el archivo de respaldo $backup_file."
    exit 1
fi

# Restaurar la copia de seguridad en la nueva base de datos
sudo -u postgres $pg_restore_path -d $backup_db -c -j 4 $backup_file
if [ $? -ne 0 ]; then
    echo "Error: No se pudo restaurar la base de datos $backup_db."
    exit 1
fi

# Eliminar el archivo de respaldo (opcional)
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

