- [1. Instalar node usando nvm(node  version manager)](#1-instalar-node-usando-nvmnode--version-manager)
- [2. Referencia](#2-referencia)

# 1. Instalar node usando nvm(node  version manager)
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
- Listar las versiones instaladas en tu computador:
```console
nvm use v13.0.0
```
# 2. Referencia
- [Versiones de node](https://nodejs.org/es/download/releases/)
- [Comandos nvm node](https://franyerverjel.com/blog/como-establecer-la-version-predeterminada-de-node-con-nvm)
