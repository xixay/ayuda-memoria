[<< INDICE](../README.md)

- [1. Instalar tmux](#1-instalar-tmux)
- [2. Instalar Vmin](#2-instalar-vmin)
  - [2.1. Utilizar vim para editar un archivo](#21-utilizar-vim-para-editar-un-archivo)
- [3. Instalar tmux resurrection(Recuperar la sesión despues del reinicio)](#3-instalar-tmux-resurrectionrecuperar-la-sesión-despues-del-reinicio)
  - [3.1. Clonar el repositorio](#31-clonar-el-repositorio)
  - [3.2. Obtener la dirección path](#32-obtener-la-dirección-path)
  - [3.3. Crear o modificar el archivo de modificación](#33-crear-o-modificar-el-archivo-de-modificación)
- [4. Instalar Tmux plugings](#4-instalar-tmux-plugings)
  - [4.1. Comandos de Tmux plugings](#41-comandos-de-tmux-plugings)
- [5. Instalando complementos](#5-instalando-complementos)
  - [5.1. Complementos para instalar](#51-complementos-para-instalar)
    - [5.1.1. Comandos de busqueda de copy cat](#511-comandos-de-busqueda-de-copy-cat)
    - [5.1.2. Para copiar y pegar](#512-para-copiar-y-pegar)
    - [5.1.3. Para copiar lo de tmux, en otro editor de texto](#513-para-copiar-lo-de-tmux-en-otro-editor-de-texto)
- [6. Iniciar tmux (Sesión por defecto)](#6-iniciar-tmux-sesión-por-defecto)
- [7. Sesión](#7-sesión)
- [8. Ventana](#8-ventana)
- [9. Paneles](#9-paneles)
- [10. Comandos de Tmux](#10-comandos-de-tmux)
  - [10.1. Mouse](#101-mouse)
  - [10.2. Paaneles](#102-paaneles)
  - [10.3. Sesiones](#103-sesiones)
  - [10.4. Otros Comandos](#104-otros-comandos)
- [11. Referencia](#11-referencia)

## 1. Instalar tmux
- Instalar tmux
```console
sudo apt-get install tmux
```
## 2. Instalar Vmin
- Editor de archivos
```console
sudo apt install vim
```
### 2.1. Utilizar vim para editar un archivo

| **Comando**         | **Accion**                                           |
|---------------------|------------------------------------------------------|
| vi .tmux.conf       | Editar archivo                                       |
| apretar i           | Para insertar datos en el archivo, en forma de texto |
| esc \| :w \| enter  | Para guardar                                         |
| esc \| :q \| enter  | Para salir                                           |
| esc \| :wq \| enter | Para guardar y salir al mismo tiempo                 |
## 3. Instalar tmux resurrection(Recuperar la sesión despues del reinicio)
### 3.1. Clonar el repositorio
- Clonar en la carpeta personal
```console
git clone https://github.com/tmux-plugins/tmux-resurrect
```
- Comprobar si esta la carpeta tmux-resurrect
```console
la tmux-resurrect
```
### 3.2. Obtener la dirección path
- Ingresar a tmux-resurrect
```console
cd tmux-resurrect
```
- obtener la direccion de la carpeta
```console
pwd
/home/xixay/tmux-resurrect    // respuesta
```
- volver a la carpeta personal
```console
cd
```
### 3.3. Crear o modificar el archivo de modificación
- crear el archivo .tmux.conf con Vim
```console
vi .tmux.conf
```
- Copiar lo siguiente y guardar
```txt
run-shell /home/xixay/tmux-resurrect/resurrect.tmux
```
- para guardar en vim
```
esc | :wq
```
- Luego de guardar recargar, para que se pueda usar
```console
tmux source-file ~/.tmux.conf
```
## 4. Instalar Tmux plugings
- Descargar el repositorio
```console
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
- Editar el archivo de configuracion tmux
```console
vi .tmux.conf
```
- Copiar lo siguiente y guardar
```txt
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
run '~/.tmux/plugins/tpm/tpm'
```
- Luego de guardar recargar, para que se pueda usar
```console
tmux source-file ~/.tmux.conf
```
### 4.1. Comandos de Tmux plugings

| **Comando**     | **Accion**                                                                                           |
|-----------------|------------------------------------------------------------------------------------------------------|
| ctrl+B \| I     | Instala nuevos complementos de GitHub o cualquier otro repositorio de git. Actualiza el entorno TMUX |
| ctrl+B \| U     | Actualiza los complementos                                                                           |
| ctrl+B \| alt+u | Eliminar/desinstalar complementos que no están en la lista de complementos                           |
## 5. Instalando complementos
- Editar el archivo de configuracion tmux
```console
vi .tmux.conf
```
- Copiar su instalador y guardar 
```txt
set set -g (Complemento)
```
- Usar Tmux plugings manager para instalar ctrl+B | I, apretar comando, para instalar
### 5.1. Complementos para instalar

| **Comando**                                                                               | **Accion**                                                                                                      |
|-------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------|
| set -g @plugin 'tmux-plugins/tmux-yank'                                                   | complemento para copiar desde terminal                                                                          |
| set -g @plugin 'seebi/tmux-colors-solarized' set -g @colors-solarized 'base16'            | complemento para agregar temas                                                                                  |
| set -g @plugin 'tmux-plugins/tmux-prefix-highlight'                                       | complemento para que al apretar ctrl + B, identifique                                                           |
| set -g @plugin 'erikw/tmux-powerline'                                                     | complemento para que le brinde una barra de estado de línea eléctrica hábil y pirateable que consta de segmento |
| set -g mouse on                                                                           | complemento para usar el mouse                                                                                  |
| set -g @plugin 'noscript/tmux-mighty-scroll'                                              | complemento para scroll de mouse                                                                                |
| set -g mouse-resize-pane on                                                               | complemento para redimensionar paneles con el mouse                                                             |
| set -g @plugin 'tmux-plugins/tmux-resurrect' set -g @plugin 'tmux-plugins/tmux-continuum' | complemento para guardado y restauración continua de Tmux                                                       |
| set -g @plugin 'tmux-plugins/tmux-copycat'                                                | complemento para busqueda en Tmux                                                                               |
| set -g mode-keys vi                                                                       | modo de copia de Tmux                                                                                           |
#### 5.1.1. Comandos de busqueda de copy cat
| **Comando**       | **Accion**                                                                               |
|-------------------|------------------------------------------------------------------------------------------|
| ctrl+B \| shift+/ | búsqueda simple de archivos                                                              |
| ctrl+B \| ctrl+g  | saltar sobre los archivos de estado de g it (mejor usado después git status del comando) |
| ctrl+B \| alt+h   | saltando sobre hashes SHA-1/SHA-256 (mejor usado después git log del comando)            |
| ctrl+B \| ctrl+u  | Búsqueda de direcciones URL (URL http, ftp y git)                                        |
| ctrl+B \| ctrl+d  | Búsqueda de número (nemotécnico d, como dígito)                                          |
| ctrl+B \| alt+i   | Búsqueda de direcciones IP                                                               |

#### 5.1.2. Para copiar y pegar

| **Comando**                                                          | **Accion**                      |
|----------------------------------------------------------------------|---------------------------------|
| mover el mouse, o aprete ctrl+B \| [                                 | para entrar en el modo de copia |
| mantenga presionado la tecla space, y mueva a la derecha o izquierda | seleccionar el texto            |
| apretar enter                                                        | copiar el texto                 |
| ctrl+B \| ]                                                          | pegar el texto                  |
#### 5.1.3. Para copiar lo de tmux, en otro editor de texto
- Instalar
```console
sudo apt-get install xclip
```
- Seleccionar lo que se desea copiar manteniendo la tecla space, copiar con enter
- Para llevarlo al porta papeles del sistema
```console
tmux show-buffer | xclip -selection clipboard
```
- Para pegar en un bloc de notas
```console
ctrl + v
```
## 6. Iniciar tmux (Sesión por defecto)
```console
tmux
```
## 7. Sesión
- Estando en Tmux

| **Comando** | **Accion**                                               |
|-------------|----------------------------------------------------------|
| ctrl+B \| S | Muestra todas las sesiones y cambia de una sesión a otra |
| ctrl+B \| $ | Cambiar el nombre de la sesión actual                    |
| ctrl+B \| D | Separa la sesión (“detach”) y la mueve a segundo plano   |
## 8. Ventana
- Estando en Tmux

| **Comando**              | **Accion**                                                                                                                            |
|--------------------------|---------------------------------------------------------------------------------------------------------------------------------------|
| ctrl+B \| c              | Crear nueva ventana(Las ventanas se llaman zsh(defecto), el * indica en que ventana esta) pe: 0:zsh- 1:zsh- 2:zsh*  ( esta ventana 3) |
| ctrl+B \| ,              | Cambiar el nombre de la ventana y luego enter                                                                                         |
| ctrl+B \| p              | Ventana anterior                                                                                                                      |
| ctrl+B \| n              | Ventana siguiente                                                                                                                     |
| ctrl+B \| w              | Listar sesiones y Ventanas                                                                                                            |
| ctrl+B \| &              | Cerrar la ventana actual ventanas la (confirmar con y)                                                                                |
| ctrl+B \| 1, 2, 3, (...) | Saltar a la ventana z                                                                                                                 |
## 9. Paneles

| **Comando**                                   | **Accion**                                             |
|-----------------------------------------------|--------------------------------------------------------|
| ctrl+B \| %                                   | Dividir en 2 partes verticales                         |
| ctrl+B \| "                                   | Dividir en 2 partes horizontales                       |
| ctrl+B \| x                                   | Cerrar el panel actual                                 |
| ctrl+B \| (izquierda, derecha, arriba, abajo) | Navegar entre los paneles                              |
| ctrl+B \| h                                   | saltar al panel izquierdo                              |
| ctrl+B \| i                                   | saltar al panel de la derecha                          |
| ctrl+B \| j                                   | saltar al panel inferior                               |
| ctrl+B \| k                                   | saltar al panel superior                               |
| ctrl+B \| P                                   | mostrar el número de paneles                           |
| ctrl+B \| O                                   | navegar cronológicamente por todos los paneles         |
| ctrl+B \| }                                   | cambiar el panel actual por los siguientes             |
| ctrl+B \| {                                   | intercambiar el panel actual con el anterior           |
| ctrl+B \| Barra espaciadora                   | cambiar entre las divisiones de los paneles            |
| ctrl+B \| !                                   | separar el panel actual y abrirlo en una nueva ventana |
## 10. Comandos de Tmux
- Para entrar a comandos de Tmux
```txt
ctrl+B | :
```
### 10.1. Mouse

| **Comando**            | **Accion**              |
|------------------------|-------------------------|
| set-option -g mouse on | Para habilitar el mouse |
### 10.2. Paaneles

| **Comando**           | **Accion**                                            |
|-----------------------|-------------------------------------------------------|
| split-window -h       | Dividir verticalmente                                 |
| resize-pane -D        | Mueve la línea divisoria entre paneles hacia abajo    |
| resize-pane -U        | Mueve la línea divisoria entre paneles hacia arriba.  |
| resize-pane -R        | Mueve la línea divisoria entre paneles a la derecha.  |
| resize-pane -L        | Mueve la línea divisoria entre paneles a la izquierda |
| resize-pane -U 10     | Mover la línea divisoria 10 celdas hacia arriba       |
| resize-pane -t 2 -R 5 | Mover la línea divisoria 5 celdas a la derecha        |
### 10.3. Sesiones

| **Comando**            | **Accion**          |
|------------------------|---------------------|
| new -s nombreSesion    | Inicia nueva sesion |
| list-sessions          | lista las sesiones  |
| kill-session -t z      | elimina la sesion z |
| attach -t nombreSesion | Ir a esa sesion     |
### 10.4. Otros Comandos

| **Comando**                                                                                               | **Accion**                                                          |
|-----------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------|
| ctrl+B \| ?                                                                                               | muestra las combinaciones de teclas activas (área de ayuda abierta) |
| ctrl+B \| [   , luego usar las teclas arriba y abajo                                                      | desplazarse en el modo copia con las teclas de arriba y abajo       |
| ctrl+B \| [   , luego apretar "g", luego ingresar el numero de linea, y apretar enter, y sera a esa linea | para ir a una linea determinada en el modo copia                    |
## 11. Referencia
- [Tmux](https://www.youtube.com/watch?v=BHhA_ZKjyxo)
- [Otro Tmux](https://www.youtube.com/watch?v=Yl7NFenTgIo)

[<< INDICE](../README.md)
