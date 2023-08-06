## Instalar tmux
- Instalar tmux
```console
sudo apt-get install tmux
```
## Instalar Vmin
```console
sudo apt install vim
```
## Instalar tmux resurrection
- Clonar en la carpeta personal
```console
git clone https://github.com/tmux-plugins/tmux-resurrect
```
- Comprobar si esta la carpeta tmux-resurrect
```console
la tmux-resurrect
```
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
## Instalar Tmux plugings
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
### Comandos
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
## Agregar complemento para copiar desde terminal
- Editar el archivo de configuracion tmux
```console
vi .tmux.conf
```
- Copiar lo siguiente y guardar 
```txt
set -g @plugin 'tmux-plugins/tmux-yank'
```
### Usar Tmux plugings manager para instalar
- Para instalar
```
ctrl+B | I
```
- Luego apretar esc, para instalar
## Agregar complemento para agregar temas
- Editar el archivo de configuracion tmux
```console
vi .tmux.conf
```
- Copiar lo siguiente y guardar 
```txt
set -g @plugin 'seebi/tmux-colors-solarized'
set -g @colors-solarized 'base16'
```
### Usar Tmux plugings manager para instalar
- Para instalar
```
ctrl+B | I
```
- Luego apretar esc, para instalar
## Agregar complemento para que al apretar ctrl + B, identifique
- Editar el archivo de configuracion tmux
```console
vi .tmux.conf
```
- Copiar lo siguiente y guardar 
```txt
set -g @plugin 'tmux-plugins/tmux-prefix-highlight'
```
### Usar Tmux plugings manager para instalar
- Para instalar
```
ctrl+B | I
```
- Luego apretar esc, para instalar
## Agregar complemento para que le brinde una barra de estado de línea eléctrica hábil y pirateable que consta de segmento
- Editar el archivo de configuracion tmux
```console
vi .tmux.conf
```
- Copiar lo siguiente y guardar 
```txt
set -g @plugin 'tmux-plugins/tmux-prefix-highlight'
```
### Usar Tmux plugings manager para instalar
- Para instalar
```
ctrl+B | I
```
- Luego apretar esc, para instalar
 tpm que 
## Inicia tmux
```console
tmux
```
## Nueva ventana
```txt
ctrl+B | C
```
- Las ventanas se llaman 
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
### Enumerar Ventanas
- Enumera las ventanas abiertas
```
ctrl+B | w
```
## Paneles
- Dividir verticalmente
```txt
ctrl+B | % 
```
- Dividir horizontalmente
```txt
ctrl+B | "
```
## Comandos de Tmux
- Para entrar a comandos de Tmux
```txt
ctrl+B | :
```
- Para dividir verticalmente
```console
split-window -h
```
- Para habilitar el mouse
```console
    set-option -g mouse on
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
## Referencia
- [Tmux](https://www.youtube.com/watch?v=BHhA_ZKjyxo)
- [Otro Tmux](https://www.youtube.com/watch?v=Yl7NFenTgIo)