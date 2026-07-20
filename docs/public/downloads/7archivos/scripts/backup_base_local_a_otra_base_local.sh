#!/bin/bash

# Solicitar al usuario los detalles de conexión utilizando zenity
local_host=$(zenity --entry --title="Detalles de Conexión Local" --text="Ingrese la dirección del host local:" --entry-text="localhost")
local_port=$(zenity --entry --title="Detalles de Conexión Local" --text="Ingrese el puerto de la base de datos:" --entry-text="5432")
local_user=$(zenity --entry --title="Detalles de Conexión Local" --text="Ingrese el usuario de la base de datos:" --entry-text="postgres")
local_password=$(zenity --password --title="Detalles de Conexión Local" --text="Ingrese la contraseña del usuario:")

if [ -z "$local_host" ] || [ -z "$local_port" ] || [ -z "$local_user" ] || [ -z "$local_password" ]; then
    zenity --error --title="Error" --text="Debe completar todos los campos de conexión."
    exit 1
fi

# Solicitar nombres de las bases de datos
local_db_origen=$(zenity --entry --title="Base de Datos ORIGEN" --text="Ingrese el nombre de la base de datos a clonar:" --entry-text="bd_cge_poa_conaud_local")
local_db_destino=$(zenity --entry --title="Base de Datos DESTINO" --text="Ingrese el nombre de la NUEVA base de datos:" --entry-text="bd_cge_poa_conaud_local_b")

if [ -z "$local_db_origen" ] || [ -z "$local_db_destino" ]; then
    zenity --error --title="Error" --text="Debe ingresar los nombres de las bases de datos origen y destino."
    exit 1
fi

# Archivo temporal de respaldo en la carpeta actual
backup_file="temp_clone_$(date '+%Y%m%d_%H%M%S').sql"

# Especificar la ruta completa de pg_dump, pg_restore y psql
pg_dump_path="/usr/bin/pg_dump"
pg_restore_path="/usr/bin/pg_restore"
psql_path="/usr/bin/psql"

# Verificar si pg_dump y pg_restore existen
if [ ! -f "$pg_dump_path" ] || [ ! -f "$pg_restore_path" ]; then
    zenity --error --title="Error" --text="Las herramientas pg_dump o pg_restore no existen en /usr/bin/."
    exit 1
fi

# 1. Realizar la copia de seguridad de la base de datos origen
(
echo "10"; echo "# Extrayendo base de datos $local_db_origen..."
PGPASSWORD="$local_password" $pg_dump_path -h "$local_host" -p "$local_port" -U "$local_user" -d "$local_db_origen" -w -F c -f "$backup_file"

if [ $? -ne 0 ]; then
    zenity --error --title="Error" --text="No se pudo crear el archivo de respaldo para $local_db_origen."
    rm -f "$backup_file"
    exit 1
fi

echo "40"; echo "# Verificando y creando base de datos $local_db_destino si no existe..."
# 2. Verificar si la base de datos de respaldo existe, si no, crearla
db_exists=$(PGPASSWORD="$local_password" $psql_path -h "$local_host" -p "$local_port" -U "$local_user" -tAc "SELECT 1 FROM pg_database WHERE datname='$local_db_destino'")

if [ "$db_exists" != "1" ]; then
    PGPASSWORD="$local_password" $psql_path -h "$local_host" -p "$local_port" -U "$local_user" -d "postgres" -c "CREATE DATABASE \"$local_db_destino\";"
    if [ $? -ne 0 ]; then
        zenity --error --title="Error" --text="No se pudo crear la base de datos destino $local_db_destino."
        rm -f "$backup_file"
        exit 1
    fi
fi

echo "70"; echo "# Restaurando datos en $local_db_destino..."
# 3. Restaurar la copia de seguridad en la nueva base de datos
PGPASSWORD="$local_password" $pg_restore_path -h "$local_host" -p "$local_port" -U "$local_user" -d "$local_db_destino" -w -c -j 4 "$backup_file" 2>/dev/null

echo "100"; echo "# Finalizando..."
) | zenity --progress --title="Clonando Base de Datos" --text="Iniciando clonación..." --percentage=0 --auto-close --auto-kill

# Eliminar el archivo temporal
rm -f "$backup_file"

# Notificar la finalización del proceso
zenity --info --title="Clonación exitosa" --text="El proceso de clonado finalizó correctamente.\n\nOrigen: $local_db_origen\nDestino: $local_db_destino"
