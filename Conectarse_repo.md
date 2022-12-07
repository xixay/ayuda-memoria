- [1. Creando Claves asimetricas ssh linux](#1-creando-claves-asimetricas-ssh-linux)
- [2. Subir clave ssh creada en linux a GitHub](#2-subir-clave-ssh-creada-en-linux-a-github)
- [3. Creando Claves asimetricas ssh windows](#3-creando-claves-asimetricas-ssh-windows)
- [4. Subir clave ssh creada en windows a GitHub](#4-subir-clave-ssh-creada-en-windows-a-github)
- [5. Creando Claves asimetricas ssh en wsl2 de windows](#5-creando-claves-asimetricas-ssh-en-wsl2-de-windows)
- [6. Subir clave ssh creada en wsl2 de windows a GitHub](#6-subir-clave-ssh-creada-en-wsl2-de-windows-a-github)
- [7. Subir clave ssh creada en wsl2 de windows a GitLab](#7-subir-clave-ssh-creada-en-wsl2-de-windows-a-gitlab)
- [8. Obtener dirección SSH del repositorio en GitHub](#8-obtener-dirección-ssh-del-repositorio-en-github)
- [9. Subir clave GitLab](#9-subir-clave-gitlab)
- [10. Obtener dirección SSH del repositorio](#10-obtener-dirección-ssh-del-repositorio)
- [11. Cambiar el remoto( https a ssh, o viceversa)](#11-cambiar-el-remoto-https-a-ssh-o-viceversa)
  - [11.1. Ver si esta en https o ssh](#111-ver-si-esta-en-https-o-ssh)
  - [11.2. Cambiar a ssh](#112-cambiar-a-ssh)
- [12. Referencia](#12-referencia)

# 1. Creando Claves asimetricas ssh linux
- Crear nuestra clave
```console
dev@dev:~$ ssh-keygen -t rsa
```
- En el directorio de nuestro usuario, /home/dev(o carpeta personal) en mi caso, dispondremos de las claves en un subdirectorio llamado .ssh (si no se visualiza en linux, apretar ctrl+h)
```console
ls .ssh/
id_rsa  id_rsa.pub  known_hosts //respuesta
```
- En este caso, como no le he especificado a ssh-keygen ningún nombre adicional, por defecto creó las claves con los nombres de id_rsa (privada) e id_rsa.pub (pública).
- Copiar el contenido del archivo id_rsa.pub y añadirlo a GitHub
```txt
ssh-rsa AAAAB3NzaC1y.............................../ agetic@dagetic315
```
# 2. Subir clave ssh creada en linux a GitHub
- Para subir la clave pública a GitHub iniciamos sesión en https://github.com/, hacemos click en el avatar de nosotros, despues en settings ingresamos a  Claves SSH (SSh and GPG keys).
- Esto nos mostrará una lista de las claves subidas con sus correspondientes nombres y datos de uso. En esta sección es posible eliminar las claves públicas ya subidas.
- Para subir una nueva clave ingresamos en New SSH Key
- En este formulario tendremos que pegar el contenido completo del archivo de nuestra clave pública id_rsa.pub(que se encuentra en .ssh). También es requerido un nombre para identificar esa clave de otras que puedan estar subidas al servidor. Este nombre puede indicar, por ejemplo, a que dispositivo(compuXixayLinux) corresponde esta clave, de esta manera una vez que el dispositivo no esté más en uso sabremos cual clave pública ya no es necesaria.
# 3. Creando Claves asimetricas ssh windows
- Apretar windows + git bash(Sacar la terminal de git)
- Comprobar si tenemos llaves ssh, si no tiene crear la carpeta
```console
ls -a ~/.ssh
./  ../  known_hosts//respuesta
```
- Si no tiene generar la llave ssh
```console
ssh-keygen -t ed25519 -C "xixay2013@gmail.com"
```
- Despues de 3 a 4 enters, se generara las claves privadas y publicas, para comprobar
```console
ls -a ~/.ssh
./  ../  id_ed25519  id_ed25519.pub  known_hosts//respuesta
```
```txt
clave privada=id_ed25519
clave publica=id_ed25519.pub
```
- Luego ejecutar el sgte comando
```console
eval "$(ssh-agent)"
```
- Luego se obtendra
```txt
Agent pid 1751
```
- Despues agregar la entidad al ssh 
```console
ssh-add ~/.ssh/id_ed25519
```
- Si se obtiene lo sgte esta bien
```console
$ ssh-add ~/.ssh/id_ed25519
Identity added: /c/Users/DELL/.ssh/id_ed25519 (xixay2013@gmail.com)
```
- Copiar el contenido de la clave publica ssh id_ed25519.pub y añadirlo a  GitHub
- Para copiar el contenido de la clave publica ssh id_ed25519.pub(osea tenerlo en el porta papeles), ejecutar
```console
clip < ~/.ssh/id_ed25519.pub
```
```txt
ssh-ed25519 AAAAC3NzaC1lZDI1NTE.....................qulhciQbf2WL xixay2013@gmail.com
```
# 4. Subir clave ssh creada en windows a GitHub
- Para subir la clave pública a GitHub iniciamos sesión en https://github.com/, hacemos click en el avatar de nosotros, despues en settings ingresamos a  Claves SSH (SSh and GPG keys).
- Esto nos mostrará una lista de las claves subidas con sus correspondientes nombres y datos de uso. En esta sección es posible eliminar las claves públicas ya subidas.
- Para subir una nueva clave ingresamos en New SSH Key
- En este formulario tendremos que pegar el contenido completo del archivo de nuestra clave pública id_ed25519.pub(que se encuentra en .ssh). También es requerido un nombre para identificar esa clave de otras que puedan estar subidas al servidor. Este nombre puede indicar, por ejemplo, a que dispositivo(compuXixayWindows) corresponde esta clave, de esta manera una vez que el dispositivo no esté más en uso sabremos cual clave pública ya no es necesaria.
# 5. Creando Claves asimetricas ssh en wsl2 de windows
- Ingresar a la terminal wsl2 de distribución de linux(ubuntu)
- Crear por consola las claves ssh
```console
ssh-keygen -t ed25519 -C "xixay2013@gmail.com"
```
- En el directorio de nuestro usuario, /home/dev(o carpeta personal) en mi caso, dispondremos de las claves en un subdirectorio llamado .ssh (si no se visualiza en linux, apretar ctrl+h)
```console
ls .ssh/
id_ed25519  id_ed25519.pub known_hosts  known_hosts.old //respuesta
```
- En este caso, como no le he especificado a ssh-keygen ningún nombre adicional, por defecto creó las claves con los nombres de id_ed25519 (privada) e id_ed25519.pub (pública).
- Ir a la carpta .ssh y copiar la clave publica
```console
cd
cd .ssh
code id_ed25519.pub
```
- Copiar el contenido del archivo id_ed25519.pub y añadirlo a GitHub
```txt
ssh-ed25519 AAAAC3NzaC1l........QCHKB xixay2013@gmail.com
```
- Agregar la clave privada a el agente ssh
```console
eval "$(ssh-agent -s)"
Agent pid 944 // respuesta
```
```console
ssh-add ~/.ssh/id_ed25519
Identity added: /home/xixay/.ssh/id_ed25519 (xixay2013@gmail.com) // respuesta
```
- Configuración de GitHub para el subsistema de windows para linux, debe asegurarse de informarle a su entorno de windows linux, sobre su perfil de gitHuib, proporcionandole un usuario y correo
```console
git config --global user.name "xixay"
git config --global user.email "xixay2013@gmail.com"
``` 
# 6. Subir clave ssh creada en wsl2 de windows a GitHub
- Para subir la clave pública a GitHub iniciamos sesión en https://github.com/, hacemos click en el avatar de nosotros, despues en settings ingresamos a  Claves SSH (SSh and GPG keys).
- Esto nos mostrará una lista de las claves subidas con sus correspondientes nombres y datos de uso. En esta sección es posible eliminar las claves públicas ya subidas.
- Para subir una nueva clave ingresamos en New SSH Key
- En este formulario tendremos que pegar el contenido completo del archivo de nuestra clave pública id_ed25519.pub(que se encuentra en .ssh). También es requerido un nombre para identificar esa clave de otras que puedan estar subidas al servidor. Este nombre puede indicar, por ejemplo, a que dispositivo(compuXixayWsl2) corresponde esta clave, de esta manera una vez que el dispositivo no esté más en uso sabremos cual clave pública ya no es necesaria.
# 7. Subir clave ssh creada en wsl2 de windows a GitLab
- Para subir la clave pública a GitHub iniciamos sesión en https://gitlab.com/users/sign_in, hacemos click en el avatar de nosotros, despues en preferencias ingresamos a  Claves SSH.
- Esto nos mostrará una lista de las claves subidas con sus correspondientes nombres y datos de uso. En esta sección es posible eliminar las claves públicas ya subidas.
- Para subir una nueva clave pegamos el contenido completo del archivo de nuestra clave pública id_ed25519.pub(que se encuentra en .ssh). También es requerido un Title para identificar esa clave de otras que puedan estar subidas al servidor. Este nombre puede indicar, por ejemplo, a que dispositivo(compuXixayWsl2) corresponde esta clave, de esta manera una vez que el dispositivo no esté más en uso sabremos cual clave pública ya no es necesaria.
# 8. Obtener dirección SSH del repositorio en GitHub
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
# 9. Subir clave GitLab
- Para subir la clave pública a GitLab iniciamos sesión e ingresamos a la sección Preferencias en el menú superior derecho. Una vez adentro en el menú izquierdo ingresamos a  Claves SSH.
- Esta sección nos mostrará un formulario donde tendremos que pegar el contenido completo del archivo de nuestra clave pública (id_rsa.pub que se encuentra en dev@dev:~/.ssh$ ). También es requerido un nombre para identificar esa clave de otras que puedan estar subidas al servidor. Este nombre puede indicar, por ejemplo, a que dispositivo((defecto dev@dev)) corresponde esta clave, de esta manera una vez que el dispositivo no esté más en uso sabremos cual clave pública ya no es necesaria.
- Una opción extra que ofrece GitLab con respecto a Github es la de seleccionar una fecha de expiración para cada clave de manera que se vuelvan automáticamente invalidas después de esta fecha.
# 10. Obtener dirección SSH del repositorio
- En GitLab seguimos un proceso similar dentro del proyecto ingresando en Clone y copiando la dirección correspondiente a SSH(git@gitlab.agetic.gob.bo:message/agetic-sms-backend.git).
```console
dev@dev:~/Documentos/Richard$ git clone git@gitlab.agetic.gob.bo:message/agetic-sms-backend.git
```
- Una ves clonado el repositorio, instalar el repositorio como se indica, y colocar el archivo .env(de configuracion)
# 11. Cambiar el remoto( https a ssh, o viceversa)
## 11.1. Ver si esta en https o ssh
- Ejecutar
```console
git remote -v
```
- Se ve que esta en https
```txt
origin	https://github.com/xixay/json_server_repositorio.git (fetch)
origin	https://github.com/xixay/json_server_repositorio.git (push)
```
## 11.2. Cambiar a ssh
- Ejecutar, colocando la nueva url en ssh(estas empiezan por git@github.com:)
```console
git remote set-url origin git@github.com:xixay/json_server_repositorio.git
```
- Para comprobar
```console
git remote -v
```
# 12. Referencia
- [Creando las claves asimétricas](https://juncotic.com/ssh-conectarnos-sin-usar-contrasena/)
- [Conectarse a repositorios git con SSH](https://juncotic.com/repositorios-git-ssh/)
- [Cambiar el remoto](https://unipython.com/cambiar-url-remota-en-git/)
- [Cambiar el remoto pag Github](https://docs.github.com/es/get-started/getting-started-with-git/managing-remote-repositories#changing-a-remote-repositorys-url)
- [Crear claves asimetricas en windows](https://www.youtube.com/watch?v=g0ZV-neSM7E)
- [Crear claves asimetricas en wsl2 de windows](https://m.youtube.com/watch?v=Xi_2Cu8z2d0)
