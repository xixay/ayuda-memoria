[<< INDICE](../../README.md)

- [1. Rabbit](#1-rabbit)
  - [1.1. Añadir el repositorio de RabbitMQ](#11-añadir-el-repositorio-de-rabbitmq)
  - [1.2. Instalar el servidor RabbitMQ](#12-instalar-el-servidor-rabbitmq)
  - [1.3. Iniciar](#13-iniciar)
  - [1.4. Acceder al panel de control de RabbitMQ](#14-acceder-al-panel-de-control-de-rabbitmq)
  - [1.5. Para el servicio](#15-para-el-servicio)

# 1. Rabbit
## 1.1. Añadir el repositorio de RabbitMQ
- instala todas las dependencias
$>sudo apt-get install gnupg2 curl wget apt-transport-https software-properties-common -y
- descarga e instala el paquete del repositorio Erlang
$>wget https://packages.erlang-solutions.com/erlang/debian/pool/esl-erlang_23.1.5-1~debian~stretch_amd64.deb
$>sudo dpkg -i esl-erlang_23.1.5-1~debian~stretch_amd64.deb
- Si existen errores de dependencia
--------------------------------------
1. Instalar con correccion
```console
$>sudo apt-get install -f
$>s(o yes)
```
2. actualiza el repositorio Erlang e instala el paquete Erlang
```console
$>sudo apt-get update -y
$>sudo apt-get install erlang erlang-nox
$>s (o yes)
```
3. añade el repositorio de RabbitMQ
```console
$>sudo add-apt-repository 'deb http://www.rabbitmq.com/debian/ testing main'
$>wget -O- https://www.rabbitmq.com/rabbitmq-release-signing-key.asc | sudo apt-key add -
```
4. actualizar
```console
$>sudo apt-get update -y
```
## 1.2. Instalar el servidor RabbitMQ
- instalar el servidor RabbitMQ
```console
$>sudo apt-get install rabbitmq-server -y
```
- inicia el servicio RabbitMQ
```console
$>systemctl start rabbitmq-server
```
- pide autenticacion password=rteran
- habilitar el servicio RabbitMQ
```console
$>systemctl enable rabbitmq-server
```
- pide autenticacion password=rteran 3 veces
- comprobar el estado del servicio RabbitMQ
```console
$>systemctl status rabbitmq-server
```


- salir
```console
$>q
```
## 1.3. Iniciar
- crear usuario "admin"
```console
$>sudo rabbitmqctl add_user admin password
```
- establece una etiqueta para tu cuenta de administrador
```console
$>sudo rabbitmqctl set_user_tags admin administrator
```
- establece el permiso adecuado
```console
$>sudo rabbitmqctl set_permissions -p / admin ".*" ".*" ".*"
```
- habilita la consola de gestión de RabbitMQ
```console
$>sudo rabbitmq-plugins enable rabbitmq_management
```
## 1.4. Acceder al panel de control de RabbitMQ
- la consola web de RabbitMQ escucha en el puerto 15672
```console
$>ss -antpl | grep 15672
```
- En el navegador
http://localhost:15672/
- Datos
```text
Username=admin
Password=password
```
## 1.5. Para el servicio
```console
 systemctl stop rabbitmq-server
```

[<< INDICE](../../README.md)