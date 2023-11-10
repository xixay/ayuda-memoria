- [1. Postgres](#1-postgres)
  - [1.1. Crear la configuración del repositorio de archivos:](#11-crear-la-configuración-del-repositorio-de-archivos)
  - [1.2. Importar la clave de firma del repositorio:](#12-importar-la-clave-de-firma-del-repositorio)
  - [1.3. Actualizar las listas de paquetes:](#13-actualizar-las-listas-de-paquetes)
  - [1.4. Instale la última versión de PostgreSQL.](#14-instale-la-última-versión-de-postgresql)
- [2. PgAdmin](#2-pgadmin)
  - [2.1. Instalar la clave pública para el repositorio (si no lo hizo anteriormente):](#21-instalar-la-clave-pública-para-el-repositorio-si-no-lo-hizo-anteriormente)
  - [2.2. Crea el archivo de configuración del repositorio:](#22-crea-el-archivo-de-configuración-del-repositorio)
  - [2.3. Instalar tanto para el modo de escritorio como para el web:](#23-instalar-tanto-para-el-modo-de-escritorio-como-para-el-web)
  - [2.4. Instalar solo para modo de escritorio:](#24-instalar-solo-para-modo-de-escritorio)
  - [2.5. Instalar solo para modo web:](#25-instalar-solo-para-modo-web)
  - [2.6. Configure el servidor web, si instaló pgadmin4-web:](#26-configure-el-servidor-web-si-instaló-pgadmin4-web)
- [3. Crear base de datos](#3-crear-base-de-datos)
  - [3.1. Ingresar usuario](#31-ingresar-usuario)
  - [3.2. Ver version](#32-ver-version)
  - [3.3. Salir postgres](#33-salir-postgres)
  - [3.4. Crear base de datos](#34-crear-base-de-datos)
  - [3.5. Ingresar sgte](#35-ingresar-sgte)
  - [3.6. Conectarse](#36-conectarse)
  - [3.7. Salir](#37-salir)
  - [3.8. Ingresar](#38-ingresar)
  - [3.9. Ingresar](#39-ingresar)
  - [3.10. Cambiar password](#310-cambiar-password)
- [4. Referencia](#4-referencia)

# 1. Postgres
## 1.1. Crear la configuración del repositorio de archivos:
```console
sudo sh -c 'echo "deb https://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
```
## 1.2. Importar la clave de firma del repositorio:
```console
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
```
## 1.3. Actualizar las listas de paquetes:
```console
sudo apt-get update
```
## 1.4. Instale la última versión de PostgreSQL.
- Si quieres una versión específica, usa 'postgresql-12' o similar en lugar de 'postgresql':
```console
sudo apt-get -y install postgresql
```
# 2. PgAdmin
## 2.1. Instalar la clave pública para el repositorio (si no lo hizo anteriormente):
```console
curl -fsS https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo gpg --dearmor -o /usr/share/keyrings/packages-pgadmin-org.gpg
```
## 2.2. Crea el archivo de configuración del repositorio:
```console
sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/packages-pgadmin-org.gpg] https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'
```
## 2.3. Instalar tanto para el modo de escritorio como para el web:
```console
sudo apt install pgadmin4
```
## 2.4. Instalar solo para modo de escritorio:
```console
sudo apt install pgadmin4-desktop
```
## 2.5. Instalar solo para modo web: 
```console
sudo apt install pgadmin4-web 
```
## 2.6. Configure el servidor web, si instaló pgadmin4-web:
```console
sudo /usr/pgadmin4/bin/setup-web.sh
```
# 3. Crear base de datos
## 3.1. Ingresar usuario
```console
sudo -i -u postgres
R.-postgres@xixay2023:~$
```
## 3.2. Ver version
```console
postgres@xixay2023:~$ psql
R.-psql (16.0 (Ubuntu 16.0-1.pgdg22.04+1))
   Digite «help» para obtener ayuda.
```
## 3.3. Salir postgres
```console
postgres=# \q
```
## 3.4. Crear base de datos
```console
postgres@xixay2023:~$ createdb my_pgdb
```
## 3.5. Ingresar sgte
```console
postgres@xixay2023:~$ psql -d my_pgdb 
R.-psql (16.0 (Ubuntu 16.0-1.pgdg22.04+1))
   Digite «help» para obtener ayuda.
```
## 3.6. Conectarse
```console
my_pgdb=# \conninfo 
R.-Está conectado a la base de datos «my_pgdb» como el usuario «postgres» a través del socket en «/var/run/postgresql» port «5432».
```
## 3.7. Salir
```console
my_pgdb=# \q
```
## 3.8. Ingresar
```console
postgres@xixay2023:~$ psql
```
## 3.9. Ingresar
```console
postgres=# \pos
```
## 3.10. Cambiar password
```console
postgres=# \password postgres
Ingrese nueva contraseña para usuario «postgres»: postgres
Ingrésela nuevamente: postgres
```
# 4. Referencia
- [Postgres para ubuntu](https://www.postgresql.org/download/linux/ubuntu/)
- [postgresDesktop](https://www.pgadmin.org/download/pgadmin-4-apt/)