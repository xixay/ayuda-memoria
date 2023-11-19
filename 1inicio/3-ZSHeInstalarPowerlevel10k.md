# Cambiar BASH por ZSH e instalar Powerlevel10k
## Instalar zsh
```console
sudo apt install zsh
```
- Ver si la terminal esta en BASH
```console
echo $SHELL
/bin/bash  //respuesta
```
- Ver en el directorio todas las instaladas
```console
cat /etc/shells

# /etc/shells: valid login shells
/bin/sh
/bin/bash
/usr/bin/bash
/bin/rbash
/usr/bin/rbash
/usr/bin/sh
/bin/dash
/usr/bin/dash
/bin/zsh     //La que interesa poner
/usr/bin/zsh
```
- Asignar zsh a usuarios, en especial a root y otros
```console
sudo -s  //entrar como root
#chsh -s /bin/zsh root
#chsh -s /bin/zsh xixay
exec zsh //salir
```
- SAlir de la terminal y volver a entrar
- Descargar la herramienta para gestionar la zsh
```console
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
yes // dar (Y) , aparecera un mensaje de instalado 
```
- aparecera un mensaje de instalado
```text
Using the Oh My Zsh template file and adding it to /home/xixay/.zshrc.

Time to change your default shell to zsh:
Do you want to change your default shell to zsh? [Y/n] Y
Changing your shell to /usr/bin/zsh...
[sudo] contraseña para xixay: 
Shell successfully changed to '/usr/bin/zsh'.

         __                                     __   
  ____  / /_     ____ ___  __  __   ____  _____/ /_  
 / __ \/ __ \   / __ `__ \/ / / /  /_  / / ___/ __ \ 
/ /_/ / / / /  / / / / / / /_/ /    / /_(__  ) / / / 
\____/_/ /_/  /_/ /_/ /_/\__, /    /___/____/_/ /_/  
                        /____/                       ....is now installed!


Before you scream Oh My Zsh! look over the `.zshrc` file to select plugins, themes, and options.

• Follow us on Twitter: @ohmyzsh
• Join our Discord community: Discord server
• Get stickers, t-shirts, coffee mugs and more: Planet Argon Shop
```
- Entrar a root y hacer lo mismo en root
```console
sudo -s  //entrar como root
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
yes  //(Y)
```
- volver a tu usuario
```console
su xixay
```
- Ver en que usuario se esta 
```console
pwd
/home/xixay  //respuesta
```
## Instalar Powerlevel10k
- Descargar el repositorio
```console
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```
- Ir a al archivo zsh por terminal, para cambiar el tema
```console
sudo nano .zshrc
```
- Modificar el tema, y reiniciar la terminal
```console
ZSH_THEME="powerlevel10k/powerlevel10k"
```
- Ir a https://www.nerdfonts.com/font-downloads y descargar la fuente comprimida, descomprimir e instalar las fuentes de tipo ttf que se desee,  son ejecutables
- Cambiar en la terminal de preferencia el tipo de fuente a usar la fuente descargada
- Luego actualizar y limpiar
```console
sudo apt update
sudo apt upgrade
```
- Abrir la terminal y sale las opciones de configuración, si no sale configurar colocar en terminal
```console
p10k configure
```
- Te sale una especie de menu para configurar, pregunta si se ve el diamante, y digitar (y) si se ve, y asi va saliendo mensajes
```txt
This is Powerlevel10k configuration wizard. It will ask you a few questions and
                             configure your prompt.

                Does this look like a diamond (rotated square)?
                  reference: https://graphemica.com/%E2%97%86

                                 --->    <---

(y)  Yes.

(n)  No.

(q)  Quit and do nothing.

Choice [ynq]: 
```
- Una vez configurado, hacerlo para el usuario root(No funciono en ubuntu)
```console
sudo -s
su root
exec zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
nano .zshrc
ZSH_THEME="powerlevel10k/powerlevel10k"
```
## Referencia
- https://www.youtube.com/watch?v=EW2eDzBFONw
- [oh-my-zsh](https://kapeli.com/cheat_sheets/Oh-My-Zsh_Git.docset/Contents/Resources/Documents/index)