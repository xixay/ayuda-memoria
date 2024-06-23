[<< INDICE](../README.md)
- [1. Instalar node usando nvm(node  version manager)](#1-instalar-node-usando-nvmnode--version-manager)
- [2. Instalar una version en especifica Node.js](#2-instalar-una-version-en-especifica-nodejs)
- [3. Listar las versiones de node](#3-listar-las-versiones-de-node)
- [4. Para usar una version en especifica Node.js](#4-para-usar-una-version-en-especifica-nodejs)
- [5. Para usar una version lts con largo mantenimiento en especifica Node.js](#5-para-usar-una-version-lts-con-largo-mantenimiento-en-especifica-nodejs)
- [6. Eliminar una versión de Node.js](#6-eliminar-una-versión-de-nodejs)
- [7. Instalar Nvm en WSL2](#7-instalar-nvm-en-wsl2)
- [8. Referencia](#8-referencia)

## 1. Instalar node usando nvm(node  version manager)
- Instalar NVM en Ubuntu 20.04
```console
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
```
- Ahora vamos a activar la variable de entorno para NVM con el siguiente comando:
```console
source ~/.bashrc
```
- Ahora vamos a verificar que tengamos instalado NVM y funcionando.
```console
nvm --version
```
- Instalar Node.js en su última versión
```console
nvm install node
```
- Ahora comprobamos que tengamos Node.js y npm instalados.
```console
node --version | npm --version
```
## 2. Instalar una version en especifica Node.js
- Con el siguiente comando instalas la versión que quieras de Node JS:
```console
nvm install 17.9.1.
```
## 3. Listar las versiones de node
```console
nvm ls
```
## 4. Para usar una version en especifica Node.js
```console
nvm use v18
```
- Luego establece esta versión como predeterminada con el siguiente comando:
```console
nvm alias default v12.22.0
```
- Si abres una nueva terminal puedes verificar con el siguiente comando la versión por defecto
```console
node -v
```
## 5. Para usar una version lts con largo mantenimiento en especifica Node.js 
//INSTALAR
- Ver la version de node instalado
```console
node -v (muestra la version de node que esta ejm:v15.0.1)
```
- Imstalar la nueva que se quiere
```console
nvm install 18.17
```
- Instalar el lts si no se lo instalo
```console
nvm install  --lts
```
- usar el node de mayor duracion de mantenimiento
```console
nvm use --lts   ()  
```
## 6. Eliminar una versión de Node.js
```console
nvm uninstall 14.18.1
```
## 7. Instalar Nvm en WSL2
- Instala cURL
```console
sudo apt-get install curl
```
- Instala nvm con
```console
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
```
## 8. Referencia
- [Versiones de node](https://nodejs.org/es/download/releases/)
- [Comandos nvm node](https://franyerverjel.com/blog/como-establecer-la-version-predeterminada-de-node-con-nvm)
- [Instalar NVM en Ubuntu 20.04](https://gndx.dev/blog/instalar-nvm-en-ubuntu-20-04/)

[<< INDICE](../README.md)