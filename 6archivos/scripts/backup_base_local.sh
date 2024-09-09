#!/bin/bash

# Solicitar al usuario los detalles de la base de datos utilizando zenity
local_db=$(zenity --entry --title="Detalles de la base de datos local" --text="Ingrese el nombre de la base de datos:" --entry-text="bd_cge_poa_conaud_local_b")
local_port=$(zenity --entry --title="Detalles de la base de datos local" --text="Ingrese el puerto de la base de datos:" --entry-text="5432")
local_host=$(zenity --entry --title="Detalles de la base de datos local" --text="Ingrese la dirección del host local:" --entry-text="localhost")
local_user=$(zenity --entry --title="Detalles de la base de datos local" --text="Ingrese el usuario de la base de datos:" --entry-text="postgres")
local_password=$(zenity --entry --title="Detalles de la base de datos local" --text="Ingrese la contraseña del usuario:" --entry-text="postgres")

if [ -z "$local_db" ] || [ -z "$local_port" ] || [ -z "$local_host" ] || [ -z "$local_user" ] || [ -z "$local_password" ]; then
    zenity --error --title="Error" --text="Debe completar todos los campos."
    exit 1
fi

backup_file="backup_$(date '+%Y%m%d_%H%M%S').sql"

# Especificar la ruta completa de pg_dump y pg_restore para PostgreSQL 16
pg_dump_path="/usr/bin/pg_dump"  # Asegúrate de que esta es la ruta correcta después de la instalación
pg_restore_path="/usr/bin/pg_restore"  # Asegúrate de que esta es la ruta correcta después de la instalación

# Verificar si pg_dump existe en la ruta especificada
if [ ! -f "$pg_dump_path" ]; then
    zenity --error --title="Error" --text="$pg_dump_path no existe."
    exit 1
fi

# Realizar la copia de seguridad
PGPASSWORD=$local_password $pg_dump_path -h $local_host -p $local_port -U $local_user -d $local_db -w -F c -f $backup_file

# Verificar si el archivo de respaldo se creó correctamente
if [ ! -f "$backup_file" ]; then
    zenity --error --title="Error" --text="No se pudo crear el archivo de respaldo $backup_file."
    exit 1
fi

# Notificar que la copia de seguridad fue exitosa
zenity --info --title="Copia de seguridad exitosa" --text="Se ha creado el archivo de respaldo:\n$backup_file"
