[<< INDICE](../README.md)
- [1. Gestión de Archivos en Linux](#1-gestión-de-archivos-en-linux)
  - [1.1. Ir a la dirección](#11-ir-a-la-dirección)
  - [1.2. Ver los permisos del archivo](#12-ver-los-permisos-del-archivo)
  - [1.3. Dar todos los permisos](#13-dar-todos-los-permisos)
  - [1.4. Editar el archivo](#14-editar-el-archivo)
    - [1.4.1. Editar con Gedit](#141-editar-con-gedit)
    - [1.4.2. Editar con Vim](#142-editar-con-vim)


# 1. Gestión de Archivos en Linux
## 1.1. Ir a la dirección
```text
rteran@agetic137:/etc/kong$ 
```
## 1.2. Ver los permisos del archivo
```console
ls -l kong.conf
```
## 1.3. Dar todos los permisos
```console
sudo chmod 777 kong.conf
```
## 1.4. Editar el archivo
**Para editar el archivo utilizando diferentes editores de texto:**
### 1.4.1. Editar con Gedit
- Se abrira el editor de texto, editar y guardar
```console
gedit kong.conf
```
### 1.4.2. Editar con Vim
- Para editar el archivo utilizando Vim:
```console
vim kong.conf
```
**En Vim, puedes usar los siguientes comandos principales:**
- Presiona i para entrar en modo de inserción y comenzar a editar.
- Cuando hayas terminado de editar, presiona Esc para salir del modo de inserción.
- Para guardar los cambios y salir, escribe :wq y presiona Enter.
**Con estos pasos, podrás manejar la edición y gestión de archivos en Linux utilizando diferentes métodos y editores de texto.**

[<< INDICE](../README.md)
