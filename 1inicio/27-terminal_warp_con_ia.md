[<< INDICE](../README.md)
- [1. Instalar Warp](#1-instalar-warp)
- [2. Abrir Warp](#2-abrir-warp)
- [3. Hacerle un alias](#3-hacerle-un-alias)
- [4. Uso de Warp](#4-uso-de-warp)
- [5. Uso de Workflow](#5-uso-de-workflow)
- [6. Crear un nuevo workflow](#6-crear-un-nuevo-workflow)
- [7. Crea un proyecto](#7-crea-un-proyecto)

## 1. Instalar Warp
- Descargar Warp, desde la web oficial para linux
```bash
https://app.warp.dev/get_warp?package=appimage
```
- Dar permiso de ejecución
```bash
chmod +x Warp.AppImage
```
- Instalar FUSE2
```bash
sudo apt install libfuse2t64
```
- Ejecutarlo
```bash
./Warp-x86_64.AppImage
```
- (Opcional) Integrarlo al sistema
- Moverlo desde la carpeta de descargas
```bash
sudo mv Warp-x86_64.AppImage /opt/warp.AppImage
```
- Hazlo ejecutable
```bash
sudo chmod +x /opt/warp.AppImage
```
- Crear un launcher, acceso directo
```bash
sudo nano /usr/share/applications/warp.desktop
```
- Pegar el siguiente contenido
```bash
[Desktop Entry]
Name=Warp
Exec=/opt/warp.AppImage
Icon=utilities-terminal
Type=Application
Categories=Utility;TerminalEmulator;

```
- Guardar y cerrar
## 2. Abrir Warp
- En la terminal, abre Warp
```bash
/opt/warp.AppImage
```
- O puedes abrirlo desde el menu de Ubuntu
## 3. Hacerle un alias
- Abrir tu archivo de configuración de Zsh
```bash
nano ~/.zshrc
```
- Pegar el siguiente contenido
```bash
alias warp='/opt/warp.AppImage'
```
- Guardar y cerrar
- Reiniciar tu terminal
```bash
source ~/.zshrc
```
- Iniciar
```bash
warp
```

## 4. Uso de Warp
- Si es posible te pedira que te crees una cuenta o vincules con tu correo, para poder usarlo

![Terminal Warp](/5imagenes/warp/0.png)

- Uso de Warp

![Terminal Warp](/5imagenes/warp/1.png)

## 5. Uso de Workflow
- Uso de Workflow

![Terminal Warp](/5imagenes/warp/2.png)

- Papeleria de reciclaje

![Terminal Warp](/5imagenes/warp/3.png)

- Worckflow para encontrar en linea del mundo, con el comando
```bash
ctrl+shift+r
```

![Terminal Warp](/5imagenes/warp/4.png)

- Activar el modo ia, con el comando ctrl+i

![Terminal Warp](/5imagenes/warp/5.png)

- Escoger el modo ia, naturalmente esta en automatico

![Terminal Warp](/5imagenes/warp/6.png)

## 6. Crear un nuevo workflow
- Crear un nuevo workflow, donde se puede ejecutar una serie de comandos

![Terminal Warp](/5imagenes/warp/7.png)

- Usar el nuevo workflow recientemente creado, haciendo click o colocando su alias

![Terminal Warp](/5imagenes/warp/8.png)

- Ejecutar el workflow

![Terminal Warp](/5imagenes/warp/9.png)

## 7. Crea un proyecto
- Crea un nuevo proyecto ejemplo: En React

![Terminal Warp](/5imagenes/warp/10.png)

![Terminal Warp](/5imagenes/warp/11.png)
