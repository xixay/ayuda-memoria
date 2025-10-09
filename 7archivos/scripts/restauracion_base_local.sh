#!/bin/bash

# Solicitar al usuario los detalles necesarios para la restauración utilizando zenity con valores sugeridos
local_host=$(zenity --entry --title="Detalles de la base de datos local" --text="Ingrese el host:" --entry-text="localhost")
local_port=$(zenity --entry --title="Detalles de la base de datos local" --text="Ingrese el puerto:" --entry-text="5432")
local_db=$(zenity --entry --title="Detalles de la base de datos local" --text="Ingrese el nombre de la base de datos:" --entry-text="bd_cge_poa_conaud_local_b")
local_user=$(zenity --entry --title="Detalles de la base de datos local" --text="Ingrese el usuario de la base de datos:" --entry-text="postgres")

# Usar --entry para sugerir una contraseña editable (será visible, no oculta)
local_password=$(zenity --entry --title="Detalles de la base de datos local" --text="Ingrese la contraseña del usuario:" --entry-text="postgres")

# Verificar si se completaron todos los campos
if [ -z "$local_host" ] || [ -z "$local_port" ] || [ -z "$local_db" ] || [ -z "$local_user" ] || [ -z "$local_password" ]; then
    zenity --error --title="Error" --text="Debe completar todos los campos."
    exit 1
fi

# Solicitar al usuario el nombre del archivo de respaldo manualmente con sugerencia
backup_file=$(zenity --entry --title="Nombre del archivo de respaldo" --text="Ingrese el nombre del archivo de respaldo:" --entry-text="backup_20240630_223225.sql")

if [ -z "$backup_file" ]; then
    zenity --error --title="Error" --text="Debe ingresar el nombre del archivo de respaldo."
    exit 1
fi

# Especificar la ruta completa de pg_restore para PostgreSQL 16
pg_restore_path="/usr/bin/pg_restore"  # Asegúrate de que esta es la ruta correcta después de la instalación

# Verificar si pg_restore existe en la ruta especificada
if [ ! -f "$pg_restore_path" ]; then
    zenity --error --title="Error" --text="$pg_restore_path no existe."
    exit 1
fi

# Paso previo: Eliminar manualmente los esquemas que podrían causar problemas con dependencias
PGPASSWORD="$local_password" psql -h "$local_host" -p "$local_port" -U "$local_user" -d "$local_db" -c "DROP SCHEMA IF EXISTS ejecucion_poa CASCADE;"

# Ejecutar la restauración de la base de datos sin mostrar los errores relacionados con transaction_timeout
PGPASSWORD="$local_password" $pg_restore_path --clean --if-exists -h "$local_host" -p "$local_port" -U "$local_user" -d "$local_db" -c -j 4 "$backup_file" 2>&1 | grep -v "transaction_timeout"

# Mostrar mensaje de éxito para que el usuario verifique manualmente
zenity --info --title="Restauración completada" --text="La restauración ha finalizado. Por favor, verifique manualmente si la base de datos se restauró correctamente."
