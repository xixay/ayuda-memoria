## Instalar
```console
sudo apt-get install tmux
```
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
### Ir a esa sesion
```console
tmux attach -t nombreSesion
```
## Referencia
- [Tmux](https://www.youtube.com/watch?v=BHhA_ZKjyxo)
- [Otro Tmux](https://www.youtube.com/watch?v=Yl7NFenTgIo)