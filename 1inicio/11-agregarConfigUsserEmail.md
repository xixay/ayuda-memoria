[<< INDICE](../README.md)
- [1. Configuraciones De usuario y email para GIT](#1-configuraciones-de-usuario-y-email-para-git)
  - [1.1. Lista de configuraciones](#11-lista-de-configuraciones)
  - [1.2. Agregar usuario global](#12-agregar-usuario-global)
  - [1.3. Agregar correo global](#13-agregar-correo-global)
  - [1.4. Para subir los repositorios](#14-para-subir-los-repositorios)

## 1. Configuraciones De usuario y email para GIT
- Son el nombre de usuario y correo, de quien realizo el commit 
### 1.1. Lista de configuraciones
- Para ver el usuario y correo registrados
```console
git config --list
```
### 1.2. Agregar usuario global 
- El nombre de usuario global para todos los repositorios 
```console
git config --global user.name "rteran"
```
### 1.3. Agregar correo global
- El correo de usuario global para todos los repositorios 
```console
git config --global user.email richard_teran@contraloria.gob.bo
```
### 1.4. Para subir los repositorios
- Comprobar que esta en gitg@github y no en https
```console
git remote -v
origin	https://github.com/xixay/ayuda-memoria.git (fetch) //descarga commits, archivos y referencias de un repositorio remoto a tu repositorio local
origin	https://github.com/xixay/ayuda-memoria.git (push)  //El envío es la forma de transferir confirmaciones desde tu repositorio local a un repo remoto
```
| Debe estar | No debe estar |
|------------|---------------|
| (ssh)      | (https)       |
- Para cambiar a ssh si esta en https
```console
git remote set-url origin git@github.com:xixay/ayuda-memoria.git
```
- Comprobar que este en ssh: 
```console
git remote -v
```
- Respuestas:
  - descarga commits, archivos y referencias de un repositorio remoto a tu repositorio local
    ```console
    origin	git@github.com:xixay/ayuda-memoria.git (fetch)
    ```
  - El envío es la forma de transferir confirmaciones desde tu repositorio local a un repo remoto
    ```console
    origin	git@github.com:xixay/ayuda-memoria.git (push)
    ```
[<< INDICE](../README.md)