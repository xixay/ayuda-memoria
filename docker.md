# Docker
***
## instalar dependencias
1. Ejecuta el siguiente comando apt para instalar nuevas dependencias de paquetes.
```console
apt install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
```
## Añadir el repositorio docker
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
## Instalación de Docker en Debian 11
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
### Permitir el acceso a Docker a usuarios no root
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
## Comandos docker
- renombrar contenedor
```console
docker chasqui nuevoNombre
```
- borrar un contenedor
```console
docker rm chasqui
```
# Contenedor Postgres
1. Crear contenedor
```console
sudo docker --name chasqui -e POSTGRES_PASSWORD=postgres -d postgres:13.5
```
2. iniciar contenedor
```console
docker start chasqui
```
3. obtener la dirección <IP>, por donde corre el contenedor
```console
docker inspect chasqui
```
4. entrar a los comandos de postgres y editar
```console
psql -h IP -U postgres -W
contraseña:postgres
```
5. crear la base de datos
```console
CREATE DATABASE chasqui_db;
```
6. salir
```console
\q
```
## Comandos de postgres
1. entrar a los comandos de postgres y editar
```console
psql -h IP -U postgres -W
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
# Contenedor mongodb
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
## Comandos de mongodb
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
# Contenedor rabbit
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
## localhost de rabbit
1. Portal de administración http://localhost:15672/
2. usuario y password
```text
Username:guest
Password:guest
```