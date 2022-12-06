- [1. Docker](#1-docker)
  - [1.1. instalar dependencias](#11-instalar-dependencias)
  - [1.2. Añadir el repositorio docker](#12-añadir-el-repositorio-docker)
  - [1.3. Instalación de Docker en Debian 11](#13-instalación-de-docker-en-debian-11)
    - [1.3.1. Permitir el acceso a Docker a usuarios no root](#131-permitir-el-acceso-a-docker-a-usuarios-no-root)
  - [1.4. Comandos docker](#14-comandos-docker)
  - [1.5. Contenedor Postgres](#15-contenedor-postgres)
    - [1.5.1. Comandos de postgres](#151-comandos-de-postgres)
  - [1.6. Contenedor mongodb](#16-contenedor-mongodb)
    - [1.6.1. Comandos de mongodb](#161-comandos-de-mongodb)
  - [1.7. Contenedor rabbit](#17-contenedor-rabbit)
    - [1.7.1. localhost de rabbit](#171-localhost-de-rabbit)
  - [1.8. Contenedor Kong](#18-contenedor-kong)
    - [1.8.1. Crear una red acoplable](#181-crear-una-red-acoplable)
    - [1.8.2. Vincule Kong a un contenedor PostgreSQL](#182-vincule-kong-a-un-contenedor-postgresql)
    - [1.8.3. Prepara tu base de datos](#183-prepara-tu-base-de-datos)
    - [1.8.4. Comenzar Kong](#184-comenzar-kong)
    - [1.8.5. Verificar su instalación](#185-verificar-su-instalación)
    - [1.8.6. Verificar Kong Manager](#186-verificar-kong-manager)
  - [1.9. Referencia](#19-referencia)
# 1. Docker
```text
Docker es un proyecto de código abierto que automatiza el despliegue de aplicaciones dentro de contenedores de software
```
## 1.1. instalar dependencias
1. Ejecuta el siguiente comando apt para instalar nuevas dependencias de paquetes.
```console
apt install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
```
## 1.2. Añadir el repositorio docker
1. Ejecuta el siguiente comando para añadir la clave GPG para Docker.
```console
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
```
2. Después, añade el repositorio de Docker para el sistema Debian 11 utilizando el siguiente comando.
```console
echo \
 "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
 $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
 ```
3. Ahora ejecuta el comando‘apt update‘ para actualizar/refrescar todos los repositorios disponibles.
```console
apt update
```
## 1.3. Instalación de Docker en Debian 11
1. Si tu sistema tiene Docker instalado desde el repositorio de Debian anteriormente, debes eliminarlo utilizando el comando que aparece a continuación.
```console
sudo apt remove docker docker-engine docker.io containerd runc
```
2. Después, puedes instalar Docker de nuevo utilizando el comando apt que aparece a continuación.
```console
apt install docker-ce docker-ce-cli containerd.io
```
3. Si la instalación se ha completado, ejecuta el siguiente comando para verificar la instalación.
- Comprueba si el servicio está habilitado o no.
```console
systemctl is-enabled docker
systemctl is-enabled containerd
```
- Comprueba el estado del servicio Docker y Containerd.
```console
systemctl status docker containerd
```
### 1.3.1. Permitir el acceso a Docker a usuarios no root
- Crea el nuevo usuario ‘johndoe’ en tu sistema Debian
```console
useradd -m -s /bin/bash johndoe
```
- Después, ejecuta el siguiente comando para añadir el usuario ‘johndoe‘ al grupo‘docker‘.
```console
sermod -aG docker johndoe
su - johndoe
```
4. Ejecuta el siguiente comando docker para verificar tu instalación.
```console
docker run hello-world
```
5. Comprobando el contenedor con estado‘en ejecución‘
```console
docker ps
```
6. te mostrará todos los contenedores, los que se están ejecutando y los que están parados.
```console
docker ps -a
```
## 1.4. Comandos docker
- renombrar contenedor
```console
docker rename chasqui nuevoNombre
```
- borrar un contenedor
```console
docker rm chasqui
```
## 1.5. Contenedor Postgres
1. Ver los puertos
```console
sudo apt install net-tools
sudo netstat -tpln
```
2. Elimina versiones anteriores postgres
```console
  dpkg -l | grep postgres
  sudo apt-get --purge remove \
  postgresql \
  pgdg-keyring \
  postgresql-13 \
  postgresql-14 \
  postgresql-15 \
  postgresql-client-13 \
  postgresql-client-14 \
  postgresql-client-15 \
  postgresql-client-common \
  postgresql-common
```
3. Ver si siguen instalados los postgres
  ```console
  sudo service postgresql status
  ```
4. Crear contenedor
```console
sudo docker run   --name chasqui   -e POSTGRES_PASSWORD=postgres   -d   -p 7777:5432   postgres:14.6
```
5. Comprobar los puertos
```console
sudo netstat -tpln
```
6. iniciar contenedor
```console
docker start chasqui
```
7. obtener la dirección <IP>, por donde corre el contenedor(linux)
```console
docker inspect chasqui
```
8. ingresar como root
```console
sudo docker exec -it chasqui bash
```
9.  entrar a los comandos de postgres y editar
```console
root@39d084e50e74:/# psql -U postgres(luego se ejecuta postgres)
```
10. crear la base de datos
```psql
CREATE DATABASE chasqui_db;
```
11. Conectarse BD
```psql
\c chasqui_db;
```
12. Crear esquemas si es que necesita(opcional)
```psql
create schema usuarios;
```
13. Salir postgres
```psql
\q
```
14. Salir root
```console
ctrl+d
```
15. Conectarse DBeaver
```txt
- Ver la IP y puerto (linux)
docker inspect chasqui(172.17.0.2) tanbien colocar en .env
Host=172.17.0.2
port=5432
Database=chasqui_db
- Ver la IP y puerto (windows wsl2) tambien colocar en el .env
Host=localhost
port=7777
Database=chasqui_db
```
### 1.5.1. Comandos de postgres
1. entrar a los comandos de postgres y editar
```console
sudo docker exec -it chasqui bash
root@39d084e50e74:/# psql -U postgres
```
- ver las bases de datos en este contenedor
```console
\l
```
- crear la base de datos
```console
CREATE DATABASE chasqui_db;
```
- borrar base de datos(el backend y el dbeaver deben estar apagado)
```console
DROP DATABASE chasqui_db;
```
- renombrar base de datos
```console
ALTER DATABASE viejoNombre RENAME TO nuevoNombre;
```
- crear en wsl2 docker
```console
docker run --name postgres-example -d -p 2022:5432 -e POSTGRES_PASSWORD=postgres postgres
```
## 1.6. Contenedor mongodb
1. Crear contenedor
```console
docker run --name mensajeria -d mongo:5.0.9
```
2. iniciar contenedor
```console
docker start mensajeria
```
3. obtener la dirección <IP>, por donde corre el contenedor
```console
docker inspect mensajeria
```
4. entrar a los comandos de mongodb y editar
```console
docker exec -it mensajeria mongo
```
5. crear la base de datos
```console
use notificaciones_db
```
6. crear usuario para esa base de datos
```console
db.createUser(
{
user: "miusuario",
pwd: "micontrasena",
roles: ["dbOwner"]
}
)
```
7. ingresar datos
```console
db.para.save({ estado: { type: 'tipo_estado1', enum: 'VALIDO', default: 'NO_ENVIADO' }, puerto: '1234', numero: '7772636', observacion: 'obs 1'})
db.contenido.save({ type: 'tipoContenido1', required: true})
db.estado.save({ type: 'tipoEstado1', enum: 'PROCESADO', default: 'EN_PROCESO'})
db.timestamps.save({ createdAt: 'fecha_creacion', updatedAt: 'fecha_modificacion'})
```
8. salir
```console
exit
```
### 1.6.1. Comandos de mongodb
1. entrar a los comandos de mongodb y editar
```console
docker exec -it mensajeria mongo
```
- ingresar a la base de datos del admin
```console
use admin
```
- crea usuario root
```console
db.createUser(
{
user: "mongouser",
pwd: "mongouser",
roles: ["root"]
}
)
```
- crear la base de datos no admin
```console
use notificaciones_db
```
- crea usuario dbOwner
```console
db.createUser(
{
user: "miusuario",
pwd: "micontrasena",
roles: ["dbOwner"]
}
)
```
- verifica autenticacion
```console
db.auth('miusuario','micontrasena')
```
- ver todos los usuarios
```console
show users
```
- lista de todos los usuarios de una base de datos
```console
db.getUsers()
```
- Eliminar un usuario de una base de datos
```console
use notificaciones_db
db.dropUser('miusuario')
```
- Ingresar datos
```console
db.para.save({ estado: { type: 'tipo_estado1', enum: 'VALIDO', default: 'NO_ENVIADO' }, puerto: '1234', numero: '7772636', observacion: 'obs 1'})
db.contenido.save({ type: 'tipoContenido1', required: true})
db.estado.save({ type: 'tipoEstado1', enum: 'PROCESADO', default: 'EN_PROCESO'})
db.timestamps.save({ createdAt: 'fecha_creacion', updatedAt: 'fecha_modificacion'})
```

- ver las colecciones de la tabla
```console
show collections
```
- muestra un elemento de la base
```console
db.para.find()
```
- muestra especifico la base
```console
db.para.find({ estado: { type: 'tipo_estado1', enum: 'VALIDO', default: 'NO_ENVIADO' }})
```
- borrar base de datos
```console
conn = new Mongo()
db = conn.getDB("notificaciones_db")
db.dropDatabase()
```
- salir
```console
exit
```
- Logearse en la terminal
```console
docker exec -it mensajeria mongo notificaciones_db -u "miusuario" -p "micontrasena"
```
## 1.7. Contenedor rabbit
1. Crear contenedor
```console
docker run -d -p 5672:5672 -p 15672:15672 \--name rabbitmq-server rabbitmq:management
```
2. iniciar contenedor
```console
docker start rabbitmq-server
```
3. Verificación del estado del servicio de RabbitMQ a través de los registros de Docker
```console
docker logs rabbitmq-server
```
4. Verifique RabbitMQ Cli y complementos para la gestión de servicios
```console
docker exec -it rabbitmq-server bash
root@5c6f76366ffc:/# rabbitmqctl version
root@5c6f76366ffc:/# rabbitmq-plugins list
```
5. salir
```console
exit
```
### 1.7.1. localhost de rabbit
1. Portal de administración http://localhost:15672/
2. usuario y password
```text
Username:guest
Password:guest
```
## 1.8. Contenedor Kong
### 1.8.1. Crear una red acoplable
```console
docker network create kong-net
```
###  1.8.2. Vincule Kong a un contenedor PostgreSQL
1. Crear contenedor postgres
```console
sudo docker run --name kong-database \
--network=kong-net \
-p 5555:5432 \
-e "POSTGRES_USER=kong" \
-e "POSTGRES_DB=kong" \
-e POSTGRES_PASSWORD=kongpass \
-d postgres:13.5
```
2. iniciar contenedor
```console
docker start kong-database
```
3. obtener la dirección <IP>, por donde corre el contenedor
```console
docker inspect kong-database// out:172.19.0.2
```
4. entrar a los comandos de postgres y editar
```console
psql -h 172.19.0.2 -U kong -W
contraseña:kongpass
```
5. crear la base de datos
```text
No es necesario ya esta creado

                         Listado de base de datos
  Nombre   | Dueño | Codificación |  Collate   |   Ctype    |  Privilegios  
-----------+-------+--------------+------------+------------+---------------
 kong      | kong  | UTF8         | en_US.utf8 | en_US.utf8 | 
 postgres  | kong  | UTF8         | en_US.utf8 | en_US.utf8 | 
 template0 | kong  | UTF8         | en_US.utf8 | en_US.utf8 | =c/kong      +
           |       |              |            |            | kong=CTc/kong
 template1 | kong  | UTF8         | en_US.utf8 | en_US.utf8 | =c/kong      +
           |       |              |            |            | kong=CTc/kong
(4 filas)

```
6. salir
```console
\q
```
### 1.8.3. Prepara tu base de datos
1. Ejecute las migraciones de la base de datos con un contenedor Kong
```console
docker run --rm \
--network=kong-net \
-e "KONG_DATABASE=postgres" \
-e "KONG_PG_HOST=kong-database" \
-e "KONG_PG_PASSWORD=kongpass" \
-e "KONG_PASSWORD=test" \
kong/kong-gateway:2.8.1.2-alpine kong migrations bootstrap
```
2. Como confirmacion la ultima linea
```console
87 migrations processed
87 executed
Database is up-to-date
```
### 1.8.4. Comenzar Kong
```console
docker run -d --name kong-gateway \
  --network=kong-net \
  -e "KONG_DATABASE=postgres" \
  -e "KONG_PG_HOST=kong-database" \
  -e "KONG_PG_USER=kong" \
  -e "KONG_PG_PASSWORD=kongpass" \
  -e "KONG_PROXY_ACCESS_LOG=/dev/stdout" \
  -e "KONG_ADMIN_ACCESS_LOG=/dev/stdout" \
  -e "KONG_PROXY_ERROR_LOG=/dev/stderr" \
  -e "KONG_ADMIN_ERROR_LOG=/dev/stderr" \
  -e "KONG_ADMIN_LISTEN=0.0.0.0:8001" \
  -e "KONG_ADMIN_GUI_URL=http://localhost:8002" \
  -e KONG_LICENSE_DATA \
  -p 8000:8000 \
  -p 8443:8443 \
  -p 8001:8001 \
  -p 8444:8444 \
  -p 8002:8002 \
  -p 8445:8445 \
  -p 8003:8003 \
  -p 8004:8004 \
  kong/kong-gateway:2.8.1.2-alpine
```
### 1.8.5. Verificar su instalación
```console
curl -i http://localhost:8001/
//o mejor
curl -i -X GET --url http://localhost:8001/services
```
### 1.8.6. Verificar Kong Manager
- (No disponible en OSS) Verifique que Kong Manager se esté ejecutando accediendo a él usando la URL especificada en KONG_ADMIN_GUI_URL:
```text
http://localhost:8002
```
## 1.9. Referencia
- [docker](https://howtoforge.es/como-instalar-docker-en-debian-11/)
- [Kong-docker](https://docs.konghq.com/gateway/latest/install-and-run/docker/)
- [instaladores buen tutorial](https://elartedelcodigo.com/tutorials/docker/instalacion-de-docker)
