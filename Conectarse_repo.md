# Creando Claves asimetricas
- Crear nuestra clave
```console
dev@dev:~$ ssh-keygen -t rsa
```
- En el directorio de nuestro usuario, /home/dev en mi caso, dispondremos de las claves en un subdirectorio llamado .ssh:
```console
dev@dev:~$ ls .ssh/
id_rsa  id_rsa.pub  known_hosts
```
```text
En este caso, como no le he especificado a ssh-keygen ningún nombre adicional, por defecto creó las claves con los nombres de id_rsa (privada) e id_rsa.pub (pública).
```
