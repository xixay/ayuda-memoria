- [1. Instalar tmux](#1-instalar-tmux)
- [2. Instalaciones necesarias](#2-instalaciones-necesarias)
  - [2.1. Instalar Vmin](#21-instalar-vmin)
    - [2.1.1. Utilizar vim para editar un archivo](#211-utilizar-vim-para-editar-un-archivo)
  - [2.2. Instalar tmux resurrection(Recuperar la sesión despues del reinicio)](#22-instalar-tmux-resurrectionrecuperar-la-sesión-despues-del-reinicio)
    - [2.2.1. Clonar el repositorio](#221-clonar-el-repositorio)
    - [2.2.2. Obtener la dirección path](#222-obtener-la-dirección-path)
    - [2.2.3. Crear o modificar el archivo de modificación](#223-crear-o-modificar-el-archivo-de-modificación)
  - [2.3. Instalar Tmux plugings](#23-instalar-tmux-plugings)
    - [2.3.1. Comandos de Tmux plugings](#231-comandos-de-tmux-plugings)
- [3. Instalando complementos](#3-instalando-complementos)
  - [3.1. Agregar complemento para copiar desde terminal](#31-agregar-complemento-para-copiar-desde-terminal)
    - [3.1.1. Usar Tmux plugings manager para instalar](#311-usar-tmux-plugings-manager-para-instalar)
  - [3.2. Agregar complemento para agregar temas](#32-agregar-complemento-para-agregar-temas)
    - [3.2.1. Usar Tmux plugings manager para instalar](#321-usar-tmux-plugings-manager-para-instalar)
  - [3.3. Agregar complemento para que al apretar ctrl + B, identifique](#33-agregar-complemento-para-que-al-apretar-ctrl--b-identifique)
    - [3.3.1. Usar Tmux plugings manager para instalar](#331-usar-tmux-plugings-manager-para-instalar)
  - [3.4. Agregar complemento para que le brinde una barra de estado de línea eléctrica hábil y pirateable que consta de segmento](#34-agregar-complemento-para-que-le-brinde-una-barra-de-estado-de-línea-eléctrica-hábil-y-pirateable-que-consta-de-segmento)
    - [3.4.1. Usar Tmux plugings manager para instalar](#341-usar-tmux-plugings-manager-para-instalar)
  - [3.5. Agregar complemento para usar el mouse](#35-agregar-complemento-para-usar-el-mouse)
    - [3.5.1. Usar Tmux plugings manager para instalar](#351-usar-tmux-plugings-manager-para-instalar)
  - [3.6. Agregar complemento para scroll de mouse](#36-agregar-complemento-para-scroll-de-mouse)
    - [3.6.1. Usar Tmux plugings manager para instalar](#361-usar-tmux-plugings-manager-para-instalar)
  - [3.7. Agregar complemento para redimensionar paneles con el mouse](#37-agregar-complemento-para-redimensionar-paneles-con-el-mouse)
    - [3.7.1. Usar Tmux plugings manager para instalar](#371-usar-tmux-plugings-manager-para-instalar)
  - [3.8. Agregar complemento para guardado y restauración continua de Tmux](#38-agregar-complemento-para-guardado-y-restauración-continua-de-tmux)
    - [3.8.1. Usar Tmux plugings manager para instalar](#381-usar-tmux-plugings-manager-para-instalar)
  - [3.9. Agregar complemento para busqueda en Tmux](#39-agregar-complemento-para-busqueda-en-tmux)
    - [3.9.1. Usar Tmux plugings manager para instalar](#391-usar-tmux-plugings-manager-para-instalar)
  - [3.10. Agregar modo de copia Tmux](#310-agregar-modo-de-copia-de-tmux)
    - [3.10.1. Usar Tmux plugings manager para instalar](#3101-usar-tmux-plugings-manager-para-instalar)
  Agregar modo de copia de Tmux
- [4. Iniciar tmux (Sesión por defecto)](#4-iniciar-tmux-sesión-por-defecto)
- [5. Ventana](#5-ventana)
  - [5.1. Crear nueva ventana](#51-crear-nueva-ventana)
  - [5.2. Cambiar el nombre de la ventana](#52-cambiar-el-nombre-de-la-ventana)
  - [5.3. Cambiar de ventana](#53-cambiar-de-ventana)
  - [5.4. Listar sesiones y Ventanas](#54-listar-sesiones-y-ventanas)
  - [5.5. Cerrar](#55-cerrar)
  - [5.6. Saltar a la ventana z](#56-saltar-a-la-ventana-z)
- [6. Paneles](#6-paneles)
- [7. Comandos de Tmux](#7-comandos-de-tmux)
  - [7.1. Para habilitar el mouse](#71-para-habilitar-el-mouse)
  - [7.2. Para paneles](#72-para-paneles)
    - [7.2.1. Dividir verticalmente](#721-dividir-verticalmente)
    - [7.2.2. Redimensionar los paneles](#722-redimensionar-los-paneles)
- [8. Sesiones](#8-sesiones)
  - [8.1. Inicia nueva sesion](#81-inicia-nueva-sesion)
  - [8.2. lista las sesiones](#82-lista-las-sesiones)
  - [8.3. elimina la sesion z](#83-elimina-la-sesion-z)
  - [8.4. Ir a esa sesion](#84-ir-a-esa-sesion)
  - [8.5. Comandos en Tmux](#85-comandos-en-tmux)
- [9. Referencia](#9-referencia)

## 1. Instalar tmux
- Instalar tmux
```console
sudo apt-get install tmux
```
## 2. Instalaciones necesarias
### 2.1. Instalar Vmin
- Editor de archivos
```console
sudo apt install vim
```
#### 2.1.1. Utilizar vim para editar un archivo
- Usar vim
```console
vi .tmux.conf 
```
- Para insertar datos en el archivo, en forma de texto
```console
apretar i
```
- Para guardar
```console
esc | :w | enter
```
- Para salir
```console
esc | :q | enter
```
- Para guardar y salir al mismo tiempo
```console
esc | :wq | enter
```
### 2.2. Instalar tmux resurrection(Recuperar la sesión despues del reinicio)
#### 2.2.1. Clonar el repositorio
- Clonar en la carpeta personal
```console
git clone https://github.com/tmux-plugins/tmux-resurrect
```
- Comprobar si esta la carpeta tmux-resurrect
```console
la tmux-resurrect
```
#### 2.2.2. Obtener la dirección path
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
#### 2.2.3. Crear o modificar el archivo de modificación
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
### 2.3. Instalar Tmux plugings
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
#### 2.3.1. Comandos de Tmux plugings
- Instala nuevos complementos de GitHub o cualquier otro repositorio de git. Actualiza el entorno TMUX
```console
ctrl+B | I
```
- Actualiza los complementos
```console
ctrl+B | U
```
- Eliminar/desinstalar complementos que no están en la lista de complementos
```console
ctrl+B | alt+u
```
## 3. Instalando complementos
### 3.1. Agregar complemento para copiar desde terminal
- Editar el archivo de configuracion tmux
```console
vi .tmux.conf
```
- Copiar lo siguiente y guardar 
```txt
set -g @plugin 'tmux-plugins/tmux-yank'
```
#### 3.1.1. Usar Tmux plugings manager para instalar
- Ingresar a una sesion en Tmux
```console
Tmux
```
- Para instalar
```
ctrl+B | I
```
- Luego apretar esc, para instalar
### 3.2. Agregar complemento para agregar temas
- Editar el archivo de configuracion tmux
```console
vi .tmux.conf
```
- Copiar lo siguiente y guardar 
```txt
set -g @plugin 'seebi/tmux-colors-solarized'
set -g @colors-solarized 'base16'
```
#### 3.2.1. Usar Tmux plugings manager para instalar
- Ingresar a una sesion en Tmux
```console
Tmux
```
- Para instalar
```
ctrl+B | I
```
- Luego apretar esc, para instalar
### 3.3. Agregar complemento para que al apretar ctrl + B, identifique
- Editar el archivo de configuracion tmux
```console
vi .tmux.conf
```
- Copiar lo siguiente y guardar 
```txt
set -g @plugin 'tmux-plugins/tmux-prefix-highlight'
```
#### 3.3.1. Usar Tmux plugings manager para instalar
- Ingresar a una sesion en Tmux
```console
Tmux
```
- Para instalar
```
ctrl+B | I
```
- Luego apretar esc, para instalar
### 3.4. Agregar complemento para que le brinde una barra de estado de línea eléctrica hábil y pirateable que consta de segmento
- Editar el archivo de configuracion tmux
```console
vi .tmux.conf
```
- Copiar lo siguiente y guardar 
```txt
set -g @plugin 'erikw/tmux-powerline'
```
#### 3.4.1. Usar Tmux plugings manager para instalar
- Ingresar a una sesion en Tmux
```console
Tmux
```
- Para instalar
```
ctrl+B | I
```
- Luego apretar esc, para instalar
### 3.5. Agregar complemento para usar el mouse
- Editar el archivo de configuracion tmux
```console
vi .tmux.conf
```
- Copiar lo siguiente y guardar 
```txt
set -g mouse on
```
#### 3.5.1. Usar Tmux plugings manager para instalar
- Ingresar a una sesion en Tmux
```console
Tmux
```
- Para instalar
```
ctrl+B | I
```
- Luego apretar esc, para instalar

### 3.6. Agregar complemento para scroll de mouse
- Editar el archivo de configuracion tmux
```console
vi .tmux.conf
```
- Copiar lo siguiente y guardar 
```txt
set -g @plugin 'noscript/tmux-mighty-scroll'
```
#### 3.6.1. Usar Tmux plugings manager para instalar
- Ingresar a una sesion en Tmux
```console
Tmux
```
- Para instalar
```
ctrl+B | I
```
- Luego apretar esc, para instalar
### 3.7. Agregar complemento para redimensionar paneles con el mouse
- Editar el archivo de configuracion tmux
```console
vi .tmux.conf
```
- Copiar lo siguiente y guardar 
```txt
set -g mouse-resize-pane on
```
#### 3.7.1. Usar Tmux plugings manager para instalar
- Ingresar a una sesion en Tmux
```console
Tmux
```
- Para instalar
```
ctrl+B | I
```
- Luego apretar esc, para instalar
### 3.8. Agregar complemento para guardado y restauración continua de Tmux
- Editar el archivo de configuracion tmux
```console
vi .tmux.conf
```
- Copiar lo siguiente y guardar 
```txt
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-continuum'
```
#### 3.8.1. Usar Tmux plugings manager para instalar
- Ingresar a una sesion en Tmux
```console
Tmux
```
- Para instalar
```
ctrl+B | I
```
- Luego apretar esc, para instalar
### 3.9. Agregar complemento para busqueda en Tmux
- Editar el archivo de configuracion tmux
```console
vi .tmux.conf
```
- Copiar lo siguiente y guardar 
```txt
set -g @plugin 'tmux-plugins/tmux-copycat'
```
- Comandos
```txt
prefix + ctrl-f- búsqueda simple de archivos
prefix + ctrl-g- saltar sobre los archivos de estado de g it (mejor usado después git statusdel comando)
prefix + alt-h- saltando sobre hashes SHA-1/SHA-256 (mejor usado después git logdel comando)
prefix + ctrl-u- Búsqueda de direcciones URL (URL http, ftp y git)
prefix + ctrl-d- búsqueda de número (nemotécnico d, como dígito)
prefix + alt-i- Búsqueda de direcciones IP
```
#### 3.9.1. Usar Tmux plugings manager para instalar
- Ingresar a una sesion en Tmux
```console
Tmux
```
- Para instalar
```
ctrl+B | I
```
- Luego apretar esc, para instalar
### 3.10. Agregar modo de copia de Tmux
- Editar el archivo de configuracion tmux
```console
vi .tmux.conf
```
- Copiar lo siguiente y guardar 
```txt
set -g mode-keys vi
```
#### 3.10.1. Usar Tmux plugings manager para instalar
- Ingresar a una sesion en Tmux
```console
Tmux
```
- Para instalar
```
ctrl+B | I
```
- Luego apretar esc, para instalar
- Para copiar desplaze el mouse, o aprete ctrl+B | [, para entrar en el modo de copia, luego mantenga presionado la tecla space, y mueva a la derecha o izquierda para seleccionar, y aprete enter para copiar
- Para pegar aprete  ctrl+B | ]
## 4. Iniciar tmux (Sesión por defecto)
```console
tmux
```
## 5. Ventana
- Estando en Tmux
### 5.1. Crear nueva ventana
```txt
ctrl+B | C
```
- Las ventanas se llaman zsh(defecto), el * indica en que ventana esta
```txt
0:zsh*                ventana 1
0:zsh- 1:zsh*         ventana 2
0:zsh- 1:zsh- 2:zsh*  ventana 3
```
### 5.2. Cambiar el nombre de la ventana
- Cambiar el nombre y luego enter
```txt
ctrl+B | , 
```
### 5.3. Cambiar de ventana
- Ventana anterior
```txt
ctrl+B | p 
```
- Ventana siguiente
```txt
ctrl+B | n 
```
### 5.4. Listar sesiones y Ventanas
- Enumera las ventanas abiertas
```
ctrl+B | w
```
### 5.5. Cerrar
- Cerrar la ventana actual ventanas la (confirmar con y)
```
ctrl+B | &
```
### 5.6. Saltar a la ventana z
```
ctrl+B | 1, 2, 3, (...)
```
## 6. Paneles
- Dividir en 2 partes verticales
```txt
ctrl+B | % 
```
- Dividir en 2 partes horizontales
```txt
ctrl+B | "
```
- cerrar el panel actual
```txt
ctrl+B | X
```
- Teclas de desplazamiento (izquierda, derecha, arriba, abajo): navegar entre los paneles
- saltar al panel izquierdo
```txt
ctrl+B | H
```
- saltar al panel de la derecha
```txt
ctrl+B | I
``` 
- saltar al panel inferior
```txt
ctrl+B | J
```
- saltar al panel superior
```txt
ctrl+B | K
```
- mostrar el número de paneles
```txt
ctrl+B | P
```
- navegar cronológicamente por todos los paneles
```txt
ctrl+B | O
```
- cambiar el panel actual por los siguientes
```txt
ctrl+B | }
```
- intercambiar el panel actual con el anterior
```txt
ctrl+B | {
```
- cambiar entre las divisiones de los paneles
```txt
ctrl+B | Barra espaciadora
```
- separar el panel actual y abrirlo en una nueva ventana
```txt
ctrl+B | !
```
## 7. Comandos de Tmux
- Para entrar a comandos de Tmux
```txt
ctrl+B | :
```
### 7.1. Para habilitar el mouse
```console
    set-option -g mouse on
```
### 7.2. Para paneles
#### 7.2.1. Dividir verticalmente
```console
split-window -h
```
#### 7.2.2. Redimensionar los paneles
- Mueve la línea divisoria entre paneles hacia abajo.
```console
resize-pane -D
```
- Mueve la línea divisoria entre paneles hacia arriba.
```console
resize-pane -U
```
- Mueve la línea divisoria entre paneles a la derecha.
```console
resize-pane -R
```
- Mueve la línea divisoria entre paneles a la izquierda.
```console
resize-pane -L
```
- También puedes mover la línea de separación según de las unidades de media, celdas, predefinidas de la siguiente manera; sin embargo, esto afecta a todos los paneles de la ventana:
- Mover la línea divisoria 10 celdas hacia arriba.
```console
resize-pane -U 10
```
- Mover la línea divisoria 5 celdas a la derecha.
```console
resize-pane -t 2 -R 5
```
## 8. Sesiones
### 8.1. Inicia nueva sesion
```console
tmux new -s nombreSesion
```
### 8.2. lista las sesiones
```console
tmux list-sessions
```
### 8.3. elimina la sesion z
```console
tmux kill-session -t z
```
### 8.4. Ir a esa sesion
```console
tmux attach -t nombreSesion
```
### 8.5. Comandos en Tmux
- muestras todas las sesiones y cambia de una sesión a otra
```txt
ctrl+B | S
```
- cambiar el nombre de la sesión actual
```txt
ctrl+B | $
```
- separa la sesión (“detach”) y la mueve a segundo plano
```txt
ctrl+B | D
```
- muestra las combinaciones de teclas activas (área de ayuda abierta)
```txt
ctrl+B | ?
```
- desplazarse en el modo copia con las teclas de arriba y abajo
```txt
ctrl+B | [   , luego usar las teclas arriba y abajo
```
- para ir a una linea determinada en el modo copia
```txt
ctrl+B | [   , luego apretar "g", luego ingresar el numero de linea, y apretar enter, y sera a esa linea
```
## 9. Referencia
- [Tmux](https://www.youtube.com/watch?v=BHhA_ZKjyxo)
- [Otro Tmux](https://www.youtube.com/watch?v=Yl7NFenTgIo)
