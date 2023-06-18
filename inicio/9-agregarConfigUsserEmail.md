## Configuraciones De usuario y email
- Son el nombre de usuario y correo, de quien realizo el commit 
### Lista de configuraciones
- Para ver el usuario y correo registrados
```console
git config --list
```
### Agregar usuario global 
- El nombre de usuario global para todos los repositorios 
```console
git config --global user.name "rteran"
```
### Agregar correo global
- El correo de usuario global para todos los repositorios 
```console
git config --global user.email richard_teran@contraloria.gob.bo
```
### Para subir los repositorios
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
- Comprobar que este en ssh
```console
git remote -v
origin	git@github.com:xixay/ayuda-memoria.git (fetch) //descarga commits, archivos y referencias de un repositorio remoto a tu repositorio local
origin	git@github.com:xixay/ayuda-memoria.git (push)  //El envío es la forma de transferir confirmaciones desde tu repositorio local a un repo remoto
```