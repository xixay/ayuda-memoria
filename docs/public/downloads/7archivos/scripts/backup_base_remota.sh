#!/bin/bash

# Función para mostrar un cuadro de entrada Zenity y obtener el valor ingresado
input_box() {
    local title="$1"
    local prompt="$2"
    local default_value="$3"
    zenity --entry --title="$title" --text="$prompt" --entry-text="$default_value" 2>/dev/null
}

# Obtener los datos de conexión usando Zenity
remote_host=$(input_box "Datos de conexión remota" "Ingrese el host remoto" "172.16.22.234")
remote_port=$(input_box "Datos de conexión remota" "Ingrese el puerto remoto" "5432")
remote_db=$(input_box "Datos de conexión remota" "Ingrese la base de datos remota" "db_poa_update_a")
remote_user=$(input_box "Datos de conexión remota" "Ingrese el usuario remoto" "postgres")
remote_password=$(input_box "Datos de conexión remota" "Ingrese la contraseña remota" "postgres")

local_db=$(input_box "Datos de conexión local" "Ingrese la base de datos local" "bd_cge_poa_conaud_local_b")
local_user=$(input_box "Datos de conexión local" "Ingrese el usuario local" "postgres")
local_password=$(input_box "Datos de conexión local" "Ingrese la contraseña local" "postgres")

backup_file="backup_$(date '+%Y%m%d_%H%M%S').sql"

# Especificar la ruta completa de pg_dump y pg_restore para PostgreSQL 16
pg_dump_path="/usr/bin/pg_dump"  # Asegúrate de que esta es la ruta correcta después de la instalación
pg_restore_path="/usr/bin/pg_restore"  # Asegúrate de que esta es la ruta correcta después de la instalación

# Verificar si pg_dump existe en la ruta especificada
if [ ! -f "$pg_dump_path" ]; then
    zenity --error --text="Error: $pg_dump_path no existe."
    exit 1
fi

# Realizar la copia de seguridad
PGPASSWORD=$remote_password $pg_dump_path -h $remote_host -p $remote_port -U $remote_user -d $remote_db -w -F c -f $backup_file

# Verificar si el archivo de respaldo se creó correctamente
if [ ! -f "$backup_file" ]; then
    zenity --error --text="Error: No se pudo crear el archivo de respaldo $backup_file."
    exit 1
fi

# Restaurar la copia de seguridad
PGPASSWORD=$local_password $pg_restore_path -h localhost -p 5432 -U $local_user -d $local_db -w -c -j 4 $backup_file

# Eliminar el archivo de respaldo (si se desea)
# rm $backup_file

# Notificar la finalización del proceso
zenity --info --text="Copia de seguridad y restauración completadas.\nEl proceso se ha completado correctamente."

exit 0

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

