#!/bin/bash

# Solicitar al usuario los detalles necesarios para la restauración utilizando zenity
local_host=$(zenity --entry --title="Detalles de la base de datos local" --text="Ingrese el host (por ejemplo, localhost):" --entry-text="localhost")
local_port=$(zenity --entry --title="Detalles de la base de datos local" --text="Ingrese el puerto (por ejemplo, 5432):" --entry-text="5432")
local_db=$(zenity --entry --title="Detalles de la base de datos local" --text="Ingrese el nombre de la base de datos (por ejemplo, bd_cge_poa_conaud_local_b):")
local_user=$(zenity --entry --title="Detalles de la base de datos local" --text="Ingrese el usuario de la base de datos (por ejemplo, postgres):")
local_password=$(zenity --password --title="Detalles de la base de datos local" --text="Ingrese la contraseña del usuario (por ejemplo postgres):")

if [ -z "$local_host" ] || [ -z "$local_port" ] || [ -z "$local_db" ] || [ -z "$local_user" ] || [ -z "$local_password" ]; then
    zenity --error --title="Error" --text="Debe completar todos los campos."
    exit 1
fi

# Solicitar al usuario el nombre del archivo de respaldo manualmente
backup_file=$(zenity --file-selection --title="Seleccionar archivo de respaldo")

if [ -z "$backup_file" ]; then
    zenity --error --title="Error" --text="Debe seleccionar el archivo de respaldo."
    exit 1
fi

# Especificar la ruta completa de pg_restore para PostgreSQL 16
pg_restore_path="/usr/bin/pg_restore"  # Asegúrate de que esta es la ruta correcta después de la instalación

# Verificar si pg_restore existe en la ruta especificada
if [ ! -f "$pg_restore_path" ]; then
    zenity --error --title="Error" --text="$pg_restore_path no existe."
    exit 1
fi

# Realizar la restauración de la base de datos ignorando los cambios de propiedad
restore_output=$(PGPASSWORD=$local_password $pg_restore_path --no-owner -h $local_host -p $local_port -U $local_user -d $local_db -c -j 4 "$backup_file" 2>&1)

# Verificar si se encontró un error relacionado con roles
if echo "$restore_output" | grep -q "no existe el rol"; then
    # Extraer el nombre del rol del error
    role_name=$(echo "$restore_output" | grep "no existe el rol" | head -n 1 | sed -E "s/.*no existe el rol «([^»]+)».*/\1/")

    # Solicitar al usuario el nombre del rol
    role_name=$(zenity --entry --title="Nombre del Rol" --text="El rol '$role_name' no existe. Ingrese el nombre del rol para crear (deje en blanco para omitir):" --entry-text="$role_name")

    if [ -n "$role_name" ]; then
        # Crear el rol en la base de datos
        create_role_query="CREATE ROLE $role_name;"
        PGPASSWORD=$local_password psql -h $local_host -p $local_port -U $local_user -d $local_db -c "$create_role_query"
        if [ $? -ne 0 ]; then
            zenity --error --title="Error" --text="No se pudo crear el rol $role_name."
            exit 1
        fi

        # Intentar restaurar nuevamente después de crear el rol
        restore_output=$(PGPASSWORD=$local_password $pg_restore_path --no-owner -h $local_host -p $local_port -U $local_user -d $local_db -c -j 4 "$backup_file" 2>&1)

        # Verificar si la restauración fue exitosa
        if [ $? -eq 0 ]; then
            zenity --info --title="Restauración exitosa" --text="Se ha restaurado la base de datos desde:\n$backup_file"
        else
            zenity --error --title="Error en la restauración" --text="No se pudo restaurar la base de datos desde:\n$backup_file\n\nDetalles del error:\n$restore_output"
        fi
    else
        zenity --info --title="Rol Omitido" --text="Rol '$role_name' no creado, omitiendo."
    fi
else
    # Verificar si la restauración fue exitosa
    if [ $? -eq 0 ]; then
        zenity --info --title="Restauración exitosa" --text="Se ha restaurado la base de datos desde:\n$backup_file"
    else
        zenity --error --title="Error en la restauración" --text="No se pudo restaurar la base de datos desde:\n$backup_file\n\nDetalles del error:\n$restore_output"
    fi
fi
