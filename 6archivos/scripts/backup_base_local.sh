#!/bin/bash

# Variables de configuración para la base de datos local
local_host="localhost"
local_port="5432"
local_db="bd_cge_poa_conaud_local_b"
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
PGPASSWORD=$local_password $pg_dump_path -h $local_host -p $local_port -U $local_user -d $local_db -w -F c -f $backup_file

# Verificar si el archivo de respaldo se creó correctamente
if [ ! -f "$backup_file" ]; then
    echo "Error: No se pudo crear el archivo de respaldo $backup_file."
    notify-send "Error en la copia de seguridad" "No se pudo crear el archivo de respaldo."
    exit 1
fi

# Notificar que la copia de seguridad fue exitosa
echo "Copia de seguridad realizada correctamente. Archivo: $backup_file"
notify-send "Copia de seguridad exitosa" "Se ha creado el archivo de respaldo: $backup_file."
