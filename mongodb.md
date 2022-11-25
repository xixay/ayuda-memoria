- [1. Mongo db](#1-mongo-db)
  - [1.1. Instalar](#11-instalar)
  - [1.2. Estados de mongodb](#12-estados-de-mongodb)
  - [1.3. Configurar la seguridad de MongoDB](#13-configurar-la-seguridad-de-mongodb)
  - [1.4. iniciar mongo](#14-iniciar-mongo)
  - [1.5. Comandos a ejecutar dentro de MongoDB](#15-comandos-a-ejecutar-dentro-de-mongodb)
  - [1.6. Actualizacion y desinstalacion](#16-actualizacion-y-desinstalacion)

# 1. Mongo db
***
## 1.1. Instalar
- Actualizar
```console
$>sudo apt update && sudo apt upgrade -y
```

- Verificar el estado de sudo en su cuenta:
```console
$>sudo whoami
```

- Instalar dependencias
```console
$>sudo apt install dirmngr gnupg apt-transport-https software-properties-common ca-certificates curl -y
```

- Importar repositorio de MongoDB
```console
$>wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -
$>echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/5.0 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list
```

- actualizar su apt-cache
```console
$>sudo apt-get update
```

- Instalar MongoDB en Debian
```console
$>sudo apt install mongodb-org
$>s(o yes)
```
- Para iniciar y activar MongoDB, use el siguiente comando
```console
$>sudo systemctl enable mongod --now
```
- Verifique la instalación probando la conexión de la base de datos y verifique la versión con el siguiente comando de terminal.
```console
$>mongo --eval 'db.runCommand({ connectionStatus: 1 })'
```
- Compruebe el estado del servicio de MongodB 5.0
```console
$>systemctl status mongod
```
## 1.2. Estados de mongodb
- iniciar MongoDB
```console
$>sudo systemctl start mongod
```
- detener MongoDB
```console
$>sudo systemctl stop mongod
```
- habilitar MongoDB al iniciar el sistema
```console
$>sudo systemctl enable mongod
```
- deshabilitar MongoDB al iniciar el sistema
```console
$>sudo systemctl disable mongod
```
- reiniciar el servicio MongoDB
```console
$>sudo systemctl restart mongod
```
## 1.3. Configurar la seguridad de MongoDB
- entrar a config
```console
$>sudo nano /etc/mongod.conf
```
- descomente la siguiente línea y agregue authorization: enabled
- ctrl+x
```console
$>sudo systemctl restart mongod
```
## 1.4. iniciar mongo
- ver estado mongo
```console
$>systemctl status mongod
```
- entrar a mongo
```console
$>mongo
```
## 1.5. Comandos a ejecutar dentro de MongoDB
- Crear bd
```console
$>use admin
```

- crear una nueva cuenta de usuario de Mongo. Para el tutorial, se hará un mongouser de usuario
```text
db.createUser(
{
user: "mongouser",
pwd: "PASSWORDCHANGE",
roles: [ { role: "userAdminAnyDatabase", db: "admin" } ]
}
)
```
- Recuerde, cambie el pwd: "PASSWORDCHANGE", no copie esto a ciegas sin editar primero y, opcionalmente, cambie el nombre del administrador si lo desea.
- salir de MongoDB
```console
$>quit()
```
- pruebe MongoDB con el estado de conexión de la nueva cuenta que creó.
- password=PASSWORDCHANGE
- La salida anterior indica que el usuario "mongouser" se ha conectado a la base de datos de administración. Esto es, por supuesto, solo una prueba. Puede cambiar el nombre de las bases de datos y cambiar el nombre de los usuarios como lo haría en el futuro.
- salir de MongoDB
```console
$>quit()
```
## 1.6. Actualizacion y desinstalacion
- actualizar MongoDB
```console
$>sudo apt update && sudo apt upgrade
```
- quitar (desinstalar) MongoDB
```console
$>sudo apt remove mongodb-org
$>sudo apt autoremove mongodb-org
$>sudo rm /etc/apt/sources.list.d/mongodb-org-5.0.list
```