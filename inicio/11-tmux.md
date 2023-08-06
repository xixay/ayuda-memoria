## Instalar tmux
- Instalar tmux
```console
sudo apt-get install tmux
```
## Instalaciones necesarias
### Instalar Vmin
- Editor de archivos
```console
sudo apt install vim
```
#### Utilizar vim para editar un archivo
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
### Instalar tmux resurrection(Recuperar la sesión despues del reinicio)
#### Clonar el repositorio
- Clonar en la carpeta personal
```console
git clone https://github.com/tmux-plugins/tmux-resurrect
```
- Comprobar si esta la carpeta tmux-resurrect
```console
la tmux-resurrect
```
#### Obtener la dirección path
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
#### Crear o modificar el archivo de modificación
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
### Instalar Tmux plugings
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
#### Comandos de Tmux plugings
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
## Instalando complementos
### Agregar complemento para copiar desde terminal
- Editar el archivo de configuracion tmux
```console
vi .tmux.conf
```
- Copiar lo siguiente y guardar 
```txt
set -g @plugin 'tmux-plugins/tmux-yank'
```
#### Usar Tmux plugings manager para instalar
- Ingresar a una sesion en Tmux
```console
Tmux
```
- Para instalar
```
ctrl+B | I
```
- Luego apretar esc, para instalar
### Agregar complemento para agregar temas
- Editar el archivo de configuracion tmux
```console
vi .tmux.conf
```
- Copiar lo siguiente y guardar 
```txt
set -g @plugin 'seebi/tmux-colors-solarized'
set -g @colors-solarized 'base16'
```
#### Usar Tmux plugings manager para instalar
- Ingresar a una sesion en Tmux
```console
Tmux
```
- Para instalar
```
ctrl+B | I
```
- Luego apretar esc, para instalar
### Agregar complemento para que al apretar ctrl + B, identifique
- Editar el archivo de configuracion tmux
```console
vi .tmux.conf
```
- Copiar lo siguiente y guardar 
```txt
set -g @plugin 'tmux-plugins/tmux-prefix-highlight'
```
#### Usar Tmux plugings manager para instalar
- Ingresar a una sesion en Tmux
```console
Tmux
```
- Para instalar
```
ctrl+B | I
```
- Luego apretar esc, para instalar
### Agregar complemento para que le brinde una barra de estado de línea eléctrica hábil y pirateable que consta de segmento
- Editar el archivo de configuracion tmux
```console
vi .tmux.conf
```
- Copiar lo siguiente y guardar 
```txt
set -g @plugin 'tmux-plugins/tmux-prefix-highlight'
```
#### Usar Tmux plugings manager para instalar
- Ingresar a una sesion en Tmux
```console
Tmux
```
- Para instalar
```
ctrl+B | I
```
- Luego apretar esc, para instalar
 tpm que 
## Iniciar tmux (Sesión por defecto)
```console
tmux
```
## Ventana
- Estando en Tmux
### Crear nueva ventana
```txt
ctrl+B | C
```
- Las ventanas se llaman zsh(defecto), el * indica en que ventana esta
```txt
0:zsh*                ventana 1
0:zsh- 1:zsh*         ventana 2
0:zsh- 1:zsh- 2:zsh*  ventana 3
```
### Cambiar el nombre de la ventana
- Cambiar el nombre y luego enter
```txt
ctrl+B | , 
```
### Cambiar de ventana
- Ventana anterior
```txt
ctrl+B | p 
```
- Ventana siguiente
```txt
ctrl+B | n 
```
### Listar sesiones y Ventanas
- Enumera las ventanas abiertas
```
ctrl+B | w
```
### Cerrar
- Cerrar la ventana actual ventanas la (confirmar con y)
```
ctrl+B | &
```
### Saltar a la ventana z
```
ctrl+B | 1, 2, 3, (...)
```
## Paneles
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
## Comandos de Tmux
- Para entrar a comandos de Tmux
```txt
ctrl+B | :
```
### Para habilitar el mouse
```console
    set-option -g mouse on
```
### Para paneles
#### Dividir verticalmente
```console
split-window -h
```
#### Redimensionar los paneles
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
## Sesiones
### Inicia nueva sesion
```console
tmux new -s nombreSesion
```
### lista las sesiones
```console
tmux list-sessions
```
### elimina la sesion z
```console
tmux kill-session -t z
```
### Ir a esa sesion
```console
tmux attach -t nombreSesion
```
### Comandos en Tmux
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
## Referencia
- [Tmux](https://www.youtube.com/watch?v=BHhA_ZKjyxo)
- [Otro Tmux](https://www.youtube.com/watch?v=Yl7NFenTgIo)