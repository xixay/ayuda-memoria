# Para instalar la versión Obsidian-1.6.7.AppImage en Ubuntu, sigue estos pasos:
## Descargar el archivo .AppImage
- Si ya tienes el archivo descargado, asegúrate de saber en qué directorio lo guardaste.
- Si no lo has descargado, puedes hacerlo desde la página oficial de Obsidian: https://obsidian.md/.
## Navegar al directorio donde se encuentra el archivo
- Abre una terminal y navega al directorio donde está el archivo .AppImage. Si, por ejemplo, está en tu carpeta de Descargas, usa este comando:
```t
cd ~/Descargas
```
## Dar permisos de ejecución al archivo .AppImage
- El archivo .AppImage debe tener permisos de ejecución. Para otorgarle estos permisos, usa el siguiente comando:
```t
chmod +x Obsidian-1.6.7.AppImage
```
## Ejecutar el archivo .AppImage
- Ahora que tiene permisos de ejecución, puedes iniciar Obsidian ejecutando el siguiente comando:
```t
./Obsidian-1.6.7.AppImage
```
## Crear un acceso directo (opcional)
- Si deseas tener Obsidian accesible desde el menú de aplicaciones, puedes crear un acceso directo para facilitar su uso:
### Crea un archivo de escritorio en la siguiente ubicación:
```t
nano ~/.local/share/applications/obsidian.desktop
```
### Añade el siguiente contenido al archivo:
```t
[Desktop Entry]
Name=Obsidian
Exec=/home/xixay/Obsidian-1.6.7.AppImage
Icon=obsidian
Type=Application
Comment=Obsidian Note-taking app
Categories=Office;
Terminal=false
```
### Guardar y cerrar
- Guarda el archivo (Ctrl + O y luego Enter), y luego sal del editor (Ctrl + X).
### Ejecutar desde el menú
- Ahora deberías poder encontrar y ejecutar Obsidian desde el menú de aplicaciones de Ubuntu.
- ¡Eso es todo! Ahora tienes Obsidian instalado y listo para usar en tu sistema Ubuntu.
