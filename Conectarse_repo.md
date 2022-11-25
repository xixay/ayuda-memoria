- [1. Creando Claves asimetricas ssh](#1-creando-claves-asimetricas-ssh)
- [2. Subir clave GitHub](#2-subir-clave-github)
- [3. Obtener dirección SSH del repositorio](#3-obtener-dirección-ssh-del-repositorio)
- [4. Subir clave GitLab](#4-subir-clave-gitlab)
- [5. Obtener dirección SSH del repositorio](#5-obtener-dirección-ssh-del-repositorio)
- [6. Cambiar el remoto( https a ssh, o viceversa)](#6-cambiar-el-remoto-https-a-ssh-o-viceversa)
  - [6.1. Ver si esta en https o ssh](#61-ver-si-esta-en-https-o-ssh)
  - [6.2. Cambiar a ssh](#62-cambiar-a-ssh)
- [7. Referencia](#7-referencia)

# 1. Creando Claves asimetricas ssh
- Crear nuestra clave
```console
dev@dev:~$ ssh-keygen -t rsa
```
- En el directorio de nuestro usuario, /home/dev(o carpeta personal) en mi caso, dispondremos de las claves en un subdirectorio llamado .ssh (si no se visualiza en linux, apretar ctrl+h)
```console
dev@dev:~$ ls .ssh/
id_rsa  id_rsa.pub  known_hosts
```
- En este caso, como no le he especificado a ssh-keygen ningún nombre adicional, por defecto creó las claves con los nombres de id_rsa (privada) e id_rsa.pub (pública).
- Copiar el contenido del archivo id_rsa.pub
```txt
ssh-rsa AAAAB3NzaC1y.............................../ agetic@dagetic315
```
# 2. Subir clave GitHub
- Para subir la clave pública a GitHub iniciamos sesión, hacemos click en el avatar de nosotros,ingresamos a  Claves SSH (SSh and GPG keys).
- Esto nos mostrará una lista de las claves subidas con sus correspondientes nombres y datos de uso. En esta sección es posible eliminar las claves públicas ya subidas.
- Para subir una nueva clave ingresamos en New SSH Key
- En este formulario tendremos que pegar el contenido completo del archivo de nuestra clave pública [id_rsa.pub(que se encuentra en dev@dev:~/.ssh$ ) a menos que hayamos especificado otro nombre]. También es requerido un nombre para identificar esa clave de otras que puedan estar subidas al servidor. Este nombre puede indicar, por ejemplo, a que dispositivo((defecto dev@dev)) corresponde esta clave, de esta manera una vez que el dispositivo no esté más en uso sabremos cual clave pública ya no es necesaria.
# 3. Obtener dirección SSH del repositorio
- En GitHub vamos a code dentro del proyecto ingresando en Clone, luego a SSH
- Puede que nos diga lo sgte
```txt
No tienes ninguna clave SSH pública en tu cuenta de GitHub. Puede agregar una nueva clave pública o intentar clonar este repositorio a través de HTTPS.
Hacemos click en add a new public key y pegamos el contenido completo del archivo de nuestra clave pública (id_rsa.pub)
```
-  Si nos pide crear un public key copiamos la dirección correspondiente a SSH(git@github.com:xixay/react-frontend-repositorio.git).
```console
dev@dev:~/Documentos/Richard$ git clone git@github.com:xixay/react-frontend-repositorio.git
```
- Una ves clonado el repositorio, instalar el repositorio como se indica, y colocar el archivo .env(de configuracion)
# 4. Subir clave GitLab
- Para subir la clave pública a GitLab iniciamos sesión e ingresamos a la sección Preferencias en el menú superior derecho. Una vez adentro en el menú izquierdo ingresamos a  Claves SSH.
- Esta sección nos mostrará un formulario donde tendremos que pegar el contenido completo del archivo de nuestra clave pública (id_rsa.pub que se encuentra en dev@dev:~/.ssh$ ). También es requerido un nombre para identificar esa clave de otras que puedan estar subidas al servidor. Este nombre puede indicar, por ejemplo, a que dispositivo((defecto dev@dev)) corresponde esta clave, de esta manera una vez que el dispositivo no esté más en uso sabremos cual clave pública ya no es necesaria.
- Una opción extra que ofrece GitLab con respecto a Github es la de seleccionar una fecha de expiración para cada clave de manera que se vuelvan automáticamente invalidas después de esta fecha.
# 5. Obtener dirección SSH del repositorio
- En GitLab seguimos un proceso similar dentro del proyecto ingresando en Clone y copiando la dirección correspondiente a SSH(git@gitlab.agetic.gob.bo:message/agetic-sms-backend.git).
```console
dev@dev:~/Documentos/Richard$ git clone git@gitlab.agetic.gob.bo:message/agetic-sms-backend.git
```
- Una ves clonado el repositorio, instalar el repositorio como se indica, y colocar el archivo .env(de configuracion)
# 6. Cambiar el remoto( https a ssh, o viceversa)
## 6.1. Ver si esta en https o ssh
- Ejecutar
```console
git remote -v
```
- Se ve que esta en https
```txt
origin	https://github.com/xixay/json_server_repositorio.git (fetch)
origin	https://github.com/xixay/json_server_repositorio.git (push)
```
## 6.2. Cambiar a ssh
- Ejecutar, colocando la nueva url en ssh(estas empiezan por git@github.com:)
```console
git remote set-url origin git@github.com:xixay/json_server_repositorio.git
```
- Para comprobar
```console
git remote -v
```
# 7. Referencia
- [Creando las claves asimétricas](https://juncotic.com/ssh-conectarnos-sin-usar-contrasena/)
- [Conectarse a repositorios git con SSH](https://juncotic.com/repositorios-git-ssh/)
- [Cambiar el remoto](https://unipython.com/cambiar-url-remota-en-git/)
- [Cambiar el remoto pag Github](https://docs.github.com/es/get-started/getting-started-with-git/managing-remote-repositories#changing-a-remote-repositorys-url)
