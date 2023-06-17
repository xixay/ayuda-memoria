# Node
- [1. Instalar node usando nvm(node  version manager)](#1-instalar-node-usando-nvmnode--version-manager)
- [2. Referencia](#2-referencia)

# 1. Instalar node usando nvm(node  version manager)
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
- Con el siguiente comando instalas la versión que quieras de Node JS:
```console
nvm install 17.9.1.
```
- Listar las versiones de node
```console
nvm ls
```
- Para usar una version en especifica
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
- Eliminar una versión de Node.js
```console
nvm uninstall 14.18.1
```
# 2. Referencia
- [Versiones de node](https://nodejs.org/es/download/releases/)
- [Comandos nvm node](https://franyerverjel.com/blog/como-establecer-la-version-predeterminada-de-node-con-nvm)
- [Instalar NVM en Ubuntu 20.04](https://gndx.dev/blog/instalar-nvm-en-ubuntu-20-04/)
