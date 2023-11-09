# Postgres
## Crear la configuración del repositorio de archivos:
```console
sudo sh -c 'echo "deb https://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
```
## Importar la clave de firma del repositorio:
```console
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
```
## Actualizar las listas de paquetes:
```console
sudo apt-get update
```
## Instale la última versión de PostgreSQL.
- Si quieres una versión específica, usa 'postgresql-12' o similar en lugar de 'postgresql':
```console
sudo apt-get -y install postgresql
```
# PgAdmin
## Instalar la clave pública para el repositorio (si no lo hizo anteriormente):
```console
curl -fsS https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo gpg --dearmor -o /usr/share/keyrings/packages-pgadmin-org.gpg
```
## Crea el archivo de configuración del repositorio:
```console
sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/packages-pgadmin-org.gpg] https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'
```
## Instalar tanto para el modo de escritorio como para el web:
```console
sudo apt install pgadmin4
```
## Instalar solo para modo de escritorio:
```console
sudo apt install pgadmin4-desktop
```
## Instalar solo para modo web: 
```console
sudo apt install pgadmin4-web 
```
## Configure el servidor web, si instaló pgadmin4-web:
```console
sudo /usr/pgadmin4/bin/setup-web.sh
```
# Crear base de datos
## Ingresar usuario
```console
sudo -i -u postgres
R.-postgres@xixay2023:~$
```
## Ver version
```console
postgres@xixay2023:~$ psql
R.-psql (16.0 (Ubuntu 16.0-1.pgdg22.04+1))
   Digite «help» para obtener ayuda.
```
## Salir postgres
```console
postgres=# \q
```
## Crear base de datos
```console
postgres@xixay2023:~$ createdb my_pgdb
```
## Ingresar sgte
```console
postgres@xixay2023:~$ psql -d my_pgdb 
R.-psql (16.0 (Ubuntu 16.0-1.pgdg22.04+1))
   Digite «help» para obtener ayuda.
```
## Conectarse
```console
my_pgdb=# \conninfo 
R.-Está conectado a la base de datos «my_pgdb» como el usuario «postgres» a través del socket en «/var/run/postgresql» port «5432».
```
## Salir
```console
my_pgdb=# \q
```
## Ingresar
```console
postgres@xixay2023:~$ psql
```
## Ingresar
```console
postgres=# \pos
```
## Cambiar password
```console
postgres=# \password postgres
Ingrese nueva contraseña para usuario «postgres»: postgres
Ingrésela nuevamente: postgres
```
# Referencia
- [Postgres para ubuntu](https://www.postgresql.org/download/linux/ubuntu/)
- [postgresDesktop](https://www.pgadmin.org/download/pgadmin-4-apt/)