- [1. Backups](#1-backups)
- [2. restaurar](#2-restaurar)

## 1. Backups
- Crear la carpeta backups, en el nivel superior y dentro crear el archivo create-backup.sh
```sh
#!/usr/bin/bash

set -e -o errtrace
trap "echo -e '\n\nERROR: Ocurrió un error mientras se ejecutaba el script :(\n\n'" ERR

arg1=${1:-pg14}
arg2=${2:-database_db}
arg3=${3:-database_db.gz}

arg4=${4:-localhost}
arg5=${5:-5432}
arg6=${6:-postgres}
arg7=${7:-postgres}

dockerContainer="${arg1}"

dbname="${arg2}"
dbhost="${arg4}"
dbport="${arg5}"
dbuser="${arg6}"
dbpass="${arg7}"
dbfile="${arg3}"

echo -e "\n >>> Creando SQL backup desde $dbname ($dbhost:$dbport) al archivo $dbfile.."

docker exec -it $dockerContainer pg_dump -h $dbhost -p $dbport -U $dbuser $dbname | gzip > $dbfile

echo -e "\n >>> ¡Backup creado con éxito! :)\n"

```
- Para hacer un backup de la base de datos
```console
sudo bash create-backup.sh conNestJs articulos_db database_db.gz
```
## 2. restaurar
- Crear el archivo restore-backup.sh, e la carpeta backups
```sh
#!/usr/bin/bash

set -e -o errtrace
trap "echo -e '\n\nERROR: Ocurrió un error mientras se ejecutaba el script :(\n\n'" ERR

arg1=${1:-pg14}
arg2=${2:-database_db}
arg3=${3:-database_db.gz}

arg4=${4:-localhost}
arg5=${5:-5432}
arg6=${6:-postgres}
arg7=${7:-postgres}

dockerContainer="${arg1}"

dbname="${arg2}"
dbhost="${arg4}"
dbport="${arg5}"
dbuser="${arg6}"
dbpass="${arg7}"

filename="${arg3/.gz/''}"
dbfile="$filename.gz"

# [INI] SQL
echo -e "\n\n >>> Restaurando SQL backup desde $dbfile a $dbname ($dbhost:$dbport)...\n"

docker restart $dockerContainer

echo -e "\nReiniciando el contenedor $dockerContainer...\n";
sleep 2;

docker exec $dockerContainer psql -h $dbhost -U postgres -c "DROP DATABASE IF EXISTS $dbname"
docker exec $dockerContainer psql -h $dbhost -U postgres -c "CREATE DATABASE $dbname ENCODING 'UTF-8'"

echo " - Copiando..."
docker cp "$dbfile" $dockerContainer:/
sleep 1;

echo " - Descomprimiendo..."
docker exec $dockerContainer gunzip -kf "$filename".gz
sleep 1;

echo " - Removiendo $filename.gz..."
docker exec $dockerContainer rm -rf "$filename".gz
sleep 1;

echo " - Restaurando..."
docker exec $dockerContainer psql -h $dbhost -U postgres -d "$dbname" -f "$filename"
sleep 1;

echo " - Removiendo $filename..."
docker exec $dockerContainer rm -rf "$filename"
sleep 1;

echo -e "\n - [éxito] $dbname ($dbhost)"
# [END] SQL

echo -e "\n\n >>> ¡Base de datos restaurada con éxito! :)\n"
```
- Para hacer una restauración de la base de datos
```console
sudo bash restore-backup.sh conNestJs database_db database_db.gz
```