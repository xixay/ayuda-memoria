[<< INDICE](../README.md)
- [1. Ver todos los puertos que estan siendo usados](#1-ver-todos-los-puertos-que-estan-siendo-usados)
- [2. Ver un puerto en especifico](#2-ver-un-puerto-en-especifico)
- [3. Matar el puerto 7008, mediante su PID](#3-matar-el-puerto-7008-mediante-su-pid)

## 1. Ver todos los puertos que estan siendo usados
- Ver todos los puertos
```cmd
netstat -plntu
```
- Puertos que se visualizan
```cmd
(No todos los procesos pueden ser identificados, no hay información de propiedad del proceso
 no se mostrarán, necesita ser superusuario para verlos todos.)
Conexiones activas de Internet (solo servidores)
Proto  Recib Enviad Dirección local         Dirección remota       Estado       PID/Program name    
tcp        0      0 0.0.0.0:5432            0.0.0.0:*               ESCUCHAR    -                   
tcp        0      0 127.0.0.1:8828          0.0.0.0:*               ESCUCHAR    24141/Code --standa 
```
## 2. Ver un puerto en especifico
```cmd
netstat -plntu | grep 7008
```
- Puerto que se visualizan (PID=2112143, el cual es mio siendo usado)
```cmd
tcp6    0   0:::7008      :::*    LISTEN    2112143/node
```
## 3. Matar el puerto 7008, mediante su PID
```cmd
kill -9 2112143
```
**![Matar Puertos](/5imagenes/puertos/puerto.png)**
[<< INDICE](../README.md)