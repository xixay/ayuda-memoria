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
## Atajos abreviados Oh My Zsh, GIT

|  g                        |   git                                                                                                                                              |
|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|
|    ga                     |   git add                                                                                                                                          |
|    gaa                    |   git add --all                                                                                                                                    |
|    gapa                   |   git add --patch                                                                                                                                  |
|    gau                    |   git add --update                                                                                                                                 |
|    gav                    |   git add --verbose                                                                                                                                |
|    gap                    |   git apply                                                                                                                                        |
|    gapt                   |   git apply --3way                                                                                                                                 |
|    gb                     |   git branch                                                                                                                                       |
|    gba                    |   git branch -a                                                                                                                                    |
|    gbd                    |   git branch -d                                                                                                                                    |
|    gbda                   |   git branch --no-color --merged \| grep -vE "^([+]\|\s($(git_main_branch)\|$(git_develop_branch))\s*$)" \| xargs git branch -d 2>/dev/null        |
|    gbD                    |   git branch -D                                                                                                                                    |
|    gbl                    |   git blame -b -w                                                                                                                                  |
|    gbnm                   |   git branch --no-merged                                                                                                                           |
|    gbr                    |   git branch --remote                                                                                                                              |
|    gbs                    |   git bisect                                                                                                                                       |
|    gbsb                   |   git bisect bad                                                                                                                                   |
|    gbsg                   |   git bisect good                                                                                                                                  |
|    gbsr                   |   git bisect reset                                                                                                                                 |
|    gbss                   |   git bisect start                                                                                                                                 |
|    gc                     |   git commit -v                                                                                                                                    |
|    gc!                    |   git commit -v --amend                                                                                                                            |
|    gcn!                   |   git commit -v --no-edit --amend                                                                                                                  |
|    gca                    |   git commit -v -a                                                                                                                                 |
|    gca!                   |   git commit -v -a --amend                                                                                                                         |
|    gcan!                  |   git commit -v -a --no-edit --amend                                                                                                               |
|    gcans!                 |   git commit -v -a -s --no-edit --amend                                                                                                            |
|    gcam                   |   git commit -a -m                                                                                                                                 |
|    gcas                   |   git commit -a -s                                                                                                                                 |
|    gcasm                  |   git commit -a -s -m                                                                                                                              |
|    gcsm                   |   git commit -s -m                                                                                                                                 |
|    gcb                    |   git checkout -b                                                                                                                                  |
|    gcf                    |   git config --list                                                                                                                                |
|    gcl                    |   git clone --recurse-submodules                                                                                                                   |
|    gccd                   |   git clone --recurse-submodules "$@" && cd "$(basename $_ .git)"                                                                                  |
|    gclean                 |   git clean -id                                                                                                                                    |
|    gpristine              |   git reset --hard && git clean -dffx                                                                                                              |
|    gcm                    |   git checkout $(git_main_branch)                                                                                                                  |
|    gcd                    |   git checkout $(git_develop_branch)                                                                                                               |
|    gcmsg                  |   git commit -m                                                                                                                                    |
|    gco                    |   git checkout                                                                                                                                     |
|    gcor                   |   git checkout --recurse-submodules                                                                                                                |
|    gcount                 |   git shortlog -sn                                                                                                                                 |
|    gcp                    |   git cherry-pick                                                                                                                                  |
|    gcpa                   |   git cherry-pick --abort                                                                                                                          |
|    gcpc                   |   git cherry-pick --continue                                                                                                                       |
|    gcs                    |   git commit -S                                                                                                                                    |
|    gd                     |   git diff                                                                                                                                         |
|    gdca                   |   git diff --cached                                                                                                                                |
|    gdcw                   |   git diff --cached --word-diff                                                                                                                    |
|    gdct                   |   git describe --tags $(git rev-list --tags --max-count=1)                                                                                         |
|    gds                    |   git diff --staged                                                                                                                                |
|    gdt                    |   git diff-tree --no-commit-id --name-only -r                                                                                                      |
|    gdnolock               |   git diff $@ ":(exclude)package-lock.json" ":(exclude)*.lock"                                                                                     |
|    gdup                   |   git diff @{upstream}                                                                                                                             |
|    gdv                    |   git diff -w $@ \| view -                                                                                                                         |
|    gdw                    |   git diff --word-diff                                                                                                                             |
|    gf                     |   git fetch                                                                                                                                        |
|    gfa                    |   git fetch --all --prune                                                                                                                          |
|    gfg                    |   git ls-files \| grep                                                                                                                             |
|    gfo                    |   git fetch origin                                                                                                                                 |
|    gg                     |   git gui citool                                                                                                                                   |
|    gga                    |   git gui citool --amend                                                                                                                           |
|    ggf                    |   git push --force origin $(current_branch)                                                                                                        |
|    ggfl                   |   git push --force-with-lease origin $(current_branch)                                                                                             |
|    ggl                    |   git pull origin $(current_branch)                                                                                                                |
|    ggp                    |   git push origin $(current_branch)                                                                                                                |
|    ggpnp                  |   ggl && ggp                                                                                                                                       |
|    ggpull                 |   git pull origin "$(git_current_branch)"                                                                                                          |
|    ggpur                  |   ggu                                                                                                                                              |
|    ggpush                 |   git push origin "$(git_current_branch)"                                                                                                          |
|    ggsup                  |   git branch --set-upstream-to=origin/$(git_current_branch)                                                                                        |
|    ggu                    |   git pull --rebase origin $(current_branch)                                                                                                       |
|    gpsup                  |   git push --set-upstream origin $(git_current_branch)                                                                                             |
|    ghh                    |   git help                                                                                                                                         |
|    gignore                |   git update-index --assume-unchanged                                                                                                              |
|    gignored               |   git ls-files -v \| grep "^[[:lower:]]"                                                                                                           |
|    git-svn-dcommit-push   |   git svn dcommit && git push github $(git_main_branch):svntrunk                                                                                   |
|    gk                     |   gitk --all --branches &!                                                                                                                         |
|    gke                    |   gitk --all $(git log -g --pretty=%h) &!                                                                                                          |
|    gl                     |   git pull                                                                                                                                         |
|    glg                    |   git log --stat                                                                                                                                   |
|    glgp                   |   git log --stat -p                                                                                                                                |
|    glgg                   |   git log --graph                                                                                                                                  |
|    glgga                  |   git log --graph --decorate --all                                                                                                                 |
|    glgm                   |   git log --graph --max-count=10                                                                                                                   |
|    glo                    |   git log --oneline --decorate                                                                                                                     |
|    glol                   |   git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'                                           |
|    glols                  |   git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --stat                                    |
|    glod                   |   git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset'                                           |
|    glods                  |   git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=short                              |
|    glola                  |   git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --all                                     |
|    glog                   |   git log --oneline --decorate --graph                                                                                                             |
|    gloga                  |   git log --oneline --decorate --graph --all                                                                                                       |
|    glp                    |   git log --pretty=<format>                                                                                                                        |
|    gm                     |   git merge                                                                                                                                        |
|    gmom                   |   git merge origin/$(git_main_branch)                                                                                                              |
|    gmtl                   |   git mergetool --no-prompt                                                                                                                        |
|    gmtlvim                |   git mergetool --no-prompt --tool=vimdiff                                                                                                         |
|    gmum                   |   git merge upstream/$(git_main_branch)                                                                                                            |
|    gma                    |   git merge --abort                                                                                                                                |
|    gp                     |   git push                                                                                                                                         |
|    gpd                    |   git push --dry-run                                                                                                                               |
|    gpf                    |   git push --force-with-lease                                                                                                                      |
|    gpf!                   |   git push --force                                                                                                                                 |
|    gpoat                  |   git push origin --all && git push origin --tags                                                                                                  |
|    gpr                    |   git pull --rebase                                                                                                                                |
|    gpu                    |   git push upstream                                                                                                                                |
|    gpv                    |   git push -v                                                                                                                                      |
|    gr                     |   git remote                                                                                                                                       |
|    gra                    |   git remote add                                                                                                                                   |
|    grb                    |   git rebase                                                                                                                                       |
|    grba                   |   git rebase --abort                                                                                                                               |
|    grbc                   |   git rebase --continue                                                                                                                            |
|    grbd                   |   git rebase $(git_develop_branch)                                                                                                                 |
|    grbi                   |   git rebase -i                                                                                                                                    |
|    grbm                   |   git rebase $(git_main_branch)                                                                                                                    |
|    grbom                  |   git rebase origin/$(git_main_branch)                                                                                                             |
|    grbo                   |   git rebase --onto                                                                                                                                |
|    grbs                   |   git rebase --skip                                                                                                                                |
|    grev                   |   git revert                                                                                                                                       |
|    grh                    |   git reset                                                                                                                                        |
|    grhh                   |   git reset --hard                                                                                                                                 |
|    groh                   |   git reset origin/$(git_current_branch) --hard                                                                                                    |
|    grm                    |   git rm                                                                                                                                           |
|    grmc                   |   git rm --cached                                                                                                                                  |
|    grmv                   |   git remote rename                                                                                                                                |
|    grrm                   |   git remote remove                                                                                                                                |
|    grs                    |   git restore                                                                                                                                      |
|    grset                  |   git remote set-url                                                                                                                               |
|    grss                   |   git restore --source                                                                                                                             |
|    grst                   |   git restore --staged                                                                                                                             |
|    grt                    |   cd "$(git rev-parse --show-toplevel \|\| echo .)"                                                                                                |
|    gru                    |   git reset --                                                                                                                                     |
|    grup                   |   git remote update                                                                                                                                |
|    grv                    |   git remote -v                                                                                                                                    |
|    gsb                    |   git status -sb                                                                                                                                   |
|    gsd                    |   git svn dcommit                                                                                                                                  |
|    gsh                    |   git show                                                                                                                                         |
|    gsi                    |   git submodule init                                                                                                                               |
|    gsps                   |   git show --pretty=short --show-signature                                                                                                         |
|    gsr                    |   git svn rebase                                                                                                                                   |
|    gss                    |   git status -s                                                                                                                                    |
|    gst                    |   git status                                                                                                                                       |
|    gsta                   |   git stash push                                                                                                                                   |
|    gsta                   |   git stash save                                                                                                                                   |
|    gstaa                  |   git stash apply                                                                                                                                  |
|    gstc                   |   git stash clear                                                                                                                                  |
|    gstd                   |   git stash drop                                                                                                                                   |
|    gstl                   |   git stash list                                                                                                                                   |
|    gstp                   |   git stash pop                                                                                                                                    |
|    gsts                   |   git stash show --text                                                                                                                            |
|    gstu                   |   git stash --include-untracked                                                                                                                    |
|    gstall                 |   git stash --all                                                                                                                                  |
|    gsu                    |   git submodule update                                                                                                                             |
|    gsw                    |   git switch                                                                                                                                       |
|    gswc                   |   git switch -c                                                                                                                                    |
|    gswm                   |   git switch $(git_main_branch)                                                                                                                    |
|    gswd                   |   git switch $(git_develop_branch)                                                                                                                 |
|    gts                    |   git tag -s                                                                                                                                       |
|    gtv                    |   git tag \| sort -V                                                                                                                               |
|    gtl                    |   gtl(){ git tag --sort=-v:refname -n -l ${1}* }; noglob gtl                                                                                       |
|    gunignore              |   git update-index --no-assume-unchanged                                                                                                           |
|    gunwip                 |   git log -n 1 \| grep -q -c "--wip--" && git reset HEAD~1                                                                                         |
|    gup                    |   git pull --rebase                                                                                                                                |
|    gupv                   |   git pull --rebase -v                                                                                                                             |
|    gupa                   |   git pull --rebase --autostash                                                                                                                    |
|    gupav                  |   git pull --rebase --autostash -v                                                                                                                 |
|    gupom                  |   git pull --rebase origin $(git_main_branch)                                                                                                      |
|    gupomi                 |   git pull --rebase=interactive origin $(git_main_branch)                                                                                          |
|    glum                   |   git pull upstream $(git_main_branch)                                                                                                             |
|    gluc                   |   git pull upstream $(git_current_branch)                                                                                                          |
|    gwch                   |   git whatchanged -p --abbrev-commit --pretty=medium                                                                                               |
|    gwip                   |   git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign -m "--wip-- [skip ci]"                           |
|    gam                    |   git am                                                                                                                                           |
|    gamc                   |   git am --continue                                                                                                                                |
|    gams                   |   git am --skip                                                                                                                                    |
|    gama                   |   git am --abort                                                                                                                                   |
|    gamscp                 |   git am --show-current-patch                                                                                                                      |
## Referencia
- https://www.youtube.com/watch?v=EW2eDzBFONw
- [oh-my-zsh](https://kapeli.com/cheat_sheets/Oh-My-Zsh_Git.docset/Contents/Resources/Documents/index)