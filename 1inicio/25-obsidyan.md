- [1. Para instalar la versión Obsidian-1.6.7.AppImage en Ubuntu, sigue estos pasos:](#1-para-instalar-la-versión-obsidian-167appimage-en-ubuntu-sigue-estos-pasos)
  - [1.1. Descargar el archivo .AppImage](#11-descargar-el-archivo-appimage)
  - [1.2. Navegar al directorio donde se encuentra el archivo](#12-navegar-al-directorio-donde-se-encuentra-el-archivo)
  - [1.3. Dar permisos de ejecución al archivo .AppImage](#13-dar-permisos-de-ejecución-al-archivo-appimage)
  - [1.4. Ejecutar el archivo .AppImage](#14-ejecutar-el-archivo-appimage)
  - [1.5. Crear un acceso directo (opcional)](#15-crear-un-acceso-directo-opcional)
    - [1.5.1. Crea un archivo de escritorio en la siguiente ubicación:](#151-crea-un-archivo-de-escritorio-en-la-siguiente-ubicación)
    - [1.5.2. Añade el siguiente contenido al archivo:](#152-añade-el-siguiente-contenido-al-archivo)
    - [1.5.3. Guardar y cerrar](#153-guardar-y-cerrar)
    - [1.5.4. Ejecutar desde el menú](#154-ejecutar-desde-el-menú)
# 1. Para instalar la versión Obsidian-1.6.7.AppImage en Ubuntu, sigue estos pasos:
## 1.1. Descargar el archivo .AppImage
- Si ya tienes el archivo descargado, asegúrate de saber en qué directorio lo guardaste.
- Si no lo has descargado, puedes hacerlo desde la página oficial de Obsidian: https://obsidian.md/.
## 1.2. Navegar al directorio donde se encuentra el archivo
- Abre una terminal y navega al directorio donde está el archivo .AppImage. Si, por ejemplo, está en tu carpeta de Descargas, usa este comando:
```shell
cd ~/Descargas
```
## 1.3. Dar permisos de ejecución al archivo .AppImage
- El archivo .AppImage debe tener permisos de ejecución. Para otorgarle estos permisos, usa el siguiente comando:
```shell
chmod +x Obsidian-1.6.7.AppImage
```
## 1.4. Ejecutar el archivo .AppImage
- Ahora que tiene permisos de ejecución, puedes iniciar Obsidian ejecutando el siguiente comando:
```shell
./Obsidian-1.6.7.AppImage
```
## 1.5. Crear un acceso directo (opcional)
- Si deseas tener Obsidian accesible desde el menú de aplicaciones, puedes crear un acceso directo para facilitar su uso:
### 1.5.1. Crea un archivo de escritorio en la siguiente ubicación:
```shell
nano ~/.local/share/applications/obsidian.desktop
```
### 1.5.2. Añade el siguiente contenido al archivo:
```shell
[Desktop Entry]
Name=Obsidian
Exec=/home/xixay/Obsidian-1.6.7.AppImage
Icon=obsidian
Type=Application
Comment=Obsidian Note-taking app
Categories=Office;
Terminal=false
```
### 1.5.3. Guardar y cerrar
- Guarda el archivo (Ctrl + O y luego Enter), y luego sal del editor (Ctrl + X).
### 1.5.4. Ejecutar desde el menú
- Ahora deberías poder encontrar y ejecutar Obsidian desde el menú de aplicaciones de Ubuntu.
- ¡Eso es todo! Ahora tienes Obsidian instalado y listo para usar en tu sistema Ubuntu.
