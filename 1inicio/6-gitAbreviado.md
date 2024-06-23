[<< INDICE](../README.md)
- [1. Atajos abreviados Oh My Zsh, GIT](#1-atajos-abreviados-oh-my-zsh-git)
  - [1.1. Git add](#11-git-add)
  - [1.2. Git aplly](#12-git-aplly)
  - [1.3. Git branch](#13-git-branch)
  - [1.4. Git blame](#14-git-blame)
  - [1.5. Git bisect](#15-git-bisect)
  - [1.6. Git commit](#16-git-commit)
  - [1.7. Git checkout](#17-git-checkout)
  - [1.8. Git config](#18-git-config)
  - [1.9. Git clone](#19-git-clone)
  - [1.10. Git clean](#110-git-clean)
  - [1.11. Git reset](#111-git-reset)
  - [1.12. Git shortlog](#112-git-shortlog)
  - [1.13. Git cherry-pick](#113-git-cherry-pick)
  - [1.14. git diff](#114-git-diff)
  - [1.15. Git fetch](#115-git-fetch)
  - [1.16. Git ls-files](#116-git-ls-files)
  - [1.17. Git gui](#117-git-gui)
  - [1.18. Git push](#118-git-push)
  - [1.19. Git pull](#119-git-pull)
  - [1.20. Git help](#120-git-help)
  - [1.21. Gignore](#121-gignore)
  - [1.22. Git gitk](#122-git-gitk)
  - [1.23. Git log](#123-git-log)
  - [1.24. Git merge](#124-git-merge)
  - [1.25. Git remote](#125-git-remote)
  - [1.26. Git rebase](#126-git-rebase)
  - [1.27. Git revert](#127-git-revert)
  - [1.28. Git reset](#128-git-reset)
  - [1.29. Git rm](#129-git-rm)
  - [1.30. Git restore](#130-git-restore)
  - [1.31. Git svn](#131-git-svn)
  - [1.32. Git submodule](#132-git-submodule)
  - [1.33. show](#133-show)
  - [1.34. Git status](#134-git-status)
  - [1.35. Git stash](#135-git-stash)
  - [1.36. Git submodule](#136-git-submodule)
  - [1.37. Git switch](#137-git-switch)
  - [1.38. Git tag](#138-git-tag)
  - [1.39. Combinaciones y otros](#139-combinaciones-y-otros)
  - [1.40. Git am](#140-git-am)
- [2. Referencia](#2-referencia)

## 1. Atajos abreviados Oh My Zsh, GIT
### 1.1. Git add
- Añade archivos al área de preparación para el próximo commit.

|  g                        |   git                                                                                                                                              |
|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|
|    ga                     |   git add                                                                                                                                          |
|    gaa                    |   git add --all                                                                                                                                    |
|    gapa                   |   git add --patch                                                                                                                                  |
|    gau                    |   git add --update                                                                                                                                 |
|    gav                    |   git add --verbose                                                                                                                                |
### 1.2. Git aplly
- Aplica parches generados por `git diff` o `git format-patch`.

|  g                        |   git                                                                                                                                              |
|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|
|    gap                    |   git apply                                                                                                                                        |
|    gapt                   |   git apply --3way                                                                                                                                 |
### 1.3. Git branch
- Gestiona las ramas en el repositorio.

|  g                        |   git                                                                                                                                              |
|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|
|    gb                     |   git branch                                                                                                                                       |
|    gba                    |   git branch -a                                                                                                                                    |
|    gbd                    |   git branch -d                                                                                                                                    |
|    gbda                   |   git branch --no-color --merged \| grep -vE "^([+]\|\s($(git_main_branch)\|$(git_develop_branch))\s*$)" \| xargs git branch -d 2>/dev/null        |
|    gbD                    |   git branch -D                                                                                                                                    |
|    gbnm                   |   git branch --no-merged                                                                                                                           |
|    gbr                    |   git branch --remote                                                                                                                              |
|    ggsup                  |   git branch --set-upstream-to=origin/$(git_current_branch)                                                                                        |
### 1.4. Git blame
- Muestra información sobre las modificaciones de cada línea de un archivo.

|  g                        |   git                                                                                                                                              |
|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|
|    gbl                    |   git blame -b -w                                                                                                                                  |
### 1.5. Git bisect
- Encuentra el commit que introdujo un bug usando una búsqueda binaria.

|  g                        |   git                                                                                                                                              |
|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|
|    gbs                    |   git bisect                                                                                                                                       |
|    gbsb                   |   git bisect bad                                                                                                                                   |
|    gbsg                   |   git bisect good                                                                                                                                  |
|    gbsr                   |   git bisect reset                                                                                                                                 |
|    gbss                   |   git bisect start                                                                                                                                 |
### 1.6. Git commit
- Guarda los cambios en el repositorio.

|  g                        |   git                                                                                                                                              |
|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|
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
|    gcmsg                  |   git commit -m                                                                                                                                    |
|    gcs                    |   git commit -S                                                                                                                                    |
### 1.7. Git checkout
- Cambia de ramas o restaura archivos del historial.

|  g                        |   git                                                                                                                                              |
|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|
|    gcb                    |   git checkout -b                                                                                                                                  |
|    gcm                    |   git checkout $(git_main_branch)                                                                                                                  |
|    gcd                    |   git checkout $(git_develop_branch)                                                                                                               |
|    gco                    |   git checkout                                                                                                                                     |
|    gcor                   |   git checkout --recurse-submodules                                                                                                                |
### 1.8. Git config
- Configura las opciones de Git a nivel global o de repositorio.

|  g                        |   git                                                                                                                                              |
|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|
|    gcf                    |   git config --list                                                                                                                                |
### 1.9. Git clone
- Crea una copia de un repositorio remoto en la máquina local.

|  g                        |   git                                                                                                                                              |
|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|
|    gcl                    |   git clone --recurse-submodules                                                                                                                   |
|    gccd                   |   git clone --recurse-submodules "$@" && cd "$(basename $_ .git)"                                                                                  |
### 1.10. Git clean
- Elimina archivos no rastreados del directorio de trabajo.

|  g                        |   git                                                                                                                                              |
|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|
|    gclean                 |   git clean -id                                                                                                                                    |
### 1.11. Git reset
- Deshace commits o cambios en el área de preparación.

|  g                        |   git                                                                                                                                              |
|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|
|    gpristine              |   git reset --hard && git clean -dffx                                                                                                              |
### 1.12. Git shortlog
- Genera un resumen de los commits agrupados por autor.

|  g                        |   git                                                                                                                                              |
|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|
|    gcount                 |   git shortlog -sn                                                                                                                                 |
### 1.13. Git cherry-pick
- Aplica los cambios de un commit específico en la rama actual.

|  g                        |   git                                                                                                                                              |
|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|
|    gcp                    |   git cherry-pick                                                                                                                                  |
|    gcpa                   |   git cherry-pick --abort                                                                                                                          |
|    gcpc                   |   git cherry-pick --continue                                                                                                                       |
### 1.14. git diff
- Muestra las diferencias entre commits, ramas o archivos.

|  g                        |   git                                                                                                                                              |
|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|
|    gd                     |   git diff                                                                                                                                         |
|    gdca                   |   git diff --cached                                                                                                                                |
|    gdcw                   |   git diff --cached --word-diff                                                                                                                    |
|    gds                    |   git diff --staged                                                                                                                                |
|    gdt                    |   git diff-tree --no-commit-id --name-only -r                                                                                                      |
|    gdnolock               |   git diff $@ ":(exclude)package-lock.json" ":(exclude)*.lock"                                                                                     |
|    gdup                   |   git diff @{upstream}                                                                                                                             |
|    gdv                    |   git diff -w $@ \| view -                                                                                                                         |
|    gdw                    |   git diff --word-diff                                                                                                                             |
### 1.15. Git fetch
- Descarga los cambios desde un repositorio remoto sin fusionarlos.

|  g                        |   git                                                                                                                                              |
|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|
|    gf                     |   git fetch                                                                                                                                        |
|    gfa                    |   git fetch --all --prune                                                                                                                          |
|    gfo                    |   git fetch origin                                                                                                                                 |
### 1.16. Git ls-files
- Muestra los archivos en el índice de Git.

|  g                        |   git                                                                                                                                              |
|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|
|    gfg                    |   git ls-files \| grep                                                                                                                             |
### 1.17. Git gui
- Abre una interfaz gráfica de usuario para interactuar con Git.

|  g                        |   git                                                                                                                                              |
|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|
|    gg                     |   git gui citool                                                                                                                                   |
|    gga                    |   git gui citool --amend                                                                                                                           |
### 1.18. Git push
- Envía los commits locales a un repositorio remoto.

|  g                        |   git                                                                                                                                              |
|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|
|    ggf                    |   git push --force origin $(current_branch)                                                                                                        |
|    ggfl                   |   git push --force-with-lease origin $(current_branch)                                                                                             |
|    ggp                    |   git push origin $(current_branch)                                                                                                                |
|    ggpush                 |   git push origin "$(git_current_branch)"                                                                                                          |
|    gpsup                  |   git push --set-upstream origin $(git_current_branch)                                                                                             |
|    gp                     |   git push                                                                                                                                         |
|    gpd                    |   git push --dry-run                                                                                                                               |
|    gpf                    |   git push --force-with-lease                                                                                                                      |
|    gpf!                   |   git push --force                                                                                                                                 |
|    gpoat                  |   git push origin --all && git push origin --tags                                                                                                  |
|    gpu                    |   git push upstream                                                                                                                                |
|    gpv                    |   git push -v                                                                                                                                      |
### 1.19. Git pull
- Descarga y fusiona los cambios desde un repositorio remoto.

|  g                        |   git                                                                                                                                              |
|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|
|    ggl                    |   git pull origin $(current_branch)                                                                                                                |
|    ggpull                 |   git pull origin "$(git_current_branch)"                                                                                                          |
|    ggu                    |   git pull --rebase origin $(current_branch)                                                                                                       |
|    gl                     |   git pull                                                                                                                                         |
|    gup                    |   git pull --rebase                                                                                                                                |
|    gupv                   |   git pull --rebase -v                                                                                                                             |
|    gupa                   |   git pull --rebase --autostash                                                                                                                    |
|    gupav                  |   git pull --rebase --autostash -v                                                                                                                 |
|    gupom                  |   git pull --rebase origin $(git_main_branch)                                                                                                      |
|    gupomi                 |   git pull --rebase=interactive origin $(git_main_branch)                                                                                          |
|    glum                   |   git pull upstream $(git_main_branch)                                                                                                             |
|    gluc                   |   git pull upstream $(git_current_branch)                                                                                                          |
|    gpr                    |   git pull --rebase                                                                                                                                |

### 1.20. Git help
- Muestra la documentación y ayuda para los comandos de Git.

|  g                        |   git                                                                                                                                              |
|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|
|    ghh                    |   git help                                                                                                                                         |
### 1.21. Gignore
- Especifica archivos o directorios que deben ser ignorados por Git.

|  g                        |   git                                                                                                                                              |
|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|
|    gignore                |   git update-index --assume-unchanged                                                                                                              |
|    gignored               |   git ls-files -v \| grep "^[[:lower:]]"                                                                                                           |
### 1.22. Git gitk
- Abre una interfaz gráfica para visualizar el historial de commits.

|  g                        |   git                                                                                                                                              |
|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|
|    gk                     |   gitk --all --branches &!                                                                                                                         |
|    gke                    |   gitk --all $(git log -g --pretty=%h) &!                                                                                                          |
### 1.23. Git log
- Muestra el historial de commits de una rama.

|  g                        |   git                                                                                                                                              |
|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|
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
### 1.24. Git merge
- Combina los cambios de diferentes ramas en una sola rama.

|  g                        |   git                                                                                                                                              |
|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|
|    gm                     |   git merge                                                                                                                                        |
|    gmom                   |   git merge origin/$(git_main_branch)                                                                                                              |
|    gmtl                   |   git mergetool --no-prompt                                                                                                                        |
|    gmtlvim                |   git mergetool --no-prompt --tool=vimdiff                                                                                                         |
|    gmum                   |   git merge upstream/$(git_main_branch)                                                                                                            |
|    gma                    |   git merge --abort                                                                                                                                |
### 1.25. Git remote
- Gestiona los repositorios remotos.

|  g                        |   git                                                                                                                                              |
|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|
|    gr                     |   git remote                                                                                                                                       |
|    gra                    |   git remote add                                                                                                                                   |
|    grmv                   |   git remote rename                                                                                                                                |
|    grrm                   |   git remote remove                                                                                                                                |
|    grset                  |   git remote set-url                                                                                                                               |
|    grup                   |   git remote update                                                                                                                                |
|    grv                    |   git remote -v                                                                                                                                    |
### 1.26. Git rebase
- Aplica los commits de una rama sobre otra.

|  g                        |   git                                                                                                                                              |
|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|
|    grb                    |   git rebase                                                                                                                                       |
|    grba                   |   git rebase --abort                                                                                                                               |
|    grbc                   |   git rebase --continue                                                                                                                            |
|    grbd                   |   git rebase $(git_develop_branch)                                                                                                                 |
|    grbi                   |   git rebase -i                                                                                                                                    |
|    grbm                   |   git rebase $(git_main_branch)                                                                                                                    |
|    grbom                  |   git rebase origin/$(git_main_branch)                                                                                                             |
|    grbo                   |   git rebase --onto                                                                                                                                |
|    grbs                   |   git rebase --skip                                                                                                                                |
### 1.27. Git revert
- Crea un nuevo commit que deshace los cambios de un commit anterior.

|  g                        |   git                                                                                                                                              |
|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|
|    grev                   |   git revert                                                                                                                                       |
### 1.28. Git reset
- Deshace commits o cambios en el área de preparación.

|  g                        |   git                                                                                                                                              |
|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|
|    grh                    |   git reset                                                                                                                                        |
|    grhh                   |   git reset --hard                                                                                                                                 |
|    groh                   |   git reset origin/$(git_current_branch) --hard                                                                                                    |
|    gru                    |   git reset --                                                                                                                                     |
### 1.29. Git rm
- Elimina archivos del índice y del directorio de trabajo.

|  g                        |   git                                                                                                                                              |
|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|
|    grm                    |   git rm                                                                                                                                           |
|    grmc                   |   git rm --cached                                                                                                                                  |
### 1.30. Git restore
- Restaura archivos del historial a su estado en el repositorio o en el área de preparación.

|  g                        |   git                                                                                                                                              |
|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|
|    grs                    |   git restore                                                                                                                                      |
|    grss                   |   git restore --source                                                                                                                             |
|    grst                   |   git restore --staged                                                                                                                             |
### 1.31. Git svn
- Permite interactuar con repositorios Subversion usando Git.

|  g                        |   git                                                                                                                                              |
|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|
|    gsd                    |   git svn dcommit                                                                                                                                  |
|    gsr                    |   git svn rebase                                                                                                                                   |
### 1.32. Git submodule
- Gestiona submódulos dentro de un repositorio.

|  g                        |   git                                                                                                                                              |
|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|
|    gsi                    |   git submodule init                                                                                                                               |
### 1.33. show
- Muestra los cambios introducidos por un commit específico.

|  g                        |   git                                                                                                                                              |
|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|
|    gsh                    |   git show                                                                                                                                         |
|    gsps                   |   git show --pretty=short --show-signature                                                                                                         |
### 1.34. Git status
- Muestra el estado de los archivos en el directorio de trabajo y el área de preparación.

|  g                        |   git                                                                                                                                              |
|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|
|    gsb                    |   git status -sb                                                                                                                                   |
|    gss                    |   git status -s                                                                                                                                    |
|    gst                    |   git status                                                                                                                                       |
### 1.35. Git stash
- Guarda los cambios no confirmados en un almacenamiento temporal.

|  g                        |   git                                                                                                                                              |
|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|
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
### 1.36. Git submodule
- Gestiona submódulos dentro de un repositorio.

|  g                        |   git                                                                                                                                              |
|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|
|    gsu                    |   git submodule update                                                                                                                             |
### 1.37. Git switch
- Cambia entre ramas o crea una nueva rama.

|  g                        |   git                                                                                                                                              |
|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|
|    gsw                    |   git switch                                                                                                                                       |
|    gswc                   |   git switch -c                                                                                                                                    |
|    gswm                   |   git switch $(git_main_branch)                                                                                                                    |
|    gswd                   |   git switch $(git_develop_branch)                                                                                                                 |
### 1.38. Git tag 
- Crea, lista o elimina etiquetas en los commits.

|  g                        |   git                                                                                                                                              |
|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|
|    gts                    |   git tag -s                                                                                                                                       |
|    gtv                    |   git tag \| sort -V                                                                                                                               |
|    gtl                    |   gtl(){ git tag --sort=-v:refname -n -l ${1}* }; noglob gtl                                                                                       |
### 1.39. Combinaciones y otros
- Cubre combinaciones de comandos y otros comandos útiles en Git.

|  g                        |   git                                                                                                                                              |
|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|
|    ggpnp                  |   ggl && ggp                                                                                                                                       |
|    ggpur                  |   ggu                                                                                                                                              |
|    gunignore              |   git update-index --no-assume-unchanged                                                                                                           |
|    gunwip                 |   git log -n 1 \| grep -q -c "--wip--" && git reset HEAD~1                                                                                         |
|    gwch                   |   git whatchanged -p --abbrev-commit --pretty=medium                                                                                               |
|    gwip                   |   git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign -m "--wip-- [skip ci]"                           |
|    git-svn-dcommit-push   |   git svn dcommit && git push github $(git_main_branch):svntrunk                                                                                   |
|    grt                    |   cd "$(git rev-parse --show-toplevel \|\| echo .)"                                                                                                |
|    gdct                   |   git describe --tags $(git rev-list --tags --max-count=1)                                                                                         |
### 1.40. Git am
- Aplica parches desde correos electrónicos.

|  g                        |   git                                                                                                                                              |
|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|
|    gam                    |   git am                                                                                                                                           |
|    gamc                   |   git am --continue                                                                                                                                |
|    gams                   |   git am --skip                                                                                                                                    |
|    gama                   |   git am --abort                                                                                                                                   |
|    gamscp                 |   git am --show-current-patch                                                                                                                      |
## 2. Referencia
- https://www.youtube.com/watch?v=EW2eDzBFONw
- [oh-my-zsh](https://kapeli.com/cheat_sheets/Oh-My-Zsh_Git.docset/Contents/Resources/Documents/index)

[<< INDICE](../README.md)