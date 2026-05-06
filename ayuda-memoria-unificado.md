# 📘 Ayuda Memoria Completo

---


<div style="page-break-before: always;"></div>

## 1. 🖥️ Sistema y Herramientas


<div style="page-break-before: always;"></div>


# 📄 1.1. Instalar programas .deb

[<< INDICE](../README.md)
# Instalar tipo deb ubuntu
- Ir a la carpeta donde se descargo el archivo
```console
cd Descargas/
```
- Buscar el programa descargado
```console
ls
dia_0.97.2-5_i386.deb//resp
```
- Instalar el paquete:
```console
sudo dpkg -i dia_0.97.2-5_i386.deb
```
# Referencia
- [Instalar](https://help.ubuntu.com/kubuntu/desktopguide/es/manual-install.html)

---


<div style="page-break-before: always;"></div>


# 📄 1.2. Actualización terminal (Linux)

[<< INDICE](../README.md)
# Realizar los tres siempre
- 1ro actualizar
```console
sudo apt-get update
```
- 2do mejorar
```console
sudo apt-get upgrade
```
- 3ro hacer limpieza
```console
sudo apt autoremove
```

---


<div style="page-break-before: always;"></div>


# 📄 1.3. Vista en terminal (Oh My Zsh + Ubuntu)

[<< INDICE](../README.md)
- [1. Instalar zsh](#1-instalar-zsh)
- [2. Comprobar tipo de terminal](#2-comprobar-tipo-de-terminal)
- [3. Ver terminales instaladas](#3-ver-terminales-instaladas)
- [4. Cambiar a la terminal zsh(root , usuarios)](#4-cambiar-a-la-terminal-zshroot--usuarios)
- [5. Reiniciar](#5-reiniciar)
- [6. Instalar oh my zsh (usuario)](#6-instalar-oh-my-zsh-usuario)
- [7. Instalar oh my zsh (root)](#7-instalar-oh-my-zsh-root)
- [8. Instalar Powerlevel10k](#8-instalar-powerlevel10k)
  - [8.1. Descargar el repositorio](#81-descargar-el-repositorio)
  - [8.2. Editar el archivo de configuración de zsh](#82-editar-el-archivo-de-configuración-de-zsh)
  - [8.3. Descarga el tipo de fuente](#83-descarga-el-tipo-de-fuente)
- [9. Configurar powerlevel10k](#9-configurar-powerlevel10k)
- [10. Referencia](#10-referencia)

## 1. Instalar zsh
```console
sudo apt install zsh
```
## 2. Comprobar tipo de terminal
- Ver si la terminal esta en BASH
```console
echo $SHELL
/bin/bash  //respuesta
```
## 3. Ver terminales instaladas
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
## 4. Cambiar a la terminal zsh(root , usuarios) 
- Asignar zsh a usuarios, en especial a root y otros
```console
sudo -s  //entrar como root
#chsh -s /bin/zsh root
#chsh -s /bin/zsh xixay
exec zsh //salir
```
## 5. Reiniciar 
- Salir de la terminal y volver a entrar
- Descargar la herramienta para gestionar la zsh
## 6. Instalar oh my zsh (usuario)
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
## 7. Instalar oh my zsh (root)
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
## 8. Instalar Powerlevel10k
### 8.1. Descargar el repositorio
```console
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```
### 8.2. Editar el archivo de configuración de zsh
- Ir a al archivo zsh por terminal, para cambiar el tema
```console
sudo nano .zshrc
```
- Modificar el tema
```console
ZSH_THEME="powerlevel10k/powerlevel10k"
```
- Guardar la nueva configuración y reiniciar la terminal
### 8.3. Descarga el tipo de fuente
- Ir a https://www.nerdfonts.com/font-downloads y descargar la fuente comprimida, descomprimir e instalar las fuentes de tipo ttf que se desee,  son ejecutables
- Cambiar en la terminal de preferencia el tipo de fuente a usar la fuente descargada
- Luego actualizar y limpiar
```console
sudo apt update
sudo apt upgrade
```
## 9. Configurar powerlevel10k
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
## 10. Referencia
- https://www.youtube.com/watch?v=EW2eDzBFONw
- [oh-my-zsh](https://kapeli.com/cheat_sheets/Oh-My-Zsh_Git.docset/Contents/Resources/Documents/index)

[<< INDICE](../README.md)

---


<div style="page-break-before: always;"></div>


# 📄 1.4. Instalar Node (Linux)

[<< INDICE](../README.md)
- [1. Instalar node usando nvm(node  version manager)](#1-instalar-node-usando-nvmnode--version-manager)
- [2. Instalar una version en especifica Node.js](#2-instalar-una-version-en-especifica-nodejs)
- [3. Listar las versiones de node](#3-listar-las-versiones-de-node)
- [4. Para usar una version en especifica Node.js](#4-para-usar-una-version-en-especifica-nodejs)
- [5. Para usar una version lts con largo mantenimiento en especifica Node.js](#5-para-usar-una-version-lts-con-largo-mantenimiento-en-especifica-nodejs)
- [6. Eliminar una versión de Node.js](#6-eliminar-una-versión-de-nodejs)
- [7. Instalar Nvm en WSL2](#7-instalar-nvm-en-wsl2)
- [8. Referencia](#8-referencia)

## 1. Instalar node usando nvm(node  version manager)
- Instalar NVM en Ubuntu 20.04
```console
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
```
- Ahora vamos a activar la variable de entorno para NVM con el siguiente comando:
```console
source ~/.bashrc
```
- Ahora vamos a verificar que tengamos instalado NVM y funcionando.
```console
nvm --version
```
- Instalar Node.js en su última versión
```console
nvm install node
```
- Ahora comprobamos que tengamos Node.js y npm instalados.
```console
node --version | npm --version
```
## 2. Instalar una version en especifica Node.js
- Con el siguiente comando instalas la versión que quieras de Node JS:
```console
nvm install 17.9.1.
```
## 3. Listar las versiones de node
```console
nvm ls
```
## 4. Para usar una version en especifica Node.js
```console
nvm use v18
```
- Luego establece esta versión como predeterminada con el siguiente comando:
```console
nvm alias default v12.22.0
```
- Si abres una nueva terminal puedes verificar con el siguiente comando la versión por defecto
```console
node -v
```
## 5. Para usar una version lts con largo mantenimiento en especifica Node.js 
//INSTALAR
- Ver la version de node instalado
```console
node -v (muestra la version de node que esta ejm:v15.0.1)
```
- Imstalar la nueva que se quiere
```console
nvm install 18.17
```
- Instalar el lts si no se lo instalo
```console
nvm install  --lts
```
- usar el node de mayor duracion de mantenimiento
```console
nvm use --lts   ()  
```
## 6. Eliminar una versión de Node.js
```console
nvm uninstall 14.18.1
```
## 7. Instalar Nvm en WSL2
- Instala cURL
```console
sudo apt-get install curl
```
- Instala nvm con
```console
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
```
## 8. Referencia
- [Versiones de node](https://nodejs.org/es/download/releases/)
- [Comandos nvm node](https://franyerverjel.com/blog/como-establecer-la-version-predeterminada-de-node-con-nvm)
- [Instalar NVM en Ubuntu 20.04](https://gndx.dev/blog/instalar-nvm-en-ubuntu-20-04/)

[<< INDICE](../README.md)

---


<div style="page-break-before: always;"></div>


# 📄 1.5. GIT

[<< INDICE](../README.md)
- [1. Ramas](#1-ramas)
- [2. Estados, commits y subir cambios](#2-estados-commits-y-subir-cambios)
- [3. Deshacer cambios](#3-deshacer-cambios)
- [4. Actualizar ramas](#4-actualizar-ramas)
- [5. Unir ramas](#5-unir-ramas)
  - [5.1. Unir rama2 a rama 1](#51-unir-rama2-a-rama-1)
  - [5.2. Pasos](#52-pasos)
- [6. Stash (Reservar cambios)](#6-stash-reservar-cambios)
  - [6.1. Ver los stash guardados](#61-ver-los-stash-guardados)
  - [6.2. Eliminar los stash](#62-eliminar-los-stash)
- [7. Ver commits anteriores](#7-ver-commits-anteriores)
- [8. Reemplazar el ultimo commit](#8-reemplazar-el-ultimo-commit)
- [9. Volver a una versión anterior de commit](#9-volver-a-una-versión-anterior-de-commit)
- [10. Crear una rama con una versión anterior de commit](#10-crear-una-rama-con-una-versión-anterior-de-commit)
- [11. Como Deshacer Un Git Pull en Git De Manera Eficiente](#11-como-deshacer-un-git-pull-en-git-de-manera-eficiente)
- [12. Como Deshacer Un Git Pull traido de otra rama](#12-como-deshacer-un-git-pull-traido-de-otra-rama)
- [13. Como Deshacer Un commit despues de haber hecho un Git Pull traido de otra rama](#13-como-deshacer-un-commit-despues-de-haber-hecho-un-git-pull-traido-de-otra-rama)
- [14. Referencia](#14-referencia)

# 1. Ramas

| **Comando**                   | **Accion**                        | **Resultado**                                                             |
|-------------------------------|-----------------------------------|---------------------------------------------------------------------------|
| git branch -a                 | Mostrar ramas                     | * main(Lo que se tiene en local)                                          |
|                               |                                   | remotes/origin/main(Lo que se tiene en el el repositorio)                 |
| git checkout main             | Cambiar de rama                   | Cambia a la rama main, desde otra rama                                    |
| git branch rama_nueva         | Crear rama                        | Crea una nueva rama(por ejemplo rama_nueva)                               |
| git checkout -b rama_nueva    | Crear rama y cambiar a rama nueva | Crea una nueva rama(por ejemplo rama_nueva) y cambia a la rama nueva      |
| git push -u origin rama_nueva | Publicar rama                     | Publicar la nueva rama en el repositorio remoto                           |
| git branch -d rama_eliminar   | Eliminar rama                     | elimina la rama que se desea, pero se debe estar en otra rama, no en ella |
| git branch -D rama_eliminar   | Forzar eliminar rama              | Si no quiere eliminar, se puede forzar                                    |
# 2. Estados, commits y subir cambios

| **Comando**                          | **Accion**                 | **Resultado**                                                                                                                   |
|--------------------------------------|----------------------------|---------------------------------------------------------------------------------------------------------------------------------|
| git branch -a                        | Muestra estado             | En la rama actual nada para hacer commit, el árbol de trabajo está limpio                                                       |
| git diff                             | Mostrar cambios            | Muestra en la terminal si se hizo algun cambio                                                                                  |
| git add archivo                      | Adiciona un cambio         | Adiciona un archivo al indice de contenidos para el próximo commit.                                                             |
| git add .                            | Adiciona todos los cambios | Adiciona todos los cambios y archivos al indice de contenidos                                                                   |
| git reset archivo                    | Quita un cambio de archivo | Remueve un archivo del indice de contenidos para el próximo commit.                                                             |
| git reset .                          | Quita todos los cambios    | Quita los cambios a ser comiteado, pero no elimina los cambios                                                                  |
| git commit -m "feat: Archivo creado" | Hacer un commit            | Confirma los cambios junto con un mensaje.                                                                                      |
| git log                              | Mostrar ultimos commits    |                                                                                                                                 |
| git push origin rama_actual          | Subir cambios              | Guardar cambios en el repositorio remoto:(Puede ser en la rama actual o otros, mientras esten vacios, o no afecten los cambios) |
| git push                             |                            | Al no especificar, guarda cambios en el repositorio remoto en la rama actual                                                    |
# 3. Deshacer cambios

| **Comando**                  | **Accion**                             | **Resultado**                            |
|------------------------------|----------------------------------------|------------------------------------------|
| git checkout archivo         | Deshace cambios                        | solo si esta encima                      |
| git checkout 'src/archivo'   | Deshace cambios                        | si se encuentra dentro de la carpeta src |
| git reset --hard origin/rama | Deshace TODOS los cambios              | Usa la rama en la que esta               |
| git reset --hard             | Deshace TODOS los cambios(otra opción) |                                          |
# 4. Actualizar ramas

| **Comando**                 | **Accion**                                       | **Resultado**                                                        |
|-----------------------------|--------------------------------------------------|----------------------------------------------------------------------|
| git fetch origin rama       | Verifica si hay cambios en esa rama              | Verifica si existen cambios en el repositorio remoto                 |
| git fetch                   | Verifica si hay cambios(otra opción)             | Verifica si existen cambios en el repositorio remoto                 |
| git pull origin rama_origen | Trae los cambios de rama_origen a la rama actual | Recupera y fusiona el repositorio remoto sobre el repositorio local. |
| git pull                    | Actualiza rama(otra opción)                      | Actualiza la rama en la que esta                                     |
# 5. Unir ramas
## 5.1. Unir rama2 a rama 1

| **ANTES**    |                | **DESPUES**        |
|--------------|----------------|--------------------|
| _rama1_      | _rama2_        | _rama1_            |
| main.ts      | main.ts        | main.ts            |
|              | main copy 2.ts | **main copy 2.ts** |
| main copy.ts |                | main copy.ts       |
## 5.2. Pasos

| **COMANDO**                                    | **ACCIÓN**                                                 | **RESULTADO**                                                                                                         |
|------------------------------------------------|------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------|
| git checkout rama1                             | Ir a la rama donde se traera o fusionara los cambios       |                                                                                                                       |
| git merge rama2                                | Fusiona la rama2 a la rama1 creando un commit sobre rama1. |                                                                                                                       |
| git merge rama2 --allow-unrelated-histories    | Si se pisan cambios, te pide elegir 2 opciones             | current change(cambio actual), [lo que esta en la rama1] incoming change(cambio entrante), [lo que viene de la rama2] |
| GUARDAR(ctrl+o) CONFIRMAR(enter) SALIR(ctrl+x) | Realizar un commit                                         | # Esta es la union de dos ramas                                                                                       |
|                                                |                                                            | fix: Combinar 'rama2' en rama1                                                                                        |
|                                                |                                                            | # Por favor ingrese un mensaje de commit que explique por qué es necesaria esta fusión,                               |
|                                                |                                                            | # especialmente si esto fusiona un upstream actualizado en una rama de tópico.                                        |
|                                                |                                                            | # # Líneas comenzando con '#' serán ignoradas, y un mensaje vacío aborta #  el commit.                                |
| git push                                       | subir al repositorio                                       |                                                                                                                       |
# 6. Stash (Reservar cambios)

| **Comando**     | **Accion**                 | **Resultado**                     |
|-----------------|----------------------------|-----------------------------------|
| git stash       | Resguarda los cambios      | Oculta los cambios(Los resguarda en la posicion 0) |
| git stash apply | Trae de vuelta los cambios | Trae los cambios de regreso       |

- Pero si se copio o creo nuevos archivos y aunque se modificaran no guardara(debe agregarlos con git add .)
## 6.1. Ver los stash guardados
- si se hace mas cambios,estos se van guardando sucesivamente, el ultimo guardado tenfra la posición cero
```console
git stash list
```
| **posicion** | **cambios**         | **traer cambios** |
|--------------|---------------------|-------------------|
| **0**        | _ultimo_            | git stash apply   |
| 1            | penultimo           | git stash apply 1 |
| 2            | ante penultimo      | git stash apply 2 |
| 3            | ante ante penultimo | git stash apply 3 |
## 6.2. Eliminar los stash
- Elimina los espacios de trabajo.
```
git stash clear
``` 
# 7. Ver commits anteriores
- Muestra los commits realizados
```console
git log --oneline
```
| **Ir a la version**  | **commits**                                                             |
|----------------------|-------------------------------------------------------------------------|
| git checkout 1802a7f | 1802a7f (HEAD -> rama2, origin/rama2) feat : commit de rama2            |
| git checkout 4ba9cc1 | 4ba9cc1 (origin/master, origin/develop, master, develop) doc: falta pm2 |
| git checkout 193378a | Inicializando NestJs                                                    |
# 8. Reemplazar el ultimo commit

| **Comando**                  | **Accion**               |
|------------------------------|--------------------------|
| git log --oneline            | Ver el ultimo commit     |
| git add .                    | Agregar el cambio        |
| git commit --amend --no-edit | Registra los cambios     |
| git push -f origin develop   | Guardar mediante forzado |
# 9. Volver a una versión anterior de commit

| **Comando**                                    | **Accion**                                      | **Resultado**                                                                                   |
|------------------------------------------------|-------------------------------------------------|-------------------------------------------------------------------------------------------------|
| git log --oneline                              | Ver el historial de commits(o sea de versiones) | 708e0a0 (HEAD -> master, origin/master) feat: Adicionando react-router-dom                      |
|                                                |                                                 | 436aba7 Falta rutas                                                                             |
|                                                |                                                 | 0198a98 doc: Estructurado por carpetas                                                          |
| git revert 708e0a0 436aba7                     | Volver a la version 0198a98                     | revertir los 2 ultimos commits, puede ser mas o menos(no debe incluir los que fueron mergeados) |
| GUARDAR(ctrl+o) CONFIRMAR(enter) SALIR(ctrl+x) | Hacer el commit                                 |                                                                                                 |
| git push                                       | subir al repositorio                            |                                                                                                 |
# 10. Crear una rama con una versión anterior de commit

| **Comando**                             | **Accion**                                      |
|-----------------------------------------|-------------------------------------------------|
| git log --oneline                       | Ver el historial de commits(o sea de versiones) |
| git checkout -b falta-ruta-rama 436aba7 | Crear la rama                                   |
| git push -u origin falta-ruta-rama      | Subir la rama al repositorio                    |
# 11. Como Deshacer Un Git Pull en Git De Manera Eficiente

| **Comando**                        | **Accion**                                                                   |
|------------------------------------|------------------------------------------------------------------------------|
| git reflog                         | 468e304 (HEAD -> master, origin/master) HEAD@{0}: commit: Primer Cambio      |
|                                    | b116d4e HEAD@{1}: commit: Corrección en el CSS                               |
|                                    | 456a37f HEAD@{2}: commit: Se Agrego una Función de JavaScript En el Footer   |
|                                    | b234b7a HEAD@{3}: commit: Agregado Dark Mode                                 |
|                                    | a356e87 HEAD@{4}: commit: Se elimino código JavaScript Excesivo              |
|                                    | cd98t4e HEAD@{5}: commit: Se añadio Redes Sociales                           |
|                                    | bt63gf5 HEAD@{6}: commit: Se agrego el campo email al formulario de contacto |
| git reset --hard a356e87           | Volver a la versión "Se elimino código JavaScript Excesivo"                  |
| git push -u origin falta-ruta-rama | Subir la rama al repositorio                                                 |
# 12. Como Deshacer Un Git Pull traido de otra rama
- Una vez que hayas realizado esta copia de seguridad
```console
git merge --abort
```
# 13. Como Deshacer Un commit despues de haber hecho un Git Pull traido de otra rama
- Si ya se hizo commit para cancelarlo
```console
git reset --soft HEAD~1
```
# 14. Referencia
- [Tablas de markdown](https://www.tablesgenerator.com/markdown_tables#)
- [Como Deshacer Un Git Pull en Git De Manera Eficiente](https://blog.nubecolectiva.com/como-deshacer-un-git-pull-en-git-de-manera-eficiente/)

[<< INDICE](../README.md)


---


<div style="page-break-before: always;"></div>


# 📄 1.6. GIT (Zsh abreviado)

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

---


<div style="page-break-before: always;"></div>


# 📄 1.7. Formato de commits

[<< INDICE](../README.md)
- [1. Tipos de commits](#1-tipos-de-commits)
  - [1.1. feat](#11-feat)
    - [1.1.1. feat especifico](#111-feat-especifico)
    - [1.1.2. feat eliminación](#112-feat-eliminación)
  - [1.2. refers](#12-refers)
  - [1.3. fix](#13-fix)
    - [1.3.1. fix api](#131-fix-api)
  - [1.4. BREAKING CHANGES](#14-breaking-changes)
  - [1.5. refactor](#15-refactor)
  - [1.6. perf](#16-perf)
  - [1.7. style](#17-style)
  - [1.8. test](#18-test)
  - [1.9. docs](#19-docs)
  - [1.10. build](#110-build)
    - [1.10.1. release](#1101-release)
  - [1.11. ops](#111-ops)
  - [1.12. chore](#112-chore)

# 1. Tipos de commits
## 1.1. feat
**Agrega una nueva característica**
```console
feat: agregar notificaciones por correo electrónico sobre nuevos mensajes directos
```
### 1.1.1. feat especifico
**Agrega una nueva característica en una parte específica del proyecto**
```console
feat(carrito de compras): agrega el botón increíble
```
### 1.1.2. feat eliminación
**Elimina una característica existente**
```console
feat!: eliminar el punto final de la lista de tickets
```
## 1.2. refers
**Agrega una referencia a una tarea o ticket**
```console
 refers to JIRA-1337 (se refiere a JIRA-1337)
```
## 1.3. fix
**Corrige un error en el código**
```console
fix: agregue el parámetro que falta a la llamada de servicio. El error se produjo debido a <razones>.
```
### 1.3.1. fix api
**Corrige un error específico en la API**
```console
fix(api): maneja el mensaje vacío en el cuerpo de la solicitud
fix(api): corrige el cálculo incorrecto de la suma de verificación del cuerpo de la solicitud
```
## 1.4. BREAKING CHANGES
**Indica cambios importantes que pueden romper la compatibilidad**
```console
BREAKING CHANGES: los puntos de ticket ya no admiten enumerar todas las entidades.
```
## 1.5. refactor
**Reestructura el código sin cambiar su comportamiento externo**
```console
refactor: implementar el cálculo del número de Fibonacci como recursividad
```
## 1.6. perf
**Mejora el rendimiento del código**
```console
perf: reduce el uso de memoria para determinar visitantes únicos mediante HyperLogLog
```
## 1.7. style
**Cambios que no afectan el significado del código (espacios en blanco, formato, punto y coma faltantes, etc.)**
```console
style: eliminar línea vacía
```
## 1.8. test
**Agrega pruebas faltantes o corrige pruebas existentes**
```console
test: agregar pruebas para la función de notificación
```
## 1.9. docs
**Cambios que afectan solo a la documentación**
```console
docs: actualizar la guía de instalación
```
## 1.10. build
**Cambios que afectan los componentes de compilación como la herramienta de compilación, la canalización CI, las dependencias, la versión del proyecto, etc.**
```console
build: actualizar dependencias
```
### 1.10.1. release
**Cambios relacionados con la liberación de una nueva versión del proyecto**
```console
build(release): `versión mejorada a 1.0.0
```
## 1.11. ops
**Cambios que afectan componentes operativos como infraestructura, implementación, respaldo, recuperación, etc.**
```console
ops: actualizar la configuración del servidor de producción
```
## 1.12. chore
**Tareas misceláneas que no se ajustan a las otras categorías**
```console
chore: modificando .gitignore
```
[<< INDICE](../README.md)

---


<div style="page-break-before: always;"></div>


# 📄 1.8. Crear repositorio (Github)

[<< INDICE](../README.md)
- [1. GitHub Descktop](#1-github-descktop)
  - [1.1. Creando repositorio](#11-creando-repositorio)
  - [1.2. GitHubDescktop](#12-githubdescktop)
    - [1.2.1. Changes](#121-changes)
    - [1.2.2. History](#122-history)
    - [1.2.3. Current branch](#123-current-branch)
# GitHub Desktop

GitHub Desktop es una herramienta gráfica que facilita la gestión de repositorios en GitHub. Permite realizar diversas operaciones sin necesidad de usar comandos de Git directamente desde la línea de comandos.

## 1. Creando Repositorio

Para crear un nuevo repositorio desde GitHub Desktop y publicarlo en GitHub:

- Abrir GitHub Desktop.
- Ir a `File > New Repository`.

| **Name**    | **Primer-Repositorio**                             |
|-------------|----------------------------------------------------|
| Description | Primer backend y frontend en GitHub Desktop        |
| Local path  | V:\curso de backend y frontend                     |

- Hacer clic en `Create repository`.
- Para publicar en GitHub.com, hacer clic en `Publish repository > Publish repository`.

La página del repositorio será [https://github.com/xixay/Primer-Repositorio](https://github.com/xixay/Primer-Repositorio).

- El primer commit será automático, creando los archivos `.gitattributes` y `README.md`.
- Inicialmente, no habrá cambios y se podrá empezar a trabajar.
- Por defecto, el repositorio tendrá solo la rama `main`.

## 2. GitHub Desktop

Para comenzar a trabajar en el repositorio:

- Abrir GitHub Desktop y visualizar el repositorio.
- Abrir en Visual Studio Code desde GitHub Desktop con `Open in Visual Studio Code`.
- Cualquier cambio realizado en Visual Studio Code se reflejará automáticamente en GitHub Desktop.

### 2.1. Changes

En esta sección se pueden visualizar los cambios realizados:

- Realizar los cambios necesarios en los archivos.
- Luego, realizar un commit:
  - Ingresar un resumen en `Summary` (obligatorio).
  - Hacer clic en `Commit to main`.
- Para enviar los commits al repositorio remoto en GitHub, hacer clic en `Push origin`.
- Los cambios se reflejarán en el repositorio en [https://github.com/xixay/Primer-Repositorio](https://github.com/xixay/Primer-Repositorio).

### 2.2. History

Aquí se pueden ver todos los commits realizados y los cambios asociados a cada uno.

### 2.3. Current Branch

Inicialmente, se estará en la rama `main`, pero se pueden crear nuevas ramas:

- Hacer clic en `Current branch` para agregar una nueva rama (`New branch`).
- Publicar la nueva rama (`Publish branch`).

Al crear una nueva rama desde `main`, esta tendrá todos los cambios de `main` sin necesidad de realizar un pull:

- Al hacer clic en `Create pull request`, se redirige a [https://github.com/xixay/Primer-Repositorio/compare/develop?expand=1](https://github.com/xixay/Primer-Repositorio/compare/develop?expand=1) para comparar los cambios entre las ramas.
- Hacer clic en `Create pull request`.
- Luego, hacer clic en `Merge pull request`.
- Confirmar el merge y cerrar la página.

De vuelta en GitHub Desktop, en la rama `main`, hacer clic en `Fetch origin` y luego en `Pull origin` para sincronizar los cambios de `develop` en `main`.

Con estos pasos, se tendrán todos los cambios de `develop` fusionados en `main` en GitHub Desktop.

[<< INDICE](../README.md)

---


<div style="page-break-before: always;"></div>


# 📄 1.9. Claves SSH (Github/Gitlab)

[<< INDICE](../README.md)
- [1. Creando Claves asimetricas ssh linux](#1-creando-claves-asimetricas-ssh-linux)
- [2. Subir clave ssh creada en linux a GitHub](#2-subir-clave-ssh-creada-en-linux-a-github)
- [3. Creando Claves asimetricas ssh windows](#3-creando-claves-asimetricas-ssh-windows)
- [4. Subir clave ssh creada en windows a GitHub](#4-subir-clave-ssh-creada-en-windows-a-github)
- [5. Creando Claves asimetricas ssh en wsl2 de windows](#5-creando-claves-asimetricas-ssh-en-wsl2-de-windows)
- [6. Subir clave ssh creada en wsl2 de windows a GitHub](#6-subir-clave-ssh-creada-en-wsl2-de-windows-a-github)
- [7. Subir clave ssh creada en wsl2 de windows a GitLab](#7-subir-clave-ssh-creada-en-wsl2-de-windows-a-gitlab)
- [8. Obtener dirección SSH del repositorio en GitHub](#8-obtener-dirección-ssh-del-repositorio-en-github)
- [9. Subir clave GitLab](#9-subir-clave-gitlab)
- [10. Obtener dirección SSH del repositorio](#10-obtener-dirección-ssh-del-repositorio)
- [11. Cambiar el remoto( https a ssh, o viceversa)](#11-cambiar-el-remoto-https-a-ssh-o-viceversa)
  - [11.1. Ver si esta en https o ssh](#111-ver-si-esta-en-https-o-ssh)
  - [11.2. Cambiar a ssh](#112-cambiar-a-ssh)
- [12. Referencia](#12-referencia)

# 1. Creando Claves asimetricas ssh linux
- Crear nuestra clave
```console
dev@dev:~$ ssh-keygen -t rsa
```
- En el directorio de nuestro usuario, /home/dev(o carpeta personal) en mi caso, dispondremos de las claves en un subdirectorio llamado .ssh (si no se visualiza en linux, apretar ctrl+h)
```console
ls .ssh/
id_rsa  id_rsa.pub  known_hosts //respuesta
```
- En este caso, como no le he especificado a ssh-keygen ningún nombre adicional, por defecto creó las claves con los nombres de id_rsa (privada) e id_rsa.pub (pública).
- Copiar el contenido del archivo id_rsa.pub y añadirlo a GitHub
```txt
ssh-rsa AAAAB3NzaC1y.............................../ agetic@dagetic315
```
# 2. Subir clave ssh creada en linux a GitHub
- Para subir la clave pública a GitHub iniciamos sesión en https://github.com/, hacemos click en el avatar de nosotros, despues en settings ingresamos a  Claves SSH (SSh and GPG keys).
- Esto nos mostrará una lista de las claves subidas con sus correspondientes nombres y datos de uso. En esta sección es posible eliminar las claves públicas ya subidas.
- Para subir una nueva clave ingresamos en New SSH Key
- En este formulario tendremos que pegar el contenido completo del archivo de nuestra clave pública id_rsa.pub(que se encuentra en .ssh). También es requerido un nombre para identificar esa clave de otras que puedan estar subidas al servidor. Este nombre puede indicar, por ejemplo, a que dispositivo(compuXixayLinux) corresponde esta clave, de esta manera una vez que el dispositivo no esté más en uso sabremos cual clave pública ya no es necesaria.
# 3. Creando Claves asimetricas ssh windows
- Apretar windows + git bash(Sacar la terminal de git)
- Comprobar si tenemos llaves ssh, si no tiene crear la carpeta
```console
ls -a ~/.ssh
./  ../  known_hosts//respuesta
```
- Si no tiene generar la llave ssh
```console
ssh-keygen -t ed25519 -C "xixay2013@gmail.com"
```
- Despues de 3 a 4 enters, se generara las claves privadas y publicas, para comprobar
```console
ls -a ~/.ssh
./  ../  id_ed25519  id_ed25519.pub  known_hosts//respuesta
```
```txt
clave privada=id_ed25519
clave publica=id_ed25519.pub
```
- Luego ejecutar el sgte comando
```console
eval "$(ssh-agent)"
```
- Luego se obtendra
```txt
Agent pid 1751
```
- Despues agregar la entidad al ssh 
```console
ssh-add ~/.ssh/id_ed25519
```
- Si se obtiene lo sgte esta bien
```console
$ ssh-add ~/.ssh/id_ed25519
Identity added: /c/Users/DELL/.ssh/id_ed25519 (xixay2013@gmail.com)
```
- Copiar el contenido de la clave publica ssh id_ed25519.pub y añadirlo a  GitHub
- Para copiar el contenido de la clave publica ssh id_ed25519.pub(osea tenerlo en el porta papeles), ejecutar
```console
clip < ~/.ssh/id_ed25519.pub
```
```txt
ssh-ed25519 AAAAC3NzaC1lZDI1NTE.....................qulhciQbf2WL xixay2013@gmail.com
```
# 4. Subir clave ssh creada en windows a GitHub
- Para subir la clave pública a GitHub iniciamos sesión en https://github.com/, hacemos click en el avatar de nosotros, despues en settings ingresamos a  Claves SSH (SSh and GPG keys).
- Esto nos mostrará una lista de las claves subidas con sus correspondientes nombres y datos de uso. En esta sección es posible eliminar las claves públicas ya subidas.
- Para subir una nueva clave ingresamos en New SSH Key
- En este formulario tendremos que pegar el contenido completo del archivo de nuestra clave pública id_ed25519.pub(que se encuentra en .ssh). También es requerido un nombre para identificar esa clave de otras que puedan estar subidas al servidor. Este nombre puede indicar, por ejemplo, a que dispositivo(compuXixayWindows) corresponde esta clave, de esta manera una vez que el dispositivo no esté más en uso sabremos cual clave pública ya no es necesaria.
# 5. Creando Claves asimetricas ssh en wsl2 de windows
- Ingresar a la terminal wsl2 de distribución de linux(ubuntu)
- Crear por consola las claves ssh
```console
ssh-keygen -t ed25519 -C "xixay2013@gmail.com"
```
- En el directorio de nuestro usuario, /home/dev(o carpeta personal) en mi caso, dispondremos de las claves en un subdirectorio llamado .ssh (si no se visualiza en linux, apretar ctrl+h)
```console
ls .ssh/
id_ed25519  id_ed25519.pub known_hosts  known_hosts.old //respuesta
```
- En este caso, como no le he especificado a ssh-keygen ningún nombre adicional, por defecto creó las claves con los nombres de id_ed25519 (privada) e id_ed25519.pub (pública).
- Ir a la carpta .ssh y copiar la clave publica
```console
cd
cd .ssh
code id_ed25519.pub
```
- Copiar el contenido del archivo id_ed25519.pub y añadirlo a GitHub
```txt
ssh-ed25519 AAAAC3NzaC1l........QCHKB xixay2013@gmail.com
```
- Agregar la clave privada a el agente ssh
```console
eval "$(ssh-agent -s)"
Agent pid 944 // respuesta
```
```console
ssh-add ~/.ssh/id_ed25519
Identity added: /home/xixay/.ssh/id_ed25519 (xixay2013@gmail.com) // respuesta
```
- Configuración de GitHub para el subsistema de windows para linux, debe asegurarse de informarle a su entorno de windows linux, sobre su perfil de gitHuib, proporcionandole un usuario y correo
```console
git config --global user.name "xixay"
git config --global user.email "xixay2013@gmail.com"
``` 
# 6. Subir clave ssh creada en wsl2 de windows a GitHub
- Para subir la clave pública a GitHub iniciamos sesión en https://github.com/, hacemos click en el avatar de nosotros, despues en settings ingresamos a  Claves SSH (SSh and GPG keys).
- Esto nos mostrará una lista de las claves subidas con sus correspondientes nombres y datos de uso. En esta sección es posible eliminar las claves públicas ya subidas.
- Para subir una nueva clave ingresamos en New SSH Key
- En este formulario tendremos que pegar el contenido completo del archivo de nuestra clave pública id_ed25519.pub(que se encuentra en .ssh). También es requerido un nombre para identificar esa clave de otras que puedan estar subidas al servidor. Este nombre puede indicar, por ejemplo, a que dispositivo(compuXixayWsl2) corresponde esta clave, de esta manera una vez que el dispositivo no esté más en uso sabremos cual clave pública ya no es necesaria.
# 7. Subir clave ssh creada en wsl2 de windows a GitLab
- Para subir la clave pública a GitHub iniciamos sesión en https://gitlab.com/users/sign_in, hacemos click en el avatar de nosotros, despues en preferencias ingresamos a  Claves SSH.
- Esto nos mostrará una lista de las claves subidas con sus correspondientes nombres y datos de uso. En esta sección es posible eliminar las claves públicas ya subidas.
- Para subir una nueva clave pegamos el contenido completo del archivo de nuestra clave pública id_ed25519.pub(que se encuentra en .ssh). También es requerido un Title para identificar esa clave de otras que puedan estar subidas al servidor. Este nombre puede indicar, por ejemplo, a que dispositivo(compuXixayWsl2) corresponde esta clave, de esta manera una vez que el dispositivo no esté más en uso sabremos cual clave pública ya no es necesaria.
# 8. Obtener dirección SSH del repositorio en GitHub
- En GitHub vamos a code dentro del proyecto ingresando en Clone, luego a SSH
- Puede que nos diga lo sgte
```txt
No tienes ninguna clave SSH pública en tu cuenta de GitHub. Puede agregar una nueva clave pública o intentar clonar este repositorio a través de HTTPS.
Hacemos click en add a new public key y pegamos el contenido completo del archivo de nuestra clave pública (id_rsa.pub)
```
-  Si nos pide crear un public key copiamos la dirección correspondiente a SSH(git@github.com:xixay/react-frontend-repositorio.git).
```console
dev@dev:~/Documentos/Richard$ git clone git@github.com:xixay/react-frontend-repositorio.git
```
- Una ves clonado el repositorio, instalar el repositorio como se indica, y colocar el archivo .env(de configuracion)
# 9. Subir clave GitLab
- Para subir la clave pública a GitLab iniciamos sesión e ingresamos a la sección Preferencias en el menú superior derecho. Una vez adentro en el menú izquierdo ingresamos a  Claves SSH.
- Esta sección nos mostrará un formulario donde tendremos que pegar el contenido completo del archivo de nuestra clave pública (id_rsa.pub que se encuentra en dev@dev:~/.ssh$ ). También es requerido un nombre para identificar esa clave de otras que puedan estar subidas al servidor. Este nombre puede indicar, por ejemplo, a que dispositivo((defecto dev@dev)) corresponde esta clave, de esta manera una vez que el dispositivo no esté más en uso sabremos cual clave pública ya no es necesaria.
- Una opción extra que ofrece GitLab con respecto a Github es la de seleccionar una fecha de expiración para cada clave de manera que se vuelvan automáticamente invalidas después de esta fecha.
# 10. Obtener dirección SSH del repositorio
- En GitLab seguimos un proceso similar dentro del proyecto ingresando en Clone y copiando la dirección correspondiente a SSH(git@gitlab.agetic.gob.bo:message/agetic-sms-backend.git).
```console
dev@dev:~/Documentos/Richard$ git clone git@gitlab.agetic.gob.bo:message/agetic-sms-backend.git
```
- Una ves clonado el repositorio, instalar el repositorio como se indica, y colocar el archivo .env(de configuracion)
# 11. Cambiar el remoto( https a ssh, o viceversa)
## 11.1. Ver si esta en https o ssh
- Ejecutar
```console
git remote -v
```
- Se ve que esta en https
```txt
origin	https://github.com/xixay/json_server_repositorio.git (fetch)
origin	https://github.com/xixay/json_server_repositorio.git (push)
```
## 11.2. Cambiar a ssh
- Ejecutar, colocando la nueva url en ssh(estas empiezan por git@github.com:)
```console
git remote set-url origin git@github.com:xixay/json_server_repositorio.git
```
- Para comprobar
```console
git remote -v
```
# 12. Referencia
- [Creando las claves asimétricas](https://juncotic.com/ssh-conectarnos-sin-usar-contrasena/)
- [Conectarse a repositorios git con SSH](https://juncotic.com/repositorios-git-ssh/)
- [Cambiar el remoto](https://unipython.com/cambiar-url-remota-en-git/)
- [Cambiar el remoto pag Github](https://docs.github.com/es/get-started/getting-started-with-git/managing-remote-repositories#changing-a-remote-repositorys-url)
- [Crear claves asimetricas en windows](https://www.youtube.com/watch?v=g0ZV-neSM7E)
- [Crear claves asimetricas en wsl2 de windows](https://m.youtube.com/watch?v=Xi_2Cu8z2d0)

[<< INDICE](../README.md)

---


<div style="page-break-before: always;"></div>


# 📄 1.10. Editar archivos (Linux)

[<< INDICE](../README.md)
- [1. Gestión de Archivos en Linux](#1-gestión-de-archivos-en-linux)
  - [1.1. Ir a la dirección](#11-ir-a-la-dirección)
  - [1.2. Ver los permisos del archivo](#12-ver-los-permisos-del-archivo)
  - [1.3. Dar todos los permisos](#13-dar-todos-los-permisos)
  - [1.4. Editar el archivo](#14-editar-el-archivo)
    - [1.4.1. Editar con Gedit](#141-editar-con-gedit)
    - [1.4.2. Editar con Vim](#142-editar-con-vim)


# 1. Gestión de Archivos en Linux
## 1.1. Ir a la dirección
```text
rteran@agetic137:/etc/kong$ 
```
## 1.2. Ver los permisos del archivo
```console
ls -l kong.conf
```
## 1.3. Dar todos los permisos
```console
sudo chmod 777 kong.conf
```
## 1.4. Editar el archivo
**Para editar el archivo utilizando diferentes editores de texto:**
### 1.4.1. Editar con Gedit
- Se abrira el editor de texto, editar y guardar
```console
gedit kong.conf
```
### 1.4.2. Editar con Vim
- Para editar el archivo utilizando Vim:
```console
vim kong.conf
```
**En Vim, puedes usar los siguientes comandos principales:**
- Presiona i para entrar en modo de inserción y comenzar a editar.
- Cuando hayas terminado de editar, presiona Esc para salir del modo de inserción.
- Para guardar los cambios y salir, escribe :wq y presiona Enter.
**Con estos pasos, podrás manejar la edición y gestión de archivos en Linux utilizando diferentes métodos y editores de texto.**

[<< INDICE](../README.md)


---


<div style="page-break-before: always;"></div>


# 📄 1.11. Configuración global Git (usuario/email)

[<< INDICE](../README.md)
- [1. Configuraciones De usuario y email para GIT](#1-configuraciones-de-usuario-y-email-para-git)
  - [1.1. Lista de configuraciones](#11-lista-de-configuraciones)
  - [1.2. Agregar usuario global](#12-agregar-usuario-global)
  - [1.3. Agregar correo global](#13-agregar-correo-global)
  - [1.4. Para subir los repositorios](#14-para-subir-los-repositorios)

## 1. Configuraciones De usuario y email para GIT
- Son el nombre de usuario y correo, de quien realizo el commit 
### 1.1. Lista de configuraciones
- Para ver el usuario y correo registrados
```console
git config --list
```
### 1.2. Agregar usuario global 
- El nombre de usuario global para todos los repositorios 
```console
git config --global user.name "rteran"
```
### 1.3. Agregar correo global
- El correo de usuario global para todos los repositorios 
```console
git config --global user.email richard_teran@contraloria.gob.bo
```
### 1.4. Para subir los repositorios
- Comprobar que esta en gitg@github y no en https
```console
git remote -v
origin	https://github.com/xixay/ayuda-memoria.git (fetch) //descarga commits, archivos y referencias de un repositorio remoto a tu repositorio local
origin	https://github.com/xixay/ayuda-memoria.git (push)  //El envío es la forma de transferir confirmaciones desde tu repositorio local a un repo remoto
```
| Debe estar | No debe estar |
|------------|---------------|
| (ssh)      | (https)       |
- Para cambiar a ssh si esta en https
```console
git remote set-url origin git@github.com:xixay/ayuda-memoria.git
```
- Comprobar que este en ssh: 
```console
git remote -v
```
- Respuestas:
  - descarga commits, archivos y referencias de un repositorio remoto a tu repositorio local
    ```console
    origin	git@github.com:xixay/ayuda-memoria.git (fetch)
    ```
  - El envío es la forma de transferir confirmaciones desde tu repositorio local a un repo remoto
    ```console
    origin	git@github.com:xixay/ayuda-memoria.git (push)
    ```
[<< INDICE](../README.md)

---


<div style="page-break-before: always;"></div>


# 📄 1.12. Docker (Windows, Linux, WSL2)

[<< INDICE](../README.md)

- [1. Definición](#1-definición)
- [2. Instalar Docker Engine en Ubuntu](#2-instalar-docker-engine-en-ubuntu)
  - [2.1. Instalar Docker con el Repositorio apt](#21-instalar-docker-con-el-repositorio-apt)
  - [2.2. Probar si funciona](#22-probar-si-funciona)
  - [2.3. Ejecutar el comando Docker sin sudo (opcional)](#23-ejecutar-el-comando-docker-sin-sudo-opcional)
- [3. Instalar Docker 2da Forma](#3-instalar-docker-2da-forma)
  - [3.1. instalar dependencias](#31-instalar-dependencias)
  - [3.2. Añadir el repositorio docker](#32-añadir-el-repositorio-docker)
  - [3.3. Instalación de Docker en Debian 11](#33-instalación-de-docker-en-debian-11)
    - [3.3.1. Permitir el acceso a Docker a usuarios no root](#331-permitir-el-acceso-a-docker-a-usuarios-no-root)
- [4. Comandos docker](#4-comandos-docker)
- [5. Contenedor Postgres](#5-contenedor-postgres)
  - [5.1. Comandos de postgres](#51-comandos-de-postgres)
- [6. Contenedor mongodb](#6-contenedor-mongodb)
  - [6.1. Comandos de mongodb](#61-comandos-de-mongodb)
- [7. Contenedor rabbit](#7-contenedor-rabbit)
  - [7.1. localhost de rabbit](#71-localhost-de-rabbit)
- [8. Contenedor Kong](#8-contenedor-kong)
  - [8.1. Crear una red acoplable](#81-crear-una-red-acoplable)
  - [8.2. Vincule Kong a un contenedor PostgreSQL](#82-vincule-kong-a-un-contenedor-postgresql)
  - [8.3. Prepara tu base de datos](#83-prepara-tu-base-de-datos)
  - [8.4. Comenzar Kong](#84-comenzar-kong)
  - [8.5. Verificar su instalación](#85-verificar-su-instalación)
  - [8.6. Verificar Kong Manager](#86-verificar-kong-manager)
- [9. Contenedor mysql](#9-contenedor-mysql)
- [10. Instalación de Docker Compose](#10-instalación-de-docker-compose)
  - [10.1. Uso de Docker Compose](#101-uso-de-docker-compose)
  - [10.2. Comandos básicos de Docker Compose](#102-comandos-básicos-de-docker-compose)
  - [10.3. Otros comandos útiles](#103-otros-comandos-útiles)
  - [10.4. Ejemplo de uso](#104-ejemplo-de-uso)
- [11. Referencia](#11-referencia)

# 1. Definición
```text
Docker es un proyecto de código abierto que automatiza el despliegue de aplicaciones dentro de contenedores de software
```
# 2. Instalar Docker Engine en Ubuntu
## 2.1. Instalar Docker con el Repositorio apt
- Actualizar la lista de paquetes
```console
sudo apt update
sudo apt install ca-certificates curl gnupg lsb-release
```
- Registrar el llavero GPG de Docker con apt
```console
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
```
- Añadir la fuente del paquete Docker a tu sistema
```console
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```
- Actualizar la lista de paquetes
```console
sudo apt update
```
- Añadir los componentes de dockler a tu sistema
```console
sudo apt install docker-ce docker-ce-cli containerd.io
```
## 2.2. Probar si funciona
```console
sudo docker run hello-world
```
- Vera al go parecido
```txt
Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/
```
## 2.3. Ejecutar el comando Docker sin sudo (opcional)
- Esto para evitar colocar sudo cada ves
- Asegúrate de que el grupo de usuarios docker existe:
```console
sudo groupadd docker
```
- Después, añádate a ti mismo:
```console
sudo usermod -aG docker ${USER}
```
- Para aplicar la nueva membresía de grupo, cierre la sesión del servidor y vuelva a iniciarla o escriba lo siguiente
```console
su - ${USER}
```
- Si debe agregar al grupo docker un usuario con el que no inició sesión, declare dicho nombre de usuario de forma explícita usando lo siguiente
```console
sudo usermod -aG docker username
```
- Probar sin sudo
```console
docker run hello-world
```
# 3. Instalar Docker 2da Forma
## 3.1. instalar dependencias
1. Ejecuta el siguiente comando apt para instalar nuevas dependencias de paquetes.
```console
apt install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
```
## 3.2. Añadir el repositorio docker
1. Ejecuta el siguiente comando para añadir la clave GPG para Docker.
```console
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
```
2. Después, añade el repositorio de Docker para el sistema Debian 11 utilizando el siguiente comando.
```console
echo \
 "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
 $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
 ```
3. Ahora ejecuta el comando‘apt update‘ para actualizar/refrescar todos los repositorios disponibles.
```console
apt update
```
## 3.3. Instalación de Docker en Debian 11
1. Si tu sistema tiene Docker instalado desde el repositorio de Debian anteriormente, debes eliminarlo utilizando el comando que aparece a continuación.
```console
sudo apt remove docker docker-engine docker.io containerd runc
```
2. Después, puedes instalar Docker de nuevo utilizando el comando apt que aparece a continuación.
```console
apt install docker-ce docker-ce-cli containerd.io
```
3. Si la instalación se ha completado, ejecuta el siguiente comando para verificar la instalación.
- Comprueba si el servicio está habilitado o no.
```console
systemctl is-enabled docker
systemctl is-enabled containerd
```
- Comprueba el estado del servicio Docker y Containerd.
```console
systemctl status docker containerd
```
### 3.3.1. Permitir el acceso a Docker a usuarios no root
- Crea el nuevo usuario ‘johndoe’ en tu sistema Debian
```console
useradd -m -s /bin/bash johndoe
```
- Después, ejecuta el siguiente comando para añadir el usuario ‘johndoe‘ al grupo‘docker‘.
```console
sermod -aG docker johndoe
su - johndoe
```
4. Ejecuta el siguiente comando docker para verificar tu instalación.
```console
docker run hello-world
```
5. Comprobando el contenedor con estado‘en ejecución‘
```console
docker ps
```
6. te mostrará todos los contenedores, los que se están ejecutando y los que están parados.
```console
docker ps -a
```
# 4. Comandos docker
- renombrar contenedor
```console
docker rename chasqui nuevoNombre
```
- borrar un contenedor
```console
docker rm chasqui
```
# 5. Contenedor Postgres
1. Ver los puertos
```console
sudo apt install net-tools
sudo netstat -tpln
```
2. Elimina versiones anteriores postgres
```console
  dpkg -l | grep postgres
  sudo apt-get --purge remove \
  postgresql \
  pgdg-keyring \
  postgresql-13 \
  postgresql-14 \
  postgresql-15 \
  postgresql-client-13 \
  postgresql-client-14 \
  postgresql-client-15 \
  postgresql-client-common \
  postgresql-common
```
3. Ver si siguen instalados los postgres
  ```console
  sudo service postgresql status
  ```
4. Crear contenedor
```console
sudo docker run   --name chasqui   -e POSTGRES_PASSWORD=postgres   -d   -p 7777:5432   postgres:14.6
```
5. Comprobar los puertos
```console
sudo netstat -tpln
```
6. iniciar contenedor
```console
docker start chasqui
```
7. obtener la dirección <IP>, por donde corre el contenedor(linux)
```console
docker inspect chasqui
```
8. ingresar como root
```console
sudo docker exec -it chasqui bash
```
9.  entrar a los comandos de postgres y editar
```console
root@39d084e50e74:/# psql -U postgres(luego se ejecuta postgres)
```
10.  crear la base de datos
```psql
CREATE DATABASE chasqui_db;
```
11.  Conectarse BD
```psql
\c chasqui_db;
```
12.  Crear esquemas si es que necesita(opcional)
```psql
create schema usuarios;
```
13.  Salir postgres
```psql
\q
```
14.  Salir root
```console
ctrl+d
```
15.  Conectarse DBeaver
```txt
- Ver la IP y puerto (linux)
docker inspect chasqui(172.17.0.2) tanbien colocar en .env
Host=172.17.0.2
port=5432
Database=chasqui_db
- Ver la IP y puerto (windows wsl2) tambien colocar en el .env
Host=localhost
port=7777
Database=chasqui_db
```
## 5.1. Comandos de postgres
- entrar a los comandos de postgres y editar
```console
sudo docker exec -it chasqui bash
root@39d084e50e74:/# psql -U postgres
```
- ver las bases de datos en este contenedor
```console
\l
```
- crear la base de datos
```console
CREATE DATABASE chasqui_db;
```
- borrar base de datos(el backend y el dbeaver deben estar apagado)
```console
DROP DATABASE chasqui_db;
```
- renombrar base de datos
```console
ALTER DATABASE viejoNombre RENAME TO nuevoNombre;
```
- crear en wsl2 docker
```console
docker run --name postgres-example -d -p 2022:5432 -e POSTGRES_PASSWORD=postgres postgres
```
# 6. Contenedor mongodb
1. Crear contenedor
```console
docker run --name mensajeria -d mongo:5.0.9
```
2. iniciar contenedor
```console
docker start mensajeria
```
3. obtener la dirección <IP>, por donde corre el contenedor
```console
docker inspect mensajeria
```
4. entrar a los comandos de mongodb y editar
```console
docker exec -it mensajeria mongo
```
5. crear la base de datos
```console
use notificaciones_db
```
6. crear usuario para esa base de datos
```console
db.createUser(
{
user: "miusuario",
pwd: "micontrasena",
roles: ["dbOwner"]
}
)
```
7. ingresar datos
```console
db.para.save({ estado: { type: 'tipo_estado1', enum: 'VALIDO', default: 'NO_ENVIADO' }, puerto: '1234', numero: '7772636', observacion: 'obs 1'})
db.contenido.save({ type: 'tipoContenido1', required: true})
db.estado.save({ type: 'tipoEstado1', enum: 'PROCESADO', default: 'EN_PROCESO'})
db.timestamps.save({ createdAt: 'fecha_creacion', updatedAt: 'fecha_modificacion'})
```
8. salir
```console
exit
```
## 6.1. Comandos de mongodb
-. entrar a los comandos de mongodb y editar
```console
docker exec -it mensajeria mongo
```
- ingresar a la base de datos del admin
```console
use admin
```
- crea usuario root
```console
db.createUser(
{
user: "mongouser",
pwd: "mongouser",
roles: ["root"]
}
)
```
- crear la base de datos no admin
```console
use notificaciones_db
```
- crea usuario dbOwner
```console
db.createUser(
{
user: "miusuario",
pwd: "micontrasena",
roles: ["dbOwner"]
}
)
```
- verifica autenticacion
```console
db.auth('miusuario','micontrasena')
```
- ver todos los usuarios
```console
show users
```
- lista de todos los usuarios de una base de datos
```console
db.getUsers()
```
- Eliminar un usuario de una base de datos
```console
use notificaciones_db
db.dropUser('miusuario')
```
- Ingresar datos
```console
db.para.save({ estado: { type: 'tipo_estado1', enum: 'VALIDO', default: 'NO_ENVIADO' }, puerto: '1234', numero: '7772636', observacion: 'obs 1'})
db.contenido.save({ type: 'tipoContenido1', required: true})
db.estado.save({ type: 'tipoEstado1', enum: 'PROCESADO', default: 'EN_PROCESO'})
db.timestamps.save({ createdAt: 'fecha_creacion', updatedAt: 'fecha_modificacion'})
```

- ver las colecciones de la tabla
```console
show collections
```
- muestra un elemento de la base
```console
db.para.find()
```
- muestra especifico la base
```console
db.para.find({ estado: { type: 'tipo_estado1', enum: 'VALIDO', default: 'NO_ENVIADO' }})
```
- borrar base de datos
```console
conn = new Mongo()
db = conn.getDB("notificaciones_db")
db.dropDatabase()
```
- salir
```console
exit
```
- Logearse en la terminal
```console
docker exec -it mensajeria mongo notificaciones_db -u "miusuario" -p "micontrasena"
```
# 7. Contenedor rabbit
1. Crear contenedor
```console
docker run -d -p 5672:5672 -p 15672:15672 \--name rabbitmq-server rabbitmq:management
```
2. iniciar contenedor
```console
docker start rabbitmq-server
```
3. Verificación del estado del servicio de RabbitMQ a través de los registros de Docker
```console
docker logs rabbitmq-server
```
4. Verifique RabbitMQ Cli y complementos para la gestión de servicios
```console
docker exec -it rabbitmq-server bash
root@5c6f76366ffc:/# rabbitmqctl version
root@5c6f76366ffc:/# rabbitmq-plugins list
```
5. salir
```console
exit
```
## 7.1. localhost de rabbit
1. Portal de administración http://localhost:15672/
2. usuario y password
```text
Username:guest
Password:guest
```
# 8. Contenedor Kong
## 8.1. Crear una red acoplable
```console
docker network create kong-net
```
##  8.2. Vincule Kong a un contenedor PostgreSQL
1. Crear contenedor postgres
```console
sudo docker run --name kong-database \
--network=kong-net \
-p 5555:5432 \
-e "POSTGRES_USER=kong" \
-e "POSTGRES_DB=kong" \
-e POSTGRES_PASSWORD=kongpass \
-d postgres:13.5
```
2. iniciar contenedor
```console
docker start kong-database
```
3. obtener la dirección <IP>, por donde corre el contenedor
```console
docker inspect kong-database// out:172.19.0.2
```
4. entrar a los comandos de postgres y editar
```console
psql -h 172.19.0.2 -U kong -W
contraseña:kongpass
```
5. crear la base de datos
```text
No es necesario ya esta creado

                         Listado de base de datos
  Nombre   | Dueño | Codificación |  Collate   |   Ctype    |  Privilegios
-----------+-------+--------------+------------+------------+---------------
 kong      | kong  | UTF8         | en_US.utf8 | en_US.utf8 |
 postgres  | kong  | UTF8         | en_US.utf8 | en_US.utf8 |
 template0 | kong  | UTF8         | en_US.utf8 | en_US.utf8 | =c/kong      +
           |       |              |            |            | kong=CTc/kong
 template1 | kong  | UTF8         | en_US.utf8 | en_US.utf8 | =c/kong      +
           |       |              |            |            | kong=CTc/kong
(4 filas)

```
6. salir
```console
\q
```
## 8.3. Prepara tu base de datos
1. Ejecute las migraciones de la base de datos con un contenedor Kong
```console
docker run --rm \
--network=kong-net \
-e "KONG_DATABASE=postgres" \
-e "KONG_PG_HOST=kong-database" \
-e "KONG_PG_PASSWORD=kongpass" \
-e "KONG_PASSWORD=test" \
kong/kong-gateway:2.8.1.2-alpine kong migrations bootstrap
```
2. Como confirmacion la ultima linea
```console
87 migrations processed
87 executed
Database is up-to-date
```
## 8.4. Comenzar Kong
```console
docker run -d --name kong-gateway \
  --network=kong-net \
  -e "KONG_DATABASE=postgres" \
  -e "KONG_PG_HOST=kong-database" \
  -e "KONG_PG_USER=kong" \
  -e "KONG_PG_PASSWORD=kongpass" \
  -e "KONG_PROXY_ACCESS_LOG=/dev/stdout" \
  -e "KONG_ADMIN_ACCESS_LOG=/dev/stdout" \
  -e "KONG_PROXY_ERROR_LOG=/dev/stderr" \
  -e "KONG_ADMIN_ERROR_LOG=/dev/stderr" \
  -e "KONG_ADMIN_LISTEN=0.0.0.0:8001" \
  -e "KONG_ADMIN_GUI_URL=http://localhost:8002" \
  -e KONG_LICENSE_DATA \
  -p 8000:8000 \
  -p 8443:8443 \
  -p 8001:8001 \
  -p 8444:8444 \
  -p 8002:8002 \
  -p 8445:8445 \
  -p 8003:8003 \
  -p 8004:8004 \
  kong/kong-gateway:2.8.1.2-alpine
```
## 8.5. Verificar su instalación
```console
curl -i http://localhost:8001/
//o mejor
curl -i -X GET --url http://localhost:8001/services
```
## 8.6. Verificar Kong Manager
- (No disponible en OSS) Verifique que Kong Manager se esté ejecutando accediendo a él usando la URL especificada en KONG_ADMIN_GUI_URL:
```text
http://localhost:8002
```
# 9. Contenedor mysql
- Crear contenedor MySQL
```bash
sudo docker run --name chasqui-mysql -e MYSQL_ROOT_PASSWORD=mysql -d -p 7777:3306 mysql:8.0
```
- Comprobar los puertos, Puedes verificar que el contenedor esté escuchando en el puerto 7777:
```bash
sudo netstat -tpln
```
- Iniciar contenedor
```bash
docker start chasqui-mysql
```
- Obtener la dirección IP del contenedor, Puedes obtener la dirección IP del contenedor:
```bash
docker inspect chasqui-mysql
```
- Ingresar como root, Puedes ingresar al contenedor como root:
```bash
sudo docker exec -it chasqui-mysql bash
```
- Entrar a la consola de MySQL, Puedes entrar a la consola de MySQL:
```bash
mysql -u root -p
```
- Crear la base de datos
```bash
CREATE DATABASE chasqui_db;
```
- Conectarse a la base de datos
```bash
USE chasqui_db;
```
- Crear esquemas (opcional)
```bash
CREATE SCHEMA usuarios;
```
- Ver todas las bases de datos:
```bash
SHOW DATABASES;
```
- Ver todas las tablas:
```bash
SHOW TABLES;
```
- Ver todos los esquemas:
```bash
SHOW SCHEMAS;
```
- Ver todos los usuarios:
```bash
SHOW USERS;
```
- Ver permisos de usuario actual(por ejemplo root):
```bash
SHOW GRANTS
```
- Ver todos los privilegios:
```bash
SHOW PRIVILEGES;
```
- Ver todos los privilegios de la base de datos:
```bash
SHOW GRANTS FOR 'root'@'%';
```
- Ver todos los usuarios y desde dónde pueden conectarse:
```bash
SELECT user, host FROM mysql.user;
```
- Salir de la consola de MySQL
```bash
exit
```
- Conectarse a la base de datos
```bash
mysql -u root -p chasqui_db
```
- Salir de la consola de MySQL
```bash
EXIT;
```
- Salir del contenedor
```bash
exit
```
- Detener el contenedor
```bash
docker stop chasqui-mysql
```
- Eliminar el contenedor
```bash
docker rm chasqui-mysql
```
- Conectarse con DBeaver
```text
Host=172.17.0.2
Port=3306
Database=chasqui_db


Si estás utilizando Windows con WSL2, debes utilizar la dirección IP localhost y el puerto 7777:


Host=localhost
Port=7777
Database=chasqui_db
```
# 10. Instalación de Docker Compose
- Descarga el script de instalación: Abre una terminal y ejecuta el siguiente comando:
```bash
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```
- Cambia los permisos del archivo: Ejecuta el siguiente comando para cambiar los permisos del archivo:
```bash
sudo chmod +x /usr/local/bin/docker-compose
```
- Verifica la instalación: Ejecuta el siguiente comando para verificar que Docker Compose esté instalado correctamente:
```bash
docker-compose --version
```
## 10.1. Uso de Docker Compose
- Crear un archivo docker-compose.yml
- El primer paso es crear un archivo llamado docker-compose.yml en el directorio raíz de tu proyecto. Este archivo define los servicios que componen tu aplicación.
```yaml
version: '3'
services:
  web:
    build: .
    ports:
      - "80:80"
    depends_on:
      - db
  db:
    image: postgres
    environment:
      - POSTGRES_USER=usuario
      - POSTGRES_PASSWORD=contraseña
```
- En este ejemplo, definimos dos servicios: web y db. El servicio web se construye a partir del directorio actual (build: .) y expone el puerto 80 (ports: - "80:80"). El servicio db utiliza la imagen de PostgreSQL (image: postgres) y establece variables de entorno para el usuario y la contraseña.

## 10.2. Comandos básicos de Docker Compose
- Una vez que tienes el archivo docker-compose.yml, puedes utilizar los siguientes comandos para gestionar tus servicios:

- docker-compose up: Inicia todos los servicios definidos en el archivo docker-compose.yml.
- docker-compose start: Inicia un servicio específico.
- docker-compose stop: Detiene un servicio específico.
- docker-compose restart: Reinicia un servicio específico.
- docker-compose down: Detiene y elimina todos los contenedores y redes creadas por Docker Compose.
## 10.3. Otros comandos útiles
- Aquí te presento algunos comandos adicionales que pueden ser útiles:

- docker-compose ps: Muestra el estado de todos los contenedores.
- docker-compose logs: Muestra los registros de todos los contenedores.
- docker-compose exec: Ejecuta un comando en un contenedor específico.

## 10.4. Ejemplo de uso
- Supongamos que tienes una aplicación web que utiliza una base de datos PostgreSQL. Puedes definir un archivo docker-compose.yml como el siguiente:

```yaml
version: '3'
services:
  web:
    build: .
    ports:
      - "80:80"
    depends_on:
      - db
  db:
    image: postgres
    environment:
      - POSTGRES_USER=usuario
      - POSTGRES_PASSWORD=contraseña
```
- Luego, puedes ejecutar el comando docker-compose up para iniciar ambos servicios. La aplicación web estará disponible en el puerto 80, y la base de datos PostgreSQL estará disponible en el contenedor db.
# 11. Referencia
- [docker](https://howtoforge.es/como-instalar-docker-en-debian-11/)
- [Cómo instalar y usar Docker en Ubuntu 20.04](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04-es)
- [Instalar Docker Engine en Ubuntu](https://kinsta.com/es/blog/instalar-docker-ubuntu/)
- [Kong-docker](https://docs.konghq.com/gateway/latest/install-and-run/docker/)
- [instaladores buen tutorial](https://elartedelcodigo.com/tutorials/docker/instalacion-de-docker)

[<< INDICE](../README.md)

---


<div style="page-break-before: always;"></div>


# 📄 1.13. TMUX

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


---


<div style="page-break-before: always;"></div>


# 📄 1.14. Notas en árbol

[<< INDICE](../README.md)
- [1. Crear el archivo de configuracion](#1-crear-el-archivo-de-configuracion)
- [2. Explicación de las configuraciones](#2-explicación-de-las-configuraciones)

## 1. Crear el archivo de configuracion
- En la carpeta .vscode crear el archivo settings.json, donde estaran los tipos de notas
```json
{
    // otras configuraciones.....,
    "todo-tree.tree.showCountsInTree": true,
    "todo-tree.tree.disableCompactFolders": true,
    "todo-tree.highlights.defaultHighlight": {
        "icon": "alert",
        "type": "text-and-comment",
        "foreground": "black",
        "background": "white",
        "opacity": 50,
        "iconColour": "blue",
        "gutterIcon": true,
    },
    "todo-tree.highlights.customHighlight": {
        "TODO": {
            "icon": "check",
            "foreground": "black",
            "background": "white",
            "iconColour": "white",
        },
        "NOTE": {
            "icon": "note",
            "foreground": "white",
            "background": "gray",
            "iconColour": "gray",
        },
        "COMMENT": {
            "icon": "note",
            "foreground": "white",
            "background": "gray",
            "iconColour": "gray",
        },
        "FIXME": {
            "foreground": "black",
            "background": "yellow",
            "iconColour": "yellow",
        },
        "BUG": {
            "foreground": "black",
            "background": "red",
            "iconColour": "red",
        },
        "[ ]": {
            "icon": "check",
            "foreground": "black",
            "background": "white",
            "iconColour": "yellow",
        },
        "[x]": {
            "icon": "check",
            "foreground": "white",
            "background": "green",
            "iconColour": "green",
        }
    },
    "todo-tree.general.tags": [
        "BUG",
        "HACK",
        "FIXME",
        "TODO",
        "NOTE",
        "COMMENT",
        "[ ]",
        "[x]"
    ],
    "todo-tree.regex.regex": "(//|#|<!--|;|/\\*|^|^\\s*(-|\\d+.))\\s*($TAGS).*(\\n\\s*//\\s{2,}.*)*",
 
}
```
## 2. Explicación de las configuraciones
- todo-tree.tree.showCountsInTree: Muestra el recuento de notas en el árbol.
- todo-tree.tree.disableCompactFolders: Desactiva el plegado compacto de carpetas en el árbol.
- todo-tree.highlights.defaultHighlight: Configuración predeterminada para resaltar notas.
  - icon: Ícono para resaltar.
  - type: Tipo de resaltado.
  - foreground: Color del texto.
  - background: Color de fondo.
  - opacity: Opacidad del resaltado.
  - iconColour: Color del ícono.
  - gutterIcon: Habilita el ícono en el margen.
- todo-tree.highlights.customHighlight: Resaltado personalizado por tipo de nota.
  - Configuraciones detalladas para TODO, NOTE, COMMENT, FIXME, BUG, [ ], [x].
- todo-tree.general.tags: Lista de etiquetas reconocidas por todo-tree.
- todo-tree.regex.regex: Expresión regular para identificar comentarios y etiquetas.

[<< INDICE](../README.md)

---


<div style="page-break-before: always;"></div>


# 📄 1.15. Color en VSCode (Peacock)

[<< INDICE](../README.md)
## Crear el archivo de configuracion
- En la carpeta .vscode crear el archivo settings.json, donde estaran los colores
```json
{
    // otras configuraciones.....,
       "workbench.colorCustomizations": {
        "activityBar.activeBackground": "#fbed80",
        "activityBar.background": "#fbed80",
        "activityBar.foreground": "#15202b",
        "activityBar.inactiveForeground": "#15202b99",
        "activityBarBadge.background": "#06b9a5",
        "activityBarBadge.foreground": "#15202b",
        "commandCenter.border": "#15202b99",
        "sash.hoverBorder": "#fbed80",
        "statusBar.background": "#f9e64f",
        "statusBar.foreground": "#15202b",
        "statusBarItem.hoverBackground": "#f7df1e",
        "statusBarItem.remoteBackground": "#f9e64f",
        "statusBarItem.remoteForeground": "#15202b",
        "titleBar.activeBackground": "#f9e64f",
        "titleBar.activeForeground": "#15202b",
        "titleBar.inactiveBackground": "#f9e64f99",
        "titleBar.inactiveForeground": "#15202b99"
    },
    "peacock.color": "#f9e64f"
 
}
```

[<< INDICE](../README.md)

---


<div style="page-break-before: always;"></div>


# 📄 1.16. GitIgnore

[<< INDICE](../README.md)
- [1. Archivo `.gitignore`](#1-archivo-gitignore)
- [2. Consulta https://help.github.com/articles/ignoring-files/ para obtener más información sobre cómo ignorar archivos.](#2-consulta-httpshelpgithubcomarticlesignoring-files-para-obtener-más-información-sobre-cómo-ignorar-archivos)
- [3. Vercel](#3-vercel)
- [4. Archivos específicos](#4-archivos-específicos)
- [5. Registros y depuración](#5-registros-y-depuración)
- [6. Informes de diagnóstico](#6-informes-de-diagnóstico)
- [7. Datos de tiempo de ejecución](#7-datos-de-tiempo-de-ejecución)
- [8. Directorios de dependencias](#8-directorios-de-dependencias)
- [9. Caché y archivos temporales](#9-caché-y-archivos-temporales)
- [10. Salida de compilación](#10-salida-de-compilación)
- [11. Caché de herramientas específicas](#11-caché-de-herramientas-específicas)
- [12. Directorios específicos de herramientas](#12-directorios-específicos-de-herramientas)
- [13. Archivos a Ignorar:](#13-archivos-a-ignorar)

## 1. Archivo `.gitignore`
- Ignora los siguientes archivos y directorios para evitar que se incluyan en el control de versiones:

## 2. Consulta https://help.github.com/articles/ignoring-files/ para obtener más información sobre cómo ignorar archivos.
## 3. Vercel
- Ignora el directorio .vercel, utilizado por la plataforma Vercel para configuraciones y despliegues.
## 4. Archivos específicos
- Evita archivos como .DS_Store y cualquier archivo con la extensión .pem.
## 5. Registros y depuración
- Excluye directorios y archivos relacionados con registros y depuración de npm, yarn, lerna, etc.
## 6. Informes de diagnóstico
- Descarta archivos JSON generados por Node.js para informes de diagnóstico.
## 7. Datos de tiempo de ejecución
- Ignora archivos y directorios relacionados con el tiempo de ejecución y procesos.
## 8. Directorios de dependencias
- Evita incluir directorios de dependencias como node_modules, jspm_packages, etc.
## 9. Caché y archivos temporales
- Excluye varios directorios y archivos temporales utilizados por herramientas de desarrollo como TypeScript, eslint, stylelint, etc.
## 10. Salida de compilación
- Descarta directorios de salida de compilación generados por frameworks como Next.js, Nuxt.js, VuePress, etc.
## 11. Caché de herramientas específicas
- Evita archivos y directorios de caché utilizados por herramientas como Parcel, Gatsby, VuePress, etc.
## 12. Directorios específicos de herramientas
- Ignora directorios relacionados con herramientas específicas como Docusaurus, serverless, etc.
Archivos de configuración de IDE: Descarta archivos relacionados con la configuración de entornos de desarrollo como VSCode.
## 13. Archivos a Ignorar:
- Vercel
```console
.vercel
```
- Archivos específicos
```console
.DS_Store         # Archivo de sistema macOS
*.pem             # Archivos con extensión .pem
```
- Registros y depuración
```console
logs              # Directorio de registros
*.log             # Archivos de registro generales
npm-debug.log*    # Archivos de registro de npm
yarn-debug.log*   # Archivos de depuración de yarn
yarn-error.log*   # Archivos de errores de yarn
lerna-debug.log*  # Archivos de depuración de lerna
.pnpm-debug.log*  # Archivos de depuración de pnpm
```
- Informes de diagnóstico de Node.js
```console
report.[0-9]*.[0-9]*.[0-9]*.[0-9]*.json
```
- Datos de tiempo de ejecución
```console
pids              # Directorio de identificadores de proceso
*.pid             # Archivos de identificación de proceso
*.seed            # Archivos de semillas
*.pid.lock        # Archivos de bloqueo de identificación de proceso
```
- Directorio para bibliotecas instrumentadas generadas por jscoverage/JSCover
```console
lib-cov
```
- Directorio de cobertura utilizado por herramientas como Estambul
```console
coverage
/coverage
*.lcov
```
- nyc test coverage
```console
.nyc_output
```
- Almacenamiento intermedio Grunt
```console
.grunt
```
- Directorio de dependencias de Bower
```console
bower_components
```
- Configuración de node-waf 
```console
.lock-wscript
```
- Complementos binarios compilados de Node.js
```console
build/Release
```
- Directorios de dependencia de Node.js
```console
node_modules/
jspm_packages/
/.pnp
.pnp.js
```
- Directorio de dependencias de Snowpack
```console
web_modules/
```
- TypeScript cache
```console
*.tsbuildinfo
next-env.d.ts
```
- Directorio de caché npm opcional
```console
.npm
```
- Caché eslint opcional
```console
.eslintcache
```
- Caché de estilo opcional
```console
.stylelintcache
```
- Caché de micropaquetes
```console
.rpt2_cache/
.rts2_cache_cjs/
.rts2_cache_es/
.rts2_cache_umd/
```
- Historial REPL opcional
```console
.node_repl_history
```
- Salida de 'paquete npm'
```console
*.tgz
```
- Archivo de integridad del hilo de Yarn
```console
.yarn-integrity
```
- Archivos de variables de entorno dotenv
```console
.env
.env.development.local
.env.test.local
.env.production.local
.env.local
```
- Caché del paquete de paquetes (Parcel)
```console
.cache
.parcel-cache
```
- Salida de compilación de Next.js
```console
.next
out
```
- Salida de compilación/generación de Nuxt.js
```console
.nuxt
dist
```
- Archivos de caché de Gatsby
```console
.cache/
```
- Salida de compilación de VuePress
```console
.vuepress/dist
```
- Directorio temporal y caché de VuePress v2.x
```console
.temp
.cache
```
- Caché de Docusaurus y archivos generados
```console
.docusaurus
```
- Directorios sin servidor
```console
.serverless/
```
- Caché FuseBox
```console
.fusebox/
```
- Archivos locales de DynamoDB
```console
.dynamodb/
```
- Archivo de puerto TernJS
```console
.tern-port
```
- Almacena versiones de VSCode utilizadas para probar extensiones
```console
.vscode-test
```
- Yarn v2
```console
.yarn/cache
.yarn/unplugged
.yarn/build-state.yml
.yarn/install-state.gz
.pnp.*
```

[<< INDICE](../README.md)

---


<div style="page-break-before: always;"></div>


# 📄 1.17. Base de Datos (Intro)

[<< INDICE](../README.md)
- [1. Diagrama entidad relacion (Diagrama lógico DER)](#1-diagrama-entidad-relacion-diagrama-lógico-der)
  - [1.1. Entidad](#11-entidad)
    - [1.1.1. Entidad Fuerte](#111-entidad-fuerte)
    - [1.1.2. Entidad Debil](#112-entidad-debil)
  - [1.2. Atributos](#12-atributos)
    - [1.2.1. Normal o Simple](#121-normal-o-simple)
    - [1.2.2. Clave Primaria](#122-clave-primaria)
    - [1.2.3. Clave Debil](#123-clave-debil)
    - [1.2.4. Derivado](#124-derivado)
    - [1.2.5. Multivalor](#125-multivalor)
    - [1.2.6. Especialización y genealización](#126-especialización-y-genealización)
  - [1.3. Relaciones](#13-relaciones)
    - [1.3.1. Normal](#131-normal)
    - [1.3.2. Debil](#132-debil)
      - [1.3.2.1. Tipos Entidad Debil](#1321-tipos-entidad-debil)
  - [1.4. Cardinalidad](#14-cardinalidad)
    - [1.4.1. Cardinalidad uno a uno (1:1)](#141-cardinalidad-uno-a-uno-11)
    - [1.4.2. Cardinalidad uno a varios (1:N)](#142-cardinalidad-uno-a-varios-1n)
    - [1.4.3. Cardinalidad varios a varios (N:N)](#143-cardinalidad-varios-a-varios-nn)
      - [1.4.3.1. Ejm 1](#1431-ejm-1)
      - [1.4.3.2. Ejm 2](#1432-ejm-2)
      - [1.4.3.3. Ejm 3](#1433-ejm-3)
      - [1.4.3.4. Ejm 4](#1434-ejm-4)
  - [1.5. Modelo de entidad relacion extendida](#15-modelo-de-entidad-relacion-extendida)
    - [1.5.1. Parcial exclusiva](#151-parcial-exclusiva)
    - [1.5.2. Total exclusiva](#152-total-exclusiva)
    - [1.5.3. Parcial solapada](#153-parcial-solapada)
    - [1.5.4. Total solapada](#154-total-solapada)
      - [1.5.4.1. Ejm 1](#1541-ejm-1)
      - [1.5.4.2. Ejm 2](#1542-ejm-2)
  - [1.6. Modelo de entidad relacion y cardinalidad](#16-modelo-de-entidad-relacion-y-cardinalidad)
    - [1.6.1. ER uno a uno (1:1)](#161-er-uno-a-uno-11)
    - [1.6.2. ER uno a varios (1:N)](#162-er-uno-a-varios-1n)
    - [1.6.3. ER varios a varios (N:N)](#163-er-varios-a-varios-nn)
    - [1.6.4. ER varios a varios Debil(1:N)](#164-er-varios-a-varios-debil1n)
    - [1.6.5. ER varios a varios (N:N) con ER varios a varios Debil(1:N)](#165-er-varios-a-varios-nn-con-er-varios-a-varios-debil1n)
  - [1.7. Cardinalidad y ordinalidad](#17-cardinalidad-y-ordinalidad)
    - [1.7.1. Cardinalidad](#171-cardinalidad)
    - [1.7.2. Ordinalidad](#172-ordinalidad)
- [2. Diagrama Entidad Relación (Diagrama Físico ER)](#2-diagrama-entidad-relación-diagrama-físico-er)
  - [2.1. Tipos de datos](#21-tipos-de-datos)
  - [2.2. Constraints (Restricciones)](#22-constraints-restricciones)
  - [2.3. Normalización](#23-normalización)
    - [2.3.1. Primera forma normal (1FN)](#231-primera-forma-normal-1fn)
      - [2.3.1.1. Ejemplo](#2311-ejemplo)
    - [2.3.2. Segunda forma normal (2FN)](#232-segunda-forma-normal-2fn)
    - [2.3.3. Tercera forma normal (3FN)](#233-tercera-forma-normal-3fn)
      - [2.3.3.1. Ejemplo mas simplificado](#2331-ejemplo-mas-simplificado)
      - [2.3.3.2. Segundo Ejemplo](#2332-segundo-ejemplo)
- [3. Base de datos PostgreSQL](#3-base-de-datos-postgresql)
  - [3.1. Definición Base de Datos](#31-definición-base-de-datos)
    - [3.1.1. Componentes Clave de una Base de Datos](#311-componentes-clave-de-una-base-de-datos)
  - [3.2. Tipos de Bases de Datos](#32-tipos-de-bases-de-datos)
  - [3.3. Operaciones Comunes en una Base de Datos](#33-operaciones-comunes-en-una-base-de-datos)
    - [3.3.1. CRUD](#331-crud)
    - [3.3.2. Consultas (Queries)](#332-consultas-queries)
  - [3.4. Conceptos Fundamentales](#34-conceptos-fundamentales)
    - [3.4.1. Llave Primaria (Primary Key)](#341-llave-primaria-primary-key)
    - [3.4.2. Llave Foránea (Foreign Key)](#342-llave-foránea-foreign-key)
    - [3.4.3. Índices (Indexes)](#343-índices-indexes)
    - [3.4.4. Llave Única (Unique Key)](#344-llave-única-unique-key)
    - [3.4.5. Constraint (Restricción)](#345-constraint-restricción)
  - [3.5. POSTGRESQL](#35-postgresql)
  - [3.6. Ventajas](#36-ventajas)
  - [3.7. Interacción con comandos](#37-interacción-con-comandos)
  - [3.8. Jerarquia de base de datos](#38-jerarquia-de-base-de-datos)
  - [3.9. Instalar PostgreSql Ubuntu](#39-instalar-postgresql-ubuntu)
  - [3.10. Instalar PgAdmin](#310-instalar-pgadmin)
    - [3.10.1. Instalar la clave pública para el repositorio (si no lo hizo anteriormente):](#3101-instalar-la-clave-pública-para-el-repositorio-si-no-lo-hizo-anteriormente)
    - [3.10.2. Crea el archivo de configuración del repositorio:](#3102-crea-el-archivo-de-configuración-del-repositorio)
    - [3.10.3. Instalar tanto para el modo de escritorio como para el web:](#3103-instalar-tanto-para-el-modo-de-escritorio-como-para-el-web)
    - [3.10.4. Instalar solo para modo de escritorio:](#3104-instalar-solo-para-modo-de-escritorio)
    - [3.10.5. Instalar solo para modo web:](#3105-instalar-solo-para-modo-web)
    - [3.10.6. Configure el servidor web, si instaló pgadmin4-web:](#3106-configure-el-servidor-web-si-instaló-pgadmin4-web)
  - [3.11. Utilizar roles y bases de datos de PostgreSQL](#311-utilizar-roles-y-bases-de-datos-de-postgresql)
    - [3.11.1. Cambiar cuenta de postgres](#3111-cambiar-cuenta-de-postgres)
    - [3.11.2. Acceder a la linea de comandos sin cambiar de cuenta](#3112-acceder-a-la-linea-de-comandos-sin-cambiar-de-cuenta)
  - [3.12. Crear un nuevo rol](#312-crear-un-nuevo-rol)
    - [3.12.1. Crear un nuevo usuario](#3121-crear-un-nuevo-usuario)
  - [3.13. Comandos más utilizados](#313-comandos-más-utilizados)
  - [3.14. Ejemplo modelo de base de datos](#314-ejemplo-modelo-de-base-de-datos)
  - [3.15. Crear Base datos](#315-crear-base-datos)
  - [3.16. Abrir la linea de comandos de Postgres con el nuevo rol](#316-abrir-la-linea-de-comandos-de-postgres-con-el-nuevo-rol)
    - [3.16.1. De forma directa](#3161-de-forma-directa)
    - [3.16.2. Conectarse a una base de datos diferente](#3162-conectarse-a-una-base-de-datos-diferente)
    - [3.16.3. Asignar privilegios a un usuario sobre una base de datos](#3163-asignar-privilegios-a-un-usuario-sobre-una-base-de-datos)
    - [3.16.4. Cambiar la contraseña de un usuario](#3164-cambiar-la-contraseña-de-un-usuario)
  - [3.17. Diagrama Entidad Relación BD](#317-diagrama-entidad-relación-bd)
  - [3.18. Diagrama Entidad BD](#318-diagrama-entidad-bd)
  - [3.19. Crear esquemas](#319-crear-esquemas)
    - [3.19.1. Cambiar al esquema creado](#3191-cambiar-al-esquema-creado)
  - [3.20. Crear tablas](#320-crear-tablas)
  - [3.21. Mostrar información sobre una tabla específica](#321-mostrar-información-sobre-una-tabla-específica)
  - [3.22. Agregar datos en una tabla](#322-agregar-datos-en-una-tabla)
  - [3.23. Ver datos en una tabla](#323-ver-datos-en-una-tabla)
  - [3.24. Eliminar datos en una tabla](#324-eliminar-datos-en-una-tabla)
  - [3.25. Agregar columnas en una tabla](#325-agregar-columnas-en-una-tabla)
  - [3.26. Eliminar columnas en una tabla](#326-eliminar-columnas-en-una-tabla)
  - [3.27. Actualizar datos de una tabla](#327-actualizar-datos-de-una-tabla)
  - [3.28. Relacion 1 a 1](#328-relacion-1-a-1)
  - [3.29. Relacion 1 a N](#329-relacion-1-a-n)
  - [3.30. Relacion N a N](#330-relacion-n-a-n)
  - [3.31. SQL JOINS](#331-sql-joins)
  - [3.32. INNER JOIN](#332-inner-join)
  - [3.33. LEFT JOIN (LEFT OUTER JOIN)](#333-left-join-left-outer-join)
  - [3.34. LEFT JOIN (A - B)](#334-left-join-a---b)
  - [3.35. RIGHT JOIN (RIGHT OUTER JOIN)](#335-right-join-right-outer-join)
  - [3.36. RIGHT JOIN (B-A)](#336-right-join-b-a)
  - [3.37. VIEW](#337-view)
    - [3.37.1. Caracteristicas](#3371-caracteristicas)
  - [3.38. TEMPORAL](#338-temporal)
  - [3.39. FUNCION](#339-funcion)
  - [3.40. TRIGGER](#340-trigger)
  - [3.41. PARTITION](#341-partition)
    - [3.41.1. Funciones de Ventana](#3411-funciones-de-ventana)
  - [3.42. PROCEDURE](#342-procedure)
  - [3.43. SUMA](#343-suma)
  - [3.44. COUNT](#344-count)
  - [3.45. SUB CLAUSULAS (WITH)](#345-sub-clausulas-with)


# 1. Diagrama entidad relacion (Diagrama lógico DER)
- Los diagramas ER se componen de entidades, relaciones y atributos. También representan la cardinalidad, que define las relaciones en términos de números.
## 1.1. Entidad
| **CONCRETA(tangible)** | **ABSTRACTO(intangible)** |
|------------------------|---------------------------|
| EMPLEADO               | CUENTA                    |
| CASA                   | CURSO                     |
| AUTO                   | MEMBRESIA                 |
### 1.1.1. Entidad Fuerte
- Son independientes de otras entidades, tienen una clave primaria, que distinga a cada suceso de la entidad.

**![Entidad Fuerte](file:///5imagenes/entidad-relacion/entidadFuerte.jpg)**
### 1.1.2. Entidad Debil
- Dependen de algun otro tipo de entidad, No tienen claves primarias.

**![Entidad Debil](file:///5imagenes/entidad-relacion/entidadDebil.jpg)**
## 1.2. Atributos
**![Atributo](file:///5imagenes/entidad-relacion/atributo.jpg)**

### 1.2.1. Normal o Simple
- Son las caracteristicas de una entidad, una relacion de muchos a muchos, o una relacion de uno a uno

**![Atributo Normal](file:///5imagenes/entidad-relacion/atributoNormal.jpg)**

### 1.2.2. Clave Primaria
- serán los identificadores, tienen un valor único en cada entidad (ejemplo: matrícula de la entidad vehículo)

**![Atributo Principal](file:///5imagenes/entidad-relacion/atributoPrincipal.jpg)**

### 1.2.3. Clave Debil

**![Atributo Debil](file:///5imagenes/entidad-relacion/atributoDebil.jpg)**

### 1.2.4. Derivado
- se calculan o derivan de otro atributo, por ejemplo, la edad se calcula a partir de la fecha de nacimiento

**![Atributo Derivado](file:///5imagenes/entidad-relacion/atributoDerivado.jpg)**

### 1.2.5. Multivalor
- se denota más de un valor del atributo, como varios números de teléfono para una persona.

**![Atributo Multivalor](file:///5imagenes/entidad-relacion/atributoMultivalor.jpg)**
### 1.2.6. Especialización y genealización
- Herencia, la persona hereda sus atributos a : director, estudiante,etc.

**![Atributo Generalizacion](file:///5imagenes/entidad-relacion/atributoGeneralizacion.jpg)**
## 1.3. Relaciones
- Las relaciones son asociaciones entre entidades, son vervos o acciones

**![relacion](file:///5imagenes/entidad-relacion/ralacion.jpg)**
### 1.3.1. Normal
- son asociaciones entre dos o más entidades

**![Normal](file:///5imagenes/entidad-relacion/relacionNormal.jpg)**
### 1.3.2. Debil
- son conexiones entre una entidad débil y su propietario

**![Debil](file:///5imagenes/entidad-relacion/relacionDebil.jpg)**
#### 1.3.2.1. Tipos Entidad Debil
- Las entidades débiles, tienen relaciones débiles, no llevan atributo identificador principal, en su lugar tiene un "atributo discriminador" y su cardinalidad siempre será (1:N)

**![Tipos Debil](file:///5imagenes/entidad-relacion/tiposEntidadDebil.jpg)**
## 1.4. Cardinalidad
### 1.4.1. Cardinalidad uno a uno (1:1)
- Esta se da cuenta cuando un registro  o elemento  de una entidad A se relaciona unicamente  con un solo registro de una entidad B y viceversa

**![unoAuno](file:///5imagenes/entidad-relacion/cardinalidad1a1.jpg)**
### 1.4.2. Cardinalidad uno a varios (1:N)
- Esta se da cuenta cuando un registro  o elemento  de una entidad A se relaciona con cero o varios registros de una entidad B, y cada registro de la entidad B se relaciona únicamente con un registro de la entidad A.

**![unoAN](file:///5imagenes/entidad-relacion/cardinalidad1aN.jpg)**
### 1.4.3. Cardinalidad varios a varios (N:N)
- Esta se da cuenta cuando un registro  o elemento  de una entidad A se relaciona con cero o varios registros de una entidad B, y cada registro de la entidad B se relaciona únicamente con cero o varios registros de la entidad A.

**![nAN](file:///5imagenes/entidad-relacion/cardinalidadNaN.jpg)**

#### 1.4.3.1. Ejm 1
- Obtener el diagrama entidad relación con las tres entidades siguientes:
  - ESTUDIANTE(num_matricula, nombre_e, fecha_nacimiento, telefono)
  - ASIGANTURA(codigo_asignatura, nombre_a)
  - DOCENTE(id_docente, nombre_d,ci,especialidad, telefono)
- Teniendo en cuenta
  - Un estudiante puede estar matriculado en una o varias asignaturas.
  - En una asignatura habrá como mínimo 10 y como máximo 25 estudiantes.
  - Un docente podrá impartir varias asignaturas.
  - Una signatura es impartida por un único docente.
  - Se quiere saber el curso escolar en el que cada estudiante está matriculado de cada asignatura
  
**![est](file:///5imagenes/entidad-relacion/estudiante.jpg)**
#### 1.4.3.2. Ejm 2
- Dada las 4 entidades realizar el diagrama E/R:
  - EMPLEADO(id_empleado, nombre_e, salario, telefono)
  - LOCALIDAD(id_localidad, nombre)
  - PROVINCIA(id_provincia, nombre_pro)
  - REGION(id_region, nombre_re)
- Se quiere guardar información de la localidad donde ha nacido cada uno de los empleados teniendo en cuenta que:
  - Un empleado ha nacido en una sola localidad
  - Cada localidad pertenence a una única provincia
  - Cada provincia pertenece a una única región del país.
  
**![prov](file:///5imagenes/entidad-relacion/provincia.jpg)**
#### 1.4.3.3. Ejm 3
- Una empresa dedicada a la instalación de dormitorios juveniles a medida quiere relizar una base de datos donde se reflejen las ventas y montajes, para lo cual se tiene en cuenta:
  - Cada modelo de dormitorio lo debe montar al menos dos empleados
  - El mismo empleado puede montar varios modelos de dormitorios.
  - De cada modelo dormitorio nos interesa conocer su código de modelo
  - El mismo empleado puede montar el mismo modelo en diferentes fechas. Nos interesa conocer la fecha en la que realiza cada montaje
  - De un empleado nos interesa su id_empleado, nombre dirección, telefono de contacto y el número de dormitorios que ha montado de cada modelo.
  - Cada modelo de dormitorio puede ser comprado por uno o varios clientes y el mismo cliente podrá comprar uno o varios dormitorios. De un cliente nos interesa su id_cliente, nombre_cli, direccion_cli, telefono_cli y fecha de compra de cada modelo.
  
**![dorm](file:///5imagenes/entidad-relacion/dormitorio.jpg)**
#### 1.4.3.4. Ejm 4
- El hospital tiene varias plantas, cada una de las cuales tiene un nombre y una cantidad de camas.
- Las camas que están en los niveles tienen un código que las identifican.
- Los pacientes cuentan con un número de seguro, ci y nombre, cada vez que el paciente llega al hospital se anota en su historia una fecha de entrada y una salida.
- A su vez cuando llega al hospital y es internadose le aigna una cama.
- Existen médicos que atienden a las pacientes, estas atenciones las denominan visitas medicas.
  
**![hosp](file:///5imagenes/entidad-relacion/hospitalDer.jpg)**
## 1.5. Modelo de entidad relacion extendida
- Es un modelo de entidades de nivel más alto  y bajo que heredan  atributos  y se dividen en generalizacion y especificacion 
- Las entidades hijas heredan los atributos de la entidad padre como tambien la llave primaria 
- Las entidades hijas no pueden tener el mismo atributo 

**![gen](file:///5imagenes/entidad-relacion/gen.jpg)**
### 1.5.1. Parcial exclusiva   
- Es parcial porque puede haber más empleados como: mesero, cajero, etc.
- Y es exclusiva porque el camarero no puede ser cocinero ni el camarero lava platos.

**![excl](file:///5imagenes/entidad-relacion/gen1.jpg)**
### 1.5.2. Total exclusiva
- Es total porque no existe mas fichas y es exclusiva porque una ficha de autor no puede ser ficha de tema.

**![texcl](file:///5imagenes/entidad-relacion/gen2.jpg)**

### 1.5.3. Parcial solapada
- Es parcial porque púede haber mas participantes como: actores, suplentes, etc.
- Y es solapada porque un director puede ser actor.

**![psol](file:///5imagenes/entidad-relacion/gen3.jpg)**
### 1.5.4. Total solapada
- Es total porque solo puede haber esos jugadores en el equipo y es solapada porque una defensa puede ser un portero, un portero puede ser un centro campista, etc

**![psol](file:///5imagenes/entidad-relacion/gencuatro.jpg)**

#### 1.5.4.1. Ejm 1
- En una empresa existen varios empleados conatributos como nombre, codigo del empleado, dirección, telefono, fecha de Nacimiento, salario; los empleados se dividen en arquitecto, indicando el numero de matricula y numero de proyecto, tambien existen administrativos que tiene cargo y nivel, tambien existen los ingenieros que tienen una especialidad y años de experiencia.

**![emp](file:///5imagenes/entidad-relacion/empresa.jpg)**

#### 1.5.4.2. Ejm 2
- Le contratan para hacer una BD que permita apoyar la gestión de un sistema de ventas. La empresa necesita llevar un control de proveedores, clientes, productos y ventas. Un proveedor tiene un RUT, nombre, dirección, telefono y página web.
- Un cliente tambien tiene RUT, nombre, dirección, pero puede tener varios teléfonos de contacto. 
- La dirección se entiende por calle, numero, comuna y ciudad.
- Un producto tiene un id único, nombre, precio actual stock y nombre del proveedor. Ademas se organizan en categorías y cada producto va sólo en una categoría.
- Una categoría tiene id, nombre y descripción.
- Por razones de contabilidad, se debe registrar la información de cada venta con un id, fecha, cliente, descuento y monto final.
- Ademas se debe guardar el precio al momento de la venta, la cantidad vendida y el monto total por el producto.

**![ven](file:///5imagenes/entidad-relacion/ventas.jpg)**
## 1.6. Modelo de entidad relacion y cardinalidad
### 1.6.1. ER uno a uno (1:1)

**![ERunoAuno](file:///5imagenes/entidad-relacion/er1a1.jpg)**
### 1.6.2. ER uno a varios (1:N)

**![ERunoAN](file:///5imagenes/entidad-relacion/er1aN.jpg)**
### 1.6.3. ER varios a varios (N:N)

**![nAN](file:///5imagenes/entidad-relacion/erNaN.jpg)**
### 1.6.4. ER varios a varios Debil(1:N)

**![nAND](file:///5imagenes/entidad-relacion/er1aNDebil.jpg)**
### 1.6.5. ER varios a varios (N:N) con ER varios a varios Debil(1:N)

**![com](file:///5imagenes/entidad-relacion/combinacion.jpg)**
## 1.7. Cardinalidad y ordinalidad

**![cYO](file:///5imagenes/entidad-relacion/cardYord.jpg)**
### 1.7.1. Cardinalidad
- es el numero maximo de veces que una instancia en una entidad se puede relacionar con instancias de otra entidad.

### 1.7.2. Ordinalidad
- es el numero minimo de veces que una instancia en una entidad se puede asociar con una instancia en la entidad relacionada.
# 2. Diagrama Entidad Relación (Diagrama Físico ER)
## 2.1. Tipos de datos
- Los tipos de datos dependiendo al manejador pueden cambiar un poco, los mas básicos son los siguientes:

**![tiposD](file:///5imagenes/entidad-relacion/tiposDatos.jpg)**
- La finalidad al elegir el tipo de dato correcto es optimizar el uso de memoria.
## 2.2. Constraints (Restricciones)
- El valor por defecto en una DB en Null
- Cuando no se meten datos el tipo es DEFAULT

| NOT NULL    | Se asegura que la columna no tenga valores nulos              |
|-------------|---------------------------------------------------------------|
| UNIQUE      | Se asegura que cada valor en la columna no se repita          |
| PRIMARY KEY | Es una combinación de NOT NULL y UNIQUE                       |
| FOREIGN KEY | Identifica de manera unica una tupla en otra tabla            |
| DEFAULT     | Coloca un valor por defecto cuando no hay un valor especifico |
| INDEX       | Se crea por columna para permitir búsquedas más rápidas       |

## 2.3. Normalización
- La normalización es un proceso que se aplica a las bases de datos para organizar las tablas y evitar la redundancia o complejidad en los datos.
- La normalización de una base de datos es la aplicación de una serie de reglas para evitar a futuro realizar quierys o consultas innecesariamente complejas. En otras palabras están enfocadas en eliminar redundancias e inconsistencias de dependencia en el diseño de las tablas que creamos para organizar las bases de datos.
- Los datos redundantes desperdician el espacio de disco de tu pc, además de crear problemas de mantenimiento.
- Las bases de datos se normalizan para:

| Evitar la redundancia de datos                               |
|--------------------------------------------------------------|
| Proteger la integridad de los datos                          |
| Evitar problemas de actualización de los datos en las tablas |
| FOREIGN KEY                                                  |

### 2.3.1. Primera forma normal (1FN)
- Todos los atribuots son atómicos.Un atributo es atómico si los elementos del dominio son simples e indivisibles.
- No debe existir variación en el número de columnas.
- Los campos no clave debe identificarse por la clave (dependencia funcional).
- Debe existir una independencia del orden tanto de las filas como de las columnas ; es decir, si los datos cambian de orden no deben cambiar sus signifados.

**![1FN](file:///5imagenes/entidad-relacion/1FN.jpg)**

#### 2.3.1.1. Ejemplo

**![1FNE](file:///5imagenes/entidad-relacion/1FNE.jpg)**
### 2.3.2. Segunda forma normal (2FN)
- Debe cumplir la 1FN.
- No tiene dependencia parcial.Es decir, todos los atributos no claves son totalmente dependientes de la la clave primaria  

**![2FN](file:///5imagenes/entidad-relacion/2FN.jpg)**

### 2.3.3. Tercera forma normal (3FN)
- Se encuentra en 2FN.
- No existe ninguna dependencia funcional transitiva en los atributos que no son clave.
- Esta FN se traduce en que aquellos datos que no pertenecen a la entidad deben tener una independencia de las demás y debe tener un campo clave propio.
- Aplicando 3FN separamos la tabla alumnos ya que contiene datos de los cursos en ella quedando de la siguiente manera.

**![3FN](file:///5imagenes/entidad-relacion/3FN.jpg)**

#### 2.3.3.1. Ejemplo mas simplificado

**![3FNS](file:///5imagenes/entidad-relacion/3FNS.jpg)**
#### 2.3.3.2. Segundo Ejemplo
- Se llevara a la 3ra forma normal la siguiente tabla
**![3FNS2](file:///5imagenes/entidad-relacion/3FNS2.jpg)**

- Se separa los nombres
**![3FNS2](file:///5imagenes/entidad-relacion/3FNS2-1.jpg)**

- Se simplifica la matería
**![3FNS2](file:///5imagenes/entidad-relacion/3FNS2-2.jpg)**

- Se simplifica lo demas
**![3FNS2](file:///5imagenes/entidad-relacion/3FNS2-3.jpg)**
# 3. Base de datos PostgreSQL
## 3.1. Definición Base de Datos
- Una base de datos es una colección de datos estructurados y organizados que permite el almacenamiento y recuperación eficiente de información. Está diseñada para manejar grandes volúmenes de datos y soportar múltiples tipos de operaciones de datos, tales como inserciones, actualizaciones, eliminaciones y consultas.
### 3.1.1. Componentes Clave de una Base de Datos
- Tablas (Tables): Las tablas son la estructura principal dentro de una base de datos relacional y están formadas por filas (registros) y columnas (campos). Cada tabla almacena datos relacionados en un formato tabular.
- Filas (Rows): Cada fila en una tabla representa un único registro de datos.
- Columnas (Columns): Cada columna en una tabla representa un campo de datos específico y define el tipo de datos que se puede almacenar en esa columna.
- Esquema (Schema): Un esquema es la estructura que define la organización de la base de datos, incluyendo las tablas, vistas, índices, procedimientos almacenados, etc. En PostgreSQL, un esquema es también un contenedor lógico dentro de una base de datos.
## 3.2. Tipos de Bases de Datos
- Bases de Datos Relacionales (RDBMS): Utilizan tablas para almacenar datos y usan SQL (Structured Query Language) para gestionar y manipular datos. Ejemplos incluyen PostgreSQL, MySQL, Oracle, y SQL Server.
- Bases de Datos NoSQL: Diseñadas para manejar grandes volúmenes de datos no estructurados y distribuidos. Ejemplos incluyen MongoDB, Cassandra, y Redis.
## 3.3. Operaciones Comunes en una Base de Datos
### 3.3.1. CRUD
- Acrónimo que representa las cuatro operaciones básicas de manipulación de datos:
  - Create (Crear): Insertar nuevos registros en una tabla.
  - Read (Leer): Consultar y recuperar datos de la base de datos.
  - Update (Actualizar): Modificar datos existentes.
  - Delete (Eliminar): Eliminar registros de una tabla.
### 3.3.2. Consultas (Queries)
- Utilización de SQL para buscar y recuperar datos específicos según criterios determinados.
## 3.4. Conceptos Fundamentales
- En PostgreSQL (y en sistemas de bases de datos relacionales en general), las llaves primarias y foráneas son conceptos fundamentales para asegurar la integridad y la relación de los datos. 
### 3.4.1. Llave Primaria (Primary Key)
- Una llave primaria es una columna o un conjunto de columnas que identifica de manera única a cada fila en una tabla. Las características principales de una llave primaria son:
  - Unicidad: Cada valor en la columna de la llave primaria debe ser único.
  - No Nulo: Los valores en la columna de la llave primaria no pueden ser nulos.
  - Indice Implícito: PostgreSQL crea automáticamente un índice único en la columna de la llave primaria para optimizar las búsquedas y las operaciones de consulta.
```sql
CREATE TABLE empleados (
    empleado_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    puesto VARCHAR(100)
);
--En este ejemplo, empleado_id es la llave primaria de la tabla empleados.
```
### 3.4.2. Llave Foránea (Foreign Key)
- Una llave foránea es una columna o un conjunto de columnas en una tabla que se refiere a la llave primaria de otra tabla. La llave foránea asegura que los valores en la columna de referencia existan en la tabla relacionada, manteniendo la integridad referencial.
```sql
CREATE TABLE departamentos (
    departamento_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE empleados (
    empleado_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    puesto VARCHAR(100),
    departamento_id INT,
    FOREIGN KEY (departamento_id) REFERENCES departamentos(departamento_id)
);
--En este ejemplo, departamento_id en la tabla empleados es una llave foránea que se refiere a departamento_id en la tabla departamentos.
```
### 3.4.3. Índices (Indexes)
- Los índices son estructuras que mejoran la velocidad de las operaciones de consulta en una tabla. Aunque los índices mejoran el rendimiento de las consultas, también pueden ralentizar las operaciones de inserción, actualización y eliminación.
```sql
CREATE INDEX idx_nombre ON empleados(nombre);
--Este comando crea un índice en la columna nombre de la tabla empleados.
```
### 3.4.4. Llave Única (Unique Key)
- Una llave única es una columna o un conjunto de columnas en una tabla que garantiza que los valores almacenados sean únicos en todas las filas de la tabla. A diferencia de la llave primaria, una tabla puede tener múltiples llaves únicas y las columnas de llaves únicas pueden aceptar valores nulos.
```sql
CREATE TABLE usuarios (
    usuario_id SERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE,
    nombre VARCHAR(100)
);
--En este ejemplo, email debe ser único en toda la tabla usuarios.
```
### 3.4.5. Constraint (Restricción)
- Las restricciones son reglas aplicadas a las columnas de una tabla para garantizar la exactitud y la fiabilidad de los datos en la base de datos. Algunos tipos comunes de restricciones incluyen:
  - NOT NULL: Asegura que una columna no puede tener valores nulos.
  - CHECK: Asegura que los valores en una columna cumplen una condición específica.
  - DEFAULT: Define un valor por defecto para una columna cuando no se proporciona ningún valor.
```sql
CREATE TABLE productos (
    producto_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio NUMERIC CHECK (precio > 0),
    stock INT DEFAULT 0
);
--En este ejemplo, email debe ser único en toda la tabla usuarios.
```
## 3.5. POSTGRESQL
- PostgreSQL es un potente sistema de base de datos relacional de objetos de código abierto con más de 35 años de desarrollo activo que le ha ganado una sólida reputación por su confiabilidad, solidez de funciones y rendimiento.
## 3.6. Ventajas
- Instalación ilimitada y gratuita
- Gran escalabilidad
- Estabilidad y confiabilidad
- Estandar SQL
- Potencia y robustez
- Extensibilidad
- pgAdmin
## 3.7. Interacción con comandos
- La consola en PostgreSQL es una herramienta muy potente para crear, administrar y depurar nuestra base de datos, podemos acceder a ella después de instalar PostgreSQL
## 3.8. Jerarquia de base de datos
- Servidor de base de datos: Computador que tiene un motor de base de datos instalado y en ejecución.
- Motor de base de datos: Software que provee un conjunto de servicios encargados de administrar una base de datos
- Base de datos: Grupo de datos que pertenencen a un mismo contexto.
- Esquemas de base de datos en PostgreSQL: Grupo de objetos de base de datos que guarda relación entre sí (tablas, funciones, relaciones, secuencias)
- Tablas de base de datos: Estructura de datos: Estructura que organiza los datos en filas y columnas formando una matriz.
## 3.9. Instalar PostgreSql Ubuntu
- Actualizar primero:
```console
sudo apt update
```
- Instale el paquete de Postgres junto con un paquete -contrib
```console
sudo apt install postgresql postgresql-contrib
```
## 3.10. Instalar PgAdmin
### 3.10.1. Instalar la clave pública para el repositorio (si no lo hizo anteriormente):
```console
curl -fsS https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo gpg --dearmor -o /usr/share/keyrings/packages-pgadmin-org.gpg
```
### 3.10.2. Crea el archivo de configuración del repositorio:
```console
sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/packages-pgadmin-org.gpg] https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'
```
### 3.10.3. Instalar tanto para el modo de escritorio como para el web:
```console
sudo apt install pgadmin4
```
### 3.10.4. Instalar solo para modo de escritorio:
```console
sudo apt install pgadmin4-desktop
```
### 3.10.5. Instalar solo para modo web: 
```console
sudo apt install pgadmin4-web 
```
### 3.10.6. Configure el servidor web, si instaló pgadmin4-web:
```console
sudo /usr/pgadmin4/bin/setup-web.sh
```
## 3.11. Utilizar roles y bases de datos de PostgreSQL
### 3.11.1. Cambiar cuenta de postgres
- Cambie a la cuenta de postgres en su servidor, para ello ingrese con su usuario:
```console
sudo -i -u postgres
```
- Acceder de inmediato a una línea de comandos de PostgresSQL
```console
sudo -i -u postgres psql
```
- Salir
```console
\q
```
### 3.11.2. Acceder a la linea de comandos sin cambiar de cuenta
- Con lo siguiente
```console
sudo -u postgres psql
```
## 3.12. Crear un nuevo rol
### 3.12.1. Crear un nuevo usuario
- Normalmente
```console
CREATE USER nombre_de_tu_usuario WITH PASSWORD 'tu_contraseña';
```
- Crear un nuevo usuario con sudo:
```console
sudo -u postgres createuser --interactive
```
- Otorgar privilegios al usuario (opcional):
- Puedes asignar privilegios específicos al nuevo usuario. Por ejemplo, para otorgarle todos los privilegios en todas las bases de datos, puedes hacer lo siguiente:
```console
ALTER USER nombre_de_tu_usuario WITH SUPERUSER;
```
- Salir de la consola de PostgreSQL:
```console
\q
```
## 3.13. Comandos más utilizados

**`\?` listar todos los comandos** 

***Comandos de navegación y consulta de información***

- **`\c`** Saltar entre bases de datos
- **`\l`** Listar base de datos disponibles
- **`\dt`** Listar las tablas de la base de datos
- **`\d <nombre_tabla>`** Describir una tabla
- **`\dn`** Listar los esquemas de la base de datos actual
- **`\df`** Listar las funciones disponibles de la base de datos actual
- **`\dv`** Listar las vistas de la base de datos actual
- **`\du`** Listar los usuarios y sus roles de la base de datos actual

***Comandos de inspección y ejecución***

- **`\g`** Volver a ejecutar el comando ejecutando justo antes
- **`\s`** Ver el historial de comandos ejecutados
- **`\s <nombre_archivo>`** Si se quiere guardar la lista de comandos ejecutados en un archivo de texto plano
- **`\i <nombre_archivo>`** Ejecutar los comandos desde un archivo
- **`\e`** Permite abrir un editor de texto plano, escribir comandos y ejecutar en lote. **\e** abre el editor de texto, escribir allí todos los comandos, luego guardar los cambios y cerrar, al cerrar se ejecutarán todos los comandos guardados.
- **`\ef`** Equivalente al comando anterior pero permite editar también funciones en PostgreSQL
## 3.14. Ejemplo modelo de base de datos
- Este modelo de base de datos representa información de usuarios y sus actividades. La entidad "Usuarios" contiene datos personales como nombre, teléfono, email, y detalles como ocupación y fecha de nacimiento. Además, se almacena la fecha de registro y una foto. Las entidades relacionadas incluyen "Experiencias" (con nombre y descripción), "Redes Sociales" (con nombre y foto), "Habilidades" (con icono, nombre y descripción), "Tecnologías" (con nombre y foto), y "Proyectos" (con nombre, foto, descripción y enlace). Estas entidades se conectan a la entidad "Usuarios" a través de claves foráneas, permitiendo organizar y acceder a información detallada sobre las experiencias, habilidades y proyectos asociados a cada usuario.

## 3.15. Crear Base datos
- Iniciar sesion con la cuenta postgres y crear la base de datos
```console
CREATE DATABASE nombre_de_tu_base_de_datos;
```
## 3.16. Abrir la linea de comandos de Postgres con el nuevo rol
### 3.16.1. De forma directa
- También podrá hacerlo de forma directa:
```console
sudo -u nombre_de_tu_usuario psql
```
### 3.16.2. Conectarse a una base de datos diferente
- Si desea que su usuario se conecte a una base de datos diferente, puede lograrlo especificando la base de datos de esta manera:
```console
psql -d otra_base_de_datos -U tu_nuevo_usuario
```
- Ya que inició sesión, puede verificar la información de su conexión actual escribiendo lo siguiente:
```console
\conninfo
```
```text
Output
You are connected to database "otra_base_de_datos" as user "tu_nuevo_usuario" via socket in "/var/run/postgresql" at port "5432".
```
### 3.16.3. Asignar privilegios a un usuario sobre una base de datos
```console
GRANT ALL PRIVILEGES ON DATABASE nombre_de_tu_base_de_datos TO nombre_de_usuario;
```
### 3.16.4. Cambiar la contraseña de un usuario
```console
ALTER USER nombre_de_usuario WITH PASSWORD 'nueva_contraseña';
```

## 3.17. Diagrama Entidad Relación BD
**![eder](file:///5imagenes/entidad-relacion/ejmDER.jpg)**
## 3.18. Diagrama Entidad BD
**![ede](file:///5imagenes/entidad-relacion/ejmDE.jpg)**
## 3.19. Crear esquemas
- La sintaxis básica para la creación de esquemas es la siguiente
```sql  
CREATE SCHEMA IF NOT EXISTS core;
CREATE SCHEMA IF NOT EXISTS portafolio;
```
### 3.19.1. Cambiar al esquema creado
- La sintaxis básica para cambiar al esquema creado es la siguiente
```sql  
SET search_path TO core;
```
## 3.20. Crear tablas
- La sintaxis básica para la creación de tablas es la siguiente
```sql
-- Creación de la tabla de usuarios
CREATE TABLE IF NOT EXISTS core.usuarios (
    id_usuario SERIAL PRIMARY KEY,
    nombre VARCHAR(2000),
    telefono INTEGER,
    email VARCHAR(100),
    descripcion TEXT,
    ocupacion VARCHAR(2000),
    fecha_nac DATE,
    foto VARCHAR(5000),
    fecha_reg TIMESTAMP DEFAULT NOW()
);

-- Creación de la tabla de habilidades
CREATE TABLE IF NOT EXISTS portafolio.habilidades (
    id_habilidad SERIAL PRIMARY KEY,
    icono VARCHAR(2000),
    nombre VARCHAR(2000),
    descripcion TEXT
);
-- Creación de la tabla intermedia para la relación n:n entre usuarios y habilidades
CREATE TABLE IF NOT EXISTS core.usuarios_habilidades (
    id_usuario_habilidad SERIAL PRIMARY KEY,
    id_usuario INTEGER,
    id_habilidad INTEGER,
    CONSTRAINT fk_usuario_habilidad_usuario FOREIGN KEY (id_usuario) REFERENCES core.usuarios(id_usuario),
    CONSTRAINT fk_usuario_habilidad_habilidad FOREIGN KEY (id_habilidad) REFERENCES portafolio.habilidades(id_habilidad)
);
-- Creación de la tabla de proyectos
CREATE TABLE IF NOT EXISTS core.proyectos (
    id_proyecto SERIAL PRIMARY KEY,
    nombre VARCHAR(2000),
    foto VARCHAR(5000),
    descripcion TEXT,
    link VARCHAR(2000),
    id_usuario INTEGER,
    CONSTRAINT fk_usuario_proyecto FOREIGN KEY (id_usuario) REFERENCES core.usuarios(id_usuario)
);

-- Creación de la tabla de redes sociales
CREATE TABLE IF NOT EXISTS core.redes_sociales (
    id_red_social SERIAL PRIMARY KEY,
    nombre VARCHAR(2000),
    foto VARCHAR(5000),
    id_usuario INTEGER,
    CONSTRAINT fk_usuario_red_social FOREIGN KEY (id_usuario) REFERENCES core.usuarios(id_usuario)
);


-- Creación de la tabla de tecnologías
CREATE TABLE IF NOT EXISTS portafolio.tecnologias (
    id_tecnologia SERIAL PRIMARY KEY,
    nombre VARCHAR(2000),
    foto VARCHAR(5000),
    id_usuario INTEGER,
    CONSTRAINT fk_usuario_tecnologia FOREIGN KEY (id_usuario) REFERENCES core.usuarios(id_usuario)
);

-- Creación de la tabla de experiencias
CREATE TABLE IF NOT EXISTS portafolio.experiencias (
    id_experiencia SERIAL PRIMARY KEY,
    nombre VARCHAR(2000),
    descripcion text,
    id_usuario INTEGER,
    CONSTRAINT fk_usuario_experiencia FOREIGN KEY (id_usuario) REFERENCES core.usuarios(id_usuario)
);

```
## 3.21. Mostrar información sobre una tabla específica
- Linea de comandos de Postgres
```console
\d core.usuarios;
```

| Columna      | Tipo                        | Ordenamiento | Nulable  | Por omisión                                   |
|-------------- |-----------------------------|--------------|----------|-----------------------------------------------|
| id_usuario    | integer                     |              | not null | nextval('core.usuarios_id_usuario_seq'::regclass) |
| nombre        | character varying(2000)     |              |          |                                               |
| telefono      | integer                     |              |          |                                               |
| email         | character varying(100)      |              |          |                                               |
| descripcion   | text                        |              |          |                                               |
| ocupacion     | character varying(2000)     |              |          |                                               |
| fecha_nac     | date                        |              |          |                                               |
| foto          | character varying(5000)     |              |          |                                               |
| fecha_reg     | timestamp without time zone |              |          | now()                                         |

Índices:
- "usuarios_pkey" PRIMARY KEY, btree (id_usuario)

Referenciada por:
- TABLE "core.usuarios_habilidades" CONSTRAINT "fk_usuario_habilidad_usuario" FOREIGN KEY (id_usuario) REFERENCES core.usuarios(id_usuario)
- TABLE "core.proyectos" CONSTRAINT "fk_usuario_proyecto" FOREIGN KEY (id_usuario) REFERENCES core.usuarios(id_usuario)
- TABLE "core.redes_sociales" CONSTRAINT "fk_usuario_red_social" FOREIGN KEY (id_usuario) REFERENCES core.usuarios(id_usuario)


## 3.22. Agregar datos en una tabla
- Como ejemplo, añada datos en cada una de las tablas en la que desea agregar, nombrar las columnas y, luego, proporcionar datos para cada una de ellas:
```sql
-- Inserción de datos en la tabla core.usuarios
INSERT INTO core.usuarios (nombre, telefono, email, descripcion, ocupacion, fecha_nac, foto, fecha_reg) 
VALUES 
('Sakura Haruno', 123456789, 'sakura@example.com', 'Ninja médica de Konoha', 'Ninja', '1995-03-28', 'sakura.jpg', NOW()),
('Asuka Langley Soryu', 987654321, 'asuka@example.com', 'Piloto del Evangelion Unidad-02', 'Piloto de Eva', '2001-12-04', 'asuka.jpg', NOW());

-- Inserción de datos en la tabla core.proyectos
INSERT INTO core.proyectos (nombre, foto, descripcion, link, id_usuario) 
VALUES 
('Proyecto de Sakura', 'proyecto_sakura.jpg', 'Desarrollo de técnicas médicas ninja', 'https://github.com/sakura/proyecto', 1),
('Proyecto de Asuka', 'proyecto_asuka.jpg', 'Defensa contra los Ángeles', 'https://github.com/asuka/proyecto', 2);

-- Inserción de datos en la tabla core.redes_sociales
INSERT INTO core.redes_sociales (nombre, foto, id_usuario) 
VALUES 
('Twitter', 'twitter_icon.jpg', 1),
('Webex', 'webex_icon.jpg', 1),
('Instagram', 'instagram_icon.jpg', 2);

-- Inserción de datos en la tabla portafolio.habilidades
INSERT INTO portafolio.habilidades (icono, nombre, descripcion) 
VALUES 
('habilidad_icon_1.jpg', 'Jutsu Médico', 'Máxima habilidad en técnicas médicas ninja, especializada en jutsu de curación.'),
('habilidad_icon_2.jpg', 'Piloto de Evangelion', 'Habilidad excepcional como piloto de la Unidad-02 en la lucha contra los Ángeles.');

-- Inserción de datos en la tabla portafolio.tecnologias
INSERT INTO portafolio.tecnologias (nombre, foto, id_usuario) 
VALUES 
('Jutsu Médico', 'tecnologia_jutsu_medico.jpg', 1),
('Piloto de Evangelion', 'tecnologia_piloto_evangelion.jpg', 2);

-- Inserción de datos en la tabla portafolio.experiencias
INSERT INTO portafolio.experiencias (nombre, descripcion, id_usuario) 
VALUES 
('Misión de Protección en Konoha', 'Participación en misiones como ninja médica para proteger la aldea de Konoha.', 1),
('Defensa contra los Ángeles', 'Piloto de la Unidad-02 en la lucha contra los Ángeles para proteger la humanidad.', 2);

-- Inserción de datos en la tabla core.usuarios_habilidades (relación n:n)
INSERT INTO core.usuarios_habilidades (id_usuario, id_habilidad)
VALUES (1, 1),(1, 2),(2, 1),(2, 2);

```
## 3.23. Ver datos en una tabla
- Ver la tabla usuarios
```sql
SELECT 	*
FROM 	core.usuarios;
```
|id_usuario|nombre|telefono|email|descripcion|ocupacion|fecha_nac|foto|fecha_reg|
|----------|------|--------|-----|-----------|---------|---------|----|---------|
|1|Sakura Haruno|123456789|sakura@example.com|Ninja médica de Konoha|Ninja|1995-03-28|sakura.jpg|2024-01-21 00:22:27.218|
|2|Asuka Langley Soryu|987654321|asuka@example.com|Piloto del Evangelion Unidad-02|Piloto de Eva|2001-12-04|asuka.jpg|2024-01-21 00:22:27.218|

## 3.24. Eliminar datos en una tabla
- Eliminar los datos de una fila que contiene tabla
```sql
-- Eliminar el jutsu medico de Sakura de la tabla tecnologias
DELETE
FROM 	portafolio.tecnologias
WHERE 	nombre = 'Jutsu Médico';
```
- Consultar la tabla de nuevo
```sql
SELECT 	*
FROM 	portafolio.tecnologias;
```

|id_tecnologia|nombre|foto|id_usuario|
|-------------|------|----|----------|
|2|Piloto de Evangelion|tecnologia_piloto_evangelion.jpg|2|


## 3.25. Agregar columnas en una tabla
- Agregue una columna para mostrar la herramienta que usa por cada chica escribiendo lo siguiente
```sql
ALTER
TABLE 	portafolio.tecnologias
ADD 	COLUMN herramienta VARCHAR(50);
```
- Si vuelve a ver la información de su tabla, observará que se agregó la columna nueva, pero no se ingresaron datos
```sql
SELECT 	*
FROM 	portafolio.tecnologias;
```

|id_tecnologia|nombre|foto|id_usuario|herramienta|
|-------------|------|----|----------|-----------|
|2|Piloto de Evangelion|tecnologia_piloto_evangelion.jpg|2||

## 3.26. Eliminar columnas en una tabla
- Eliminar la columna
```sql
--eliminar herramienta
ALTER
TABLE 	portafolio.tecnologias
DROP 	herramienta;
```
## 3.27. Actualizar datos de una tabla
- Puede actualizar los valores de una entrada existente buscando el registro que desee y fijando el valor que prefiera utilizar para la columna:
```sql
--actualizar foto
UPDATE 	portafolio.tecnologias
SET 	foto = 'tecnologia_eva01.jpg'
WHERE 	nombre = 'Piloto de Evangelion';
```
- Puede verificar la eficacia de la operación consultando los datos de nuevo:
```sql
SELECT 	*
FROM 	portafolio.tecnologias;
```

|id_tecnologia|nombre|foto|id_usuario|
|-------------|------|----|----------|
|2|Piloto de Evangelion|tecnologia_eva01.jpg|2|


## 3.28. Relacion 1 a 1
**![a11](file:///5imagenes/entidad-relacion/anime_1_1.png)**
- Asumiremos que usuarios tiene una relacion de 1:1 con la tabla tecnologias, un usuario posee 1 tecnología
```sql
--relacion 1:1
SELECT  u.id_usuario, u.nombre as nombre_usuario,u.telefono,u.email,u.descripcion,u.ocupacion,u.fecha_nac,u.foto as foto_usuario,u.fecha_reg,
        t.id_tecnologia,t.nombre as nombre_tecnologia,t.foto as foto_tecnologia 
FROM    core.usuarios u, portafolio.tecnologias t
WHERE   u.id_usuario=t.id_usuario AND u.id_usuario =1;
```
|id_usuario|nombre_usuario|telefono|email|descripcion|ocupacion|fecha_nac|foto_usuario|fecha_reg|id_tecnologia|nombre_tecnologia|foto_tecnologia|
|----------|--------------|--------|-----|-----------|---------|---------|------------|---------|-------------|-----------------|---------------|
|1|Sakura Haruno|123456789|sakura@example.com|Ninja médica de Konoha|Ninja|1995-03-28|sakura.jpg|2024-01-21 19:27:58.957|1|Jutsu Médico|tecnologia_jutsu_medico.jpg|

## 3.29. Relacion 1 a N
**![a1n](file:///5imagenes/entidad-relacion/anime_1_n.png)**
- Usuarios tiene una relación de 1:N con la tabla redes_sociales, un usuario puede tener muchas redes sociales
```sql
--relacion 1:N
SELECT  u.id_usuario ,u.nombre as nombre_usuario,
        rs.nombre as nombre_red_social, rs.foto as foto_red_social 
FROM    core.usuarios u ,core.redes_sociales rs 
WHERE   u.id_usuario=rs.id_usuario AND u.id_usuario =1 ;
```

|id_usuario|nombre_usuario|nombre_red_social|foto_red_social|
|----------|--------------|-----------------|---------------|
|1|Sakura Haruno|Twitter|twitter_icon.jpg|
|1|Sakura Haruno|Webex|webex_icon.jpg|

## 3.30. Relacion N a N
**![ann](file:///5imagenes/entidad-relacion/anime_n_n.png)**
- Usuarios tiene una relación de N:N con la tabla habilidades, muchos usuarios pueden tener muchas habilidades
```sql
--relacion N:N
SELECT  u.id_usuario,u.nombre as nombre_usuario,
        h.id_habilidad ,h.nombre as habilidad
FROM    core.usuarios u,portafolio.habilidades h ,core.usuarios_habilidades uh
WHERE   TRUE
        AND u.id_usuario=uh.id_usuario AND h.id_habilidad=uh.id_habilidad  AND (u.id_usuario =1 OR u.id_usuario=2) ;
```
|id_usuario|nombre_usuario|id_habilidad|habilidad|
|----------|--------------|------------|---------|
|1|Sakura Haruno|1|Jutsu Médico|
|1|Sakura Haruno|2|Piloto de Evangelion|
|2|Asuka Langley Soryu|1|Jutsu Médico|
|2|Asuka Langley Soryu|2|Piloto de Evangelion|

## 3.31. SQL JOINS
- En SQL, existen varios tipos de joins que permiten combinar registros de dos o más tablas en función de una condición relacionada.
**![aj](file:///5imagenes/entidad-relacion/sqljoin.jpeg)**
## 3.32. INNER JOIN
- El INNER JOIN se utiliza para combinar filas de dos o más tablas basándose en una condición de relación entre ellas. Solo devuelve las filas donde hay coincidencias en todas las tablas involucradas, en resumen es la intersecciòn de las tres tablas
**![aij](file:///5imagenes/entidad-relacion/anime-inner-join.png)**
```sql
--INNER JOIN:
--Recupera las habilidades de los usuarios que tienen habilidades registradas.
SELECT  u.id_usuario, u.nombre as nombre_usuario,
		    h.nombre AS habilidad_nombre
FROM 	  core.usuarios u
		    INNER JOIN core.usuarios_habilidades uh ON u.id_usuario = uh.id_usuario
		    INNER JOIN portafolio.habilidades h ON uh.id_habilidad = h.id_habilidad
order by u.id_usuario ;
``` 
|id_usuario|nombre_usuario|habilidad_nombre|
|----------|--------------|----------------|
|1|Sakura Haruno|Jutsu Médico|
|1|Sakura Haruno|Piloto de Evangelion|
|2|Asuka Langley Soryu|Jutsu Médico|
|2|Asuka Langley Soryu|Piloto de Evangelion|

## 3.33. LEFT JOIN (LEFT OUTER JOIN)
- El LEFT JOIN es un tipo de operación de unión que devuelve todos los registros de la tabla de la izquierda (en este caso core.usuarios), y los registros coincidentes de la tabla de la derecha (en este caso core.proyectos). Si no hay coincidencias en la tabla de la derecha, se devolverán valores nulos en las columnas de esa tabla.

**![alj](file:///5imagenes/entidad-relacion/anime-left-join.png)**
```sql
--LEFT JOIN
--Obtener todos los usuarios y sus proyectos (si tienen alguno)
SELECT  u.*, 
        p.nombre AS proyecto_nombre
FROM    core.usuarios u
        LEFT JOIN core.proyectos p ON u.id_usuario = p.id_usuario;
--En el ejemplo:
--Sakura Haruno tiene un proyecto llamado "Proyecto de Sakura".
--Asuka Langley Soryu tiene un proyecto llamado "Proyecto de Asuka".
--Si un usuario no tiene proyectos (por ejemplo, si agregamos un usuario nuevo sin proyectos), aparecerá con NULL en la columna proyecto_nombre.
```
|id_usuario|nombre|telefono|email|descripcion|ocupacion|fecha_nac|foto|fecha_reg|proyecto_nombre|
|----------|------|--------|-----|-----------|---------|---------|----|---------|---------------|
|1|Sakura Haruno|123456789|sakura@example.com|Ninja médica de Konoha|Ninja|1995-03-28|sakura.jpg|2024-01-21 19:27:58.957|Proyecto de Sakura|
|2|Asuka Langley Soryu|987654321|asuka@example.com|Piloto del Evangelion Unidad-02|Piloto de Eva|2001-12-04|asuka.jpg|2024-01-21 19:27:58.957|Proyecto de Asuka|

## 3.34. LEFT JOIN (A - B) 
- Para realizar una consulta que utilice la diferencia de conjuntos (A - B) entre las tablas core.usuarios y portafolio.tecnologias en PostgreSQL, y para entender cómo se relacionan estos conjuntos, podemos usar una operación de LEFT JOIN con una condición que excluya los registros que tienen correspondencia en ambas tablas.

**![aloj](file:///5imagenes/entidad-relacion/anime-a-b.png)**
```sql
--LEFT JOIN
--Obtener los usuarios que están en core.usuarios pero no tienen ninguna entrada correspondiente en portafolio.tecnologias.
SELECT  u.*,
        t.id_tecnologia,
        t.nombre AS tecnologia_nombre,
        t.foto AS tecnologia_foto
FROM    core.usuarios u
        LEFT JOIN portafolio.tecnologias t ON u.id_usuario = t.id_usuario
WHERE   t.id_usuario IS NULL;
--core.usuarios u: Especificamos la tabla de usuarios como el conjunto A.
--portafolio.tecnologias t: Especificamos la tabla de tecnologías como el conjunto B.
--Realizamos un LEFT JOIN para combinar los usuarios con las tecnologías basado en id_usuario.
--La condición asegura que solo se seleccionen los registros de core.usuarios que no tienen una correspondencia en portafolio.tecnologias, es decir, los usuarios que no están asociados a ninguna tecnología.
```
|id_usuario|nombre|telefono|email|descripcion|ocupacion|fecha_nac|foto|fecha_reg|id_tecnologia|tecnologia_nombre|tecnologia_foto|
|----------|------|--------|-----|-----------|---------|---------|----|---------|-------------|-----------------|---------------|
|21|Nuevo Usuario|123456789|nuevo@usuario.com|Descripción|Ocupación|2000-01-01|foto.jpg|2024-01-22 20:44:33.476||||
|22|Nuevo Usuario2|987654321|nuevo2@usuario.com|Descripción|Ocupación|2000-01-01|foto2.jpg|2024-01-22 20:55:57.484||||

## 3.35. RIGHT JOIN (RIGHT OUTER JOIN)
- Un Right Join en PostgreSQL devuelve todos los registros de la tabla de la derecha (en este caso, core.usuarios) y los registros de la tabla de la izquierda (en este caso, core.proyectos) que tienen una coincidencia en la condición especificada (p.id_usuario = u.id_usuario). Si no hay ninguna coincidencia en la tabla de la izquierda, los campos de esa tabla tendrán valores nulos en el resultado.

**![arj](file:///5imagenes/entidad-relacion/anime-rigth-join.png)**
```sql
--RIGHT JOIN
-- Obtener todos los proyectos y sus usuarios (incluso si no tienen un usuario asociado)
SELECT  p.*, 
        u.nombre AS usuario_nombre
FROM    core.proyectos p
        RIGHT JOIN core.usuarios u ON p.id_usuario = u.id_usuario;
--Se muestran todos los usuarios, incluso aquellos que no tienen proyectos asociados (Nuevo Usuario y Nuevo Usuario2).
--Los registros de proyectos se muestran solo cuando hay una coincidencia con usuarios.
--Los campos de id_proyecto, nombre, foto, descripcion y link son NULL para los registros de usuarios que no tienen coincidencias en proyectos.
```
|id_proyecto|nombre|foto|descripcion|link|id_usuario|usuario_nombre|
|-----------|------|----|-----------|----|----------|--------------|
|1|Proyecto de Sakura|proyecto_sakura.jpg|Desarrollo de técnicas médicas ninja|https://github.com/sakura/proyecto|1|Sakura Haruno|
|2|Proyecto de Asuka|proyecto_asuka.jpg|Defensa contra los Ángeles|https://github.com/asuka/proyecto|2|Asuka Langley Soryu|
|||||||Nuevo Usuario|
|||||||Nuevo Usuario2|

## 3.36. RIGHT JOIN (B-A)
- Para obtener la diferencia de conjuntos (B - A) entre las tablas usuarios y proyectos utilizando un RIGHT JOIN en PostgreSQL, puedes seguir este enfoque:

**![arj](file:///5imagenes/entidad-relacion/anime-b-a_.png)**
```sql
--RIGHT JOIN
-- Representar los usuarios que no tienen proyectos asociados.
SELECT  p.*,
        u.nombre AS usuario_nombre
FROM    core.proyectos p
        RIGHT JOIN core.usuarios u ON p.id_usuario = u.id_usuario
WHERE p.id_proyecto IS NULL;
--El resultado de esta consulta sería una tabla que muestra información detallada de los usuarios que no tienen proyectos asociados. Esto incluiría todos los campos de usuarios y los campos relevantes de proyectos serán NULL.
```
|id_proyecto|nombre|foto|descripcion|link|id_usuario|usuario_nombre|
|-----------|------|----|-----------|----|----------|--------------|
|||||||Nuevo Usuario|
|||||||Nuevo Usuario2|

## 3.37. VIEW
- Un view en SQL (también conocido como vista) es una representación virtual de datos que se deriva de una o más tablas base. Se define mediante una consulta SQL almacenada que actúa como una tabla virtual cuyos resultados se pueden consultar como si fueran datos reales de una tabla.
### 3.37.1. Caracteristicas
- Consulta definida: Un view se crea utilizando una consulta SELECT que especifica cómo se deben combinar, filtrar o transformar los datos de las tablas base.
- Almacenamiento virtual: A diferencia de una tabla física, un view no almacena datos por sí mismo. En su lugar, almacena la consulta que define los datos a mostrar.
- Actualización automática: Cuando consultas un view, los datos que se muestran se calculan en tiempo real basándose en los datos actuales de las tablas base. Esto asegura que los datos del view estén siempre actualizados.
- Seguridad y simplificación: Los views pueden utilizarse para simplificar consultas complejas, ocultar detalles de implementación de las tablas base y controlar el acceso a los datos mostrando solo la información relevante.
```sql
--View
-- Crear una vista que muestre la información del usuario y sus habilidades
CREATE VIEW vw_usuario_habilidades AS
SELECT u.*, h.nombre AS habilidad_nombre
FROM core.usuarios u
INNER JOIN core.usuarios_habilidades uh ON u.id_usuario = uh.id_usuario
INNER JOIN portafolio.habilidades h ON uh.id_habilidad = h.id_habilidad;
--Esta vista combina datos de las tablas usuarios, usuarios_habilidades y habilidades. La consulta INNER JOIN une los usuarios con las habilidades que poseen, mostrando todas las columnas de usuarios junto con el nombre de la habilidad (habilidad_nombre) que cada usuario posee.
```
- Para mostrar los datos del view
```sql
-- Seleccionar todos los datos de la vista vw_usuario_habilidades
SELECT * FROM vw_usuario_habilidades;
--un view en SQL es una herramienta poderosa para simplificar consultas, mejorar la seguridad y asegurar que los datos presentados estén siempre actualizados según las tablas base.
```

|id_usuario|nombre|telefono|email|descripcion|ocupacion|fecha_nac|foto|fecha_reg|habilidad_nombre|
|----------|------|--------|-----|-----------|---------|---------|----|---------|----------------|
|2|Asuka Langley Soryu|987654321|asuka@example.com|Piloto del Evangelion Unidad-02|Piloto de Eva|2001-12-04|asuka.jpg|2024-01-21 19:27:58.957|Jutsu Médico|
|1|Sakura Haruno|123456789|sakura@example.com|Ninja médica de Konoha|Ninja|1995-03-28|sakura.jpg|2024-01-21 19:27:58.957|Jutsu Médico|
|2|Asuka Langley Soryu|987654321|asuka@example.com|Piloto del Evangelion Unidad-02|Piloto de Eva|2001-12-04|asuka.jpg|2024-01-21 19:27:58.957|Piloto de Evangelion|
|1|Sakura Haruno|123456789|sakura@example.com|Ninja médica de Konoha|Ninja|1995-03-28|sakura.jpg|2024-01-21 19:27:58.957|Piloto de Evangelion|

## 3.38. TEMPORAL
- En SQL, la palabra clave "TEMPORAL" se refiere a la creación de una tabla temporal. Una tabla temporal es una tabla que existe solo por el tiempo de vida de la conexión de la base de datos, es decir, se elimina automáticamente al finalizar la conexión. 
```sql
--temporal
-- Crear una tabla temporal para almacenar usuarios con proyectos
CREATE TEMPORARY TABLE temp_usuarios_proyectos AS
SELECT u.*, p.nombre AS proyecto_nombre
FROM core.usuarios u
LEFT JOIN core.proyectos p ON u.id_usuario = p.id_usuario;
--Esta consulta crea una tabla temporal llamada "temp_usuarios_proyectos" que almacena datos de usuarios junto con el nombre de sus proyectos, provenientes de las tablas "usuarios" y "proyectos" de la base de datos "core".
```
- Para mostrar los datos de la tabla temporal
```sql
-- Seleccionar todos los datos de la tabla temporal temp_usuarios_proyectos
SELECT * FROM temp_usuarios_proyectos;
```
|id_usuario|nombre|telefono|email|descripcion|ocupacion|fecha_nac|foto|fecha_reg|proyecto_nombre|
|----------|------|--------|-----|-----------|---------|---------|----|---------|---------------|
|1|Sakura Haruno|123456789|sakura@example.com|Ninja médica de Konoha|Ninja|1995-03-28|sakura.jpg|2024-01-21 19:27:58.957|Proyecto de Sakura|
|2|Asuka Langley Soryu|987654321|asuka@example.com|Piloto del Evangelion Unidad-02|Piloto de Eva|2001-12-04|asuka.jpg|2024-01-21 19:27:58.957|Proyecto de Asuka|

## 3.39. FUNCION
- Una función en SQL es un bloque de código que puede realizar operaciones y devolver un valor, facilitando la reutilización de código y la realización de cálculos o transformaciones de datos de manera modular y consistente.
- Crear la función
```sql
--Funcion
-- Crear una función que calcule la edad a partir de la fecha de nacimiento
CREATE OR REPLACE FUNCTION calcular_edad(fecha_nac DATE) RETURNS INTEGER AS $$
    SELECT EXTRACT(YEAR FROM age(CURRENT_DATE, fecha_nac));
$$ LANGUAGE SQL;
--CREATE OR REPLACE FUNCTION calcular_edad(fecha_nac DATE): Define una nueva función llamada calcular_edad que acepta un parámetro fecha_nac de tipo DATE.
--RETURNS INTEGER: Especifica que la función devuelve un valor de tipo entero (INTEGER).
--AS $$ ... $$: Delimita el cuerpo de la función.
--SELECT EXTRACT(YEAR FROM age(CURRENT_DATE, fecha_nac)): Dentro del cuerpo de la función, se usa la función age para calcular la diferencia entre la fecha actual (CURRENT_DATE) y la fecha de nacimiento (fecha_nac), y luego se extrae el componente de años de esa diferencia.
--LANGUAGE SQL: Indica que el cuerpo de la función está escrito en SQL.
```
- Usar la funcion
```sql
--Funcion
-- Llamada a la función para obtener la edad de un usuario
SELECT u.nombre as nombre_usuario, calcular_edad(fecha_nac) AS edad FROM core.usuarios u;
--SELECT u.nombre AS nombre_usuario, calcular_edad(u.fecha_nac) AS edad: Selecciona el nombre del usuario y la edad calculada usando la función calcular_edad.
--FROM core.usuarios u: Especifica la tabla usuarios en el esquema core y le asigna el alias u para facilitar la referencia a sus columnas.
```
|nombre_usuario|edad|
|--------------|----|
|Sakura Haruno|28|
|Asuka Langley Soryu|22|

## 3.40. TRIGGER
- Un trigger en SQL es un tipo de objeto que permite ejecutar automáticamente un conjunto de instrucciones cuando ocurre un evento específico en una tabla o vista. Los eventos que pueden activar un trigger incluyen operaciones de INSERT, UPDATE, o DELETE. Los triggers se utilizan para mantener la integridad de los datos, auditar cambios o realizar cálculos automáticos.
- Creación de la función para el trigger
```sql
--TRIGGER
-- Crear un trigger que actualice la fecha de registro cada vez que se inserta un nuevo usuario
CREATE OR REPLACE FUNCTION actualizar_fecha_registro()
RETURNS TRIGGER AS $$
BEGIN
    NEW.fecha_reg := NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
--CREATE OR REPLACE FUNCTION actualizar_fecha_registro(): Define una nueva función llamada actualizar_fecha_registro que no toma parámetros y devuelve un tipo TRIGGER.
--RETURNS TRIGGER: Especifica que la función devuelve un tipo TRIGGER.
--BEGIN ... END;: Delimita el bloque de código de la función.
--NEW.fecha_reg := NOW();: Asigna la fecha y hora actuales a la columna fecha_reg del nuevo registro (NEW).
--RETURN NEW;: Devuelve el nuevo registro modificado.
--LANGUAGE plpgsql;: Indica que la función está escrita en PL/pgSQL, el lenguaje procedimental de PostgreSQL.
```
- Creación del trigger
```sql
CREATE TRIGGER trigger_actualizar_fecha_registro
BEFORE INSERT ON core.usuarios
FOR EACH ROW EXECUTE FUNCTION actualizar_fecha_registro();
--CREATE TRIGGER trigger_actualizar_fecha_registro: Define un nuevo trigger llamado trigger_actualizar_fecha_registro.
--BEFORE INSERT ON core.usuarios: Especifica que el trigger se ejecuta antes de cada operación de INSERT en la tabla usuarios en el esquema core.
--FOR EACH ROW: Indica que el trigger se ejecutará una vez por cada fila que se inserte.
--EXECUTE FUNCTION actualizar_fecha_registro();: Especifica que se debe ejecutar la función actualizar_fecha_registro cuando el trigger se active.
```
- Uso del trigger: Cuando se inserta un nuevo usuario en la tabla usuarios, el trigger se activa automáticamente y actualiza la columna fecha_reg con la fecha y hora actuales. Aquí hay un ejemplo de cómo insertar un nuevo usuario:
```sql
-- Insertar un nuevo usuario (el trigger actualizará la fecha de registro)
INSERT INTO core.usuarios (nombre, telefono, email, descripcion, ocupacion, fecha_nac, foto)
VALUES ('Nuevo Usuario', 123456789, 'nuevo@usuario.com', 'Descripción', 'Ocupación', '2000-01-01', 'foto.jpg');

```
|id_usuario|nombre|telefono|email|descripcion|ocupacion|fecha_nac|foto|fecha_reg|
|----------|------|--------|-----|-----------|---------|---------|----|---------|
|1|Sakura Haruno|123456789|sakura@example.com|Ninja médica de Konoha|Ninja|1995-03-28|sakura.jpg|2024-01-21 19:27:58.957|
|2|Asuka Langley Soryu|987654321|asuka@example.com|Piloto del Evangelion Unidad-02|Piloto de Eva|2001-12-04|asuka.jpg|2024-01-21 19:27:58.957|
|3|Nuevo Usuario|123456789|nuevo@usuario.com|Descripción|Ocupación|2000-01-01|foto.jpg|2024-01-22 20:44:33.476|
- En este ejemplo, la columna fecha_reg se actualizará automáticamente con la fecha y hora actuales debido al trigger que hemos creado.
## 3.41. PARTITION
- En SQL, una partición es una forma de dividir los resultados de una consulta en subconjuntos lógicos, permitiendo aplicar funciones de agregación o ventana a cada uno de estos subconjuntos por separado. Esto se logra utilizando la cláusula PARTITION BY en funciones de ventana.
```sql
--PARTITION
-- Calcular la cantidad de proyectos por usuario utilizando PARTITION
SELECT p.id_usuario, COUNT(*) OVER (PARTITION BY p.id_usuario) AS cantidad_proyectos
FROM core.proyectos p;
--SELECT p.id_usuario: Selecciona la columna id_usuario de la tabla proyectos.
--COUNT(*) OVER (PARTITION BY p.id_usuario) AS cantidad_proyectos: Calcula la cantidad de proyectos para cada usuario utilizando la función de ventana COUNT(*) OVER. La cláusula PARTITION BY p.id_usuario divide los resultados en particiones donde cada partición contiene todas las filas con el mismo id_usuario. Luego, COUNT(*) cuenta el número de filas en cada partición.
--FROM core.proyectos p: Especifica la tabla proyectos en el esquema core y le asigna el alias p.
```
|id_usuario|cantidad_proyectos|
|----------|------------------|
|1|1|
|2|1|
|3|1|
### 3.41.1. Funciones de Ventana
- Las funciones de ventana como COUNT() OVER, SUM() OVER, AVG() OVER, etc., se aplican a cada partición independientemente.
- Estas funciones no colapsan las filas como lo hacen las funciones de agregación tradicionales (COUNT, SUM, etc.) cuando se usan con GROUP BY.
## 3.42. PROCEDURE
- Un procedimiento almacenado (stored procedure) es un conjunto de instrucciones SQL que se guardan y se ejecutan en el servidor de base de datos. Los procedimientos almacenados permiten encapsular lógica compleja, simplificar la gestión de transacciones y mejorar el rendimiento al reducir la cantidad de tráfico entre la aplicación y la base de datos.
- Creación del procedimiento almacenado
```sql
--PROCEDIMIENTO
-- Crear un procedimiento almacenado que inserte un nuevo usuario
CREATE OR REPLACE PROCEDURE insertar_usuario(
    nombre VARCHAR(2000),
    telefono INTEGER,
    email VARCHAR(100),
    descripcion TEXT,
    ocupacion VARCHAR(2000),
    fecha_nac DATE,
    foto VARCHAR(5000)
)
AS $$
BEGIN
    INSERT INTO core.usuarios(nombre, telefono, email, descripcion, ocupacion, fecha_nac, foto)
    VALUES (nombre, telefono, email, descripcion, ocupacion, fecha_nac, foto);
END;
$$ LANGUAGE plpgsql;
--CREATE OR REPLACE PROCEDURE insertar_usuario(...): Define un nuevo procedimiento almacenado llamado insertar_usuario con varios parámetros que corresponden a las columnas de la tabla usuarios.
--AS $$ ... $$: Delimita el cuerpo del procedimiento almacenado.
--BEGIN ... END;: Delimita el bloque de código que se ejecutará cuando se llame al procedimiento.
--INSERT INTO core.usuarios(...) VALUES (...): Inserta un nuevo registro en la tabla usuarios con los valores proporcionados como parámetros.
--LANGUAGE plpgsql: Indica que el procedimiento está escrito en PL/pgSQL, el lenguaje procedimental de PostgreSQL.
```
- Llamada al procedimiento
```sql
-- Llamada al procedimiento para insertar un nuevo usuario
CALL insertar_usuario('Nuevo Usuario2', 987654321, 'nuevo2@usuario.com', 'Descripción', 'Ocupación', '2000-01-01', 'foto2.jpg');
```
|id_usuario|nombre|telefono|email|descripcion|ocupacion|fecha_nac|foto|fecha_reg|
|----------|------|--------|-----|-----------|---------|---------|----|---------|
|1|Sakura Haruno|123456789|sakura@example.com|Ninja médica de Konoha|Ninja|1995-03-28|sakura.jpg|2024-01-21 19:27:58.957|
|2|Asuka Langley Soryu|987654321|asuka@example.com|Piloto del Evangelion Unidad-02|Piloto de Eva|2001-12-04|asuka.jpg|2024-01-21 19:27:58.957|
|3|Nuevo Usuario|123456789|nuevo@usuario.com|Descripción|Ocupación|2000-01-01|foto.jpg|2024-01-22 20:44:33.476|
|4|Nuevo Usuario2|987654321|nuevo2@usuario.com|Descripción|Ocupación|2000-01-01|foto2.jpg|2024-01-22 20:55:57.484|
## 3.43. SUMA
- En SQL, la suma se refiere a la operación de agregar los valores de una columna específica en las filas seleccionadas de una tabla. La función SUM() se utiliza para realizar esta operación de agregación.
```sql
--SUMA
-- Calcular la suma de los id_usuario agrupada por usuario que tiene mas de una red social
SELECT rs.id_usuario, SUM(rs.id_usuario) AS suma_id_usuarios
FROM core.redes_sociales rs
where rs.id_usuario =1
GROUP BY rs.id_usuario;
--SELECT rs.id_usuario: Selecciona la columna id_usuario de la tabla redes_sociales.
--SUM(rs.id_usuario) AS suma_id_usuarios: Calcula la suma de los valores en la columna id_usuario para cada grupo definido por GROUP BY. La suma se etiqueta como suma_id_usuarios.
--FROM core.redes_sociales rs: Especifica la tabla redes_sociales en el esquema core, y se le asigna el alias rs.
--WHERE rs.id_usuario = 1: Filtra las filas para incluir solo aquellas donde id_usuario es 1.
--GROUP BY rs.id_usuario: Agrupa las filas por el valor de id_usuario.
```
|id_usuario|suma_id_usuarios|
|----------|----------------|
|1|2|
- Para ilustrar un caso más general, donde sumamos los id_usuario de todos los usuarios que tienen más de una red social:
```sql
-- Calcular la suma de los id_usuario agrupada por usuario que tiene más de una red social
SELECT rs.id_usuario, SUM(rs.id_usuario) AS suma_id_usuarios
FROM core.redes_sociales rs
GROUP BY rs.id_usuario
HAVING COUNT(rs.id_red_social) > 1;
```
|id_usuario|suma_id_usuarios|
|----------|----------------|
|1|2|
## 3.44. COUNT
- La función COUNT() en SQL se utiliza para contar el número de filas que cumplen con un criterio específico. Puede ser usada de varias maneras para contar diferentes tipos de valores en una consulta.
```sql
--COUNT
-- Contar la cantidad de usuarios agrupada por nombre
SELECT nombre, COUNT(*) AS cantidad_usuarios
FROM core.usuarios
GROUP BY nombre;
--SELECT nombre, COUNT(*) AS cantidad_usuarios: Selecciona la columna nombre y cuenta el número de filas para cada nombre usando COUNT(*). El resultado se etiqueta como cantidad_usuarios.
--FROM core.usuarios: Especifica la tabla usuarios en el esquema core.
--GROUP BY nombre: Agrupa las filas por el valor en la columna nombre, de modo que COUNT(*) cuente el número de filas en cada grupo.
```
|nombre|cantidad_usuarios|
|------|-----------------|
|Sakura Haruno|1|
|Nuevo Usuario|1|
|Asuka Langley Soryu|1|
|Nuevo Usuario2|1|
- otro ejm
```sql
-- Calcular la cantidad de habilidades por usuario
SELECT u.id_usuario, COUNT(h.id_habilidad) AS cantidad_habilidades
FROM core.usuarios u
LEFT JOIN core.usuarios_habilidades uh ON u.id_usuario = uh.id_usuario
LEFT JOIN portafolio.habilidades h ON uh.id_habilidad = h.id_habilidad
GROUP BY u.id_usuario
order by u.id_usuario ;
--SELECT u.id_usuario, COUNT(h.id_habilidad) AS cantidad_habilidades: Selecciona el id_usuario y cuenta el número de habilidades asociadas a cada usuario (h.id_habilidad), etiquetando el resultado como cantidad_habilidades.
--FROM core.usuarios u: Especifica la tabla usuarios en el esquema core con el alias u.
--LEFT JOIN core.usuarios_habilidades uh ON u.id_usuario = uh.id_usuario: Realiza una unión externa izquierda con la tabla usuarios_habilidades para asociar cada usuario con sus habilidades.
--LEFT JOIN portafolio.habilidades h ON uh.id_habilidad = h.id_habilidad: Realiza otra unión externa izquierda con la tabla habilidades para obtener información detallada sobre las habilidades.
--GROUP BY u.id_usuario: Agrupa las filas por id_usuario para contar el número de habilidades por cada usuario.
--ORDER BY u.id_usuario: Ordena los resultados por id_usuario.
```

|id_usuario|cantidad_habilidades|
|----------|--------------------|
|1|2|
|2|2|
|3|1|
|4|1|

- COUNT(*) vs COUNT(column_name):
  - COUNT(*) cuenta todas las filas en cada grupo, independientemente de los valores en las columnas.
  - COUNT(column_name) cuenta las filas donde column_name no es NULL.
- Uso de GROUP BY:
  - La cláusula GROUP BY agrupa las filas que tienen el mismo valor en las columnas especificadas, permitiendo que las funciones de agregación como COUNT() se apliquen a cada grupo por separado.
- Uniones en SQL:
  - LEFT JOIN incluye todas las filas de la tabla izquierda y las filas coincidentes de la tabla derecha. Si no hay coincidencia, los resultados de la tabla derecha serán NULL.
## 3.45. SUB CLAUSULAS (WITH)
- La cláusula WITH en SQL se utiliza para definir subconsultas, también conocidas como Common Table Expressions (CTEs), que se pueden utilizar dentro de una consulta principal. Los CTEs permiten estructurar consultas complejas de manera más legible y modular..
- Consulta simple con WITH:Obtener la cantidad de usuarios en la tabla usuarios.
```sql
-- Ejemplo simple de uso de WITH para contar usuarios
WITH usuarios_cte AS (
     SELECT COUNT(*) AS cantidad_usuarios
     FROM core.usuarios
)
SELECT cantidad_usuarios
FROM usuarios_cte;
--WITH usuarios_cte AS (...): Define un CTE llamado usuarios_cte que cuenta el número de usuarios en la tabla usuarios.
--SELECT cantidad_usuarios FROM usuarios_cte;: Selecciona el resultado del CTE para mostrar la cantidad de usuarios.
```
|cantidad_usuarios|
|-----------------|
|22|

- Consulta con WITH para usuarios y habilidades:Obtener la cantidad de habilidades por usuario.
```sql
-- Ejemplo de uso de WITH para contar habilidades por usuario
WITH habilidades_por_usuario AS (
    SELECT u.id_usuario, COUNT(h.id_habilidad) AS cantidad_habilidades
    FROM core.usuarios u
    LEFT JOIN core.usuarios_habilidades uh ON u.id_usuario = uh.id_usuario
    LEFT JOIN portafolio.habilidades h ON uh.id_habilidad = h.id_habilidad
    GROUP BY u.id_usuario
)
SELECT id_usuario, cantidad_habilidades
FROM habilidades_por_usuario
ORDER BY id_usuario;
--WITH habilidades_por_usuario AS (...): Define un CTE llamado habilidades_por_usuario que cuenta las habilidades por usuario.
--SELECT id_usuario, cantidad_habilidades FROM habilidades_por_usuario;: Selecciona y muestra el resultado del CTE.
```
|id_usuario|cantidad_habilidades|
|----------|--------------------|
|1|2|
|2|2|
|3|1|
|4|1|
|5|1|
|6|1|
|7|1|
|8|1|
|9|1|
|10|1|
|11|1|
|12|1|
|13|1|
|14|1|
|15|1|
|16|1|
|17|1|
|18|1|
|19|1|
|20|1|
|21|0|
|22|0|

- Consulta compleja con múltiples CTEs:Obtener usuarios con sus proyectos, habilidades y redes sociales.
```sql
-- Ejemplo complejo de uso de WITH para obtener detalles de usuarios
WITH proyectos_cte AS (
    SELECT u.id_usuario, p.id_proyecto, p.nombre AS nombre_proyecto
    FROM core.usuarios u
    LEFT JOIN core.proyectos p ON u.id_usuario = p.id_usuario
),
habilidades_cte AS (
    SELECT u.id_usuario, COUNT(h.id_habilidad) AS cantidad_habilidades
    FROM core.usuarios u
    LEFT JOIN core.usuarios_habilidades uh ON u.id_usuario = uh.id_usuario
    LEFT JOIN portafolio.habilidades h ON uh.id_habilidad = h.id_habilidad
    GROUP BY u.id_usuario
),
redes_sociales_cte AS (
    SELECT u.id_usuario, COUNT(rs.id_red_social) AS cantidad_redes_sociales
    FROM core.usuarios u
    LEFT JOIN core.redes_sociales rs ON u.id_usuario = rs.id_usuario
    GROUP BY u.id_usuario
)
SELECT u.id_usuario, u.nombre, p.nombre_proyecto, h.cantidad_habilidades, r.cantidad_redes_sociales
FROM core.usuarios u
LEFT JOIN proyectos_cte p ON u.id_usuario = p.id_usuario
LEFT JOIN habilidades_cte h ON u.id_usuario = h.id_usuario
LEFT JOIN redes_sociales_cte r ON u.id_usuario = r.id_usuario
ORDER BY u.id_usuario;
--WITH proyectos_cte AS (...): Define un CTE llamado proyectos_cte para obtener los proyectos de cada usuario.
--WITH habilidades_cte AS (...): Define un CTE llamado habilidades_cte para contar las habilidades por usuario.
--WITH redes_sociales_cte AS (...): Define un CTE llamado redes_sociales_cte para contar las redes sociales por usuario.
--La consulta principal selecciona usuarios con sus nombres, proyectos, cantidad de habilidades y cantidad de redes sociales, uniendo los resultados de los CTEs definidos.
```
|id_usuario|nombre|nombre_proyecto|cantidad_habilidades|cantidad_redes_sociales|
|----------|------|---------------|--------------------|-----------------------|
|1|Sakura Haruno|Proyecto de Sakura|2|2|
|2|Asuka Langley Soryu|Proyecto de Asuka|2|1|
|3|Inuyasha|Proyecto de Inuyasha|1|1|
|4|Bulma Brief|Proyecto de Bulma|1|1|
|5|Nami|Proyecto de Nami|1|1|
|6|Mikasa Ackerman|Proyecto de Mikasa|1|1|
|7|Erza Scarlet|Proyecto de Erza|1|1|
|8|Zero Two|Proyecto de Zero Two|1|1|
|9|Hinata Hyuga|Proyecto de Hinata|1|1|
|10|Kagome Higurashi|Proyecto de Kagome|1|1|
|11|Lucy Heartfilia|Proyecto de Lucy|1|1|
|12|Riza Hawkeye|Proyecto de Riza|1|1|
|13|Rei Ayanami|Proyecto de Rei|1|1|
|14|Winry Rockbell|Proyecto de Winry|1|1|
|15|Yoruichi Shihouin|Proyecto de Yoruichi|1|1|
|16|Rukia Kuchiki|Proyecto de Rukia|1|1|
|17|Tsunade Senju|Proyecto de Tsunade|1|1|
|18|Android 18|Proyecto de Android 18|1|1|
|19|Yuno Gasai|Proyecto de Yuno|1|1|
|20|Homura Akemi|Proyecto de Homura|1|1|
|21|Nuevo Usuario||0|0|
|22|Nuevo Usuario2||0|0|

[<< INDICE](../README.md)


---


<div style="page-break-before: always;"></div>


# 📄 1.18. Tema VSCode

[<< INDICE](../README.md)
# One Darck Pro
- Referencia: [One Darck Pro](https://github.com/Binaryify/OneDark-Pro)

---


<div style="page-break-before: always;"></div>


# 📄 1.19. Grabador de Video (Kasan)

[<< INDICE](../README.md)
# Instalar Kasam
- Para instalar
```console
sudo add-apt-repository ppa:kazam-team/stable-series
sudo apt-get update
sudo apt-get install kazam
```
- Ajustar para que no aparesca negro
```console
sudo nano/etc/gdm3/custom.conf
```
- Colocar en false
```console
WaylandEnable=false
```
**![Kasam](file:///5imagenes/instaladores/instalarKasam.png)**


---


<div style="page-break-before: always;"></div>


# 📄 1.20. JavaScript (intro)

[<< INDICE](../../README.md)

[Day 2 >>](./dia_02_tipos_de_datos.md)
- [📔Día 1](#día-1)
  - [Introducción](#introducción)
  - [Requerimientos](#requerimientos)
  - [Preparación](#preparación)
    - [Instala Node.js](#instala-nodejs)
    - [Navegador](#navegador)
      - [Instalando Google Chrome](#instalando-google-chrome)
      - [Abriendo la consola de Google Chrome](#abriendo-la-consola-de-google-chrome)
      - [Escribiendo el código en la consola del navegador](#escribiendo-el-código-en-la-consola-del-navegador)
        - [Console.log](#consolelog)
        - [Console.log con múltiples argumentos](#consolelog-con-múltiples-argumentos)
        - [Comentario](#comentario)
        - [Sintaxis](#sintaxis)
      - [Aritmética](#aritmética)
    - [Editor de código](#editor-de-código)
      - [Instalando Visual Studio](#instalando-visual-studio)
      - [Cómo usar Visual Studio Code](#cómo-usar-visual-studio-code)
  - [Añadiendo JavaScript a una página web](#añadiendo-javascript-a-una-página-web)
    - [Script en línea](#script-en-línea)
    - [Script interno](#script-interno)
    - [Script externo](#script-externo)
    - [Múltiples Scripts externos](#múltiples-scripts-externos)
  - [Introducción a los tipos de datos](#introducción-a-los-tipos-de-datos)
    - [Números](#números)
    - [Cadenas de texto](#cadenas-de-texto)
    - [Booleanos](#booleanos)
    - [Undefined](#undefined)
    - [Null](#null)
  - [Comprobando los tipos de datos](#comprobando-los-tipos-de-datos)
  - [Comentarios](#comentarios)
    - [Variables](#variables)
- [💻 Día 1: Ejercicios](#-día-1-ejercicios)

# 📔Día 1

## Introducción

**Felicidades** por decidir participar en el desafío de 30 días de JavaScript. En este desafío aprenderás todo lo que necesitas para ser un programador de JavaScript y los conceptos generales de la programación. Al final obtendrás un certificado de 30 días de JavaScript. Únete al [grupo de telegram](https://t.me/ThirtyDaysOfJavaScript).

**30 días de JavaScript** es una guía tanto para principiantes como para desarrolladores avanzados. Bienvenido a JavaScript. Disfruto de usarlo y enseñarlo y espero que tú también. JavaScript es el lenguaje del navegador.

En este tutorial de paso a paso, aprenderás JavaScript, el lenguaje de programación más popular de la historia de la humanidad. Se usa para **agregar interactividad a las páginas web, para desarrollar aplicaciones móviles, aplicaciones de desktop, juegos** y ahora también puede ser usado para el **aprendizaje automático** (machine learning) e **inteligencia artificial** (AI). Su popularidad ha incrementado en años recientes, siendo el lenguaje predominante por cuatro años consecutivos y el más usado en GitHub.

## Requerimientos

Ningún conocimiento previo es requerido para el siguiente desafío. Solo necesitarás:

1. Motivación
2. Una computadora
3. Internet
4. Un navegador
5. Un editor de texto

## Preparación

Asumo que tienes motivación, un fuerte deseo de convertirte en un desarrollador, una computadora e internet. Si tienes todo esto, entonces lo tienes todo.

### Instala Node.js

Tal vez no lo necesites ahora pero si más adelante. Asi que instala [node.js](https://nodejs.org/en/)

![Node download](file:///home/xixay/Documentos/Richard/ayuda-memoria/1inicio/20-javaScript/images/download_node.png)

Luego de que se descargue, haz doble click e instálalo

![Install node](file:///home/xixay/Documentos/Richard/ayuda-memoria/1inicio/20-javaScript/images/install_node.png)

Puedes comprobar si se ha instalado correctamente abriendo la terminal del ordenador

    asabeneh $ node -v
    v12.14.0

Para el desafío estaremos utilizando la versión 12.14.0, la cual es la recomendada por Node.

### Navegador

Existen muchos navegadores disponibles. Sin embargo, recomiendo especialmente Google Chrome.

#### Instalando Google Chrome

Instala [Google Chrome](https://www.google.com/chrome/) si aún no lo tienes. Podemos escribir un pequeño código JavaScript en la consola del navegador, pero no utilizamos la consola para desarrollar aplicaciones.

![Google Chrome](file:///home/xixay/Documentos/Richard/ayuda-memoria/1inicio/20-javaScript/images/google_chrome.png)

#### Abriendo la consola de Google Chrome

Puedes abrir la consola de Google Chrome haciendo click en los tres puntos de la esquina superior derecha del navegador Chrome o utilizando un acceso directo. Yo prefiero usar los atajos.

![Opening chrome](file:///home/xixay/Documentos/Richard/ayuda-memoria/1inicio/20-javaScript/images/opening_developer_tool.png)

Para abrir la consola Chrome usando un atajo.

    Mac
    Command+Option+I

    Windows:
    Ctl+Shift+I

![Opening console](file:///home/xixay/Documentos/Richard/ayuda-memoria/1inicio/20-javaScript/images/opening_chrome_console_shortcut.png)

Después de abrir la consola de Google Chrome, intenta explorar los botones marcados. Pasaremos la mayor parte del tiempo aquí. La consola es el lugar donde va el código de JavaScript. El motor de la Consola de Google V8 cambia tu código JavaScript a código de máquina. Escribamos un código JavaScript en la consola de Google Chrome:

![write code on console](file:///home/xixay/Documentos/Richard/ayuda-memoria/1inicio/20-javaScript/images/js_code_on_chrome_console.png)

#### Escribiendo el código en la consola del navegador

Podemos escribir cualquier código de JavaScript en la consola de Google o en la de cualquier navegador. Sin embargo, para este desafío, sólo nos centramos en la consola de Google Chrome. Abre la consola usando:

    Mac
    Comando+Opción+I

    Windows:
    Ctl+Mayúsculas+I

##### Console.log

Para escribir nuestro primer código de JavaScript, usamos una función incorporada, **console.log()**. Pasamos un argumento como datos de entrada, y la función muestra la salida. Pasamos 'Hola, Mundo' como datos de entrada o argumento en la función console.log().

    console.log('¡Hola, Mundo!')

##### Console.log con múltiples argumentos

El console.log(param1, param2, param3), puede tomar múltiples argumentos.

![console log multiple arguments](file:///home/xixay/Documentos/Richard/ayuda-memoria/1inicio/20-javaScript/images/console_log_multipl_arguments.png)

    console.log('Hola', 'Mundo', '!')
    console.log('FELIZ', 'AÑO', 'NUEVO', 2020)
    console.log('Bienvenido', 'a', 30, 'Días', 'de', 'JavaScript')

Como pueden ver, en el código del fragmento de arriba, console.log() puede tomar múltiples argumentos.

¡Felicidades! Escribiste tu primer código JavaScript usando _console.log()_.

##### Comentario

Podemos añadir comentarios a nuestro código. Los comentarios son muy importantes para hacer el código más legible y para dejar recordatorios en nuestro código. JavaScript no ejecuta la parte de comentarios de nuestro código. Cualquier texto que empiece con // en JavaScript es un comentario o cualquier cosa que encierre como esta /\* \*/ es un comentario.

**Ejemplo: Comentario en una sola línea**

    // Este es el primer comentario
    // Este es el segundo comentario
    // Soy un comentario de una sola línea

**Ejemplo: Comentario multilínea**

    /* Este es un comentario de varias líneas.

    Los comentarios multilínea pueden tomar múltiples líneas.

    JavaScript es el lenguaje de la web
    */

##### Sintaxis

JavaScript es un lenguaje de programación. Como resultado, tiene su sintaxis como otros lenguajes. Si no escribimos una sintaxis que JavaScript entienda, se producirán diferentes tipos de errores. Exploraremos diferentes tipos de errores de JavaScript más adelante. Por ahora, veamos los errores de sintaxis.

![Error](file:///home/xixay/Documentos/Richard/ayuda-memoria/1inicio/20-javaScript/images/raising_syntax_error.png)

Cometí un error deliberado. Como resultado, la consola produce un error de sintaxis. En realidad, la sintaxis es muy informativa. Informa sobre el tipo de error que cometimos. Leyendo la guía de retroalimentación de errores, podemos corregir la sintaxis y arreglar el problema. El proceso de identificar y eliminar errores de un programa se llama 'debugging'. Corrijamos los errores:

    console.log("¡Hola, Mundo!")
    console.log('¡Hola, Mundo!')

Hasta ahora, hemos visto cómo mostrar el texto usando un console.log(). Si imprimimos texto o cadena usando console.log(), el texto tiene que estar entre comillas simples, dobles o 'backtick' (``). **Ejemplo:**

    console.log("¡Hola, Mundo!")
    console.log('¡Hola, Mundo!')
    console.log(`Hola, Mundo!`)

#### Aritmética

Ahora, practiquemos más la escritura de códigos JavaScript usando console.log() en la consola de Google Chrome para los tipos de datos numéricos. Además del texto, también podemos hacer cálculos matemáticos usando JavaScript. Hagamos los siguientes cálculos sencillos.

![Arithmetic](file:///home/xixay/Documentos/Richard/ayuda-memoria/1inicio/20-javaScript/images/arithmetic.png)

    console.log(2 + 3) // Adición
    console.log(3 - 2) // Sustracción
    console.log(2 * 3) // Multiplicación
    console.log(3 / 2) // División
    console.log(3 % 2) // Módulo - encontrar el resto
    console.log(3 ** 2) // Exponencial

### Editor de código

Podemos escribir nuestros códigos en la consola del navegador, pero no será para proyectos más grandes. En un entorno de trabajo real, los desarrolladores utilizan diferentes editores para escribir sus códigos. En este desafío de 30 días de JavaScript, usaremos Visual Studio Code.

#### Instalando Visual Studio

Visual Studio es un editor de texto de código abierto muy popular. Recomendaría descargarlo, pero si estás a favor de otros editores, siéntete libre de seguir con lo que tienes.

![Vscode](file:///home/xixay/Documentos/Richard/ayuda-memoria/1inicio/20-javaScript/images/vscode.png)

Si ya instalaste Visual Studio Code, empezaremos a usarlo.

#### Cómo usar Visual Studio Code

Abre Visual Studio Code haciendo doble clic en el ícono de Visual Studio. Cuando lo abras, obtendrás este tipo de interfaz. Intenta interactuar con los iconos etiquetados.

![Vscode ui](file:///home/xixay/Documentos/Richard/ayuda-memoria/1inicio/20-javaScript/images/vscode_ui.png)

![Vscode add project](file:///home/xixay/Documentos/Richard/ayuda-memoria/1inicio/20-javaScript/images/adding_project_to_vscode.png)

![Vscode open project](file:///home/xixay/Documentos/Richard/ayuda-memoria/1inicio/20-javaScript/images/opening_project_on_vscode.png)

![script file](file:///home/xixay/Documentos/Richard/ayuda-memoria/1inicio/20-javaScript/images/scripts_on_vscode.png)

![running script](file:///home/xixay/Documentos/Richard/ayuda-memoria/1inicio/20-javaScript/images/running_script.png)

![coding running](file:///home/xixay/Documentos/Richard/ayuda-memoria/1inicio/20-javaScript/images/launched_on_new_tab.png)

## Añadiendo JavaScript a una página web

JavaScript puede ser añadido a una página web de tres maneras diferentes:

- **_Script en línea ('Inline script')_**
- **_Script interno_**
- **_Script externo_**
- **_Múltiples scripts_**

Las siguientes secciones muestran diferentes formas de añadir código JavaScript a nuestra página web.

### Script en línea

Crea una carpeta en tu escritorio y llámala 30DíasDeJS o en cualquier lugar y crea un archivo **_index.html_** en la carpeta del proyecto. Luego pega el siguiente código y ábrelo en un navegador, ya sea en [Chrome](https://www.google.com/chrome/).

    <!DOCTYPE html>
      <html>
       <head>
         <title>30DíasDeJS:Inline Script</title>
       </head>

       <body>
         <button onclick="alert('Bienvenido a 30DaysOfJavaScript!')">Hazme Click</button>
       </body>
    </html>

Ahora, escribiste tu primer inline script. Podemos crear un mensaje de alerta emergente usando la función integrada _alert()_.

### Script interno

El Script interno puede ser escrito en la cabecera del código _('head')_ o en el cuerpo _('body')_, pero es preferible ponerlo en el cuerpo del documento HTML. Primero, escribamos en la parte de la cabeza de la página.

    <!DOCTYPE html>
    <html>
        <head>
        <title>30DíasDeJS:Scripts Internos</title>
        <script>
            console.log("Bienvenido a 30DaysOfJavaScript!")
        </script>
        </head>
        <body>
        </body>
    </html>

Así es como escribimos el guión interno la mayor parte del tiempo. Escribir el código de JavaScript en la sección del body es el lugar más recomendado. Abre la consola del navegador para ver la respuesta del console.log()

    <!DOCTYPE html>
    <html>
        <head>
         <title>30DíasDeJS:Scripts Internos</title>
        </head>
        <body>
        <button onclick="alert('Bienvenido a 30DaysOfJavaScript!');">Click Me</button>
        <script>
            console.log("Bienvenido a 30DaysOfJavaScript!");
        </script>
        </body>
    </html>

Abre la consola del navegador para ver la respuesta del console.log()

![js code from vscode](file:///home/xixay/Documentos/Richard/ayuda-memoria/1inicio/20-javaScript/images/js_code_vscode.png)

### Script externo

Al igual que el script interno, el enlace del script externo puede estar en la cabecera del código ('head') o en el cuerpo ('body'), pero igualmente es recomendado ponerlo en el 'body'. Primero, debemos crear un archivo JavaScript externo con extensión .js. Cualquier archivo JavaScript termina con .js. Crea un archivo introduccion.js dentro del directorio del proyecto y escribe el siguiente código y enlaza este archivo .js en la parte inferior del cuerpo.

    console.log('Bienvenido a 30DaysOfJavaScript')

**Script externo en la cabecera**

    <!DOCTYPE html>
    <html>
        <head>
         <title>30DíasDeJS:Scripts Externos</title>
        <script src="introduction.js"></script>
        </head>
        <body>
        </body>
        </html>

**Script externo en el cuerpo**

    <!DOCTYPE html>
    <html>
        <head>
         <title>30DíasDeJS:Scripts Externos</title>
        </head>
        <body>
        //Podría estar en la cabecera o en el cuerpo...
        // Aquí está el lugar recomendado para poner el script externo
        <script src="introduction.js"></script>
        </body>
        </html>

Abre la consola del navegador para ver la respuesta del console.log()

### Múltiples Scripts externos

Podemos enlazar múltiples archivos externos de JavaScript a una página web. Crea un archivo holamundo.js dentro de la carpeta 30DiasDeJS y escribe el siguiente código.

    console.log('¡Hola, Mundo!')


    <!DOCTYPE html>
    <html>
        <cabeza>
        <título>Múltiples guiones externos</título>
        </cabeza>
        <cuerpo>

        <script src ="./holamundo.js"></script>
        <script src="./introduccion.js"></script>
        </cuerpo>
    </html>

Tu archivo main.js debería estar por debajo de todos los otros scripts. Ten cuidado con tu ejercicio para entender esta línea.

![Multiple Script](file:///home/xixay/Documentos/Richard/ayuda-memoria/1inicio/20-javaScript/images/multiple_script.png)

## Introducción a los tipos de datos

En JavaScript y también en otros lenguajes de programación, hay diferentes tipos de datos. Los siguientes son los tipos de datos primitivos de JavaScript: _Cadenas de texto ('string'), Números, Booleanos, undefined, Null_ y _Symbol_.

### Números

- Enteros: Números enteros (negativos, cero y positivos) Ejemplo: ... -3, -2, -1, 0, 1, 2, 3 ...
- Float: Números decimales Ejemplo ... -3.5, -2.25, -1.0, 0.0, 1.1, 2.2, 3.5 ...

### Cadenas de texto

Una colección de uno o más carácteres entre comillas. **Ejemplo:**

    "Asabeneh"
    "Finlandia"
    'JavaScript es un hermoso lenguaje de programación'.
    "Me encanta enseñar"
    "Espero que estés disfrutando del primer día"
    `También podemos crear una cadena usando un backtick`

### Booleanos

Un valor booleano es verdadero o falso. Cualquier comparación devuelve un valor booleano, que es verdadero o falso.

Un tipo de datos booleano es un valor Verdadero o Falso.

**Ejemplo:**

    true // si la luz está encendida, el valor es true
    falso // si la luz está apagada, el valor es Falso

### Undefined

En JavaScript, si no asignamos un valor a una variable, el valor es indefinido. Además, si una función no devuelve nada, devuelve undefined.

    let nombre;
    console.log(nombre); //no está definida, porque no está asignada a un valor todavía

### Null

Null en JavaScript significa un valor vacío/nulo.

    let valorVacio = null

## Comprobando los tipos de datos

Para comprobar el tipo de datos de un determinado valor, utilizamos el operador **'typeof'**. Véase el siguiente ejemplo.

    console.log(typeof 'Asabeneh') // string
    console.log(typeof 5) // número
    console.log(typeof true ) // boolean
    console.log(typeof null) // tipo de objeto
    console.log(typeof undefined) // undefined

## Comentarios

Los comentarios en JavaScript son similares a los de otros lenguajes de programación. Los comentarios son importantes para hacer tu código más legible. Hay dos maneras de comentar:

- _Comentario en una sola línea_
- _Comentario multilineal_

        // comentando el código mismo con un solo comentario
        // let nombre = 'Asabeneh'; comentario de una sola línea
        // let apellido = 'Yetayeh'; comentario de una sola línea

Comentario multilineal:

    /*
        let ubicación = 'Helsinki';
        let edad = 100;
        let casado = verdadero;
        Este es un comentario de varias líneas
     */

### Variables

Las variables son contenedores de datos. Las variables se utilizan para almacenar datos en una ubicación de memoria. Cuando se declara una variable, se reserva una ubicación de memoria. Cuando se asigna una variable a un valor (data), el espacio de memoria se llena con esos datos. Para declarar una variable, usamos palabras clave _var_, _let_ o _const_. Hablaremos más sobre var, let y const en detalle en otras secciones (ámbito). Por ahora, la explicación anterior es suficiente.

Para una variable que cambia en un momento diferente, usamos _let_. Si los datos no cambian en absoluto, usamos _const_. Por ejemplo, PI, nombre del país, gravedad no cambian, y podemos usar _const._

- El nombre de una variable en JavaScript no debe comenzar con un número.
- Un nombre de variable JavaScript no permite caracteres especiales excepto el signo de dólar y el guión bajo.
- Los nombres de las variables en JavaScript siguen una convención 'CamelCase'.
- El nombre de una variable no debe tener espacio entre palabras.

Los siguientes son ejemplos válidos de variables JavaScript.

Variables válidas en JavaScript:

    primerNombre
    apellido
    país
    ciudadCapital
    capital
    edad
    estaCasado

    nombre_de_pila
    apellido
    esta_casado
    ciudad_capital

    num1
    num_1
     _num_1
    $num1
    año2020
    año_2020

camelCase es convencional en JavaScript. En este material, usaremos variables de CamelCase.

Variables inválidas:

    primer-nombre
    1_numero
    num_#_1

Declaremos las variables con diferentes tipos de datos. Para declarar una variable, necesitamos usar la palabra clave let o const antes del nombre de la variable. Después del nombre de la variable, escribimos un signo igual (operador de asignación), y un valor.

    # Sintaxis
    let nombreDeLaVariable = valor

**Ejemplos: Variables**

    // Declarando diferentes variables de diferentes tipos de datos
    let nombre = 'Asabeneh' // nombre de una persona
    let apellido = 'Yetayeh' // apellido de una persona
    let pais = 'Finland' // país
    let ciudad = 'Helsinki' // ciudad capital
    let edad = 100 // edad en años
    let estaCasado = true

    console.log(nombre, apellido, país, ciudad, edad, estáCasado)


    Asabeneh Yetayeh Finlandia Helsinki 100 True

    // Declarando variables con valores numéricos
    let edad = 100 // edad en años
    const constante = 9,81 // gravedad terrestre en m/s2
    const puntoDeEbullición  = 100 // punto de ebullición del agua, temperatura en oC
    const PI = 3.14 // constante geométrica

    console.log(gravedad, punto de ebullición, PI)


    9.81 100 3.14


    // Las variables también pueden ser declaradas en una línea separada por una coma
    let nombre = 'Asabeneh', // nombre de una persona
    trabajo = 'profesor',
    viveEn = 'Finlandia';
    console.log(nombre, trabajo, viveEn);


    Asabeneh profesor de Finlandia

Cuando ejecutas los archivos en la carpeta Día_1 deberías obtener esto:

![Day one](file:///home/xixay/Documentos/Richard/ayuda-memoria/1inicio/20-javaScript/images/day_1.png)

🌕 Eres increíble. Acabas de completar el desafío del día 1 y estás en camino a la grandeza. Ahora haz algunos ejercicios para tu cerebro y para tus músculos.

# 💻 Día 1: Ejercicios

1.  Escribe un comentario de una sola línea que diga _"los comentarios pueden hacer que el código sea legible"_

2.  Escribe otro comentario que diga, _"Bienvenido a 30DaysOfJavaScript"_

3.  Escribe un comentario multilínea que diga, _"Los comentarios pueden hacer el código legible, fácil de usar e informativo"_

4.  Crea un archivo variable.js y declarar variables y asignar tipos de datos string, booleanos, indefinidos y nulos

5.  Crea el archivo datatypes.js y utilizar el operador **_"typeof"_** de JavaScript para comprobar los diferentes tipos de datos. Comprueba el tipo de datos de cada variable

6.  Declara cuatro variables sin asignar valores

7.  Declara cuatro variables con valores asignados

8.  Declara variables para almacenar su nombre, apellido, estado civil, país y edad en múltiples líneas

9.  Declara variables para almacenar su nombre, apellido, estado civil, país y edad en una sola línea

10. Declara dos variables _miEdad_ y _tuEdad_ y asígneles valores iniciales y regístrese en la consola del navegador.

            Tengo 25 años.
            Tú tienes 30 años.

    🎉 ¡FELICIDADES! 🎉

[Day 2 >>](./dia_02_tipos_de_datos.md)

[<< INDICE](../../README.md)


---


<div style="page-break-before: always;"></div>


# 📄 1.21. VSCode Configuración

[<< INDICE](../../README.md)
## Configuracion 
- Ruta
```console
~/.config/Code/User/profiles/5dc970e5/settings.json
```
- settings.json
```json
{
  "workbench.editor.showTabs": "single",
  "[typescript]": {
    "editor.defaultFormatter": "vscode.typescript-language-features"
  },
  "[vue]": {
    "editor.defaultFormatter": "Vue.volar"
  },
  "git.autofetch": true,
  "rest-client.environmentVariables": {
    "$shared": {}
  },
  "terminal.integrated.env.linux": {},
  "terminal.integrated.fontFamily": "MesloLGS NF",
  "terminal.integrated.fontLigatures": true,
  "console-ninja.featureSet": "Community",
  "turboConsoleLog.logMessagePrefix": "🐱===========>",
  "turboConsoleLog.includeFileNameAndLineNum": false,
  "git.openRepositoryInParentFolders": "never",
  "turboConsoleLog.insertEmptyLineAfterLogMessage": true,
  "turboConsoleLog.insertEnclosingFunction": false,
  "editor.defaultFormatter": "esbenp.prettier-vscode",
  "prettier.singleQuote": true,
  "prettier.printWidth": 100,
  "workbench.iconTheme": "material-icon-theme",
  "RainbowBrackets.depreciation-notice": false,
  "debug.javascript.autoAttachFilter": "always",
  "workbench.colorTheme": "One Dark Pro Darker",
  "editor.fontFamily": "'Droid Sans Mono', 'monospace', monospace,'JetBrains Mono'",
  "inlineChat.showGutterIcon": true,
  "files.autoSave": "onFocusChange"
}

```

---


<div style="page-break-before: always;"></div>


# 📄 1.22. Debugger

[<< INDICE](../README.md)
# Instalar Debugger
- Instalar la extension
```url
https://marketplace.visualstudio.com/items?itemName=ms-vscode.js-debug-nightly
```
- Crear el archivo launch.json
```JSON
{
    "version": "0.2.0",
    "configurations": [
      {
        "type": "node",
        "request": "launch",
        "name": "Launch Program",
        "skipFiles": ["<node_internals>/**"],
        "program": "${file}",
        "preLaunchTask": "tsc: build - tsconfig.json",
        "outFiles": ["${workspaceFolder}/dist/**/*.js"]
      }
    ]
  }
```
**![Debugger](file:///5imagenes/debugger/archivo configuracion.png)**
- Iniciar desde el vscode el backend
**![Debugger](file:///5imagenes/debugger/vscode.png)**


---


<div style="page-break-before: always;"></div>


# 📄 1.23. Matar puertos

[<< INDICE](../README.md)
- [1. Ver todos los puertos que estan siendo usados](#1-ver-todos-los-puertos-que-estan-siendo-usados)
- [2. Ver un puerto en especifico](#2-ver-un-puerto-en-especifico)
- [3. Matar el puerto 7008, mediante su PID](#3-matar-el-puerto-7008-mediante-su-pid)

## 1. Ver todos los puertos que estan siendo usados
- Ver todos los puertos
```cmd
netstat -plntu
```
- Puertos que se visualizan
```cmd
(No todos los procesos pueden ser identificados, no hay información de propiedad del proceso
 no se mostrarán, necesita ser superusuario para verlos todos.)
Conexiones activas de Internet (solo servidores)
Proto  Recib Enviad Dirección local         Dirección remota       Estado       PID/Program name    
tcp        0      0 0.0.0.0:5432            0.0.0.0:*               ESCUCHAR    -                   
tcp        0      0 127.0.0.1:8828          0.0.0.0:*               ESCUCHAR    24141/Code --standa 
```
## 2. Ver un puerto en especifico
```cmd
netstat -plntu | grep 7008
```
- Puerto que se visualizan (PID=2112143, el cual es mio siendo usado)
```cmd
tcp6    0   0:::7008      :::*    LISTEN    2112143/node
```
## 3. Matar el puerto 7008, mediante su PID
```cmd
kill -9 2112143
```
**![Matar Puertos](file:///5imagenes/puertos/puerto.png)**
[<< INDICE](../README.md)

---


<div style="page-break-before: always;"></div>


# 📄 1.24. Snippets

[<< INDICE](../README.md)
- [1. Snippets](#1-snippets)
  - [1.1. Comando busqueda](#11-comando-busqueda)
  - [1.2. Snippets información](#12-snippets-información)
    - [1.2.1. React Hooks](#121-react-hooks)
    - [1.2.2. Métodos básicos](#122-métodos-básicos)
    - [1.2.3. React](#123-react)
    - [1.2.4. React Nativo](#124-react-nativo)
    - [1.2.5. Redux](#125-redux)
    - [1.2.6. PropTypes](#126-proptypes)
    - [1.2.7. Console](#127-console)
    - [1.2.8. React Componentes](#128-react-componentes)
    - [1.2.9. `rcc`](#129-rcc)
    - [1.2.10. `rce`](#1210-rce)
    - [1.2.11. `rcep`](#1211-rcep)
    - [1.2.12. `rpc`](#1212-rpc)
    - [1.2.13. `rpcp`](#1213-rpcp)
    - [1.2.14. `rpce`](#1214-rpce)
    - [1.2.15. `rccp`](#1215-rccp)
    - [1.2.16. `rfcp`](#1216-rfcp)
    - [1.2.17. `rfc`](#1217-rfc)
    - [1.2.18. `rfce`](#1218-rfce)
    - [1.2.19. `rafcp`](#1219-rafcp)
    - [1.2.20. `rafc`](#1220-rafc)
    - [1.2.21. `rafce`](#1221-rafce)
    - [1.2.22. `rmc`](#1222-rmc)
    - [1.2.23. `rmcp`](#1223-rmcp)
    - [1.2.24. `rcredux`](#1224-rcredux)
    - [1.2.25. `rcreduxp`](#1225-rcreduxp)
    - [1.2.26. `rfcredux`](#1226-rfcredux)
    - [1.2.27. `rfreduxp`](#1227-rfreduxp)
    - [1.2.28. `reduxmap`](#1228-reduxmap)
  - [1.3. React Nativo Componentes](#13-react-nativo-componentes)
    - [1.3.1. `rnc`](#131-rnc)
    - [1.3.2. `rnf`](#132-rnf)
    - [1.3.3. `rnfs`](#133-rnfs)
    - [1.3.4. `rnfe`](#134-rnfe)
    - [1.3.5. `rnfes`](#135-rnfes)
    - [1.3.6. `rncs`](#136-rncs)
    - [1.3.7. `rnce`](#137-rnce)
  - [1.4. Otros](#14-otros)
    - [1.4.1. `cmmb`](#141-cmmb)
    - [1.4.2. `desc`](#142-desc)
    - [1.4.3. `test`](#143-test)
    - [1.4.4. `tit`](#144-tit)
    - [1.4.5. `stest`](#145-stest)
    - [1.4.6. `srtest`](#146-srtest)
    - [1.4.7. `sntest`](#147-sntest)
    - [1.4.8. `snrtest`](#148-snrtest)
    - [1.4.9. `hocredux`](#149-hocredux)
    - [1.4.10. `hoc`](#1410-hoc)

# 1. Snippets

## 1.1. Comando busqueda
Comando de búsqueda
Puedes buscar fragmentos de código con el comando de búsqueda de fragmentos de código de ES7, que se puede ejecutar con CMD + Shift + P o simplemente usar la combinación de teclas CMD + Shift + R (CTRL + ALT + R para Windows y Linux).

A continuación, se incluye un enlace directo al mercado de fragmentos de código de ES7 React/Redux/React-Native/JS
## 1.2. Snippets información

Cada espacio dentro de `{ }` y `()` significa que esto se inserta en la siguiente línea :)
`$` representa cada paso después de `tab`.

_TypeScript_ tiene sus propios componentes y fragmentos de código. Utilice la búsqueda o simplemente escriba `ts` antes de cada fragmento de código de componente.

Por ejemplo, `tsrcc`

<br>

### 1.2.1. React Hooks

- Se agregan los ganchos de los [documentos oficiales](https://reactjs.org/docs/hooks-reference.html) con el nombre del gancho como prefijo.

### 1.2.2. Métodos básicos

|  Prefijo | Metodo                                              |
| ------: | --------------------------------------------------- |
|  `imp→` | `import moduleName from 'module'`                   |
|  `imn→` | `import 'module'`                                   |
|  `imd→` | `import { destructuredModule } from 'module'`       |
|  `ime→` | `import * as alias from 'module'`                   |
|  `ima→` | `import { originalName as aliasName} from 'module'` |
|  `exp→` | `export default moduleName`                         |
|  `exd→` | `export { destructuredModule } from 'module'`       |
|  `exa→` | `export { originalName as aliasName} from 'module'` |
|  `enf→` | `export const functionName = (params) => { }`       |
|  `edf→` | `export default (params) => { }`                    |
| `ednf→` | `export default function functionName(params) { }`  |
|  `met→` | `methodName = (params) => { }`                      |
|  `fre→` | `arrayName.forEach(element => { }`                  |
|  `fof→` | `for(let itemName of objectName { }`                |
|  `fin→` | `for(let itemName in objectName { }`                |
| `anfn→` | `(params) => { }`                                   |
|  `nfn→` | `const functionName = (params) => { }`              |
|  `dob→` | `const {propName} = objectToDescruct`               |
|  `dar→` | `const [propName] = arrayToDescruct`                |
|  `sti→` | `setInterval(() => { }, intervalTime`               |
|  `sto→` | `setTimeout(() => { }, delayTime`                   |
| `prom→` | `return new Promise((resolve, reject) => { }`       |
| `cmmb→` | `comment block`                                     |
|   `cp→` | `const { } = this.props`                            |
|   `cs→` | `const { } = this.state`                            |

### 1.2.3. React

|      Prefijo | Metodo                                                                      |
| ----------: | --------------------------------------------------------------------------- |
|      `imr→` | `import React from 'react'`                                                 |
|     `imrd→` | `import ReactDOM from 'react-dom'`                                          |
|     `imrc→` | `import React, { Component } from 'react'`                                  |
|    `imrpc→` | `import React, { PureComponent } from 'react'`                              |
|     `imrm→` | `import React, { memo } from 'react'`                                       |
|     `imrr→` | `import { BrowserRouter as Router, Route, NavLink} from 'react-router-dom'` |
|     `imbr→` | `import { BrowserRouter as Router} from 'react-router-dom'`                 |
|    `imbrc→` | `import { Route, Switch, NavLink, Link } from react-router-dom'`            |
|    `imbrr→` | `import { Route } from 'react-router-dom'`                                  |
|    `imbrs→` | `import { Switch } from 'react-router-dom'`                                 |
|    `imbrl→` | `import { Link } from 'react-router-dom'`                                   |
|   `imbrnl→` | `import { NavLink } from 'react-router-dom'`                                |
|     `imrs→` | `import React, { useState } from 'react'`                                   |
|    `imrse→` | `import React, { useState, useEffect } from 'react'`                        |
|    `redux→` | `import { connect } from 'react-redux'`                                     |
|      `est→` | `this.state = { }`                                                          |
|      `cdm→` | `componentDidMount = () => { }`                                             |
|      `scu→` | `shouldComponentUpdate = (nextProps, nextState) => { }`                     |
|     `cdup→` | `componentDidUpdate = (prevProps, prevState) => { }`                        |
|     `cwun→` | `componentWillUnmount = () => { }`                                          |
|    `gdsfp→` | `static getDerivedStateFromProps(nextProps, prevState) { }`                 |
|     `gsbu→` | `getSnapshotBeforeUpdate = (prevProps, prevState) => { }`                   |
|      `sst→` | `this.setState({ })`                                                        |
|      `ssf→` | `this.setState((state, props) => return { })`                               |
|    `props→` | `this.props.propName`                                                       |
|    `state→` | `this.state.stateName`                                                      |
| `rcontext→` | `const $1 = React.createContext()`                                          |
|     `cref→` | `this.$1Ref = React.createRef()`                                            |
|     `fref→` | `const ref = React.createRef()`                                             |
|      `bnd→` | `this.methodName = this.methodName.bind(this)`                              |

### 1.2.4. React Nativo

|     Prefijo | Metodo                                 |
| ---------: | -------------------------------------- |
|    `imrn→` | `import { $1 } from 'react-native'`    |
| `rnstyle→` | `const styles = StyleSheet.create({})` |

### 1.2.5. Redux

|       Prefijo | Metodo                    |
| -----------: | ------------------------- |
|  `rxaction→` | `redux action template`   |
|   `rxconst→` | `export const $1 = '$1'`  |
| `rxreducer→` | `redux reducer template`  |
|  `rxselect→` | `redux selector template` |
|   `rxslice→` | `redux slice template`    |

### 1.2.6. PropTypes

|    Prefijo | Metodo                                   |
| --------: | ---------------------------------------- |
|    `pta→` | `PropTypes.array`                        |
|   `ptar→` | `PropTypes.array.isRequired`             |
|    `ptb→` | `PropTypes.bool`                         |
|   `ptbr→` | `PropTypes.bool.isRequired`              |
|    `ptf→` | `PropTypes.func`                         |
|   `ptfr→` | `PropTypes.func.isRequired`              |
|    `ptn→` | `PropTypes.number`                       |
|   `ptnr→` | `PropTypes.number.isRequired`            |
|    `pto→` | `PropTypes.object`                       |
|   `ptor→` | `PropTypes.object.isRequired`            |
|    `pts→` | `PropTypes.string`                       |
|   `ptsr→` | `PropTypes.string.isRequired`            |
|   `ptnd→` | `PropTypes.node`                         |
|  `ptndr→` | `PropTypes.node.isRequired`              |
|   `ptel→` | `PropTypes.element`                      |
|  `ptelr→` | `PropTypes.element.isRequired`           |
|    `pti→` | `PropTypes.instanceOf(name)`             |
|   `ptir→` | `PropTypes.instanceOf(name).isRequired`  |
|    `pte→` | `PropTypes.oneOf([name])`                |
|   `pter→` | `PropTypes.oneOf([name]).isRequired`     |
|   `ptet→` | `PropTypes.oneOfType([name])`            |
|  `ptetr→` | `PropTypes.oneOfType([name]).isRequired` |
|   `ptao→` | `PropTypes.arrayOf(name)`                |
|  `ptaor→` | `PropTypes.arrayOf(name).isRequired`     |
|   `ptoo→` | `PropTypes.objectOf(name)`               |
|  `ptoor→` | `PropTypes.objectOf(name).isRequired`    |
|   `ptsh→` | `PropTypes.shape({ })`                   |
|  `ptshr→` | `PropTypes.shape({ }).isRequired`        |
|  `ptany→` | `PropTypes.any`                          |
| `ptypes→` | `static propTypes = {}`                  |

### 1.2.7. Console

| Prefijo | Metodo                                                       |
| ------ | ------------------------------------------------------------ |
| `clg→` | `console.log(object)`                                        |
| `clo→` | `` console.log(`object`, object) ``                          |
| `clj→` | `` console.log(`object`, JSON.stringify(object, null, 2)) `` |
| `ctm→` | `` console.time(`timeId`) ``                                 |
| `cte→` | `` console.timeEnd(`timeId`) ``                              |
| `cas→` | `console.assert(expression,object)`                          |
| `ccl→` | `console.clear()`                                            |
| `cco→` | `console.count(label)`                                       |
| `cdi→` | `console.dir`                                                |
| `cer→` | `console.error(object)`                                      |
| `cgr→` | `console.group(label)`                                       |
| `cge→` | `console.groupEnd()`                                         |
| `ctr→` | `console.trace(object)`                                      |
| `cwa→` | `console.warn`                                               |
| `cin→` | `console.info`                                               |

### 1.2.8. React Componentes

### 1.2.9. `rcc`

```javascript
import React, { Component } from 'react'

export default class FileName extends Component {
  render() {
    return <div>$2</div>
  }
}
```

### 1.2.10. `rce`

```javascript
import React, { Component } from 'react'

export class FileName extends Component {
  render() {
    return <div>$2</div>
  }
}

export default $1
```

### 1.2.11. `rcep`

```javascript
import React, { Component } from 'react'
import PropTypes from 'prop-types'

export class FileName extends Component {
  static propTypes = {}

  render() {
    return <div>$2</div>
  }
}

export default $1
```

### 1.2.12. `rpc`

```javascript
import React, { PureComponent } from 'react'

export default class FileName extends PureComponent {
  render() {
    return <div>$2</div>
  }
}
```

### 1.2.13. `rpcp`

```javascript
import React, { PureComponent } from 'react'
import PropTypes from 'prop-types'

export default class FileName extends PureComponent {
  static propTypes = {}

  render() {
    return <div>$2</div>
  }
}
```

### 1.2.14. `rpce`

```javascript
import React, { PureComponent } from 'react'
import PropTypes from 'prop-types'

export class FileName extends PureComponent {
  static propTypes = {}

  render() {
    return <div>$2</div>
  }
}

export default FileName
```

### 1.2.15. `rccp`

```javascript
import React, { Component } from 'react'
import PropTypes from 'prop-types'

export default class FileName extends Component {
  static propTypes = {
    $2: $3,
  }

  render() {
    return <div>$4</div>
  }
}
```

### 1.2.16. `rfcp`

```javascript
import React from 'react'
import PropTypes from 'prop-types'

function $1(props) {
  return <div>$0</div>
}

$1.propTypes = {}

export default $1
```

### 1.2.17. `rfc`

```javascript
import React from 'react'

export default function $1() {
  return <div>$0</div>
}
```

### 1.2.18. `rfce`

```javascript
import React from 'react'

function $1() {
  return <div>$0</div>
}

export default $1
```

### 1.2.19. `rafcp`

```javascript
import React from 'react'
import PropTypes from 'prop-types'

const $1 = (props) => {
  return <div>$0</div>
}

$1.propTypes = {}

export default $1
```

### 1.2.20. `rafc`

```javascript
import React from 'react'

export const $1 = () => {
  return <div>$0</div>
}
```

### 1.2.21. `rafce`

```javascript
import React from 'react'

const $1 = () => {
  return <div>$0</div>
}

export default $1
```

### 1.2.22. `rmc`

```javascript
import React, { memo } from 'react'

export default memo(function $1() {
  return <div>$0</div>
})
```

### 1.2.23. `rmcp`

```javascript
import React, { memo } from 'react'
import PropTypes from 'prop-types'

const $1 = memo(function $1(props) {
  return <div>$0</div>
})

$1.propTypes = {}

export default $1
```

### 1.2.24. `rcredux`

```javascript
import React, { Component } from 'react'
import { connect } from 'react-redux'

export class FileName extends Component {
  render() {
    return <div>$4</div>
  }
}

const mapStateToProps = (state) => ({})

const mapDispatchToProps = {}

export default connect(mapStateToProps, mapDispatchToProps)(FileName)
```

### 1.2.25. `rcreduxp`

```javascript
import React, { Component } from 'react'
import PropTypes from 'prop-types'
import { connect } from 'react-redux'

export class FileName extends Component {
  static propTypes = {
    $2: $3,
  }

  render() {
    return <div>$4</div>
  }
}

const mapStateToProps = (state) => ({})

const mapDispatchToProps = {}

export default connect(mapStateToProps, mapDispatchToProps)(FileName)
```

### 1.2.26. `rfcredux`

```javascript
import React, { Component } from 'react'
import { connect } from 'react-redux'

export const FileName = () => {
  return <div>$4</div>
}

const mapStateToProps = (state) => ({})

const mapDispatchToProps = {}

export default connect(mapStateToProps, mapDispatchToProps)(FileName)
```

### 1.2.27. `rfreduxp`

```javascript
import React, { Component } from 'react'
import PropTypes from 'prop-types'
import { connect } from 'react-redux'

export const FileName = () => {
  return <div>$4</div>
}

FileName.propTypes = {
  $2: $3,
}

const mapStateToProps = (state) => ({})

const mapDispatchToProps = {}

export default connect(mapStateToProps, mapDispatchToProps)(FileName)
```

### 1.2.28. `reduxmap`

```javascript
const mapStateToProps = (state) => ({})

const mapDispatchToProps = {}
```

## 1.3. React Nativo Componentes

### 1.3.1. `rnc`

```javascript
import React, { Component } from 'react'
import { Text, View } from 'react-native'

export default class FileName extends Component {
  render() {
    return (
      <View>
        <Text> $2 </Text>
      </View>
    )
  }
}
```

### 1.3.2. `rnf`

```javascript
import React from 'react'
import { View, Text } from 'react-native'

export default function $1() {
  return (
    <View>
      <Text> $2 </Text>
    </View>
  )
}
```

### 1.3.3. `rnfs`

```javascript
import React from 'react'
import { StyleSheet, View, Text } from 'react-native'

export default function $1() {
  return (
    <View>
      <Text> $2 </Text>
    </View>
  )
}

const styles = StyleSheet.create({})
```

### 1.3.4. `rnfe`

```javascript
import React from 'react'
import { View, Text } from 'react-native'

const $1 = () => {
  return (
    <View>
      <Text> $2 </Text>
    </View>
  )
}

export default $1
```

### 1.3.5. `rnfes`

```javascript
import React from 'react'
import { StyleSheet, View, Text } from 'react-native'

const $1 = () => {
  return (
    <View>
      <Text> $2 </Text>
    </View>
  )
}

export default $1

const styles = StyleSheet.create({})
```

### 1.3.6. `rncs`

```javascript
import React, { Component } from 'react'
import { Text, StyleSheet, View } from 'react-native'

export default class FileName extends Component {
  render() {
    return (
      <View>
        <Text> $2 </Text>
      </View>
    )
  }
}

const styles = StyleSheet.create({})
```

### 1.3.7. `rnce`

```javascript
import React, { Component } from 'react'
import { Text, View } from 'react-native'

export class FileName extends Component {
  render() {
    return (
      <View>
        <Text> $2 </Text>
      </View>
    )
  }
}

export default $1
```

## 1.4. Otros

### 1.4.1. `cmmb`

```JS
/**
|--------------------------------------------------
| $1
|--------------------------------------------------
*/
```

### 1.4.2. `desc`

```javascript
describe('$1', () => {
  $2
})
```

### 1.4.3. `test`

```javascript
test('should $1', () => {
  $2
})
```

### 1.4.4. `tit`

```javascript
it('should $1', () => {
  $2
})
```

### 1.4.5. `stest`

```javascript
import React from 'react'
import renderer from 'react-test-renderer'

import { $1 } from '../$1'

describe('<$1 />', () => {
  const defaultProps = {}
  const wrapper = renderer.create(<$1 {...defaultProps} />)

  test('render', () => {
    expect(wrapper).toMatchSnapshot()
  })
})
```

### 1.4.6. `srtest`

```javascript
import React from 'react'
import renderer from 'react-test-renderer'
import { Provider } from 'react-redux'

import store from 'src/store'
import { $1 } from '../$1'

describe('<$1 />', () => {
  const defaultProps = {}
  const wrapper = renderer.create(
    <Provider store={store}>
      <$1 {...defaultProps} />)
    </Provider>,
  )

  test('render', () => {
    expect(wrapper).toMatchSnapshot()
  })
})
```

### 1.4.7. `sntest`

```javascript
import 'react-native'
import React from 'react'
import renderer from 'react-test-renderer'

import $1 from '../$1'

describe('<$1 />', () => {
  const defaultProps = {}

  const wrapper = renderer.create(<$1 {...defaultProps} />)

  test('render', () => {
    expect(wrapper).toMatchSnapshot()
  })
})
```

### 1.4.8. `snrtest`

```javascript
import 'react-native'
import React from 'react'
import renderer from 'react-test-renderer'
import { Provider } from 'react-redux'

import store from 'src/store/configureStore'
import $1 from '../$1'

describe('<$1 />', () => {
  const defaultProps = {}
  const wrapper = renderer.create(
    <Provider store={store}>
      <$1 {...defaultProps} />
    </Provider>,
  )

  test('render', () => {
    expect(wrapper).toMatchSnapshot()
  })
})
```

### 1.4.9. `hocredux`

```javascript
import React from 'react'
import PropTypes from 'prop-types'
import { connect } from 'react-redux'

export const mapStateToProps = (state) => ({})

export const mapDispatchToProps = {}

export const $1 = (WrappedComponent) => {
  const hocComponent = ({ ...props }) => <WrappedComponent {...props} />

  hocComponent.propTypes = {}

  return hocComponent
}

export default (WrapperComponent) =>
  connect(mapStateToProps, mapDispatchToProps)($1(WrapperComponent))
```

### 1.4.10. `hoc`

```javascript
import React from 'react'
import PropTypes from 'prop-types'

export default (WrappedComponent) => {
  const hocComponent = ({ ...props }) => <WrappedComponent {...props} />

  hocComponent.propTypes = {}

  return hocComponent
}
```
[<< INDICE](../README.md)

---


<div style="page-break-before: always;"></div>


# 📄 1.25. Obsidian

[<< INDICE](../README.md)
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


---


<div style="page-break-before: always;"></div>


# 📄 1.26. Google Drive + Obsidian

[<< INDICE](../README.md)
- [1. Configurar google drive en ubuntu](#1-configurar-google-drive-en-ubuntu)
  - [1.1. Inicia la configuración de rclone: Abre una terminal y escribe:](#11-inicia-la-configuración-de-rclone-abre-una-terminal-y-escribe)
  - [1.2. Nombra tu remoto:](#12-nombra-tu-remoto)
  - [1.3. Selecciona Google Drive como el tipo de almacenamiento:](#13-selecciona-google-drive-como-el-tipo-de-almacenamiento)
  - [1.4. Cliente y secreto de Google:](#14-cliente-y-secreto-de-google)
  - [1.5. Selecciona el alcance del acceso (scope):](#15-selecciona-el-alcance-del-acceso-scope)
  - [1.6. Complete para acceder a las carpetas "Computadoras"](#16-complete-para-acceder-a-las-carpetas-computadoras)
  - [1.7. Cuenta de servicio (opcional):](#17-cuenta-de-servicio-opcional)
  - [1.8. Cuando te pregunte si quieres editar la configuración avanzada](#18-cuando-te-pregunte-si-quieres-editar-la-configuración-avanzada)
  - [1.9. Autenticación interactiva:](#19-autenticación-interactiva)
  - [1.10. Team Drive (opcional):](#110-team-drive-opcional)
  - [1.11. Mensaje de creacion](#111-mensaje-de-creacion)
  - [1.12. Confirmar configuración:](#112-confirmar-configuración)
  - [1.13. Salir de la configuración:](#113-salir-de-la-configuración)
  - [1.14. Montar Google Drive](#114-montar-google-drive)

# 1. Configurar google drive en ubuntu
- Aquí están los pasos detallados basados en lo que has mencionado:
## 1.1. Inicia la configuración de rclone: Abre una terminal y escribe:
```shell
 rclone config
```
- Luego selecciona New remote escribiendo n y presiona Enter.
```shell
2024/09/28 20:19:51 NOTICE: Config file "/home/xixay/.config/rclone/rclone.conf" not found - using defaults
No remotes found - make a new one
n) New remote
s) Set configuration password
q) Quit config
n/s/q> n
```
## 1.2. Nombra tu remoto:
- Cuando te pregunte por el nombre del remote, escribe un nombre, por ejemplo remote, y presiona Enter:
```shell
name> remote
```
## 1.3. Selecciona Google Drive como el tipo de almacenamiento:
- Cuando te pida el tipo de almacenamiento, escribe el número correspondiente a Google Drive o directamente drive y presiona Enter:
```shell
Type of storage to configure.
Enter a string value. Press Enter for the default ("").
Choose a number from below, or type in your own value
 1 / 1Fichier
   \ "fichier"
 2 / Alias for an existing remote
   \ "alias"
 3 / Amazon Drive
   \ "amazon cloud drive"
 4 / Amazon S3 Compliant Storage Provider (AWS, Alibaba, Ceph, Digital Ocean, Dreamhost, IBM COS, Minio, Tencent COS, etc)
   \ "s3"
 5 / Backblaze B2
   \ "b2"
 6 / Box
   \ "box"
 7 / Cache a remote
   \ "cache"
 8 / Citrix Sharefile
   \ "sharefile"
 9 / Dropbox
   \ "dropbox"
10 / Encrypt/Decrypt a remote
   \ "crypt"
11 / FTP Connection
   \ "ftp"
12 / Google Cloud Storage (this is not Google Drive)
   \ "google cloud storage"
13 / Google Drive
   \ "drive"
14 / Google Photos
   \ "google photos"
15 / Hubic
   \ "hubic"
16 / In memory object storage system.
   \ "memory"
17 / Jottacloud
   \ "jottacloud"
18 / Koofr
   \ "koofr"
19 / Local Disk
   \ "local"
20 / Mail.ru Cloud
   \ "mailru"
21 / Microsoft Azure Blob Storage
   \ "azureblob"
22 / Microsoft OneDrive
   \ "onedrive"
23 / OpenDrive
   \ "opendrive"
24 / OpenStack Swift (Rackspace Cloud Files, Memset Memstore, OVH)
   \ "swift"
25 / Pcloud
   \ "pcloud"
26 / Put.io
   \ "putio"
27 / SSH/SFTP Connection
   \ "sftp"
28 / Sugarsync
   \ "sugarsync"
29 / Transparently chunk/split large files
   \ "chunker"
30 / Union merges the contents of several upstream fs
   \ "union"
31 / Webdav
   \ "webdav"
32 / Yandex Disk
   \ "yandex"
33 / http Connection
   \ "http"
34 / premiumize.me
   \ "premiumizeme"
35 / seafile
   \ "seafile"
Storage> drive
** See help for drive backend at: https://rclone.org/drive/ **
```
## 1.4. Cliente y secreto de Google:
- Luego te preguntará por el Google Application Client Id donde en client_id y el Client Secret. Si no tienes uno configurado, simplemente presiona Enter para dejarlos en blanco (esto utiliza los valores predeterminados de rclone).
```shell
Google Application Client Id
Setting your own is recommended.
See https://rclone.org/drive/#making-your-own-client-id for how to create your own.
If you leave this blank, it will use an internal key which is low performance.
Enter a string value. Press Enter for the default ("").
client_id>[Enter]
OAuth Client Secret
Leave blank normally.
Enter a string value. Press Enter for the default ("").
client_secret>[Enter]
Scope that rclone should use when requesting access from drive.
Enter a string value. Press Enter for the default ("").
```
## 1.5. Selecciona el alcance del acceso (scope):
- A continuación, te pedirá que elijas el nivel de acceso que rclone tendrá a tu Google Drive. Para el acceso completo, elige 1 (recomendado si quieres poder leer/escribir y borrar archivos).
```shell
Choose a number from below, or type in your own value
 1 / Full access all files, excluding Application Data Folder.
   \ "drive"
 2 / Read-only access to file metadata and file contents.
   \ "drive.readonly"
   / Access to files created by rclone only.
 3 | These are visible in the drive website.
   | File authorization is revoked when the user deauthorizes the app.
   \ "drive.file"
   / Allows read and write access to the Application Data folder.
 4 | This is not visible in the drive website.
   \ "drive.appfolder"
   / Allows read-only access to file metadata but
 5 | does not allow any access to read or download file content.
   \ "drive.metadata.readonly"
scope> 1
```
## 1.6. Complete para acceder a las carpetas "Computadoras"
- (consulte los documentos) o para que rclone use una carpeta que no sea la raíz como punto de inicio.
- Ingrese un valor de cadena. Presione Enter para el valor predeterminado ("").
```shell
ID of the root folder
Leave blank normally.

Fill in to access "Computers" folders (see docs), or for rclone to use
a non root folder as its starting point.

Enter a string value. Press Enter for the default ("").
root_folder_id>[Enter]
```
## 1.7. Cuenta de servicio (opcional):
- Si no estás usando una cuenta de servicio de Google (lo más probable es que no la necesites), simplemente presiona Enter cuando te pregunte sobre el archivo JSON de la cuenta de servicio:
```shell
Service Account Credentials JSON file path
Leave blank normally.
Needed only if you want use SA instead of interactive login.

Leading `~` will be expanded in the file name as will environment variables such as `${RCLONE_CONFIG_DIR}`.

Enter a string value. Press Enter for the default ("").
service_account_file>[Enter]
```
## 1.8. Cuando te pregunte si quieres editar la configuración avanzada
- simplemente selecciona No escribiendo n y presiona Enter. La mayoría de los usuarios no necesitan tocar la configuración avanzada.
```shell
Edit advanced config? (y/n)
y) Yes
n) No (default)
y/n> n
```
## 1.9. Autenticación interactiva:
- Cuando te pregunte si deseas usar un navegador web para autenticarte, elige Yes (y):
```shell
Remote config
Use auto config?
 * Say Y if not sure
 * Say N if you are working on a remote or headless machine
y) Yes (default)
n) No
y/n> y
Got code
```
- Esto abrirá tu navegador y te pedirá que inicies sesión en tu cuenta de Google. Una vez hecho esto, te pedirá que autorices a rclone para acceder a tu Google Drive. Acepta los permisos.
- Autenticación completada: Después de iniciar sesión en Google, rclone recibirá un código de autenticación y completará la configuración.
```shell
If your browser doesn't open automatically go to the following link: http://127.0.0.1:53682/auth?state=T5dK-A8riPj4TNBtRahQAg
Log in and authorize rclone for access
Waiting for code...
```
## 1.10. Team Drive (opcional):
- Si no estás utilizando una "Team Drive" (un drive compartido de Google), selecciona No (n).
```shell
Configure this as a team drive?
y) Yes
n) No (default)
y/n> n
```
## 1.11. Mensaje de creacion
```shell
--------------------
[remote]
scope = drive
token = {"access_token":"ya29.a0AcM612xpbQ1U6jK_nran0ZkpV3Yuzwl3c0kWhay5xmRZyMr2KtAUreRE2zG7lae8wz1sKrsxXIp72PmizwOtsamg2TPYuNqPyHhMACDFOX9EO3M6k0ZvmTBcx_EZmy9n_zqAL5q8UpcWp48c6oG3xW-XOIBTsoKHkoWv7wNlaCgYKAQYSARISFQHGX2MiTjUDtyP3Vvg8CjPpEfbFIg0175","token_type":"Bearer","refresh_token":"1//0hyWaAJvbA4MhCgYIARAAGBESNwF-L9IrL5jWgBrPXJVAfCdS-Xv8rF9DGo0dVgYAHVVEyaUVh4XzLxuCtDdYLt7Ss-l6HPDddik","expiry":"2024-09-28T21:21:11.733809241-04:00"}
--------------------
```
## 1.12. Confirmar configuración:
- Finalmente, rclone te pedirá confirmar si todo está bien. Elige Yes (y):
```shell
y) Yes this is OK (default)
e) Edit this remote
d) Delete this remote
y/e/d> y
```
## 1.13. Salir de la configuración:
- Escoger la opción q:
```shell
Current remotes:

Name                 Type
====                 ====
remote               drive

e) Edit existing remote
n) New remote
d) Delete remote
r) Rename remote
c) Copy remote
s) Set configuration password
q) Quit config
e/n/d/r/c/s/q> q
```
## 1.14. Montar Google Drive
- Para montar tu Google Drive en Ubuntu como una carpeta, usa el siguiente comando:
```shell
mkdir ~/GoogleDrive
rclone mount remote: ~/GoogleDrive --vfs-cache-mode writes &
```
- Esto montará tu Google Drive en la carpeta ~/GoogleDrive.
```shell
[1] 2945937
```



---


<div style="page-break-before: always;"></div>


# 📄 1.28. Warp terminal IA

[<< INDICE](../README.md)
- [1. Instalar Warp](#1-instalar-warp)
- [2. Abrir Warp](#2-abrir-warp)
- [3. Hacerle un alias](#3-hacerle-un-alias)
- [4. Uso de Warp](#4-uso-de-warp)
- [5. Uso de Workflow](#5-uso-de-workflow)
- [6. Crear un nuevo workflow](#6-crear-un-nuevo-workflow)
- [7. Crea un proyecto](#7-crea-un-proyecto)

## 1. Instalar Warp
- Descargar Warp, desde la web oficial para linux
```bash
https://app.warp.dev/get_warp?package=appimage
```
- Dar permiso de ejecución
```bash
chmod +x Warp.AppImage
```
- Instalar FUSE2
```bash
sudo apt install libfuse2t64
```
- Ejecutarlo
```bash
./Warp-x86_64.AppImage
```
- (Opcional) Integrarlo al sistema
- Moverlo desde la carpeta de descargas
```bash
sudo mv Warp-x86_64.AppImage /opt/warp.AppImage
```
- Hazlo ejecutable
```bash
sudo chmod +x /opt/warp.AppImage
```
- Crear un launcher, acceso directo
```bash
sudo nano /usr/share/applications/warp.desktop
```
- Pegar el siguiente contenido
```bash
[Desktop Entry]
Name=Warp
Exec=/opt/warp.AppImage
Icon=utilities-terminal
Type=Application
Categories=Utility;TerminalEmulator;

```
- Guardar y cerrar
## 2. Abrir Warp
- En la terminal, abre Warp
```bash
/opt/warp.AppImage
```
- O puedes abrirlo desde el menu de Ubuntu
## 3. Hacerle un alias
- Abrir tu archivo de configuración de Zsh
```bash
nano ~/.zshrc
```
- Pegar el siguiente contenido
```bash
alias warp='/opt/warp.AppImage'
```
- Guardar y cerrar
- Reiniciar tu terminal
```bash
source ~/.zshrc
```
- Iniciar
```bash
warp
```

## 4. Uso de Warp
- Si es posible te pedira que te crees una cuenta o vincules con tu correo, para poder usarlo

![Terminal Warp](file:///5imagenes/warp/0.png)

- Uso de Warp

![Terminal Warp](file:///5imagenes/warp/1.png)

## 5. Uso de Workflow
- Uso de Workflow

![Terminal Warp](file:///5imagenes/warp/2.png)

- Papeleria de reciclaje

![Terminal Warp](file:///5imagenes/warp/3.png)

- Worckflow para encontrar en linea del mundo, con el comando
```bash
ctrl+shift+r
```

![Terminal Warp](file:///5imagenes/warp/4.png)

- Activar el modo ia, con el comando ctrl+i

![Terminal Warp](file:///5imagenes/warp/5.png)

- Escoger el modo ia, naturalmente esta en automatico

![Terminal Warp](file:///5imagenes/warp/6.png)

## 6. Crear un nuevo workflow
- Crear un nuevo workflow, donde se puede ejecutar una serie de comandos

![Terminal Warp](file:///5imagenes/warp/7.png)

- Usar el nuevo workflow recientemente creado, haciendo click o colocando su alias

![Terminal Warp](file:///5imagenes/warp/8.png)

- Ejecutar el workflow

![Terminal Warp](file:///5imagenes/warp/9.png)

## 7. Crea un proyecto
- Crea un nuevo proyecto ejemplo: En React

![Terminal Warp](file:///5imagenes/warp/10.png)

![Terminal Warp](file:///5imagenes/warp/11.png)


---


<div style="page-break-before: always;"></div>

## 2. ⚙️ Backend


### 2.1. NestJS


<div style="page-break-before: always;"></div>


# 📄 A.1. Variables de entorno

[<< INDICE](../../README.md)
- [1. Instalar localmente](#1-instalar-localmente)
- [2. crear el archivo .env](#2-crear-el-archivo-env)
- [3. Colocar las variables donde se necesite](#3-colocar-las-variables-donde-se-necesite)
  - [3.1. Donde esta la aplicación principal](#31-donde-esta-la-aplicación-principal)
  - [3.2. Donde esta la conexion base de datos](#32-donde-esta-la-conexion-base-de-datos)
- [4. Agregar al archivo gitignore](#4-agregar-al-archivo-gitignore)
- [5. Crear el archivo .env.sample](#5-crear-el-archivo-envsample)
- [6. Referencias](#6-referencias)
# 1. Instalar localmente
```console
npm i dotenv --save
```
# 2. crear el archivo .env
- En aqui estara información que no debe ser compartida en la nube
```ts
# Datos de despliegue
NODE_ENV=development
PORT=3000

# Configuración de la base de datos
DB_HOST=172.17.0.4
DB_USERNAME=postgres
DB_PASSWORD=postgres
DB_DATABASE=articulos_db
DB_PORT=5432
```
# 3. Colocar las variables donde se necesite
## 3.1. Donde esta la aplicación principal
- Importar las librerias y colocar en ves del puerto
```ts
/**otras librerias */
//importar librerias para variablesde entorno
import * as dotenv from 'dotenv';
dotenv.config();

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  app.enableCors();

  app.enableCors({
    origin: true,
    methods: 'GET,HEAD,PUT,PATCH,POST,DELETE,OPTIONS',
    credentials: true,
  });
  await app.listen(process.env.PORT);// por el puerto 3000
}
bootstrap();

```
## 3.2. Donde esta la conexion base de datos
- Importar las librerias y colocar en ves de ip, usuario, password, base de datos
```ts
import { Module } from '@nestjs/common';
/**otras librerias */
//importar librerias para variablesde entorno
import * as dotenv from 'dotenv';
dotenv.config();

@Module({
  imports: [
    ArticulosModule,
    TypeOrmModule.forRoot({
      type: 'postgres',
      host: process.env.DB_HOST,//172.17.0.2
      port: parseInt(process.env.DB_PORT),//5432 por ser number
      username: process.env.DB_USERNAME,//postgres
      password: process.env.DB_PASSWORD,//postgres
      database: process.env.DB_DATABASE,//articulos_db
      entities: [Articulo, Usuario, Perfile, Foto],
      synchronize: true,
    }),
    UsuariosModule,
    PerfilesModule,
    FotosModule,
  ],
})
export class AppModule {}
```
# 4. Agregar al archivo gitignore
- Para que no lo suba al repositorio, ontraseñas y otros
```ts
.env
```
# 5. Crear el archivo .env.sample
- Aqui estara un modelo de como seria el archivo .env
```ts
# Datos de despliegue
NODE_ENV=development
PORT=3000//puede estar

# Configuración de la base de datos
DB_HOST=172.17.0.4//cambia depende de la maquina
DB_USERNAME=postgres//mejor si se pone ejm
DB_PASSWORD=postgres//mejor si se pone ejm
DB_DATABASE=articulos_db//mejor si se pone ejm
DB_PORT=5432//puede estar
```
# 6. Referencias
- [Variable de entorno](https://www.npmjs.com/package/dotenv)

[<< INDICE](../../README.md)

---


<div style="page-break-before: always;"></div>


# 📄 B.1. Encriptación

[<< INDICE](../../README.md)
- [1. Crypto](#1-crypto)
- [2. Referencia](#2-referencia)

# 1. Crypto
- Instalar
```console
npm install crypto-js
```
- Llamar a las librerias en un archivo.ts
```ts
import CryptoJS from 'crypto-js'
const key = 'agetic' // La llabe puede ser cualquier valor
```
- Encriptar contrasena
```ts
const codificado = CryptoJS.AES.encrypt(contrasena, key).toString()
```
- Decriptar contraseña
```ts
const bytes = CryptoJS.AES.decrypt(contrasenaCodificada, key)
const decodificado = bytes.toString(CryptoJS.enc.Utf8)
```
# 2. Referencia
- Para mas detalles visitar [crypto-js](https://www.npmjs.com/package/crypto-js)

[<< INDICE](../../README.md)


---


<div style="page-break-before: always;"></div>


# 📄 C.1. Backup & Restore BD

- [1. Backups](#1-backups)
- [2. restaurar](#2-restaurar)

## 1. Backups
- Crear la carpeta backups, en el nivel superior y dentro crear el archivo create-backup.sh
```sh
#!/usr/bin/bash

set -e -o errtrace
trap "echo -e '\n\nERROR: Ocurrió un error mientras se ejecutaba el script :(\n\n'" ERR

arg1=${1:-pg14}
arg2=${2:-database_db}
arg3=${3:-database_db.gz}

arg4=${4:-localhost}
arg5=${5:-5432}
arg6=${6:-postgres}
arg7=${7:-postgres}

dockerContainer="${arg1}"

dbname="${arg2}"
dbhost="${arg4}"
dbport="${arg5}"
dbuser="${arg6}"
dbpass="${arg7}"
dbfile="${arg3}"

echo -e "\n >>> Creando SQL backup desde $dbname ($dbhost:$dbport) al archivo $dbfile.."

docker exec -it $dockerContainer pg_dump -h $dbhost -p $dbport -U $dbuser $dbname | gzip > $dbfile

echo -e "\n >>> ¡Backup creado con éxito! :)\n"

```
- Para hacer un backup de la base de datos
```console
sudo bash create-backup.sh conNestJs articulos_db database_db.gz
```
## 2. restaurar
- Crear el archivo restore-backup.sh, e la carpeta backups
```sh
#!/usr/bin/bash

set -e -o errtrace
trap "echo -e '\n\nERROR: Ocurrió un error mientras se ejecutaba el script :(\n\n'" ERR

arg1=${1:-pg14}
arg2=${2:-database_db}
arg3=${3:-database_db.gz}

arg4=${4:-localhost}
arg5=${5:-5432}
arg6=${6:-postgres}
arg7=${7:-postgres}

dockerContainer="${arg1}"

dbname="${arg2}"
dbhost="${arg4}"
dbport="${arg5}"
dbuser="${arg6}"
dbpass="${arg7}"

filename="${arg3/.gz/''}"
dbfile="$filename.gz"

# [INI] SQL
echo -e "\n\n >>> Restaurando SQL backup desde $dbfile a $dbname ($dbhost:$dbport)...\n"

docker restart $dockerContainer

echo -e "\nReiniciando el contenedor $dockerContainer...\n";
sleep 2;

docker exec $dockerContainer psql -h $dbhost -U postgres -c "DROP DATABASE IF EXISTS $dbname"
docker exec $dockerContainer psql -h $dbhost -U postgres -c "CREATE DATABASE $dbname ENCODING 'UTF-8'"

echo " - Copiando..."
docker cp "$dbfile" $dockerContainer:/
sleep 1;

echo " - Descomprimiendo..."
docker exec $dockerContainer gunzip -kf "$filename".gz
sleep 1;

echo " - Removiendo $filename.gz..."
docker exec $dockerContainer rm -rf "$filename".gz
sleep 1;

echo " - Restaurando..."
docker exec $dockerContainer psql -h $dbhost -U postgres -d "$dbname" -f "$filename"
sleep 1;

echo " - Removiendo $filename..."
docker exec $dockerContainer rm -rf "$filename"
sleep 1;

echo -e "\n - [éxito] $dbname ($dbhost)"
# [END] SQL

echo -e "\n\n >>> ¡Base de datos restaurada con éxito! :)\n"
```
- Para hacer una restauración de la base de datos
```console
sudo bash restore-backup.sh conNestJs database_db database_db.gz
```

---


<div style="page-break-before: always;"></div>


# 📄 D.1. Seeders

[<< INDICE](../../README.md)
## Realizado de seeders proyecto base AGETIC nestjs
- Ir a  a la ubicación database/seeds/
- Crear el archivo 1611498173796-openvox.ts (debe tener un nuemro de codigo diferente a los otros)
```ts
// Llama a la entidad
import { Openvox } from '../../src/application/openvox/entity/openvox.entity'
import { MigrationInterface, QueryRunner } from 'typeorm'

export class openvox1611498173796 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<void> {
    // En los atributos no se coloca (id, estado, transaccion, usuarioCreacion, fechaCreacion)
    const items = [
      {
        // id: '1',
        modelo: 'OPENVOXAPI',
        ip: '192.168.20.201',
        https: true,
        puerto: 443,
        usuario: 'yo123',
        contrasena: 'U2FsdGVkX18TFtLm4bzvjPoMRmbYt1U5EdXzsw+snPo=',
        puerto_asterisk: 5038,
        usuario_asterisk: 'admin',
        contrasena_asterisk: 'U2FsdGVkX18KjhheV1RQQHj0syHa7nabLODn42uc4ck='
      },
      {
        // id: '2',
        modelo: 'OPENVOXdemo',
        ip: 'demo.openvox.cn',
        https: false,
        puerto: 65321,
        usuario: 'tu123',
        contrasena: 'U2FsdGVkX18J0YxdFu7Ybwv/XDdrgheq9l5x3yjlKMg=',
        puerto_asterisk: 5439,
        usuario_asterisk: 'tu123ASK',
        contrasena_asterisk: 'U2FsdGVkX18J0YxdFu7Ybwv/XDdrgheq9l5x3yjlKMg='
      },
      {
        // id: '3',
        modelo: 'OPENVOXSIN',
        ip: '192.168.0.12',
        https:false,
        puerto:441,
        usuario:'ellos123',
        contrasena:'U2FsdGVkX1+T746X71Th6VZ52DfxWiDf0pqitL3rt/g=',
        puerto_asterisk:440,
        usuario_asterisk:'ellosASK123',
        contrasena_asterisk:'U2FsdGVkX1948aHUBbYHMkwCteZ4PdGdRX5t4g/pSbU='
      },
    ]
    const openvoxes = items.map((item) => {
      return new Openvox({
        // declarar los atributos mencionados arriba
        modelo: item.modelo,
        ip: item.ip,
        https: item.https,
        puerto: item.puerto,
        usuario: item.usuario,
        contrasena: item.contrasena,
        puertoAsterisk: item.puerto_asterisk,
        usuarioAsterisk: item.usuario_asterisk,
        contrasenaAsterisk: item.contrasena_asterisk,
        // declarar estos atributos por defecto(para todos es igual)
        estado: 'ACTIVO',
        transaccion: 'SEEDS',
        usuarioCreacion: '1',
        fechaCreacion: new Date(),
      })
    })
    await queryRunner.manager.save(openvoxes)
  }

  /* eslint-disable */
  public async down(queryRunner: QueryRunner): Promise<void> {}
}
```
```txt
El nombre de la clase (openvox1611498173796), debe ser similar al nombre del archivo(1611498173796-openvox.ts)
```
- Ejecutar npm run setup

[<< INDICE](../../README.md)

---


<div style="page-break-before: always;"></div>


# 📄 E.1. Crud SISPOA

[<< INDICE](../../README.md)

## Generar Crud
- Estando en el esquema parametricas
```console
npx ts-node src/common/scripts/feature.generator.ts TipoAreasUnidades parametricas
```
- Estando en el esquema estructura_organizacional
```console
npx ts-node src/common/scripts/feature.generator.ts Items estructura_organizacional
```
- Si aparece  null value in column id'' violates not-null constraint, es porque en el validation en el insert colocar
```ts
estados.est_codigo = 1;
objetivosEstrategicos2.oes_estado = estados;//por ser objeto
```
- Ó Colocar Por defecto value =1(en la base de datos)

[<< INDICE](../../README.md)


---


<div style="page-break-before: always;"></div>


# 📄 F.1. Entidades

[<< INDICE](../../README.md)
- [1. ENTIDAD](#1-entidad)
  - [1.1. DIMENSION](#11-dimension)
  - [1.2. OBJETIVOS ESTRATEGICOS2](#12-objetivos-estrategicos2)
  - [1.3. ESTADOS](#13-estados)

# 1. ENTIDAD
## 1.1. DIMENSION
- La entidad dimension
```ts
import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  OneToMany,
} from "typeorm";
import { Estados } from "./Estados";
import { ObjetivosEstrategicos2 } from "./ObjetivosEstrategicos2";

@Index("dimensiones_pkey", ["dim_codigo"], { unique: true })
@Entity("dimensiones", { schema: "pei" })
export class Dimensiones {
  @Column("integer", { primary: true, name: "dim_codigo" })
  dim_codigo: number;

  @Column("character varying", { name: "dim_numero" })
  dim_numero: string;

  @Column("character varying", { name: "dim_descripcion", nullable: true })
  dim_descripcion: string | null;

  @Column("integer", { name: "dim_gestion_inicio", nullable: true })
  dim_gestion_inicio: number | null;

  @Column("integer", { name: "dim_gestion_fin", nullable: true })
  dim_gestion_fin: number | null;

  @Column("integer", { name: "usuario_registro" })
  usuario_registro: number;

  @Column("integer", { name: "usuario_modificacion", default: () => "0" })
  usuario_modificacion: number;

  @Column("integer", { name: "usuario_baja", default: () => "0" })
  usuario_baja: number;

  @Column("timestamp without time zone", {
    name: "fecha_registro",
    default: () => "(now())::timestamp without time zone",
  })
  fecha_registro: Date;

  @Column("timestamp without time zone", {
    name: "fecha_modificacion",
    default: () => "'1900-01-01 00:00:00'",
  })
  fecha_modificacion: Date;

  @Column("timestamp without time zone", {
    name: "fecha_baja",
    default: () => "'1900-01-01 00:00:00'",
  })
  fecha_baja: Date;

  @ManyToOne(() => Estados, (estados) => estados.dimensiones)
  @JoinColumn([{ name: "dim_estado", referencedColumnName: "est_codigo" }])
  dim_estado: Estados;

  @OneToMany(
    () => ObjetivosEstrategicos2,
    (objetivos_estrategicos2) => objetivos_estrategicos2.dim_codigo
  )
  objetivos_estrategicos: ObjetivosEstrategicos2[];
}
```
## 1.2. OBJETIVOS ESTRATEGICOS2
- La entidad objetivos estrategicos2
```ts
import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  OneToMany,
} from "typeorm";
import { Estrategias } from "./Estrategias";
import { Dimensiones } from "./Dimensiones";
import { Estados } from "./Estados";

@Index("objetivos_estrategicos2_pkey", ["oes_codigo"], { unique: true })
@Entity("objetivos_estrategicos2", { schema: "pei" })
export class ObjetivosEstrategicos2 {
  @Column("integer", { primary: true, name: "oes_codigo" })
  oes_codigo: number;

  @Column("character varying", { name: "oes_numero" })
  oes_numero: string;

  @Column("character varying", { name: "oes_descripcion", nullable: true })
  oes_descripcion: string | null;

  @Column("numeric", { name: "oes_porcentaje", nullable: true })
  oes_porcentaje: string | null;

  @Column("integer", { name: "usuario_registro" })
  usuario_registro: number;

  @Column("integer", { name: "usuario_modificacion", default: () => "0" })
  usuario_modificacion: number;

  @Column("integer", { name: "usuario_baja", default: () => "0" })
  usuario_baja: number;

  @Column("timestamp without time zone", {
    name: "fecha_registro",
    default: () => "(now())::timestamp without time zone",
  })
  fecha_registro: Date;

  @Column("timestamp without time zone", {
    name: "fecha_modificacion",
    default: () => "'1900-01-01 00:00:00'",
  })
  fecha_modificacion: Date;

  @Column("timestamp without time zone", {
    name: "fecha_baja",
    default: () => "'1900-01-01 00:00:00'",
  })
  fecha_baja: Date;

  @OneToMany(() => Estrategias, (estrategias) => estrategias.oes_codigo)
  estrategias: Estrategias[];

  @ManyToOne(
    () => Dimensiones,
    (dimensiones) => dimensiones.objetivos_estrategicos
  )
  @JoinColumn([{ name: "dim_codigo", referencedColumnName: "dim_codigo" }])
  dim_codigo: Dimensiones;

  @ManyToOne(() => Estados, (estados) => estados.objetivos_estrategicos2)
  @JoinColumn([{ name: "oes_estado", referencedColumnName: "est_codigo" }])
  oes_estado: Estados;
}
```
## 1.3. ESTADOS
- Entidad Estados
```ts
import { Column, Entity, Index, OneToMany } from "typeorm";
import { Dimensiones } from "./Dimensiones";
import { ObjetivosEstrategicos2 } from "./ObjetivosEstrategicos2";

@Index("estados_pkey", ["est_codigo"], { unique: true })
@Entity("estados", { schema: "parametricas" })
export class Estados {
  @Column("integer", { primary: true, name: "est_codigo", default: () => "1" })
  est_codigo: number;

  @Column("character varying", { name: "est_nombre" })
  est_nombre: string;

  @Column("character varying", { name: "est_descripcion", nullable: true })
  est_descripcion: string | null;

  @Column("integer", { name: "usuario_registro" })
  usuario_registro: number;

  @Column("integer", { name: "usuario_modificacion", default: () => "0" })
  usuario_modificacion: number;

  @Column("integer", { name: "usuario_baja", default: () => "0" })
  usuario_baja: number;

  @Column("timestamp without time zone", {
    name: "fecha_registro",
    default: () => "(now())::timestamp without time zone",
  })
  fecha_registro: Date;

  @Column("timestamp without time zone", {
    name: "fecha_modificacion",
    default: () => "'1900-01-01 00:00:00'",
  })
  fecha_modificacion: Date;

  @Column("timestamp without time zone", {
    name: "fecha_baja",
    default: () => "'1900-01-01 00:00:00'",
  })
  fecha_baja: Date;

  @Column("character varying", { name: "est_color", nullable: true })
  est_color: string | null;

  @OneToMany(() => Dimensiones, (dimensiones) => dimensiones.dim_estado)
  dimensiones: Dimensiones[];

  @OneToMany(
    () => ObjetivosEstrategicos2,
    (objetivos_estrategicos2) => objetivos_estrategicos2.oes_estado
  )
  objetivos_estrategicos2: ObjetivosEstrategicos2[];

}
```

[<< INDICE](../../README.md)

---


<div style="page-break-before: always;"></div>


# 📄 G.1. Decoradores

[<< INDICE](../../README.md)
## Instalar
```console
npm i -D --save class-validator class-transformer
```
## Decoradores de validación

| Decorador                                             | Descripción                                                                                                                                                                                          |
| ------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Decoradores de validación comunes**                       |                                                                                                                                                                                                       |
| `@IsDefined(value: any)`                               | Comprueba si el valor está definido (!== undefined, !== null). Este es el único decorador que ignora la opción skipMissingProperties.                                                               |
| `@IsOptional()`                                        | Comprueba si el valor dado está vacío (=== null, === undefined) y si es así, ignora todos los validadores de la propiedad.                                                          |
| `@Equals(comparison: any)`                             | Comprueba si el valor es igual ("===") comparison.                                                                                                                                                            |
| `@NotEquals(comparison: any)`                          | Comprueba si el valor no es igual ("!==") comparison.                                                                                                                                                         |
| `@IsEmpty()`                                           | Comprueba si el valor dado está vacío (=== '', === null, === undefined).                                                                                                                                     |
| `@IsNotEmpty()`                                        | Comprueba si el valor dado no está vacío (!== '', !== null, !== undefined).                                                                                                                                 |
| `@IsIn(values: any[])`                                 | Comprueba si el valor está en una matriz de valores permitidos.                                                                                                                                                     |
| `@IsNotIn(values: any[])`                              | Comprueba si el valor no está en una matriz de valores no permitidos.                                                                                         |
| **Decoradores de validación de tipos**                         |                                                                                                                                                                                                       |
| `@IsBoolean()`                                         | Comprueba si un valor es un boolean.                                                                                                                                                                       |
| `@IsDate()`                                            | Comprueba si el valor es un date.                                                                                                                                                                        |
| `@IsString()`                                          | Comprueba si el valor es un string.                                                                                                                                                                      |
| `@IsNumber(options: IsNumberOptions)`                  | Comprueba si el valor es un number.                                                                                                                                                                      |
| `@IsInt()`                                             | Comprueba si el valor es un número entero.                                                                                                       |
| `@IsArray()`                                           | Comprueba si el valor es un array                                                                                                                                                                       |
| `@IsEnum(entity: object)`                              | Comprueba si el valor es una enumeración válida                                                                                                    |
| **Decoradores de validación de números**                       |
| `@IsDivisibleBy(num: number)`                          | Comprueba si el valor es un número divisible por otro.                                                                                                                                       |
| `@IsPositive()`                                        | Comprueba si el valor es un número positivo mayor que cero.                                                                                    |
| `@IsNegative()`                                        | Comprueba si el valor es un número negativo menor que cero.                                                                                     |
| `@Min(min: number)`                                    | Comprueba si el número dado es mayor o igual que el número dado.                                                                             |
| `@Max(max: number)`                                    | Comprueba si el número dado es menor o igual que el número dado.                                                                                |
| **Decoradores de validación de fecha**                         |
| `@MinDate(date: Date \| (() => Date))`                 | Comprueba si el valor es una fecha posterior a la fecha especificada.                                                                                                                                        |
| `@MaxDate(date: Date \| (() => Date))`                 | Comprueba si el valor es una fecha anterior a la fecha especificada.                                                                               |
| **Decoradores de validación de tipo cadena**                  |                                                                                                                                                                                                       |
| `@IsBooleanString()`                                   | Comprueba si una cadena es un booleano (p.ej. es "verdadero" o "falso" o "1", "0").                                 |
| `@IsDateString()`                                      | Alias for `@IsISO8601()`.                                                                                                                                                                             |
| `@IsNumberString(options?: IsNumericOptions)`          | Comprueba si una cadena es un número.                                                                                                                  |
| **String validation decorators**                       |                                                                                                                                                                                                       |
| `@Contains(seed: string)`                              | Comprueba si la cadena contiene la semilla.                                                                                                      |
| `@NotContains(seed: string)`                           | Comprueba si la cadena no contiene la semilla.                                                                                                   |
| `@IsAlpha()`                                           | Comprueba si la cadena contiene solo letras (a-zA-Z).                                                                                               |
| `@IsAlphanumeric()`                                    | Comprueba si la cadena contiene solo letras y números.                                                                                          |
| `@IsDecimal(options?: IsDecimalOptions)`               | Comprueba si la cadena es un valor decimal válido. Las opciones predeterminadas de IsDecimal son `force_decimal=False`, `decimal_digits: '1,'`, `locale: 'en-US'`                                                          |
| `@IsAscii()`                                           | Comprueba si la cadena contiene solo caracteres ASCII.                                                                                                |
| `@IsBase32()`                                          | Comprueba si una cadena está codificada en base32.                                                                                                        |
| `@IsBase58()`                                          | Comprueba si una cadena está codificada en base58.                                                                                                           |
| `@IsBase64(options?: IsBase64Options)`                 | Comprueba si una cadena está codificada en base64.                                                                                                         |
| `@IsIBAN()`                                            | Comprueba si una cadena es un IBAN (Número de cuenta bancaria internacional).                                                                                 |
| `@IsBIC()`                                             | Comprueba si una cadena es un BIC (código de identificación bancaria) o un código SWIFT.                                                                          |
| `@IsByteLength(min: number, max?: number)`             | Comprueba si la longitud de la cadena (en bytes) se encuentra dentro de un rango.                                                                                      |
| `@IsCreditCard()`                                      | Comprueba si la cadena es una tarjeta de crédito.                                                                                                      |
| `@IsCurrency(options?: IsCurrencyOptions)`             | Comprueba si la cadena es una cantidad de moneda válida.                                                                                               |
| `@IsISO4217CurrencyCode()`                             | Comprueba si la cadena es un código de moneda ISO 4217.                                                                                             |
| `@IsEthereumAddress()`                                 | Comprueba si la cadena es una dirección de Ethereum usando expresiones regulares básicas. No valida sumas de verificación de direcciones.                                                                 |
| `@IsBtcAddress()`                                      | Comprueba si la cadena es una dirección BTC válida.                                                                                                      |
| `@IsDataURI()`                                         | Comprueba si la cadena tiene un formato uri de datos.                                                                                                    |
| `@IsEmail(options?: IsEmailOptions)`                   | Comprueba si la cadena es un correo electrónico.                                                                                                               |
| `@IsFQDN(options?: IsFQDNOptions)`                     | Comprueba si la cadena es un nombre de dominio completo (por ejemplo, dominio.com).                                                                       |
| `@IsFullWidth()`                                       | Comprueba si la cadena contiene caracteres de ancho completo.                                                                                             |
| `@IsHalfWidth()`                                       | Comprueba si la cadena contiene caracteres de ancho medio.                                                                                             |
| `@IsVariableWidth()`                                   | Comprueba si la cadena contiene una combinación de caracteres de ancho completo y medio.                                                                         |
| `@IsHexColor()`                                        | Comprueba si la cadena es un color hexadecimal.                                                                                                    |
| `@IsHSL()`                                             | Comprueba si la cadena es un color HSL basado en [CSS Colors Level 4 specification](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value).                                                       |
| `@IsRgbColor(options?: IsRgbOptions)`                  | Comprueba si la cadena es de color rgb o rgba.                                                                                                    |
| `@IsIdentityCard(locale?: string)`                     | Comprueba si la cadena es un código de documento de identidad válido.                                                                                           |
| `@IsPassportNumber(countryCode?: string)`              | Comprueba si la cadena es un número de pasaporte válido relativo a un código de país específico.                                                                   |
| `@IsPostalCode(locale?: string)`                       | Comprueba si la cadena es un código postal.                                                                                                       |
| `@IsHexadecimal()`                                     | Comprueba si la cadena es un número hexadecimal.                                                                                                    |
| `@IsOctal()`                                           | Comprueba si la cadena es un número octal.                                                                                                         |
| `@IsMACAddress(options?: IsMACAddressOptions)`         | Comprueba si la cadena es una dirección MAC.                                                                                                            |
| `@IsIP(version?: "4"\|"6")`                            | Comprueba si la cadena es una IP (versión 4 o 6).                                                                                        |
| `@IsPort()`                                            | Comprueba si la cadena es un número de puerto válido.                                                                                                  |
| `@IsISBN(version?: "10"\|"13")`                        | Comprueba si la cadena es un ISBN (versión 10 o 13).                                                                                          |
| `@IsEAN()`                                             | Comprueba si la cadena es un EAN (número de artículo europeo).                                                                     |
| `@IsISIN()`                                            | Comprueba si la cadena es un ISIN (identificador de acciones/valores).                                                                                        |
| `@IsISO8601(options?: IsISO8601Options)`               | Comprueba si la cadena tiene un formato de fecha ISO 8601 válido. Usa la opción strict = true para cheques adicionales para una fecha válida.                                   |
| `@IsJSON()`                                            | Comprueba si la cadena es JSON válida.                                                                                                           |
| `@IsJWT()`                                             | Comprueba si la cadena es JWT válida.                                                                                                           |
| `@IsObject()`                                          | Comprueba si el objeto es válido Objeto (null, functions, arrays devolveran false).                                                                                                                     |
| `@IsNotEmptyObject()`                                  | Comprueba si el objeto no está vacío.                                                                                                             |
| `@IsLowercase()`                                       | Comprueba si la cadena está en minúsculas.                                                                                                                 |
| `@IsLatLong()`                                         | Comprueba si la cadena es una coordenada de latitud-longitud válida en el formato lat, long.                                                                    |
| `@IsLatitude()`                                        | Comprueba si la cadena o el número es una coordenada de latitud válida.                                                                                     |
| `@IsLongitude()`                                       | Comprueba si la cadena o el número es una coordenada de longitud válida.                                                                                      |
| `@IsMobilePhone(locale: string)`                       | Comprueba si la cadena es un número de teléfono móvil.                                                                                                  |
| `@IsISO31661Alpha2()`                                  | Comprueba si la cadena es un código de país asignado oficialmente ISO 3166-1 alfa-2 válido.                                                                |
| `@IsISO31661Alpha3()`                                  | Comprueba si la cadena es un código de país asignado oficialmente ISO 3166-1 alfa-3 válido.                                                                   |
| `@IsLocale()`                                          | Comprueba si la cadena es una configuración regional.                                                                                                              |
| `@IsPhoneNumber(region: string)`                       | Comprueba si la cadena es un número de teléfono válido usando libphonenumber-js.                                                                                       |
| `@IsMongoId()`                                         | Comprueba si la cadena es una representación codificada hexadecimal válida de un ObjectId de MongoDB.                                                                   |
| `@IsMultibyte()`                                       | Comprueba si la cadena contiene uno o más caracteres multibyte.                                                                                      |
| `@IsNumberString(options?: IsNumericOptions)`          | Comprueba si la cadena es numérica.                                                                                                                  |
| `@IsSurrogatePair()`                                   | Comprueba si la cadena contiene algún par de caracteres sustitutos.                                                                                        |
| `@IsTaxId()`                                           | Comprueba si la cadena es un número de identificación fiscal válido. La configuración regional predeterminada es `en-US`.                                                                                                                                    |
| `@IsUrl(options?: IsURLOptions)`                       | Comprueba si la cadena es una URL.                                                                                                                |
| `@IsMagnetURI()`                                       | Comprueba si la cadena es un [magnet uri format](https://en.wikipedia.org/wiki/Magnet_URI_scheme).                                                                                                       |
| `@IsUUID(version?: UUIDVersion)`                       | Comprueba si la cadena es un UUID (versión 3, 4, 5 o todas).                                                                                      |
| `@IsFirebasePushId()`                                  | Comprueba si la cadena es un [Firebase Push ID](https://firebase.googleblog.com/2015/02/the-2120-ways-to-ensure-unique_68.html)                                                                          |
| `@IsUppercase()`                                       | Comprueba si la cadena está en mayúsculas.                                                                                                             |
| `@Length(min: number, max?: number)`                   | Comprueba si la longitud de la cadena cae dentro de un rango.                                                                                              |
| `@MinLength(min: number)`                              | Comprueba si la longitud de la cadena no es menor que el número dado.                                                                                     |
| `@MaxLength(max: number)`                              | Comprueba si la longitud de la cadena no es mayor que el número dado.                                                                                     |
| `@Matches(pattern: RegExp, modifiers?: string)`        | Comprueba si la cadena coincide con el patrón. O bien coincide('foo', /foo/i) o coincide('foo', 'foo', 'i').                                                                   |
| `@IsMilitaryTime()`                                    | Comprueba si la cadena es una representación válida de la hora militar en formato HH:MM.                                                                   |
| `@IsTimeZone()`                                        | Comprueba si la cadena representa una zona horaria IANA válida.                                                                                             |
| `@IsHash(algorithm: string)`                           | Comprueba si la cadena es un hash Se admiten los siguientes tipos:`md4`, `md5`, `sha1`, `sha256`, `sha384`, `sha512`, `ripemd128`, `ripemd160`, `tiger128`, `tiger160`, `tiger192`, `crc32`, `crc32b`. |
| `@IsMimeType()`                                        | Comprueba si la cadena coincide con una válida [MIME type](https://en.wikipedia.org/wiki/Media_type) formato                                                                                                  |
| `@IsSemVer()`                                          | Comprueba si la cadena es una especificación de control de versiones semánticas (SemVer).                                                                             |
| `@IsISSN(options?: IsISSNOptions)`                     | Comprueba si la cadena es un ISSN.                                                                                                              |
| `@IsISRC()`                                            | Comprueba si la cadena es un [ISRC](https://en.wikipedia.org/wiki/International_Standard_Recording_Code).                                                                                                |
| `@IsRFC3339()`                                         | Comprueba si la cadena es válida [RFC 3339](https://tools.ietf.org/html/rfc3339) fecha.                                                                                                                 |
| `@IsStrongPassword(options?: IsStrongPasswordOptions)` | Comprueba si la cadena es una contraseña segura.                                                                         |
| **Decoradores de validación de Array**                        |                                                                                                                                                                                                       |
| `@ArrayContains(values: any[])`                        | Comprueba si el array contiene todos los valores del array de valores dada.                                                                               |
| `@ArrayNotContains(values: any[])`                     | comprueba si el array no contiene ninguno de los valores dados.                                                                  |
| `@ArrayNotEmpty()`                                     | Comprueba si el array no está vacío.                                                                                  |
| `@ArrayMinSize(min: number)`                           | Comprueba si la longitud del array es mayor o igual que el número especificado.                                                                   |
| `@ArrayMaxSize(max: number)`                           | Ccomprueba si la longitud del array es menor o igual al número especificado.                                                                           |
| `@ArrayUnique(identifier?: (o) => any)`                | Comprueba si todos los valores del array son únicos. La comparación de objetos se basa en referencias. La función opcional se puede especificar qué valor de retorno se utilizará para la comparación.                         |
| **Decoradores de validación de objetos**                       |
| `@IsInstance(value: any)`                              | Comprueba si la propiedad es una instancia del valor pasado.                                                                           |
| **Otros decoradores**                                   |                                                                                                                                                                                                       |
| `@Allow()`                                             | Evita eliminar la propiedad cuando no se especifica ninguna otra restricción.                                                                 |

[<< INDICE](../../README.md)

---


<div style="page-break-before: always;"></div>


# 📄 H.1. Consultas SQL

[<< INDICE](../../README.md)
- [1. Metodo para obtener la lista por aun\_codigo\_supervisor](#1-metodo-para-obtener-la-lista-por-aun_codigo_supervisor)
  - [1.1. Dbeaver ejm1](#11-dbeaver-ejm1)
  - [1.2. Backend ejm1](#12-backend-ejm1)
- [2. Validar que los items no se repitan al momento de editar](#2-validar-que-los-items-no-se-repitan-al-momento-de-editar)
  - [2.1. Dbeaver ejm2](#21-dbeaver-ejm2)
  - [2.2. Backend ejm2](#22-backend-ejm2)
- [3. Consultas](#3-consultas)
  - [3.1. OBTENER CARGOS ITE solo de 1 y 2](#31-obtener-cargos-ite-solo-de-1-y-2)
  - [3.2. OBTENER LOS CARGOS ITEMS DE ESOS CODIGOS](#32-obtener-los-cargos-items-de-esos-codigos)
  - [3.3. OBTENER NIVELES AREAS UNIDADES](#33-obtener-niveles-areas-unidades)
  - [3.4. OBTENER AREAS UNIDADES CON SU RESPECTIVA DIRECTIVA usando WHERE(mas pesado menos recomendado)](#34-obtener-areas-unidades-con-su-respectiva-directiva-usando-wheremas-pesado-menos-recomendado)
  - [3.5. OBTENER AREAS UNIDADES CON SU RESPECTIVA DIRECTIVA usando LEFT JOIN](#35-obtener-areas-unidades-con-su-respectiva-directiva-usando-left-join)

# 1. Metodo para obtener la lista por aun_codigo_supervisor
## 1.1. Dbeaver ejm1
- En DBEAVER el codigo del metodo findAll(), es equivalente hacer:
```sql
SELECT 
	t.afu_codigo, 
	t.aun_codigo_supervisado, 
	t.aun_codigo_supervisor, 
	t.afu_descripcion, 
	t.afu_estado, 
	e.est_color, 
	e.est_nombre AS afu_estado_descripcion 
FROM estructura_organizacional.autoridades_funcionales t
LEFT JOIN parametricas.estados e ON e.est_codigo = t.afu_estado
WHERE t.aun_codigo_supervisado=64 ;
```

|afu_codigo|aun_codigo_supervisado|aun_codigo_supervisor|afu_descripcion|afu_estado|est_color|afu_estado_descripcion|
|----------|----------------------|---------------------|---------------|----------|---------|----------------------|
|222|64|60|desc 1|1|#54bebe|EDICIÓN|
|221|64|61|desc 2|1|#54bebe|EDICIÓN|

- Otra manera mas pesada(se obtiene la misma tabla)
```sql
SELECT 
	t.afu_codigo, 
	t.aun_codigo_supervisado, 
	t.aun_codigo_supervisor, 
	t.afu_descripcion, 
	t.afu_estado, 
	e.est_color, 
	e.est_nombre AS afu_estado_descripcion 
FROM estructura_organizacional.autoridades_funcionales t,parametricas.estados e
WHERE e.est_codigo = t.afu_estado and t.aun_codigo_supervisado=64 ;
```

|afu_codigo|aun_codigo_supervisado|aun_codigo_supervisor|afu_descripcion|afu_estado|est_color|afu_estado_descripcion|
|----------|----------------------|---------------------|---------------|----------|---------|----------------------|
|222|64|60|desc 1|1|#54bebe|EDICIÓN|
|221|64|61|desc 2|1|#54bebe|EDICIÓN|
## 1.2. Backend ejm1
- El método
```ts
  @LoggerMethod
  async findAll(query: GetAllAutoridadesFuncionalesDto, manager: EntityManager) {
    //query esta el dto entrante, ahi esta el aun_codigo_supervisor
    try {
      let sql = `
      SELECT 
        t.afu_codigo, 
        t.aun_codigo_supervisado, 
        t.aun_codigo_supervisor, 
        t.afu_descripcion, 
        t.afu_estado, 
        e.est_color, 
        e.est_nombre AS afu_estado_descripcion 
      FROM estructura_organizacional.autoridades_funcionales t
      LEFT JOIN parametricas.estados e ON e.est_codigo = t.afu_estado//Autoridades funcionales aqui hace un leftjoin con estados
      WHERE TRUE
      ${query.aun_codigo_supervisor ? `AND t.aun_codigo_supervisor IN ${query.aun_codigo_supervisor}` : ''}//aquí
      ${query.afu_estado ? `AND t.afu_estado IN ${query.afu_estado}` : ''};`;

      const resultQuery = await manager.query(sql);
      return CustomService.verifyingDataResult(resultQuery, this.message_custom);
    } catch (error) {
      throwError(400, error.message);
    }
  }
```
- Url que envia el get por aun_codigo_supervisado=64
```txt
http://localhost:7000/autoridades-funcionales?aun_codigo_supervisado=(64)
```
- La respuesta que se obtiene en el backend
```json
{
  "codigo": 0,
  "error_existente": 0,
  "error_mensaje": "SE OBTUVIERON DATOS DE FORMA CORRECTA.",
  "error_codigo": 2001,
  "trace_id": "c028fb39-7f08-42e0-bc2d-4bc1a8a1f525",
  "datos": [
    {
      "afu_codigo": 221,
      "aun_codigo_supervisado": 64,
      "aun_codigo_supervisor": 61,
      "afu_descripcion": "El area/unidad: GDEP - GERENCIA DEPORTIVA, esta supervisado funcionalmente por: GNRH - GERENCIA NACIONAL DE RECURSOS HUMANOS",
      "aun_sigla": "GNRH",
      "afu_estado": 1,
      "est_color": "#54bebe",
      "afu_estado_descripcion": "EDICIÓN"
    },
    {
      "afu_codigo": 222,
      "aun_codigo_supervisado": 64,
      "aun_codigo_supervisor": 60,
      "afu_descripcion": "El area/unidad: GDEP - GERENCIA DEPORTIVA, esta supervisado funcionalmente por: DC - DESPACHO DEL CONTROLADOR",
      "aun_sigla": "DC",
      "afu_estado": 1,
      "est_color": "#54bebe",
      "afu_estado_descripcion": "EDICIÓN"
    }
  ]
}
```
# 2. Validar que los items no se repitan al momento de editar
## 2.1. Dbeaver ejm2
- Encontrar las areas unidades, pertenecientes a ese organigrama
```sql
select * 
from estructura_organizacional.areas_unidades au 
where au.org_codigo = 42;
```
|aun_codigo|aun_nombre|aun_sigla|nau_codigo|aau_codigo|cau_codigo|aun_estado|usuario_registro|usuario_modificacion|usuario_baja|fecha_registro|fecha_modificacion|fecha_baja|org_codigo|aun_numero|
|----------|----------|---------|----------|----------|----------|----------|----------------|--------------------|------------|--------------|------------------|----------|----------|----------|
|181|PRINCIPAL|P1|1|1|2|1|1791|1791|0|2023-04-21 17:51:56.806|2023-04-23 16:51:33.162|1900-01-01 00:00:00.000|42|345|
|182|PRINCIPAL2|P2|2|2|1|1|1791|1791|0|2023-04-21 17:53:26.227|2023-04-23 16:51:49.441|1900-01-01 00:00:00.000|42|1234|
- Obtener todos los cargos-item, que estan en esas 2 areas unidades, que estan dentro de un organigrama(el item no debe repetirse)
```sql
select * 
from estructura_organizacional.cargos_items ci 
where ci.aun_codigo IN (181,182);
```
|cit_codigo|cit_descripcion|car_codigo|ite_codigo|cit_estado|usuario_registro|usuario_modificacion|usuario_baja|fecha_registro|fecha_modificacion|fecha_baja|aun_codigo|
|----------|---------------|----------|----------|----------|----------------|--------------------|------------|--------------|------------------|----------|----------|
|186|desc 3|68|134|1|1791|0|0|2023-04-24 09:20:08.205|1900-01-01 00:00:00.000|1900-01-01 00:00:00.000|181|
|188|desc 4|68|136|1|1791|0|0|2023-04-24 09:37:29.877|1900-01-01 00:00:00.000|1900-01-01 00:00:00.000|181|
- Para modificar el item en el cargo-item, el ite_codigo debe estar presente solamente una vez en la tabla anterior, para ello buscar en la anterior consulta y con todos los estados
```sql
select * 
from estructura_organizacional.cargos_items ci 
where ci.ite_codigo IN (134) AND ci.aun_codigo IN (181,182) and ci.cit_estado in (1,2,3,4,5);
``` 
|cit_codigo|cit_descripcion|car_codigo|ite_codigo|cit_estado|usuario_registro|usuario_modificacion|usuario_baja|fecha_registro|fecha_modificacion|fecha_baja|aun_codigo|
|----------|---------------|----------|----------|----------|----------------|--------------------|------------|--------------|------------------|----------|----------|
|186|desc 5|68|134|1|1791|0|0|2023-04-24 09:20:08.205|1900-01-01 00:00:00.000|1900-01-01 00:00:00.000|181|
## 2.2. Backend ejm2
- Metodo que verifica que el item, no se repita al modificarse, al momento de actualizarse
```ts
  @LoggerMethod
  async update(updateCargosItemsDto: UpdateCargosItemsDto, manager: EntityManager) {
    try {
      const cargosItems: CargosItems = await this.validations(Operation.UPDATE, manager, updateCargosItemsDto);

      const resultQuery = await manager.update(CargosItems, cargosItems.cit_codigo, cargosItems);
      //buscar areas con ese organigrama
      let resultCargosItem = []
      try {
        const getAllAreasUnidadesDto = new GetAllAreasUnidadesDto//obt todos
        getAllAreasUnidadesDto.org_codigo = `(${this.orgCodigo})`// Debe existir este org_codigo=42 se trae de otro lado
        const resultAreas = await this.areasUnidadesService.findAll(getAllAreasUnidadesDto, manager)//obtiene todas las areas unidades en ese organigrama
        const getAllCargosItemsDtoU = new GetAllCargosItemsDto()
        getAllCargosItemsDtoU.aun_codigo = `(${resultAreas.map(m => m.aun_codigo)})`;asigna a aun_codigo con [181,182]
        getAllCargosItemsDtoU.ite_codigo = `(${updateCargosItemsDto.ite_codigo})`//busca tb por ite_codigo=135
        getAllCargosItemsDtoU.cit_estado = `(1,2,3,4,5)`;//busca tb con todos los estados
        resultCargosItem = await this.findAll(getAllCargosItemsDtoU, manager)
      } catch (error) { }
      //encuentra 1 con el cit_codigo=186
      if (resultCargosItem.length>1) throwError(400, 'NO SE PUEDE MODIFICAR PORQUE EL ITEM ESTA REPITIENDOSE EN EL ORGANIGRAMA ');
      return CustomService.verifyingDataResult(resultQuery, this.message_custom);
    } catch (error) {
      this.logger.debug(error);
      throwError(400, error.message);
    }
  }
```
- Url que envia el put para modificar el item
```txt
http://localhost:7000/cargos-items
```
- Con el body
```json
{
  "aun_codigo": 186,
  "car_codigo": 68,
  "cit_codigo": 201,
  "ite_codigo": 135
}
```
- La respuesta que se obtiene en el backend
```json
{
  "codigo": 0,
  "error_existente": 1,
  "error_mensaje": "NO SE PUEDE MODIFICAR PORQUE ESE ITEM YA ESTA REPITIENDOSE EN EL ORGANIGRAMA ",
  "error_codigo": 4001,
  "datos": [],
  "trace_id": "7813cb25-1c54-4997-9d92-4cfa6b4bb1e1"
}
```
- Como existe el item, no lo modifica

|cit_codigo|cit_descripcion|car_codigo|ite_codigo|cit_estado|usuario_registro|usuario_modificacion|usuario_baja|fecha_registro|fecha_modificacion|fecha_baja|aun_codigo|
|----------|---------------|----------|----------|----------|----------------|--------------------|------------|--------------|------------------|----------|----------|
|186|desc 6|68|134|1|1791|0|0|2023-04-24 09:20:08.205|1900-01-01 00:00:00.000|1900-01-01 00:00:00.000|181|
# 3. Consultas
## 3.1. OBTENER CARGOS ITE solo de 1 y 2
```sql
select 
ci.cit_codigo,
cid.cid_codigo
from estructura_organizacional.cargos_items ci  
left join estructura_organizacional.cargos_item_dependencias cid on cid.cit_codigo_hijo =ci.cit_codigo 
where cit_codigo in (1,2);
```
## 3.2. OBTENER LOS CARGOS ITEMS DE ESOS CODIGOS
```sql
select *
from estructura_organizacional.cargos_items ci 
where ci.cit_codigo in (48,49)
```
|cit_codigo|cit_descripcion|car_codigo|ite_codigo|cit_estado|usuario_registro|usuario_modificacion|usuario_baja|fecha_registro|fecha_modificacion|fecha_baja|aun_codigo|
|----------|---------------|----------|----------|----------|----------------|--------------------|------------|--------------|------------------|----------|----------|
|48|desc 7|57|47|1|1791|1791|0|2023-04-05 11:10:06.509|2023-04-05 11:18:34.266|1900-01-01 00:00:00.000|61|
|49|desc 8|58|48|1|1791|1791|0|2023-04-05 11:12:33.909|2023-04-05 11:22:05.908|1900-01-01 00:00:00.000|60|
## 3.3. OBTENER NIVELES AREAS UNIDADES
```sql
select *
from parametricas.niveles_areas_unidades nau
order by nau.nau_codigo 
asc;
```
|nau_codigo|nau_nombre|nau_descripcion|nau_estado|usuario_registro|usuario_modificacion|usuario_baja|fecha_registro|fecha_modificacion|fecha_baja|nau_nivel|
|----------|----------|---------------|----------|----------------|--------------------|------------|--------------|------------------|----------|---------|
|1|DIRECTIVO|Definición para áreas Directivas|1|0|0|0|2023-03-16 16:13:33.930|1900-01-01 00:00:00.000|1900-01-01 00:00:00.000|1|
|2|EJECUTIVO|Definición para Áreas/Unidades Ejecutivas|1|0|0|0|2023-03-16 16:13:33.930|1900-01-01 00:00:00.000|1900-01-01 00:00:00.000|2|
|3|OPERATIVO|Definición para Áreas/Unidades Operativas|1|0|0|0|2023-03-16 16:13:33.930|1900-01-01 00:00:00.000|1900-01-01 00:00:00.000|3|
## 3.4. OBTENER AREAS UNIDADES CON SU RESPECTIVA DIRECTIVA usando WHERE(mas pesado menos recomendado)
```sql
select 
au.aun_codigo,
au.aun_nombre,
au.nau_codigo,
nau.nau_nombre
from estructura_organizacional.areas_unidades au, parametricas.niveles_areas_unidades nau  
where au.nau_codigo =nau.nau_codigo
order by au.aun_codigo;
```
|aun_codigo|aun_nombre|nau_codigo|nau_nombre|
|----------|----------|----------|----------|
|1|Despacho Contralor|2|EJECUTIVO|
|2|Gerencia Recursos Humanos|2|EJECUTIVO|
|3|Gerencia Nacional Administrativa financiera|2|EJECUTIVO|
## 3.5. OBTENER AREAS UNIDADES CON SU RESPECTIVA DIRECTIVA usando LEFT JOIN
```sql
select 
au.aun_codigo,
au.aun_nombre,
au.nau_codigo,
nau.nau_nombre 
from estructura_organizacional.areas_unidades au  
left join parametricas.niveles_areas_unidades nau on au.nau_codigo  =nau.nau_codigo
order by au.aun_codigo;
```
|aun_codigo|aun_nombre|nau_codigo|nau_nombre|
|----------|----------|----------|----------|
|1|Despacho Contralor|2|EJECUTIVO|
|2|Gerencia Recursos Humanos|2|EJECUTIVO|
|3|Gerencia Nacional Administrativa financiera|2|EJECUTIVO|

[<< INDICE](../../README.md)

---


<div style="page-break-before: always;"></div>


# 📄 I.1. Linter & Formateador

## Linting
- Iniciar el depurador de codigo (detectar errores)
```console
npm run lint
```
## Formateador
- Iniciar el prettier (formatea codigo)
```console
npm run format
```

---


### 2.2. RabbitMQ


<div style="page-break-before: always;"></div>


# 📄 J.1. RabbitMQ (Backend)

[<< INDICE](../../README.md)

- [1. Rabbit](#1-rabbit)
  - [1.1. Añadir el repositorio de RabbitMQ](#11-añadir-el-repositorio-de-rabbitmq)
  - [1.2. Instalar el servidor RabbitMQ](#12-instalar-el-servidor-rabbitmq)
  - [1.3. Iniciar](#13-iniciar)
  - [1.4. Acceder al panel de control de RabbitMQ](#14-acceder-al-panel-de-control-de-rabbitmq)
  - [1.5. Para el servicio](#15-para-el-servicio)

# 1. Rabbit
## 1.1. Añadir el repositorio de RabbitMQ
- instala todas las dependencias
$>sudo apt-get install gnupg2 curl wget apt-transport-https software-properties-common -y
- descarga e instala el paquete del repositorio Erlang
$>wget https://packages.erlang-solutions.com/erlang/debian/pool/esl-erlang_23.1.5-1~debian~stretch_amd64.deb
$>sudo dpkg -i esl-erlang_23.1.5-1~debian~stretch_amd64.deb
- Si existen errores de dependencia
--------------------------------------
1. Instalar con correccion
```console
$>sudo apt-get install -f
$>s(o yes)
```
2. actualiza el repositorio Erlang e instala el paquete Erlang
```console
$>sudo apt-get update -y
$>sudo apt-get install erlang erlang-nox
$>s (o yes)
```
3. añade el repositorio de RabbitMQ
```console
$>sudo add-apt-repository 'deb http://www.rabbitmq.com/debian/ testing main'
$>wget -O- https://www.rabbitmq.com/rabbitmq-release-signing-key.asc | sudo apt-key add -
```
4. actualizar
```console
$>sudo apt-get update -y
```
## 1.2. Instalar el servidor RabbitMQ
- instalar el servidor RabbitMQ
```console
$>sudo apt-get install rabbitmq-server -y
```
- inicia el servicio RabbitMQ
```console
$>systemctl start rabbitmq-server
```
- pide autenticacion password=rteran
- habilitar el servicio RabbitMQ
```console
$>systemctl enable rabbitmq-server
```
- pide autenticacion password=rteran 3 veces
- comprobar el estado del servicio RabbitMQ
```console
$>systemctl status rabbitmq-server
```


- salir
```console
$>q
```
## 1.3. Iniciar
- crear usuario "admin"
```console
$>sudo rabbitmqctl add_user admin password
```
- establece una etiqueta para tu cuenta de administrador
```console
$>sudo rabbitmqctl set_user_tags admin administrator
```
- establece el permiso adecuado
```console
$>sudo rabbitmqctl set_permissions -p / admin ".*" ".*" ".*"
```
- habilita la consola de gestión de RabbitMQ
```console
$>sudo rabbitmq-plugins enable rabbitmq_management
```
## 1.4. Acceder al panel de control de RabbitMQ
- la consola web de RabbitMQ escucha en el puerto 15672
```console
$>ss -antpl | grep 15672
```
- En el navegador
http://localhost:15672/
- Datos
```text
Username=admin
Password=password
```
## 1.5. Para el servicio
```console
 systemctl stop rabbitmq-server
```

[<< INDICE](../../README.md)

---


### 2.3. MongoDB


<div style="page-break-before: always;"></div>


# 📄 K.1. MongoDb (Backend)

[<< INDICE](../../README.md)
- [1. Mongo db](#1-mongo-db)
  - [1.1. Instalar](#11-instalar)
  - [1.2. Estados de mongodb](#12-estados-de-mongodb)
  - [1.3. Configurar la seguridad de MongoDB](#13-configurar-la-seguridad-de-mongodb)
  - [1.4. iniciar mongo](#14-iniciar-mongo)
  - [1.5. Comandos a ejecutar dentro de MongoDB](#15-comandos-a-ejecutar-dentro-de-mongodb)
  - [1.6. Actualizacion y desinstalacion](#16-actualizacion-y-desinstalacion)

# 1. Mongo db
***
## 1.1. Instalar
- Actualizar
```console
$>sudo apt update && sudo apt upgrade -y
```

- Verificar el estado de sudo en su cuenta:
```console
$>sudo whoami
```

- Instalar dependencias
```console
$>sudo apt install dirmngr gnupg apt-transport-https software-properties-common ca-certificates curl -y
```

- Importar repositorio de MongoDB
```console
$>wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -
$>echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/5.0 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list
```

- actualizar su apt-cache
```console
$>sudo apt-get update
```

- Instalar MongoDB en Debian
```console
$>sudo apt install mongodb-org
$>s(o yes)
```
- Para iniciar y activar MongoDB, use el siguiente comando
```console
$>sudo systemctl enable mongod --now
```
- Verifique la instalación probando la conexión de la base de datos y verifique la versión con el siguiente comando de terminal.
```console
$>mongo --eval 'db.runCommand({ connectionStatus: 1 })'
```
- Compruebe el estado del servicio de MongodB 5.0
```console
$>systemctl status mongod
```
## 1.2. Estados de mongodb
- iniciar MongoDB
```console
$>sudo systemctl start mongod
```
- detener MongoDB
```console
$>sudo systemctl stop mongod
```
- habilitar MongoDB al iniciar el sistema
```console
$>sudo systemctl enable mongod
```
- deshabilitar MongoDB al iniciar el sistema
```console
$>sudo systemctl disable mongod
```
- reiniciar el servicio MongoDB
```console
$>sudo systemctl restart mongod
```
## 1.3. Configurar la seguridad de MongoDB
- entrar a config
```console
$>sudo nano /etc/mongod.conf
```
- descomente la siguiente línea y agregue authorization: enabled
- ctrl+x
```console
$>sudo systemctl restart mongod
```
## 1.4. iniciar mongo
- ver estado mongo
```console
$>systemctl status mongod
```
- entrar a mongo
```console
$>mongo
```
## 1.5. Comandos a ejecutar dentro de MongoDB
- Crear bd
```console
$>use admin
```

- crear una nueva cuenta de usuario de Mongo. Para el tutorial, se hará un mongouser de usuario
```text
db.createUser(
{
user: "mongouser",
pwd: "PASSWORDCHANGE",
roles: [ { role: "userAdminAnyDatabase", db: "admin" } ]
}
)
```
- Recuerde, cambie el pwd: "PASSWORDCHANGE", no copie esto a ciegas sin editar primero y, opcionalmente, cambie el nombre del administrador si lo desea.
- salir de MongoDB
```console
$>quit()
```
- pruebe MongoDB con el estado de conexión de la nueva cuenta que creó.
- password=PASSWORDCHANGE
- La salida anterior indica que el usuario "mongouser" se ha conectado a la base de datos de administración. Esto es, por supuesto, solo una prueba. Puede cambiar el nombre de las bases de datos y cambiar el nombre de los usuarios como lo haría en el futuro.
- salir de MongoDB
```console
$>quit()
```
## 1.6. Actualizacion y desinstalacion
- actualizar MongoDB
```console
$>sudo apt update && sudo apt upgrade
```
- quitar (desinstalar) MongoDB
```console
$>sudo apt remove mongodb-org
$>sudo apt autoremove mongodb-org
$>sudo rm /etc/apt/sources.list.d/mongodb-org-5.0.list
```

[<< INDICE](../../README.md)

---


### 2.4. Repositorios externos (Backend)


<div style="page-break-before: always;"></div>


# 📄 README.md

[<< INDICE](https://github.com/xixay/ayuda-memoria)

| Tema | Enlace | Tema | Enlace |
|------|--------|------|--------|
| **1. Inicio** | [Ver](./documentacion/1-articulo.md) | **2. Cruds** | [Ver](./documentacion/2-cruds.md) |
| **3. Continuando Cruds** | [Ver](./documentacion/3-continuandoCruds.md) |  |  |

## Ejecutar en modo desarrollo
```console
npm run dev
```
>Ir a localhost:3000
## Para llevar a producción
```console
npm run build
```
```text
De esta manera se crea el archivo app.js
```
## Ejecutar el producto final app.js
```console
npm run start
```
>Ir a localhost:3000
## Referencia
- [¿Cómo configurar NodeJS y Express con Typescript? ¡Configuración inicial!](https://www.youtube.com/watch?v=HONRQUFqFkA)
- [Solicitudes HTTP con Axios](https://styde.net/solicitudes-http-con-axios/)
- [Nodejs, PostgreSQL & Typescript, REST API CRUD](https://github.com/FaztWeb/postgresql-node-restapi-ts/tree/master)
- [Nodejs, PostgreSQL & Typescript, REST API CRUD video](https://www.youtube.com/watch?v=z4BNZfZ1Wq8)

---


<div style="page-break-before: always;"></div>


# 📄 README.md

[<< INDICE](https://github.com/xixay/ayuda-memoria)

| Tema | Enlace | Tema | Enlace |
|------|--------|------|--------|
| **1. Inicio Rapido** | [Ver](./documentacion/1-inicioRapido.md) | **2. Paso a paso** | [Ver](./documentacion/2-pasoAPaso.md) |
| **3. Articulo Builder** | [Ver](./documentacion/3-articuloBuilder.md) | **3.1. Articulo Rutas Builder** | [Ver](./documentacion/3.1-articuloRutasBuilder.md) |
| **4. Articulo** | [Ver](./documentacion/4-articulo.md) | **4.1. Articulo Rutas** | [Ver](./documentacion/4.1-articuloRutas.md) |
| **5. Comandos** | [Ver](./documentacion/5-comandosTypeOrm.md) |  |  |

# Awesome Project Build with TypeORM

Steps to run this project:

1. Run `npm i` command
2. Setup database settings inside `data-source.ts` file
3. Run `npm start` command


---


<div style="page-break-before: always;"></div>


# 📄 README.md

[<< INDICE](https://github.com/xixay/ayuda-memoria)

<p align="center">
  <a href="http://nestjs.com/" target="blank"><img src="https://nestjs.com/img/logo-small.svg" width="200" alt="Nest Logo" /></a>
</p>

[circleci-image]: https://img.shields.io/circleci/build/github/nestjs/nest/master?token=abc123def456
[circleci-url]: https://circleci.com/gh/nestjs/nest

  <p align="center">A progressive <a href="http://nodejs.org" target="_blank">Node.js</a> framework for building efficient and scalable server-side applications.</p>
    <p align="center">
<a href="https://www.npmjs.com/~nestjscore" target="_blank"><img src="https://img.shields.io/npm/v/@nestjs/core.svg" alt="NPM Version" /></a>
<a href="https://www.npmjs.com/~nestjscore" target="_blank"><img src="https://img.shields.io/npm/l/@nestjs/core.svg" alt="Package License" /></a>
<a href="https://www.npmjs.com/~nestjscore" target="_blank"><img src="https://img.shields.io/npm/dm/@nestjs/common.svg" alt="NPM Downloads" /></a>
<a href="https://circleci.com/gh/nestjs/nest" target="_blank"><img src="https://img.shields.io/circleci/build/github/nestjs/nest/master" alt="CircleCI" /></a>
<a href="https://coveralls.io/github/nestjs/nest?branch=master" target="_blank"><img src="https://coveralls.io/repos/github/nestjs/nest/badge.svg?branch=master#9" alt="Coverage" /></a>
<a href="https://discord.gg/G7Qnnhy" target="_blank"><img src="https://img.shields.io/badge/discord-online-brightgreen.svg" alt="Discord"/></a>
<a href="https://opencollective.com/nest#backer" target="_blank"><img src="https://opencollective.com/nest/backers/badge.svg" alt="Backers on Open Collective" /></a>
<a href="https://opencollective.com/nest#sponsor" target="_blank"><img src="https://opencollective.com/nest/sponsors/badge.svg" alt="Sponsors on Open Collective" /></a>
  <a href="https://paypal.me/kamilmysliwiec" target="_blank"><img src="https://img.shields.io/badge/Donate-PayPal-ff3f59.svg"/></a>
    <a href="https://opencollective.com/nest#sponsor"  target="_blank"><img src="https://img.shields.io/badge/Support%20us-Open%20Collective-41B883.svg" alt="Support us"></a>
  <a href="https://twitter.com/nestframework" target="_blank"><img src="https://img.shields.io/twitter/follow/nestframework.svg?style=social&label=Follow"></a>
</p>
  <!--[![Backers on Open Collective](https://opencollective.com/nest/backers/badge.svg)](https://opencollective.com/nest#backer)
  [![Sponsors on Open Collective](https://opencollective.com/nest/sponsors/badge.svg)](https://opencollective.com/nest#sponsor)-->

## Indice

| Tema | Enlace | Tema | Enlace |
|------|--------|------|--------|
| **1. Articulo** | [Ver](./documentacion/1-articulo.md) | **2. Cruds** | [Ver](./documentacion/1.1-articuloRutas.md) |
| **3. Decoradores** | [Ver](./documentacion/1.2-getAllQuery.md) |  |  |

## Description

[Nest](https://github.com/nestjs/nest) framework TypeScript starter repository.

## Installation

```bash
$ npm install
```

## Running the app

```bash
# development
$ npm run start

# watch mode
$ npm run start:dev

# production mode
$ npm run start:prod
```

## Test

```bash
# unit tests
$ npm run test

# e2e tests
$ npm run test:e2e

# test coverage
$ npm run test:cov
```

## Support

Nest is an MIT-licensed open source project. It can grow thanks to the sponsors and support by the amazing backers. If you'd like to join them, please [read more here](https://docs.nestjs.com/support).

## Stay in touch

- Author - [Kamil Myśliwiec](https://kamilmysliwiec.com)
- Website - [https://nestjs.com](https://nestjs.com/)
- Twitter - [@nestframework](https://twitter.com/nestframework)

## License

Nest is [MIT licensed](LICENSE).


---


<div style="page-break-before: always;"></div>


# 📄 README.md

[<< INDICE](https://github.com/xixay/ayuda-memoria)
- [1. node-mongoDB](#1-node-mongodb)
  - [1.1. Inicializar el proyecto](#11-inicializar-el-proyecto)
  - [1.2. Agregar MongoDB como dependencia](#12-agregar-mongodb-como-dependencia)
  - [1.3. Crear cluster para la bd](#13-crear-cluster-para-la-bd)
  - [1.4. Conéctese a su clúster](#14-conéctese-a-su-clúster)
    - [1.4.1. index.js](#141-indexjs)
    - [1.4.2. estudiantesCrud.js](#142-estudiantescrudjs)
  - [1.5. Operaciones CRUD](#15-operaciones-crud)
  - [1.6. Crear](#16-crear)
  - [1.7. Encontrar](#17-encontrar)
  - [1.8. Actualizar](#18-actualizar)
  - [1.9. Borrar](#19-borrar)
  - [1.10. Referencia](#110-referencia)

# 1. node-mongoDB
 Base de datos mongo db
 ***
 ## 1.1. Inicializar el proyecto
 1. crear package.json
 ```console
 npm init -y
 ```
 2. En este proyecto, usaremos módulos ECMAScript, que son la forma estandarizada de empaquetar código JavaScript. Para habilitar los módulos ECMAScript, agregue un nuevo campo al archivo "package.json":
```JSON
 "type": "module"
 ```
 ## 1.2. Agregar MongoDB como dependencia
1. Instalar MongoDB
 ```console
npm install mongodb
 ```
## 1.3. Crear cluster para la bd
1. Crear contenedor
 ```console
docker run --name escuela -d mongo:5.0.9
 ```
2. iniciar contenedor
```console
docker start escuela
```
3. obtener la dirección , por donde corre el contenedor
```console
docker inspect escuela
```
4. entrar a los comandos de mongodb y editar
```console
docker exec -it escuela mongo
```
5. crear la base de datos
```console
use escuela_db
```
6. crear usuario para esa base de datos
```console
db.createUser(
{
user: "juan",
pwd: "123",
roles: ["dbOwner"]
}
)
```
## 1.4. Conéctese a su clúster
1. Cree un .env archivo “ ” en la raíz de su proyecto y agregue su cadena de conexión de clúster como una variable:
```env
DB_URI=mongodb://juan:123@ip:port/escuela_db>
```
2. Cree un .env.default
```env
DB_URI=mongodb://<username>:<password>@<ip:port/baseDatos_db>
```
3. Crear el archivo .gitignore para que git ignore el .env, y adentro debe tener
```text
# Environment variables
.env
```
4. Para cargar esa configuración en nuestra aplicación
```console
npm install dotenv
```
5. Crear index.js
```console
mkdir src && touch src/index.js
```
6. Abrir index.js
### 1.4.1. index.js
1. Importe el dotenv paquete
```js
import { config } from 'dotenv';
```
2. Cargar las variables de env
```js
config();
console.log(process.env.DB_URI);
```
3. Ejecute el script en su terminal:
```console
node src/index.js
```
***
7. crear estudiantesCrud.js
```console
touch src/estudiantesCrud.js
```
### 1.4.2. estudiantesCrud.js
1. importando el MongoClient
```js
import { MongoClient } from 'mongodb';
```
2. crear la función asincrona conexion
```js
export async function conectarseAlCluster(uri) {
   let mongoClient;

   try {
       mongoClient = new MongoClient(uri);
       console.log('Conectándose al clúster de MongoDB...');
       await mongoClient.connect();
       console.log('Successfully connected to MongoDB Atlas!');

       return mongoClient;
   } catch (error) {
       console.error('¡Conectado con éxito a MongoDB !', error);
       process.exit();
   }
}
```
```text
La función acepta un parámetro — uri— e instancia un MongoClient. Luego, se conecta invocando el connect()método asíncrono. Usamos la awaitpalabra clave para esperar a que se establezca la conexión antes de ejecutar las siguientes declaraciones. Toda la implementación está envuelta en una try/catchdeclaración. En caso de error, registramos un mensaje en la salida estándar y terminamos la ejecución con process.exit().
```
3. crear la función asincrona de operaciones
```js
export async function ejecutarOperacionesEstudiantesCrud() {
   const uri = process.env.DB_URI;
   let mongoClient;

   try {
       mongoClient = await conectarseAlCluster(uri);
   } finally {
       await mongoClient.close();
   }
}
```
***
8. La version final de index.js, deberia verse
```js
import { config } from 'dotenv';
import { ejecutarOperacionesEstudiantesCrud } from './estudiantesCrud.js';

config();
await ejecutarOperacionesEstudiantesCrud();
```
9. Ejecute el script en su terminal:
```console
node src/index.js
```
***
## 1.5. Operaciones CRUD
1. Nuestro ejemplo creará una base de datos llamada “ escuela_db”, que tendrá una colección de “ estudiantes”.
2. Actualice la ejecutarOperacionesEstudiantesCrud()
```js
 export async function ejecutarOperacionesEstudiantesCrud() {
    const uri = process.env.DB_URI;
    let mongoClient;

    try {
        mongoClient = await conectarseAlCluster(uri);
        //crea la base de datos
        const db = mongoClient.db('escuela_db');
        //agrega una coleccion de estudiantes
        const coleccion = db.collection('estudiantes');
    } finally {
        await mongoClient.close();
    }
 }
```
3. Ejecute el script en su terminal:
```console
node src/index.js
```
## 1.6. Crear
1. Ahora que tiene una base de datos y una colección configuradas, puede crear un nuevo documento usando insertOne(). Para crear un documento
```js
export async function crearDocumentoEstudiante(collection) {
   const documentoEstudiante = {
       nombre: 'John Smith',
       fechaNacimiento: new Date(2000, 11, 20),
       direccion: { calle: 'Pike Lane', ciudad: 'Los Angeles', estado: 'CA' },
   };

   await collection.insertOne(documentoEstudiante);
}
```
2. Llamar la funcion crearDocumentoEstudiante en try
```js
 export async function ejecutarOperacionesEstudiantesCrud() {
    const uri = process.env.DB_URI;
    let mongoClient;

    try {
        mongoClient = await conectarseAlCluster(uri);
        const db = mongoClient.db('escuela_db');
        const coleccion = db.collection('estudiantes');
        console.log('Crear estudiante');
        await crearDocumentoEstudiante(coleccion);
    } finally {
        await mongoClient.close();
    }
 }
 ```
3. Ejecute el script en su terminal:
```console
node src/index.js
```
4. Para comprobar que se creo ejecute desde terminal:
```console
docker exec -it escuela mongo escuela_db -u "juan" -p "123"
```
Una ves dentro de mongo ejecutar
```console
db.estudiantes.find()
```
## 1.7. Encontrar
1. utilizar el método find() para recuperar documentos de la base de datos.
```js
export async function encontrarEstudiantesPorNombre(coleccion, nombre) {
   return coleccion.find({ nombre }).toArray();
}
```
2. Llamar la funcion encontrarEstudiantesPorNombre en try
```js
export async function ejecutarOperacionesEstudiantesCrud() {
    const uri = process.env.DB_URI;
    let mongoClient;

    try {
        mongoClient = await conectarseAlCluster(uri);
        const db = mongoClient.db('escuela_db');
        const coleccion = db.collection('estudiantes');
        //Comentar la funcion crear usuario
/*      console.log('Crear estudiante');
        await crearDocumentoEstudiante(coleccion); */
        console.log(await encontrarEstudiantesPorNombre(coleccion, 'John Smith'));
    } finally {
        await mongoClient.close();
    }
 }
 ```
3. Ejecute el script en su terminal:
```console
node src/index.js
```
## 1.8. Actualizar
1. crear una función que actualice los campos especificados de un documento con un nombre específico
```js
export async function actualizarEstudiantesPorNombre(coleccion, nombre, camposActualizados) {
   await coleccion.updateMany(
       { nombre },
       { $set: camposActualizados }
   );
}
```
2. Llame a esta función y luego encontrarEstudiantesPorNombre()una vez más para verificar que el documento se actualizó.
```js
export async function ejecutarOperacionesEstudiantesCrud() {
    const uri = process.env.DB_URI;
    let mongoClient;

    try {
        mongoClient = await conectarseAlCluster(uri);
        const db = mongoClient.db('escuela_db');
        const coleccion = db.collection('estudiantes');
        // console.log('Crear estudiante');
        // await crearDocumentoEstudiante(coleccion);
        console.log(await encontrarEstudiantesPorNombre(coleccion, 'John Smith'));
        console.log('ACTUALIZAR la fecha de nacimiento\'s del estudiante');
        await actualizarEstudiantesPorNombre(coleccion, 'John Smith', { fechaNacimiento: new Date(2001, 5, 5) });
        console.log(await encontrarEstudiantesPorNombre(coleccion, 'John Smith'));
    } finally {
        await mongoClient.close();
    }
 }
 ```
3. Ejecute el script en su terminal:
```console
node src/index.js
```
## 1.9. Borrar
1. Vamos a crear una función que elimine todos los documentos con un nombre específico justo después de la actualizarEstudiantesPorNombre()función:
```js
export async function eliminarEstudiantesPorNombre(coleccion, nombre) {
   await coleccion.deleteMany({ nombre });
}
```
2. Llame a la función dentro del trybloque. También puede descomentar las llamadas a funciones anteriores.
```js
export async function ejecutarOperacionesEstudiantesCrud() {
    const uri = process.env.DB_URI;
    let mongoClient;

    try {
        mongoClient = await conectarseAlCluster(uri);
        const db = mongoClient.db('escuela_db');
        const coleccion = db.collection('estudiantes');
        console.log('Crear estudiante');
        await crearDocumentoEstudiante(coleccion);
        console.log(await encontrarEstudiantesPorNombre(coleccion, 'John Smith'));
        console.log('ACTUALIZAR la fecha de nacimiento\'s del estudiante');
        await actualizarEstudiantesPorNombre(coleccion, 'John Smith', { fechaNacimiento: new Date(2001, 5, 5) });
        console.log(await encontrarEstudiantesPorNombre(coleccion, 'John Smith'));
        console.log('Eliminar Estudiante');
        await eliminarEstudiantesPorNombre(coleccion, 'John Smith');
        console.log(await encontrarEstudiantesPorNombre(coleccion, 'John Smith'));
    } finally {
        await mongoClient.close();
    }
 }
 ```
3. Ejecute el script en su terminal:
```console
node src/index.js
```
## 1.10. Referencia
- Para mongodb en npm https://www.mongodb.com/languages/javascript/mongodb-and-npm-tutorial
- Para el archivo .env https://desarrolloactivo.com/blog/dotenv-environment-variables/

[<< INDICE](https://github.com/xixay/ayuda-memoria)

---


<div style="page-break-before: always;"></div>


# 📄 README.md

# ts2-repositorio
 2do Tutorial de type script
 ***
## Iniciando el proyecto
- Inicializa el proyecto
```console
$>npm init

package name: (ts2-repositorio)
version: (1.0.0)
description: 2do tutorial de type script
entry point: (index.js)
test command:
git repository: (https://github.com/xixay/ts2-repositorio.git)
keywords:
author: Xixay
license: (ISC)
```

- Instalando las dependecias para que reconozca type script y node de manera global

```console
$>npm install -g typescript
$>npm install -g ts-node
$>npm install -g tslib @types/node
```
- Instalando las dependecias para que reconozca type script y node de manera local
```console
$>npm install -D typescript
$>npm install -D ts-node
$>npm install -D tslib @types/node
```
## multiplicador.ts
-El el archivo package.json
```json
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1",
    "iniciar:multiplicador": "ts-node multiplicador.ts"
  },
```

- Crear el archivo tsconfig.json con la siguiente info
```json

{
  "compilerOptions": {
    "types": [
      // ... your other types
      "node"
    ],
  },
}

```

- Ejecuta
```console
$>npm run iniciar:multiplicador
o
$>ts-node multiplicador.ts
```

## calculadora.ts
-El el archivo package.json
```json
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1",
    "iniciar:multiplicador": "ts-node multiplicador.ts",
    "iniciar:calculadora": "ts-node calculadora.ts"
  },
```

- Crear el archivo tsconfig.json con la siguiente info
```json

{
  "compilerOptions": {
    "types": [
      // ... your other types
      "node"
    ],
    "lib": ["es6", "dom", "es2017"],
    "target": "es5",
  },
}

```

- Ejecuta
```console
$>npm run iniciar:calculadora
o
$>ts-node calculadora.ts
```
 ## Referencia
- Video de referencia https://www.youtube.com/watch?v=xtp_DuPxo9Q
- ts-node https://www.npmjs.com/package/ts-node
- Pagina de referencia con que se creo el LEAME.md https://programminghistorian.org/es/lecciones/introduccion-a-markdown
- Arreglo de console.log https://bobbyhadz.com/blog/typescript-cannot-find-name-console
- Arreglo del includes https://stackoverflow.com/questions/40545329/property-includes-does-not-exist-on-type-string


---


<div style="page-break-before: always;"></div>


# 📄 README.md

# ts-node-express-repositorio
 Cómo (y por qué) deberías usar TypeScript con Node y Express
 ## Como configurar un proyecto Express con TypeScrip
 1. Veamos paso por paso cómo crear un entorno para usar TypeScript dentro de un proyecto de Express.js
 ```console
 npm init
 ```
 2. Instalaremos el paquete typescript
 ```console
 npm install -D typescript
 ```
 3. Dentro de nuestro package.json introduciremos un script llamado tsc. Esta modificación nos permite llamar a funciones TypeScript desde la línea de comandos en la carpeta del proyecto
 ```json
 "scripts": {
    "tsc": "tsc"
},
 ```
 4. Usar el sgte comando para inicializar el proyecto creando el fichero tsconfig.json
 ```console
 npm run tsc -- --init
 ```
 5. Dentro de este fichero descomentaremos la opción outDir y elegiremos una localización donde se dejarán los ficheros .js transpilados.
 ```json
 {
  "compilerOptions": {
 
    "outDir": "./build",                                   /* Specify an output folder for all emitted files. */

  }
}

 ```
 6. Instalar express. Existe un paquete npm concreto para que TypeScript reconozca los tipos de Express.
 ```console
 npm install express --save
 ```
 ## Ejm Hola mundo
 1. Dentro de nuestro proyecto crearemos una carpeta llamada app. Dentro de esta carpeta crearemos un fichero llamado app.ts con el siguiente contenido:
 ```ts
// lib/app.ts
import express = require('express');

// Crear una nueva instancia de aplicación express
const app: express.Application = express();

//puerto
const port = 3000;
app.get('/', function (solicitud, respuesta) {
  respuesta.send('Hola Mundo!');
});

app.listen(port, ()=> {
  console.log('¡Aplicación de ejemplo corriendo en el puerto 3000!');
});
 ```
 2. Compilando nuestra primera aplicación:
 ```console
 npm run tsc
 ```
 3. Como podemos ver, este comando ha creado automáticamente la carpeta build y el fichero .js.
 4. Ejecutando Express
 ```console
 node build/app.js
 ```
 5. Ir a http://localhost:3000/
 ## Ejecutar TypeScript sin transpilar
- Puedes ejecutar TypeScript directamente en Node con el paquete ts-node.
- Este paquete se recomienda sólo para desarrollo
1. Instalar
```console
npm install ts-node-dev --save
```
2. Dentro de nuestro package.json añadiremos dos scripts más.
```json
"scripts": {
    "tsc": "tsc",
    "dev": "ts-node-dev --respawn --transpile-only ./app/app.ts",
    "prod": "tsc && node ./build/app.js"
},
```
### Para iniciar el entorno de desarrollo o develop
```console
npm run dev
```
### Para ejecutar el servidor en modo producción
```console
npm run prod
```
## Referencia 
- http://developinginspanish.com/2019/08/11/como-y-por-que-deberias-usar-typescript-con-node-y-express/
- https://www.typescriptlang.org/docs/handbook/typescript-in-5-minutes.html
- https://github.com/andregardi/ts-express
- https://expressjs.com/
- https://stackoverflow.com/questions/67455625/ts-node-dev-no-script-to-run-provided

---


<div style="page-break-before: always;"></div>


# 📄 README.md

# typeorm-repositorio
 - Proporcionar funciones adicionales que lo ayuden a desarrollar cualquier tipo de aplicación que use bases de datos, desde aplicaciones pequeñas con unas pocas tablas hasta aplicaciones empresariales a gran escala con múltiples bases de datos
## Instalación
1. Instale el paquete npm:
```console
npm install typeorm --save
```
2. Necesitas instalar reflect-metadata calzas, e impórtelo en algún lugar en el lugar global de su aplicación (por ejemplo, en app.ts):
```console
npm install reflect-metadata --save
```
3. Es posible que deba instalar tipos de nodos:
```console
npm install @types/node --save-dev
```
### Instale un controlador de base de datos:
1. para MySQL o MariaDB
```console
npm install mysql --save(también puede instalar mysql2 en su lugar)
```
2. para PostgreSQL o CockroachDB
```console
npm install pg --save
```
3. para SQLite
```console
npm install sqlite3 --save
```
4. para Microsoft SQL Server
```console
npm install mssql --save
```
5. para sql.js
```console
npm install sql.js --save
```
6. para oráculo
```console
npm install oracledb --save
```
```text
Para que el controlador de Oracle funcione, debe seguir las instrucciones de instalación de su sitio.
```
7. para SAP Hana
```console
npm install @sap/hana-client
npm install hdb-pool
```
```text
El soporte de SAP Hana fue posible gracias al patrocinio de Neptune Software .
```
8. para Google Cloud Spanner
```console
npm install @google-cloud/spanner --save
```
- Proporcione credenciales de autenticación a su código de aplicación configurando la variable de entorno GOOGLE_APPLICATION_CREDENTIALS:

```text
# Linux/macOS
export GOOGLE_APPLICATION_CREDENTIALS="KEY_PATH"

# Windows
set GOOGLE_APPLICATION_CREDENTIALS=KEY_PATH

# Replace KEY_PATH with the path of the JSON file that contains your service account key.
```
- Para usar Spanner con el emulador, debe configurar SPANNER_EMULATOR_HOSTla variable de entorno:
```text
# Linux/macOS
export SPANNER_EMULATOR_HOST=localhost:9010

# Windows
set SPANNER_EMULATOR_HOST=localhost:9010
```
9. para MongoDB (experimental)
```console
npm install mongodb@^3.6.0 --save
```
10. para NativeScript , react-native y Cordova
```text
Consulte la documentación de las plataformas compatibles
```
>Instale solo uno de ellos, según la base de datos que utilice.
## Si usa TypeScript
1. Colocar en el tsconfig.json
```json
"emitDecoratorMetadata": true,
"experimentalDecorators": true,
```
2. Es posible que también deba habilitar es6 en la sección lib de opciones del compilador o instalar es6-shim desde @types.

---


<div style="page-break-before: always;"></div>


# 📄 README.md

# ts1-repositorio
 Typescript Curso Práctico Rápido desde Cero para Iniciantes
 ***
## Iniciando el proyecto
1. Crea el archivo .gitignore y coloca node modules para que no te suba al github las dependencias
```console
node_modules
```
2. Inicializa el proyecto
```console
$>npm init

package name: (ts1-repositorio)
version: (1.0.0)
description: 1er tutorial de type script
entry point: (index.js)
test command:
git repository: (https://github.com/xixay/ts1-repositorio.git)
keywords:
author: Xixay
license: (ISC)
```
3. Instalando las dependecias para que reconozca type script y node y express de manera local
```console
$>npm i -D express @types/express @types/node nodemon ts-node typescript cors --save-dev @types/cors
```
4. Usar el sgte comando para inicializar el proyecto creando el fichero tsconfig.json
```console
tsc --init
```
5. Dentro de este fichero descomentaremos la opción outDir elegiremos una localización donde se dejarán los ficheros .js compilados,  y en rootDir estaran los archivos de desarrollo type script .
```json
{
  "compilerOptions": {
    "rootDir": "./src",                                  /* Especifique la carpeta raíz dentro de sus archivos de origen. */
    "moduleResolution": "node",                       /* Especifique cómo busca TypeScript un archivo de un especificador de módulo dado. */
    "outDir": "./dist",                                   /* Especifique una carpeta de salida para todos los archivos emitidos. */
    "removeComments": true,                           /* Deshabilitar la emisión de comentarios. */

  }
}

```
6. Dentro de nuestro proyecto crearemos una carpeta llamada src. Dentro de esta carpeta crearemos un fichero llamado app.ts con el siguiente contenido:
```ts
// lib/app.ts
import express from "express"
import cors from 'cors'

// Crear una nueva instancia de aplicación express
const app: express.Application = express()

//puerto
const port = 3000
//credenciales(permisos de GET,POST,PUT,etc)
app.use(cors())
//metodo get
app.get("/", (solicitud: express.Request, respuesta: express.Response) => {
    //status
    respuesta.status(200)
    //mensaje a mostrar en localhost:3000
    respuesta.send("Hola TypeScript con Node y Express!")
})

app.listen(port, () => {
  console.log("¡Aplicación de ejemplo corriendo en el puerto "+port+"!")
})

```
7. Dentro de nuestro package.json introduciremos los script para ejecutar las tareas dese consola
```json
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1",
    "start": "node dist/app.js",// Iniciara el archivo compilado
    "dev": "nodemon src/app.ts",// Iniciara en el modo desarrollo
    "build": "tsc -p ."//Lo llevara para produccion, osea lo compilara
  },
```
```text
1. nodemon(Ejecuta archivos typeScript)
2. tsc(Transforma typeScript a javaScript)
3. node(Ejecuta archivos javaScript)
```
8. Ejecutar en modo desarrollo
```console
npm run dev
```
>Ir a localhost:3000
9. Para llevar a producción
```console
npm run build
```
```text
De esta manera se crea el archivo app.js
```
10. Ejecutar el producto final app.js
```console
npm run start
```
>Ir a localhost:3000
## Referencia
- https://www.youtube.com/watch?v=HONRQUFqFkA

---


<div style="page-break-before: always;"></div>


# 📄 README.md

- [1. Postgres-repositorio Linux](#1-postgres-repositorio-linux)
- [2. Contenedor Postgres](#2-contenedor-postgres)
  - [2.1. Crear una base de datos en Postgres](#21-crear-una-base-de-datos-en-postgres)
  - [2.2. Crear una tabla en Postgres](#22-crear-una-tabla-en-postgres)
- [3. Configuración de un servidor Express](#3-configuración-de-un-servidor-express)
- [4. Conexión a una base de datos de Postgres desde Node.js](#4-conexión-a-una-base-de-datos-de-postgres-desde-nodejs)
- [5. Creación de rutas para operaciones CRUD](#5-creación-de-rutas-para-operaciones-crud)
  - [5.1. GET todos los usuarios](#51-get-todos-los-usuarios)
  - [5.2. GET un solo usuario por ID](#52-get-un-solo-usuario-por-id)
  - [5.3. POST un nuevo usuario](#53-post-un-nuevo-usuario)
  - [5.4. PUT datos actualizados en un usuario existente](#54-put-datos-actualizados-en-un-usuario-existente)
  - [5.5. DELETE un usuario](#55-delete-un-usuario)
  - [5.6. Exportación de funciones CRUD en una API REST](#56-exportación-de-funciones-crud-en-una-api-rest)
  - [5.7. Configuración de funciones CRUD en una API REST](#57-configuración-de-funciones-crud-en-una-api-rest)
  - [5.8. Pruebas](#58-pruebas)
- [6. Referencia](#6-referencia)
## 1. Postgres-repositorio Linux
 API CRUD REST con Node.js, Express y PostgreSQL
***
## 2. Contenedor Postgres
1. Crear contenedor
```console
sudo docker run --name persona -e POSTGRES_PASSWORD=password -d postgres:13.5
```
2. Obtener la dirección , por donde corre el contenedor
```console
docker inspect persona
```
3. Entrar a los comandos de postgres y editar
```console
psql -h IP -U postgres -W
contraseña:password
```
### 2.1. Crear una base de datos en Postgres
1. Crear bd
```console
CREATE DATABASE persona_db;
```
2. Utilizar el\list comando para ver las bases de datos disponibles:
```console
\l
```
3. Conectémonos a la nueva base de datos persona_db usando el comando de conexión:
```console
\c persona_db
contraseña:password
```
### 2.2. Crear una tabla en Postgres
1. Finalmente, en el símbolo del sistema psql, crearemos una tabla llamada usuarios con tres campos, dos tipos VARCHAR y una ID de incremento automático :PRIMARY KEY
```console
CREATE TABLE usuarios (
  ID SERIAL PRIMARY KEY,
  nombre VARCHAR(30),
  email VARCHAR(30)
);
```
2. Agreguemos algunos datos para trabajar
```console
INSERT INTO usuarios (nombre, email)
  VALUES ('Jerry', 'jerry@example.com'), ('George', 'george@example.com');
```
3. Asegurémonos de que la información anterior se haya agregado correctamente obteniendo todas las entradas en usuarios:
```console
SELECT * FROM usuarios;
```
4. Para salir
```console
\q
```
## 3. Configuración de un servidor Express
1. Para configurar una aplicación Node.js y un servidor Express, primero cree un directorio para que viva el proyecto:
```console
mkdir node-api-postgres
cd node-api-postgres
```
2. Puede ejecutar "npm init -y" para crear un archivo
3. Querremos instalar Express para el servidor y node-postgres para conectarnos a PostgreSQL
```console
npm i express pg
```
4. Para crear el archivo de configuración
```console
npm install dotenv
```
5. Cree un archivo, que usaremos como punto de entrada para nuestro servidor.
```console
touch index.js
```
- Debe tener lo sgte:
```js
const express = require('express')
const bodyParser = require('body-parser')
const app = express()
const port = 3000

app.use(bodyParser.json())
app.use(
  bodyParser.urlencoded({
    extended: true,
  })
)
```
6. Le indicaremos una ruta para buscar una GETsolicitud en la /URL raíz y devolver algo de JSON:
```js
app.get('/', (solicitud, respuesta) => {
  respuesta.json({ info: 'Node.js, Express, y Postgres API' })
})
```
7. Ahora, configure la aplicación para escuchar en el puerto que configuró:
```js
app.listen(port, () => {
  console.log(`Aplicación ejecutándose en el puerto ${port}.`)
})
```
8. Desde la línea de comando, podemos iniciar el servidor presionando
```console
node index.js
```
9. Vaya a la barra de URL de su navegador y verá el JSON que configuramos anteriormente: http://localhost:3000
```text
info	"Node.js, Express, y Postgres API"
```
10. El servidor Express se está ejecutando ahora, pero solo está enviando algunos datos JSON estáticos que creamos. El siguiente paso es conectarse a PostgreSQL desde Node.js para poder realizar consultas dinámicas.
## 4. Conexión a una base de datos de Postgres desde Node.js
- Usaremos el módulo node-postgres para crear un grupo de conexiones. Por tanto, no tenemos que abrir y cerrar un cliente cada vez que hacemos una consulta.
- Una opción popular para la agrupación de producción sería utilizar pgBouncer, un agrupador de conexiones ligero para PostgreSQL.
- Cree un archivo llamado consultas.js y establezca la configuración de su conexión PostgreSQL
```console
touch consultas.js
```
```js
const Pool = require('pg').Pool
const pool = new Pool({
  user: 'postgres',
  host: 'IP',
  database: 'persona_db',
  password: 'password',
  port: 5432,
})
```
## 5. Creación de rutas para operaciones CRUD
- Crearemos seis funciones para seis rutas, como se muestra a continuación. Primero, cree todas las funciones para cada ruta. Luego, exporta las funciones para que sean accesibles:


| Método | Función | Equivalente | Body |
| --------- | --------- | --------- | --------- |
| GET: / | mostrarInicio() | http://localhost:3000/ | no tiene |
| GET: /usuarios | obtenerUsuarios() | http://localhost:3000/usuarios | no tiene |
| GET: /usuarios/:id | obtenerUsuarioPorID() | http://localhost:3000/usuarios:1 | no tiene |
| POST: /usuarios | crearUsuario() | http://localhost:3000/usuarios | { "nombre": "nemo", "email": "memo@gmail.com" } |
| PUT: /usuarios/:id | actualizarUsuario() | http://localhost:3000/usuarios:1 | { "nombre": "capitan", "email": "capitan@gmail.com" } |
| DELETE: /usuarios/:id | borrarUsuario() | http://localhost:3000/usuarios:1 | no tiene |
### 5.1. GET todos los usuarios
- Nuestro primer punto final será una solicitud GET. Podemos poner el SQL sin procesar que tocará la base de datos persona_db dentro de pool.query(). Vamos SELECT a todos los usuarios y ordenamos por ID .
```js
const obtenerUsuarios = (solicitud, respuesta) => {
  pool.query('SELECT * FROM usuarios ORDER BY id ASC', (error, resultados) => {
    if (error) {
      throw error;
    }
    respuesta.status(200).json(resultados.rows);
  });
};
```
### 5.2. GET un solo usuario por ID
- Para nuestra /usuarios/:id solicitud, obtendremos el id parámetro personalizado por URL y usaremos una cláusula WHERE para mostrar el resultado.

- En la consulta SQL, estamos buscando id=$1 . En este caso, $1 es un marcador de posición numerado que PostgreSQL usa de forma nativa en lugar del ?marcador de posición que puede reconocer de otras variaciones de SQL:
```js
const obtenerUsuarioPorID = (solicitud, respuesta) => {
  const newID = solicitud.params.id.slice(1);
  const id = parseInt(newID);
  pool.query('SELECT * FROM usuarios WHERE id = $1', [id], (error, resultados) => {
    if (error) {
      throw error;
    }
    respuesta.status(200).json(resultados.rows);
  });
};
```
### 5.3. POST un nuevo usuario
- La API llevará una solicitud GET y POST al /usuarios endpoint. En la solicitud POST, agregaremos un nuevo usuario. En esta función, estamos extrayendo elname propiedades y emaildel cuerpo de la solicitud e insertamos los valores con INSERT:
```js
const crearUsuario = (solicitud, respuesta) => {
  const { nombre, email } = solicitud.body;
  pool.query(
    'INSERT INTO usuarios (nombre, email) VALUES ($1, $2) RETURNING *',
    [nombre, email],
    (error, resultados) => {
      if (error) {
        throw error;
      }
      respuesta.status(201).send(`Usuario agregado con ID: ${resultados.rows[0].id}`);
    }
  );
};
```
### 5.4. PUT datos actualizados en un usuario existente
- El /usuarios/:id endpoint también tomará dos solicitudes HTTP, GET la que creamos para obtenerUsuarioPorID y un PUT para modificar un usuario existente. Para esta consulta, combinaremos lo que aprendimos en GET y POST para usar la cláusula UPDATE.

- Vale la pena señalar que PUT es idempotente, lo que significa que se puede hacer exactamente la misma llamada una y otra vez y producirá el mismo resultado. PUT es diferente a POST, en el que exactamente la misma llamada repetida generará continuamente nuevos usuarios con los mismos datos:
```js
const actualizarUsuario = (solicitud, respuesta) => {
  const newID = solicitud.params.id.slice(1);
  const id = parseInt(newID);
  const { nombre, email } = solicitud.body;

  pool.query(
    'UPDATE usuarios SET nombre = $1, email = $2 WHERE id = $3',
    [nombre, email, id],
    (error, resultados) => {
      if (error) {
        throw error;
      }
      respuesta.status(200).send(`Usuario modificado con ID: ${id}`);
    }
  );
};
```
### 5.5. DELETE un usuario
- Finalmente, usaremos la cláusula DELETE dentro /usuarios/:id para eliminar un usuario específico por ID. Esta llamada es muy similar a nuestra función: obtenerUsuarioPorID().
```js
const borrarUsuario = (solicitud, respuesta) => {
  const newID = solicitud.params.id.slice(1);
  const id = parseInt(newID);
  pool.query('DELETE FROM usuarios WHERE id = $1', [id], (error, resultados) => {
    if (error) {
      throw error;
    }
    respuesta.status(200).send(`Usuario eliminado con ID: ${id}`);
  });
};
```
### 5.6. Exportación de funciones CRUD en una API REST
- Para acceder a estas funciones desde index.js, necesitaremos exportarlas. Podemos hacerlo con module.exports, creando un objeto de funciones. Como estamos usando la sintaxis de ES6 , podemos escribir obtenerUsuarios en lugar de obtenerUsuarios:obtenerUsuarios y así sucesivamente:
```js
module.exports = {
  obtenerUsuarios,
  obtenerUsuarioPorID,
  crearUsuario,
  actualizarUsuario,
  borrarUsuario,
};
```
### 5.7. Configuración de funciones CRUD en una API REST
- Ahora que tenemos todas nuestras consultas, debemos incluirlas en el archivo index.js y crear rutas de endpoint para todas las funciones de consulta que creamos.
```js
const db = require('./consultas');
```
- Ahora, para cada punto final, configuraremos el método de solicitud HTTP, la ruta de URL del punto final y la función relevante:
```js
  app.get('/usuarios', db.obtenerUsuarios);
  app.get('/usuarios/:id', db.obtenerUsuarioPorID);
  app.post('/usuarios', db.crearUsuario);
  app.put('/usuarios/:id', db.actualizarUsuario);
  app.delete('/usuarios/:id', db.borrarUsuario);
  ```
### 5.8. Pruebas
- Ejecutar 
```console
node index.js
```
- Probar con el Thunder Client herramienta de vscode
- ejm crear usuario
```text
Colocar:
POST = http://localhost:3000/usuarios
body ={ 
  "nombre": "nemo",
   "email": "memo@gmail.com" 
   }
luego SEND
```
## 6. Referencia
- [CRUD REST API  with Node.js, Express, and PostgreSQL](https://blog.logrocket.com/crud-rest-api-node-js-express-postgresql/)
- [CÓMO Descargar e INSTALAR POSTGRESQL en WINDOWS 10](https://www.youtube.com/watch?v=FtWA60xuOJs)
- [Solución - pgAdmin 4 fatal error the application server could not be contacted](https://www.youtube.com/watch?v=2OiaNoi3P4w)
- [Open postgreSQL through command prompt in windows PC](https://www.youtube.com/watch?v=1Za_EzTIXVY)
- [RESOLVED postgres psql 'more' is not recognized as an internal or external command](https://www.youtube.com/watch?v=tWcyp8_2Wsk)
- [Ejecutar un servidor PostgreSQL de forma manual](https://www.youtube.com/watch?v=eQ-sjRQDbh8)
- [SQL - Postgresql, acceso desde consola](https://www.youtube.com/watch?v=una5HNHqLTI)

---


<div style="page-break-before: always;"></div>


# 📄 README.md

- [1. Iniciando el proyecto](#1-iniciando-el-proyecto)
- [2. Creando el package.json](#2-creando-el-packagejson)
- [3. Instalando las dependecias](#3-instalando-las-dependecias)
- [4. Crear el tsconfig.json](#4-crear-el-tsconfigjson)
- [5. Crear las rutas de alojamiento de desarrollo y producción](#5-crear-las-rutas-de-alojamiento-de-desarrollo-y-producción)
- [6. Creando el servidor](#6-creando-el-servidor)
- [7. Creando los comando de ejecución](#7-creando-los-comando-de-ejecución)
- [8. Ejecutar en modo desarrollo](#8-ejecutar-en-modo-desarrollo)
- [9. Para llevar a producción](#9-para-llevar-a-producción)
- [10. Ejecutar el producto final app.js](#10-ejecutar-el-producto-final-appjs)
- [11. Referencia](#11-referencia)

## 1. Iniciando el proyecto
- Crea el archivo .gitignore y coloca node modules para que no te suba al github las dependencias
```console
node_modules
```
## 2. Creando el package.json
- Inicializa el proyecto
```console
npm init

package name: (microservicio-api-user-kong-repositorio)
version: (1.0.0)
description: microservicio con get que devuelve un mensaje Usuario
entry point: (index.js)
test command:
git repository: (https://github.com/xixay/microservicio-api-user-kong-repositorio.git)
keywords:
author: Xixay
license: (ISC)
```
## 3. Instalando las dependecias
- para que reconozca type script y node y express de manera local
```console
npm i -D express @types/express @types/node nodemon ts-node typescript cors --save-dev @types/cors body-parser
```
## 4. Crear el tsconfig.json
- Usar el sgte comando para inicializar el proyecto creando el fichero tsconfig.json
```console
tsc --init
```
## 5. Crear las rutas de alojamiento de desarrollo y producción
- Dentro de tsconfig.json descomentaremos rootDir donde estaran los archivos de desarrollo type script y la opción outDir elegiremos una localización donde se dejarán los ficheros .js compilados.
```json
{
  "compilerOptions": {
    "rootDir": "./src",                                  /* Especifique la carpeta raíz dentro de sus archivos de origen. */
    "moduleResolution": "node",                       /* Especifique cómo busca TypeScript un archivo de un especificador de módulo dado. */
    "outDir": "./dist",                                   /* Especifique una carpeta de salida para todos los archivos emitidos. */
    "removeComments": true,                           /* Deshabilitar la emisión de comentarios. */

  }
}

```
## 6. Creando el servidor
- Dentro de nuestro proyecto crearemos una carpeta llamada src. Dentro de esta carpeta crearemos un fichero llamado app.ts con el siguiente contenido:
```ts
// lib/app.ts
import express from "express";
import cors from "cors";
import bodyParser from "body-parser";

// Crear una nueva instancia de aplicación express
const app: express.Application = express();

//puerto
const port = 8765;
//credenciales(permisos de GET,POST,PUT,etc)
app.use(cors());
//accesar a la información del cuerpo(de donde se envia la solicitud)
app.use(bodyParser.json());
//metodo get
app.get("/users", (solicitud: express.Request, respuesta: express.Response) => {
  //status
  respuesta.status(200);
  //mensaje a mostrar en localhost:8765
  respuesta.send("Envío usuarios");
});

app.listen(port, () => {
  console.log("Servicio levantado correctamente en " + port + "!");
});

```
## 7. Creando los comando de ejecución
- Dentro de nuestro package.json introduciremos los script para ejecutar las tareas dese consola
```json
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1",
    "start": "node dist/app.js",// Iniciara el archivo compilado
    "dev": "nodemon src/app.ts",// Iniciara en el modo desarrollo
    "build": "tsc -p ."//Lo llevara para produccion, osea lo compilara
  },
```
```text
1. nodemon(Ejecuta archivos typeScript)
2. tsc(Transforma typeScript a javaScript)
3. node(Ejecuta archivos javaScript)
```
## 8. Ejecutar en modo desarrollo
```console
npm run dev
```
>Ir a localhost:8765
## 9. Para llevar a producción
```console
npm run build
```
```text
De esta manera se crea el archivo app.js
```
## 10. Ejecutar el producto final app.js
```console
npm run start
```
>Ir a localhost:8765
## 11. Referencia
- [¿Cómo configurar NodeJS y Express con Typescript? ¡Configuración inicial!](https://www.youtube.com/watch?v=HONRQUFqFkA)
- [Solicitudes HTTP con Axios](https://styde.net/solicitudes-http-con-axios/)
- [Kong: El King de los Microservicios](https://medium.com/codenares/kong-el-king-de-los-microservicios-f54d9d307e69)

---


<div style="page-break-before: always;"></div>


# 📄 README.md

- [1. Iniciando el proyecto](#1-iniciando-el-proyecto)
- [2. Creando el package.json](#2-creando-el-packagejson)
- [3. Instalando las dependecias](#3-instalando-las-dependecias)
- [4. Crear el tsconfig.json](#4-crear-el-tsconfigjson)
- [5. Crear las rutas de alojamiento de desarrollo y producción](#5-crear-las-rutas-de-alojamiento-de-desarrollo-y-producción)
- [6. Creando el servidor](#6-creando-el-servidor)
- [7. Creando los comando de ejecución](#7-creando-los-comando-de-ejecución)
- [8. Ejecutar en modo desarrollo](#8-ejecutar-en-modo-desarrollo)
- [9. Para llevar a producción](#9-para-llevar-a-producción)
- [10. Ejecutar el producto final app.js](#10-ejecutar-el-producto-final-appjs)
- [11. Referencia](#11-referencia)

## 1. Iniciando el proyecto
- Crea el archivo .gitignore y coloca node modules para que no te suba al github las dependencias
```console
node_modules
```
## 2. Creando el package.json
- Inicializa el proyecto
```console
npm init

package name: (microservicio-api-account-kong-repositorio)
version: (1.0.0)
description: microservicio con get que devuelve un mensaje Cuentas
entry point: (index.js)
test command:
git repository: (https://github.com/xixay/microservicio-api-account-kong-repositorio/.git)
keywords:
author: Xixay
license: (ISC)
```
## 3. Instalando las dependecias
- para que reconozca type script y node y express de manera local
```console
npm i -D express @types/express @types/node nodemon ts-node typescript cors --save-dev @types/cors body-parser
```
## 4. Crear el tsconfig.json
- Usar el sgte comando para inicializar el proyecto creando el fichero tsconfig.json
```console
tsc --init
```
## 5. Crear las rutas de alojamiento de desarrollo y producción
- Dentro de tsconfig.json descomentaremos rootDir donde estaran los archivos de desarrollo type script y la opción outDir elegiremos una localización donde se dejarán los ficheros .js compilados.
```json
{
  "compilerOptions": {
    "rootDir": "./src",                                  /* Especifique la carpeta raíz dentro de sus archivos de origen. */
    "moduleResolution": "node",                       /* Especifique cómo busca TypeScript un archivo de un especificador de módulo dado. */
    "outDir": "./dist",                                   /* Especifique una carpeta de salida para todos los archivos emitidos. */
    "removeComments": true,                           /* Deshabilitar la emisión de comentarios. */

  }
}

```
## 6. Creando el servidor
- Dentro de nuestro proyecto crearemos una carpeta llamada src. Dentro de esta carpeta crearemos un fichero llamado app.ts con el siguiente contenido:
```ts
// lib/app.ts
import express from "express";
import cors from "cors";
import bodyParser from "body-parser";

// Crear una nueva instancia de aplicación express
const app: express.Application = express();

//puerto
const port = 8901;
//credenciales(permisos de GET,POST,PUT,etc)
app.use(cors());
//accesar a la información del cuerpo(de donde se envia la solicitud)
app.use(bodyParser.json());
//metodo get
app.get(
  "/accounts",
  (solicitud: express.Request, respuesta: express.Response) => {
    //status
    respuesta.status(200);
    //mensaje a mostrar en localhost:8901
    respuesta.send("Envío cuentas");
  }
);

app.listen(port, () => {
  console.log("Servicio levantado correctamente en " + port + "!");
});

```
## 7. Creando los comando de ejecución
- Dentro de nuestro package.json introduciremos los script para ejecutar las tareas dese consola
```json
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1",
    "start": "node dist/app.js",// Iniciara el archivo compilado
    "dev": "nodemon src/app.ts",// Iniciara en el modo desarrollo
    "build": "tsc -p ."//Lo llevara para produccion, osea lo compilara
  },
```
```text
1. nodemon(Ejecuta archivos typeScript)
2. tsc(Transforma typeScript a javaScript)
3. node(Ejecuta archivos javaScript)
```
## 8. Ejecutar en modo desarrollo
```console
npm run dev
```
>Ir a localhost:8901
## 9. Para llevar a producción
```console
npm run build
```
```text
De esta manera se crea el archivo app.js
```
## 10. Ejecutar el producto final app.js
```console
npm run start
```
>Ir a localhost:8901
## 11. Referencia
- [¿Cómo configurar NodeJS y Express con Typescript? ¡Configuración inicial!](https://www.youtube.com/watch?v=HONRQUFqFkA)
- [Solicitudes HTTP con Axios](https://styde.net/solicitudes-http-con-axios/)
- [Kong: El King de los Microservicios](https://medium.com/codenares/kong-el-king-de-los-microservicios-f54d9d307e69)

---


<div style="page-break-before: always;"></div>


# 📄 README.md

## 1. Contenedor Kong
### 1.1. Crear una red acoplable
- crear network
```console
docker network create kong-net-2
```
- listar network
```console
docker network ls
```
###  1.2. Vincule Kong a un contenedor PostgreSQL
1. Crear contenedor postgres
```console
sudo docker run --name kong-database-2 \
--network=kong-net-2 \
-p 5555:5432 \
-e "POSTGRES_USER=kong" \
-e "POSTGRES_DB=kong" \
-e POSTGRES_PASSWORD=kongpass \
-d postgres:9.6
```
2. iniciar contenedor
```console
docker start kong-database-2
```
3. obtener la dirección <IP>, por donde corre el contenedor
```console
docker inspect kong-database-2// out:172.18.0.2
```
4. entrar a los comandos de postgres y editar
```console
psql -h 172.18.0.2 -U kong -W
contraseña:kong
```
5. crear la base de datos
- No es necesario ya esta creado, para ver solo listar
```psql
\l
```
Listado de base de datos
| Nombre    | Dueño | Codificación |  Collate   |   Ctype    |  Privilegios |
|-----------|-------|--------------|------------|------------|--------------|
| kong      | kong  | UTF8         | en_US.utf8 | en_US.utf8 |              |
| postgres  | kong  | UTF8         | en_US.utf8 | en_US.utf8 |              |
| template0 | kong  | UTF8         | en_US.utf8 | en_US.utf8 | =c/kong      |
|           |       |              |            |            | kong=CTc/kong|
| template1 | kong  | UTF8         | en_US.utf8 | en_US.utf8 | =c/kong      |
|           |       |              |            |            | kong=CTc/kong|

- salir
```psql
\q
```
### 1.3. Prepara tu base de datos
1. Ejecute las migraciones de la base de datos con un contenedor Kong
```console
docker run --rm \
--network=kong-net-2 \
-e "KONG_DATABASE=postgres" \
-e "KONG_PG_HOST=kong-database-2" \
-e "KONG_PG_PASSWORD=kongpass" \
-e "KONG_PASSWORD=test" \
kong/kong-gateway:2.8.1.3-alpine kong migrations bootstrap
```
2. Como confirmacion la ultima linea
```console
87 migrations processed
87 executed
Database is up-to-date
```
### 1.4. Comenzar Kong
- No debe estar corriendo otro contenedor kong-gateway
```console
docker run -d --name kong-gateway-2 \
  --network=kong-net-2 \
  -e "KONG_DATABASE=postgres" \
  -e "KONG_PG_HOST=kong-database-2" \
  -e "KONG_PG_USER=kong" \
  -e "KONG_PG_PASSWORD=kongpass" \
  -e "KONG_PROXY_ACCESS_LOG=/dev/stdout" \
  -e "KONG_ADMIN_ACCESS_LOG=/dev/stdout" \
  -e "KONG_PROXY_ERROR_LOG=/dev/stderr" \
  -e "KONG_ADMIN_ERROR_LOG=/dev/stderr" \
  -e "KONG_ADMIN_LISTEN=0.0.0.0:8001" \
  -e "KONG_ADMIN_GUI_URL=http://localhost:8002" \
  -e KONG_LICENSE_DATA \
  -p 8000:8000 \
  -p 8443:8443 \
  -p 8001:8001 \
  -p 8444:8444 \
  -p 8002:8002 \
  -p 8445:8445 \
  -p 8003:8003 \
  -p 8004:8004 \
  kong/kong-gateway:2.8.1.3-alpine
```
### 1.5. Verificar su instalación
```console
curl -i http://localhost:8001/
//o mejor
curl -i -X GET --url http://localhost:8001/services
```
### 1.6. Verificar Kong Manager
- (No disponible en OSS) Verifique que Kong Manager se esté ejecutando accediendo a él usando la URL especificada en KONG_ADMIN_GUI_URL:
```text
http://localhost:8002
```
## Crear los microservicios
- [microservicio ussers](https://github.com/xixay/microservicio-api-user-kong-repositorio)
- [microservicio accounts](https://github.com/xixay/microservicio-api-account-kong-repositorio/)
## Enlazar el microservicio api-user
```console
curl -i -X POST http://localhost:8001/services/ \
--data name=api-user \
--data 'upstream_url=http://localhost:8765' \
--data 'paths[]=/users'

###### 1ra
curl -i -X POST http://localhost:8001/services/ \
--data name=api-user \
--data url='http://localhost:8765'

curl -i http://localhost:8001/services/api-user

curl -i -X POST http://localhost:8001/services/api-user/routes \
  --data 'paths[]=/users' \
  --data name=usuarios

curl -i -X GET http://localhost:8000/users/request
#######
###### 2da
curl -i -X POST http://localhost:8001/services/ \
--data name=api-user \
--data url='http://localhost:8765/users'

curl -i http://localhost:8001/services/api-user

curl -i -X POST http://localhost:8001/services/api-user/routes \
  --data 'paths[]=/users' \
  --data name=usuarios

curl -i -X GET http://localhost:8000/users/request

http://localhost:8001/services/





curl -i -X POST http://localhost:8001/services/api-user/routes \
     -H "Content-Type: application/json" \
     -d '{"name": "test-route", "paths": [ "/path/users" ]}'
#######
#########3ra
curl -i -X POST \
--url http://localhost:8001/services/ \
--data 'name=api-user' \
--data 'upstream_url=http://localhost:8765' \
--data 'request_path=/users'
#############
####
curl -i -X POST \
--url http://localhost:8001/services/ \
--data 'name=api-user' \
--data 'url=http://localhost:8765' \
--data 'paths[]=/users'
#####
#####
curl -i -X POST \
  --url http://localhost:8001/services/ \
  --data 'name=example-service' \
  --data 'url=http://mockbin.org'

curl -i -X POST \
  --url http://localhost:8001/services/ \
  --data 'name=user-service' \
  --data 'url=http://localhost:8765'

curl -i -X POST \
  --url http://localhost:8001/services/example-service/routes \
  --data 'hosts[]=user.com'

curl -i -X POST \
  --url http://localhost:8001/services/user-service/routes \
  --data 'hosts[]=user.com'


curl -i -X GET \
  --url http://localhost:8000/ \
  --header 'Host: example.com'

curl -i -X GET \
  --url http://localhost:8000/ \
  --header 'Host: user.com'

#####
#####
curl -i -X POST \ 
--url http://localhost:8001/apis/ \ 
--data ’name=mockbin’ \
--data ’upstream_url=http://mockbin.com/’ \
--data ’request_host=mockbin.com’
#####
```
## Enlazar el microservicio api-account
```console
curl -i -X POST --url http://localhost:8001/apis/ \
--data 'name=api-account' \
--data 'upstream_url=http://localhost:8901' \
--data 'request_path=/accounts'
```
## Significado
- name: nombre descriptivo que queremos que tenga el microservicio dentro de Kong
- upstream_url: url hacia donde se va a redirigir el tráfico.
- request_path: ruta que dispara esta parte de la API.

---


<div style="page-break-before: always;"></div>


# 📄 README.md

[<< INDICE](https://github.com/xixay/ayuda-memoria)

# microservicio-repositorio

| Tema | Enlace | Tema | Enlace |
|------|--------|------|--------|
| **1. Microservicios** | [Ver](./microservicio.md) | **2. Microservicios con Eventos** | [Ver](./microservicio-con-eventos.md) |

<p align="center">
  <a href="http://nestjs.com/" target="blank"><img src="https://nestjs.com/img/logo-small.svg" width="200" alt="Nest Logo" /></a>
</p>

[circleci-image]: https://img.shields.io/circleci/build/github/nestjs/nest/master?token=abc123def456
[circleci-url]: https://circleci.com/gh/nestjs/nest

  <p align="center">A progressive <a href="http://nodejs.org" target="_blank">Node.js</a> framework for building efficient and scalable server-side applications.</p>
    <p align="center">
<a href="https://www.npmjs.com/~nestjscore" target="_blank"><img src="https://img.shields.io/npm/v/@nestjs/core.svg" alt="NPM Version" /></a>
<a href="https://www.npmjs.com/~nestjscore" target="_blank"><img src="https://img.shields.io/npm/l/@nestjs/core.svg" alt="Package License" /></a>
<a href="https://www.npmjs.com/~nestjscore" target="_blank"><img src="https://img.shields.io/npm/dm/@nestjs/common.svg" alt="NPM Downloads" /></a>
<a href="https://circleci.com/gh/nestjs/nest" target="_blank"><img src="https://img.shields.io/circleci/build/github/nestjs/nest/master" alt="CircleCI" /></a>
<a href="https://coveralls.io/github/nestjs/nest?branch=master" target="_blank"><img src="https://coveralls.io/repos/github/nestjs/nest/badge.svg?branch=master#9" alt="Coverage" /></a>
<a href="https://discord.gg/G7Qnnhy" target="_blank"><img src="https://img.shields.io/badge/discord-online-brightgreen.svg" alt="Discord"/></a>
<a href="https://opencollective.com/nest#backer" target="_blank"><img src="https://opencollective.com/nest/backers/badge.svg" alt="Backers on Open Collective" /></a>
<a href="https://opencollective.com/nest#sponsor" target="_blank"><img src="https://opencollective.com/nest/sponsors/badge.svg" alt="Sponsors on Open Collective" /></a>
  <a href="https://paypal.me/kamilmysliwiec" target="_blank"><img src="https://img.shields.io/badge/Donate-PayPal-ff3f59.svg"/></a>
    <a href="https://opencollective.com/nest#sponsor"  target="_blank"><img src="https://img.shields.io/badge/Support%20us-Open%20Collective-41B883.svg" alt="Support us"></a>
  <a href="https://twitter.com/nestframework" target="_blank"><img src="https://img.shields.io/twitter/follow/nestframework.svg?style=social&label=Follow"></a>
</p>
  <!--[![Backers on Open Collective](https://opencollective.com/nest/backers/badge.svg)](https://opencollective.com/nest#backer)
  [![Sponsors on Open Collective](https://opencollective.com/nest/sponsors/badge.svg)](https://opencollective.com/nest#sponsor)-->

## Description

[Nest](https://github.com/nestjs/nest) framework TypeScript starter repository.

## Installation

```bash
$ npm install
```

## Running the app

```bash
# development
$ npm run start

# watch mode
$ npm run start:dev

# production mode
$ npm run start:prod
```

## Test

```bash
# unit tests
$ npm run test

# e2e tests
$ npm run test:e2e

# test coverage
$ npm run test:cov
```

## Support

Nest is an MIT-licensed open source project. It can grow thanks to the sponsors and support by the amazing backers. If you'd like to join them, please [read more here](https://docs.nestjs.com/support).

## Stay in touch

- Author - [Kamil Myśliwiec](https://kamilmysliwiec.com)
- Website - [https://nestjs.com](https://nestjs.com/)
- Twitter - [@nestframework](https://twitter.com/nestframework)

## License

Nest is [MIT licensed](LICENSE).

[<< INDICE](https://github.com/xixay/ayuda-memoria)

---


<div style="page-break-before: always;"></div>


# 📄 README.md

[<< INDICE](https://github.com/xixay/ayuda-memoria)

# microservicio-repositorio-cliente

| Tema | Enlace | Tema | Enlace |
|------|--------|------|--------|
| **1. Microservicio cliente** | [Ver](./microservicio-cliente.md) | **2. Microservicio cliente con Eventos** | [Ver](./microservicio-cliente-con-eventos.md) |

<p align="center">
  <a href="http://nestjs.com/" target="blank"><img src="https://nestjs.com/img/logo-small.svg" width="200" alt="Nest Logo" /></a>
</p>

[circleci-image]: https://img.shields.io/circleci/build/github/nestjs/nest/master?token=abc123def456
[circleci-url]: https://circleci.com/gh/nestjs/nest

  <p align="center">A progressive <a href="http://nodejs.org" target="_blank">Node.js</a> framework for building efficient and scalable server-side applications.</p>
    <p align="center">
<a href="https://www.npmjs.com/~nestjscore" target="_blank"><img src="https://img.shields.io/npm/v/@nestjs/core.svg" alt="NPM Version" /></a>
<a href="https://www.npmjs.com/~nestjscore" target="_blank"><img src="https://img.shields.io/npm/l/@nestjs/core.svg" alt="Package License" /></a>
<a href="https://www.npmjs.com/~nestjscore" target="_blank"><img src="https://img.shields.io/npm/dm/@nestjs/common.svg" alt="NPM Downloads" /></a>
<a href="https://circleci.com/gh/nestjs/nest" target="_blank"><img src="https://img.shields.io/circleci/build/github/nestjs/nest/master" alt="CircleCI" /></a>
<a href="https://coveralls.io/github/nestjs/nest?branch=master" target="_blank"><img src="https://coveralls.io/repos/github/nestjs/nest/badge.svg?branch=master#9" alt="Coverage" /></a>
<a href="https://discord.gg/G7Qnnhy" target="_blank"><img src="https://img.shields.io/badge/discord-online-brightgreen.svg" alt="Discord"/></a>
<a href="https://opencollective.com/nest#backer" target="_blank"><img src="https://opencollective.com/nest/backers/badge.svg" alt="Backers on Open Collective" /></a>
<a href="https://opencollective.com/nest#sponsor" target="_blank"><img src="https://opencollective.com/nest/sponsors/badge.svg" alt="Sponsors on Open Collective" /></a>
  <a href="https://paypal.me/kamilmysliwiec" target="_blank"><img src="https://img.shields.io/badge/Donate-PayPal-ff3f59.svg"/></a>
    <a href="https://opencollective.com/nest#sponsor"  target="_blank"><img src="https://img.shields.io/badge/Support%20us-Open%20Collective-41B883.svg" alt="Support us"></a>
  <a href="https://twitter.com/nestframework" target="_blank"><img src="https://img.shields.io/twitter/follow/nestframework.svg?style=social&label=Follow"></a>
</p>
  <!--[![Backers on Open Collective](https://opencollective.com/nest/backers/badge.svg)](https://opencollective.com/nest#backer)
  [![Sponsors on Open Collective](https://opencollective.com/nest/sponsors/badge.svg)](https://opencollective.com/nest#sponsor)-->

## Description

[Nest](https://github.com/nestjs/nest) framework TypeScript starter repository.

## Installation

```bash
$ npm install
```

## Running the app

```bash
# development
$ npm run start

# watch mode
$ npm run start:dev

# production mode
$ npm run start:prod
```

## Test

```bash
# unit tests
$ npm run test

# e2e tests
$ npm run test:e2e

# test coverage
$ npm run test:cov
```

## Support

Nest is an MIT-licensed open source project. It can grow thanks to the sponsors and support by the amazing backers. If you'd like to join them, please [read more here](https://docs.nestjs.com/support).

## Stay in touch

- Author - [Kamil Myśliwiec](https://kamilmysliwiec.com)
- Website - [https://nestjs.com](https://nestjs.com/)
- Twitter - [@nestframework](https://twitter.com/nestframework)

## License

Nest is [MIT licensed](LICENSE).

[<< INDICE](https://github.com/xixay/ayuda-memoria)


---


<div style="page-break-before: always;"></div>


# 📄 README.md

[<< INDICE](https://github.com/xixay/ayuda-memoria)
- [1. Instalar biblioteca](#1-instalar-biblioteca)
- [2. Publicación de un Mensaje o Evento por parte del cliente](#2-publicación-de-un-mensaje-o-evento-por-parte-del-cliente)
- [3. Inyectar el servicio de saludo usando ClientProxy](#3-inyectar-el-servicio-de-saludo-usando-clientproxy)
- [4. Probar las rutas](#4-probar-las-rutas)
- [5. Referencia](#5-referencia)

## 1. Instalar biblioteca
```
npm i --save @nestjs/microservices amqplib amqp-connection-manager
```
## 2. Publicación de un Mensaje o Evento por parte del cliente
- Configurar la aplicación cliente para hablar con el intermediario de mensajes RabbitMQ, para ello ir a  src/app.module.ts.
```ts
import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
// importar
import { ClientsModule, Transport } from '@nestjs/microservices';

@Module({
  // imports: [],
  imports: [
    // Registra nuestro corredor RabbitMQ
    ClientsModule.register([
      {
        name: 'SALUDO_SERVICIO', // nombre de token como SALUDO_SERVICIO para nuestro servicio de saludo. Este token nos ayuda a inyectar este servicio donde queramos usarlo en nuestra aplicación.
        transport: Transport.RMQ, // nuestro microservicio responde a  RMQ
        options: {
          urls: ['amqp://guest:guest@localhost:5672'], // URL de conexión
          queue: 'cola_de_libros',
          // Opciones de cola adicionales
          queueOptions: {
            durable: false,
          },
        },
      },
    ]),
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
```
## 3. Inyectar el servicio de saludo usando ClientProxy
- Ir a src/app.service.ts y modificar
```ts
// import { Injectable } from '@nestjs/common';
// Agregar decorador @Inject() para inyectar el servicio de saludo usando ClientProxy
import { Inject, Injectable } from '@nestjs/common';
import { ClientProxy } from '@nestjs/microservices';

@Injectable()
export class AppService {
  /* Agregar Constructor */
  constructor(@Inject('SALUDO_SERVICIO') private cliente: ClientProxy) {}
  /* Modificar y agregar patron cmd */
  async obtenerHola() {
    return this.cliente.send({ cmd: 'saludo' }, 'codificador progresivo');
  }
  /* Enviar mensajes */
  async obtenerHolaAsincrono() {
    const mensaje = await this.cliente.send(
      { cmd: 'saludo-asincrono' },
      'Codificador Progresivo',
    );
    return mensaje;
  }
  /* Publicar evento*/
  /* estos eventos se enrutan al intermediario (específicamente cola_de_libros ) desde donde nuestro servicio de saludo recibe esos mensajes y actúa en consecuencia*/
  async publicarEvento() {
    this.cliente.emit('libro-creado', {
      nombreDelLibro: 'El Camino De Los Reyes',
      autor: 'Brandon Sanderson',
    });
  }
}
```
- Ir a app.controller.ts, modificar y crear rutas
```ts
import { Controller, Get } from '@nestjs/common';
import { AppService } from './app.service';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}
  /* Agregar la ruta saludo*/
  @Get('/saludo')
  async obtenerHola() {
    return this.appService.obtenerHola();
  }
  /* Agregar la ruta saludo-asincrono*/
  @Get('/saludo-asincrono')
  async obtenerHolaAsincrono() {
    return this.appService.obtenerHolaAsincrono();
  }
  /* Agregar la ruta publish-event*/
  @Get('/publicar-evento')
  async publicarEvento() {
    this.appService.publicarEvento();
  }
}
```
## 4. Probar las rutas
- Ejecutar en modo desarrollo tanto el backend como el cliente
```console
npm run start:dev
```
Ejecutar las rutas correspondientes GET
|Api|Ruta|Descripcion|Metodo|
|----|----------------------------|--------------|-------------|
|GET|http://localhost:3000/saludo/|Obtener saludo|obtenerHola()|
|GET|http://localhost:3000/saludo-asincrono/|Enviar mensaje|obtenerHolaAsincrono()|
|GET|http://localhost:3000/publicar-evento/|Publicar evento|publicarEvento()|
## 5. Referencia
- [How to create a NestJS RabbitMQ Microservice](https://progressivecoder.com/how-to-create-a-nestjs-rabbitmq-microservice/)

[<< INDICE](https://github.com/xixay/ayuda-memoria)

---


<div style="page-break-before: always;"></div>

## 3. 🎨 Frontend


### 3.1. Formularios HTML


<div style="page-break-before: always;"></div>


# 📄 3.1. Formulario Html

# Formulario-Repositorio
 Capturar datos a través de formulario utilizando funciones en JavaScript


---


### 3.2. Vuetify


<div style="page-break-before: always;"></div>


# 📄 3.2.1. Vuetify (Intro)

[<< INDICE](../../README.md)
- [1. vue-vuetify-axios-repositorio](#1-vue-vuetify-axios-repositorio)
  - [1.1. instalando Vue](#11-instalando-vue)
    - [1.1.1. Crear proyecto](#111-crear-proyecto)
    - [1.1.2. Seleccionar las rutas](#112-seleccionar-las-rutas)
    - [1.1.3. Correr el servidor](#113-correr-el-servidor)
  - [1.2. instalando Vuetify](#12-instalando-vuetify)
    - [1.2.1. Instalar por terminal](#121-instalar-por-terminal)
    - [1.2.2. Agregar vuetify](#122-agregar-vuetify)
    - [1.2.3. Corriendo](#123-corriendo)
    - [1.2.4. Error 1er caracter](#124-error-1er-caracter)
  - [1.3. Instalar Axios](#13-instalar-axios)
  - [1.4. Preparacion inicial](#14-preparacion-inicial)
    - [1.4.1. Preparar la vista de portada](#141-preparar-la-vista-de-portada)
    - [1.4.2. Creando el componente Articulo](#142-creando-el-componente-articulo)
    - [1.4.3. Creando la vista Articulo](#143-creando-la-vista-articulo)
    - [1.4.4. Añadir la vista Articulo a las rutas](#144-añadir-la-vista-articulo-a-las-rutas)
  - [1.5. Rutas apis CRUD](#15-rutas-apis-crud)
    - [1.5.1. Creando la data-tables](#151-creando-la-data-tables)
    - [1.5.2. Agregando el metodo obtener articulos](#152-agregando-el-metodo-obtener-articulos)
    - [1.5.3. Creando el toolbar](#153-creando-el-toolbar)
    - [1.5.4. Creando el modal para agregar nuevo articulo](#154-creando-el-modal-para-agregar-nuevo-articulo)
    - [1.5.5. Agregando el metodo para crear articulo](#155-agregando-el-metodo-para-crear-articulo)
    - [1.5.6. Mejorando el servicio de creacion, agregando el registro](#156-mejorando-el-servicio-de-creacion-agregando-el-registro)
    - [1.5.7. Agregar el metodo de reseteo de datos del modal](#157-agregar-el-metodo-de-reseteo-de-datos-del-modal)
    - [1.5.8. Agregar el metodo para usar el mismo modal, tanto para editar y crear](#158-agregar-el-metodo-para-usar-el-mismo-modal-tanto-para-editar-y-crear)
    - [1.5.9. Agregando el metodo editar articulo](#159-agregando-el-metodo-editar-articulo)
    - [1.5.10. Agregando el metodo eliminar articulo](#1510-agregando-el-metodo-eliminar-articulo)
    - [1.5.11. Agregando el metodo para ver un articulo](#1511-agregando-el-metodo-para-ver-un-articulo)
    - [1.5.12. Agregar menu lateral](#1512-agregar-menu-lateral)
  - [1.6. Referencias](#16-referencias)

# 1. vue-vuetify-axios-repositorio
 Combinar la librería Axios, que facilita la realización de peticiones Ajax junto con Vuetify, una popular librería para VueJs para realizar Apps con estética Material Design
 ***
## 1.1. instalando Vue
```console
npm install -g @vue/cli 
```
### 1.1.1. Crear proyecto
```console
vue create my-app
❯ Manually select features 
```
### 1.1.2. Seleccionar las rutas
```console
>Router(space)
❯2.x
Use history mode for router? (Requires proper server setup for index fallback in production) (Y/n) y
❯ ESLint with error prevention only
❯Lint on save
❯ In dedicated config files
 Save this as a preset for future projects? (y/N) Y
  Save preset as: xx
```
### 1.1.3. Correr el servidor
```console
cd my-app
npm run serve
```
## 1.2. instalando Vuetify
### 1.2.1. Instalar por terminal
```console
vue add vuetify-cli
```
### 1.2.2. Agregar vuetify
- Ahora que tiene un proyecto instanciado, puede agregar Vue CLI package utilizando el CLI.
```console
vue add vuetify
> Still proceed? (y/N) Y
❯ Default (recommended)
```
### 1.2.3. Corriendo
```console
npm run serve
```
### 1.2.4. Error 1er caracter
- Si muestra un error en el primer carácter de cualquier lectura de archivo colocar
```JSON
"parser": '@babel/eslint-parser',
"parserOptions": {
    "requireConfigFile": false,
}
```
## 1.3. Instalar Axios
- Dentro de la carpeta my-app, instalar la dependencia
```console
npm install -D axios
```
## 1.4. Preparacion inicial
### 1.4.1. Preparar la vista de portada
- La vista HomeView.vue llama a el componente HelloWorld.vue, ir a ese componente y cambiar de nombre a Portada.vue
- Ir a HomeView.vue y importar el componente Portada.vue en lugar de HelloWorld.vue
```vue
<template>
  <!-- Llama al componente -->
  <portada/>
</template>

<script>
//Llama al componente
  import Portada from '../components/Portada'

  export default {
    name: 'Home',
    //Instancia el componente
    components: {
      Portada,
    },
  }
</script>
```
- Cambiar el bar, para ello ir a la aplicacion principal App.vue
```vue
<template>
  <v-app>
    <v-app-bar
      app
      color="primary"
      dark
    >
      <v-spacer></v-spacer>
      <v-btn
        href="https://github.com/vuetifyjs/vuetify/releases/latest"
        target="_blank"
        text
      >
        <span class="mr-2">Ir a Articulos</span>
        <v-icon>mdi-open-in-new</v-icon>
      </v-btn>
    </v-app-bar>
    <v-main>
      <router-view/>
    </v-main>
  </v-app>
</template>

<script>
export default {
  name: 'App',
  data: () => ({
    //
  }),
};
</script>

```
### 1.4.2. Creando el componente Articulo
- Ir a la carpeta my-app/src/components, y crear el componente Articulo.vue que se visualizara al inicio de la app
```vue
<template>
    <v-container>
      Articulos
    </v-container>
  </template>
  
  <script>
  
  </script>
  
  <style>
  
  </style>       
```
### 1.4.3. Creando la vista Articulo
- En la carpeta views, crear el archivo ArticuloView.vue, y añadir el componente articulo
```vue
<template>
  <!-- Llama al componente -->
  <articulo/>
</template>

<script>
//Llama al componente
  import Articulo from '../components/Articulo.vue'

  export default {
    name: 'ArticuloView',// ****La vista y el componente no deben tener el mismo name
    //Instancia el componente
    components: {
      Articulo,
    },
  }
</script>
```
### 1.4.4. Añadir la vista Articulo a las rutas
-Ir a la carpeta my-app/src/router/index.js, y añadir la vista Articulo.vue, y agregar su ruta
```js
import Vue from 'vue'
import VueRouter from 'vue-router'
import HomeView from '../views/HomeView.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',//http://localhost:8080/
    name: 'home',
    component: HomeView
  },
  {
    path: '/articulos',//http://localhost:8080/articulos
    name: 'articulos',
    component: function () {
      return import(/* webpackChunkName: "about" */ '../views/ArticuloView.vue')
    }
  },
  {
    path: '/about',//http://localhost:8080/fdfdffdfdfd
    name: 'about',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: function () {
      return import(/* webpackChunkName: "about" */ '../views/AboutView.vue')
    }
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
```
## 1.5. Rutas apis CRUD
### 1.5.1. Creando la data-tables
1. En el componente Articulo.vue, originalmente se tiene asi:
```vue
<template>
  <v-container>
    Articulos
  </v-container>
</template>

<script>

</script>

<style>

</style>
```
2. Agregando el v-card, el cual sera el lienzo de la tabla, dentro de container:

```vue
<template>
  <v-container pa-0>
    <v-card class="mt-15" max-width="100%">
    </v-card>
  </v-container>
</template>
```
3. Agregar la tabla dentro del v-card
```vue
<template>
  <v-container pa-0>
    <v-card class="mt-15" max-width="100%">
      <v-data-table
        :headers="columnas"//Aqui es el titulo de las columnas
        :items="articulos"//los datos de las columnas
        class="elevation-19"//elevacion de la tabla, hoja de estilo
      >
      </v-data-table>
    </v-card>
  </v-container>
</template>
```
4. En el script importar la dependencia Axios
```js
<script>
import axios from "axios"
</script>
```
5. Agregar el export default que enviara la informacion al home
```js
<script>
export default {
  name: "Articulo",//Nombre de la exportación
}
</script>
```
6. Agregar el data, donde estaran todas las variables
```js
<script>
export default {
  name: "Articulo",//Nombre de la exportación
  data() {//aqui estaran instanciadas todas las variables
    return {
        /* Variables */
    }
  },
}
</script>
```
7. Agregar las variables o datos que necesita el data-tables
```js
<script>
export default {
  name: "Articulo",//Nombre de la exportación
  data() {//aqui estaran instanciadas todas las variables
    return {
        url: "http://localhost:3000/articulos",//ENDPOINT, de donde recive los datos
      columnas: [
        { text: 'ID', value: 'id', class: 'primary  white--text'},
        { text: 'DESCRIPCIÓN', value: 'descripcion', class: 'primary  white--text' },
        { text: 'PRECIO', value: 'precio', class: 'primary  white--text' },
        { text: 'STOCK', value: 'stock', class: 'primary  white--text' }
      ],//titulos de las columnas
      articulos: [],//el array de objetos, que viene del metodo GET
    }
  },
}
</script>
```
8. se debe agregar el mounted el cual se iniciar antes que todo
```js
<script>
import axios from "axios"

export default {

  mounted() {//Lo 1ro que se monta al iniciar el componente
    /* El metodo que se iniciar por defecto*/
  },
}
</script>
```
### 1.5.2. Agregando el metodo obtener articulos
1. En los methods, crearemos el metodo obtener articulos, que llamara al metodo GET, que pedira que el backend le de informacion de la base de datos
```js
methods: {
    obtenerArticulos(){
      axios.get(this.url).then((response) => {//relaiza un GET para obtener la información
        console.log(response.data)//muestra por consola la información
        this.articulos = response.data//Guardando los datos que llegaron del backend
      })
      .catch(e => {
      // Capturamos los errores
      console.log(e)
      })
    }
}
```
2. En el mountend llamaremos a el metodo obtenerArticulos
```js
<script>
import axios from "axios"

export default {
  mounted() {//Lo 1ro que se monta al iniciar el componente
     this.obtenerArticulos()
  },
}
</script>
```
3. Articulo final queda:
```vue
<template>
    <v-container>
        <v-card class="mt-15" max-width="100%">
            <v-data-table
                :headers="columnas"
                :items="articulos"
                class="elevation-19"
            >
            </v-data-table>
        </v-card>
    </v-container>
  </template>
  
  <script>
  import axios from "axios"
  export default {
  name: "Articulo",//Nombre de la exportación
  data() {//aqui estaran instanciadas todas las variables
    return {
        /* Variables */
        url: "http://localhost:3000/articulos",//ENDPOINT, de donde recive los datos
      columnas: [
        { text: 'ID', value: 'id', class: 'primary  white--text'},
        { text: 'DESCRIPCIÓN', value: 'descripcion', class: 'primary  white--text' },
        { text: 'PRECIO', value: 'precio', class: 'primary  white--text' },
        { text: 'STOCK', value: 'stock', class: 'primary  white--text' }
      ],//titulos de las columnas
      articulos: [],//el array de objetos, que viene del metodo GET
    }
  },
  mounted() {//Lo 1ro que se monta al iniciar el componente
    /* El metodo que se iniciar por defecto*/
    this.obtenerArticulos()
  },
  methods: {
      obtenerArticulos(){
        axios.get(this.url).then((response) => {//relaiza un GET para obtener la información
          console.log(response.data)//muestra por consola la información
          this.articulos = response.data//Guardando los datos que llegaron del backend
        })
        .catch(e => {
        // Capturamos los errores
        console.log(e)
        })
      }
  }
}
  </script>
  <style>
  
  </style>
```
### 1.5.3. Creando el toolbar
1. Agregar un v-card arriba del v-card que tiene la tabla, quitar al container el padding, poner como margen de arriba 1
```vue
<template>
  <v-container pa-0>
    <!-- card del fondo -->
    <v-card class="mt-1" max-width="100%">
      <!-- card con toolbar -->
      <v-card flat height="50px" tile>
        <!--Aqui vendra el toolbar-->
      </v-card>
      <!-- tabla -->
      <v-data-table>
      </v-data-table>
    </v-card>
  </v-container>
  </template>
```
2. Agregar el toolbar con la propiedad dense(ocupara el espacio del v-card)
```js
  <!-- card con toolbar -->
  <v-card flat height="50px" tile>
    <v-toolbar dense>
      <!-- elementos del toolbar -->
    </v-toolbar>
  </v-card>
```
3. agregando icono navegador al toolbar 
```js
  <v-toolbar dense>
    <!-- app-bar -->
    <v-app-bar-nav-icon></v-app-bar-nav-icon>
  </v-toolbar>
```
4. agregando titulo al toolbar
```js
  <v-toolbar dense>
    <!-- app-bar -->
    <!-- titulo del toolbar -->
    <v-toolbar-title>Mis Articulos</v-toolbar-title>
  </v-toolbar>
```
5.  espacio entre titulo y boton que se agregara
```js
  <v-toolbar dense>
    <!-- app-bar -->
    <!-- titulo del toolbar -->
    <!-- espacio sobrante -->
      <v-spacer></v-spacer>
  </v-toolbar>
``` 
6.  agregar boton que adiciona articulos
```js
  <v-toolbar dense>
    <!-- app-bar -->
    <!-- titulo del toolbar -->
    <!-- espacio sobrante -->
     <!-- boton que adiciona articulos -->
      <v-btn icon>
        <v-icon>mdi-plus</v-icon>
      </v-btn>
  </v-toolbar>
```
### 1.5.4. Creando el modal para agregar nuevo articulo
1. Agregar el v-dialog, debajo de la tabla, pero se mostrara encima
```js
    <!-- Modal de nuevo articulo -->
    <v-dialog v-model="modalFormArticulo"
      width="500">
      <!-- Card que mostrara el modal -->
      <v-card>
        <!-- titulo card -->
        <!-- contenido del card -->
        <!-- Crea una linea divisora -->
        <!-- Los botones de accion -->
      </v-card>
    </v-dialog>
```
2. Titulo del modal
```js
  <v-card>
    <!-- h5=tamaño texto, color de relleno=primary, color texto=blanco -->
    <v-card-title class="text-h5 primary white--text">
      Nuevo Articulo
    </v-card-title>
  </v-card>
```
3. Agregando un formulario al contenido
```js
  <v-card-text>
    <v-container>
      <v-row>
        <v-col cols="12" sm="6" md="4">
          <v-text-field
            label="Descripción"
          ></v-text-field>
        </v-col>
        <v-col cols="12" sm="6" md="4">
          <v-text-field
            label="Precio"
          ></v-text-field>
        </v-col>
        <v-col cols="12" sm="6" md="4">
          <v-text-field
            label="Stock"
          ></v-text-field>
        </v-col>
      </v-row>
    </v-container>
  </v-card-text>

```
4. Agregando linea divisora 
```vue
<v-divider></v-divider>
```
5. Botones de accion del modal
```js
  <v-card-actions>
    <!-- Espacio -->
    <v-spacer></v-spacer>
    <!-- boton de cerrar -->
    <v-btn color="primary" text @click="modalFormArticulo = false">
      Cerrar
    </v-btn>
    <!-- boton de agregar -->
    <v-btn color="primary" text @click="modalFormArticulo = false">
      Agregar
    </v-btn>
  </v-card-actions>
```
6. Agregar la variable que representa a el modal en data
- Eso depende del nombre que se dio con v-model
- Debe estar en falso para ocultarse
```js
 data() {
    //aqui estaran instanciadas todas las variables
    return {
      // otras variables
      modalFormArticulo: false,//ocultar el modal
    }
  },
```
### 1.5.5. Agregando el metodo para crear articulo
1. En el toolbar agregar el @click que pondra en true el modal para mostrarlo
```js
  <v-toolbar dense>
    <!-- otros -->
    <!-- boton que adiciona articulos -->
    <v-btn icon @click="modalFormArticulo = true">
      <v-icon>mdi-plus</v-icon>
    </v-btn>
  </v-toolbar>
```
2. Inicializar en el data las variables que se utilizaran
```js
  data() {
    //aqui estaran instanciadas todas las variables
    return {
      // otras variables
      edtDescripcion: "",
      edtPrecio:0,
      edtStock:0,
    }
  },
```
3. Colocar las variables en el formulario
```js
    <v-container>
      <v-row>
        <v-col cols="12" sm="6" md="4">
          <v-text-field
            v-model="edtDescripcion"
            label="Descripción"
          ></v-text-field>
        </v-col>
        <v-col cols="12" sm="6" md="4">
          <v-text-field
            v-model="edtPrecio"
            label="Precio"
          ></v-text-field>
        </v-col>
        <v-col cols="12" sm="6" md="4">
          <v-text-field
            v-model="edtStock"
            label="Stock"
          ></v-text-field>
        </v-col>
      </v-row>
    </v-container>
```
4. Agregar la accion que adiciona el articulo en el modal
   - Agregar el metodo en el boton
```js
    <!-- acciones del card -->
    <v-card-actions>
      <!-- Espacio -->
      <v-spacer></v-spacer>
      <!-- boton de cerrar -->
      <v-btn color="primary" text @click="modalFormArticulo = false">
        Cerrar
      </v-btn>
      <!-- boton de agregar -->
      <v-btn color="primary" text @click="crearArticulo">
        Agregar
      </v-btn>
    </v-card-actions>
```
5. Agregar el metodo crearArticulo() en el script, debajo del metodo obtenerArticulos
```js
  methods:{
    crearArticulo(){
      <!-- Aqui las instrucciones -->
    }
  }
```
6. Agregar el metodo post para agregar articulo
```js
  crearArticulo(){
  //realiza un POST que envia información y obtiene información
  axios.post(this.url, {
      "descripcion": this.edtDescripcion,
      "precio": this.edtPrecio,
      "stock": this.edtStock
    })
    .then((response) => {
      console.log(response)
      this.modalFormArticulo = false//ocultar al enviar
      this.obtenerArticulos()
    })
    .catch((e) => {
      console.log(e)
    })
  }
```
7. El metodo para agregar articulo al final queda
```vue
<template>
    <v-container pa-0>
        <v-card class="mt-1" max-width="100%">
            <!-- card con toolbar -->
            <v-card flat height="50px" tile>
              <!--Aqui vendra el toolbar-->
              <v-toolbar dense>
                <!-- elementos del toolbar -->
                    <!-- app-bar -->
                <v-app-bar-nav-icon></v-app-bar-nav-icon>
                    <!-- titulo del toolbar -->
                <v-toolbar-title>Mis Articulos</v-toolbar-title>
                    <!-- espacio sobrante -->
                    <v-spacer></v-spacer>
                    <!-- boton que adiciona articulos -->
                    <v-btn icon @click="modalFormArticulo = true">
                    <v-icon>mdi-plus</v-icon>
                  </v-btn>
              </v-toolbar>
            </v-card>
            <!-- tabla -->
            <v-data-table
                :headers="columnas"
                :items="articulos"
                class="elevation-19"
            >
            </v-data-table>
                <!-- Modal de nuevo articulo -->
            <v-dialog v-model="modalFormArticulo"
              width="500">
              <!-- Card que mostrara el modal -->
              <v-card>
                <!-- titulo card -->
                <v-card-title class="text-h5 primary white--text">
                  Nuevo Articulo
                </v-card-title>
                <!-- contenido del card -->
                <v-card-text>
                  <v-container>
                    <v-row>
                      <v-col cols="12" sm="6" md="4">
                        <v-text-field
                          v-model="edtDescripcion"
                          label="Descripción"
                        ></v-text-field>
                      </v-col>
                      <v-col cols="12" sm="6" md="4">
                        <v-text-field
                          v-model="edtPrecio"
                          label="Precio"
                        ></v-text-field>
                      </v-col>
                      <v-col cols="12" sm="6" md="4">
                        <v-text-field
                          v-model="edtStock"
                          label="Stock"
                        ></v-text-field>
                      </v-col>
                    </v-row>
                  </v-container>
                </v-card-text>
                <!-- Crea una linea divisora -->
                <v-divider></v-divider>
                <!-- Los botones de accion -->
                <v-card-actions>
                  <!-- Espacio -->
                  <v-spacer></v-spacer>
                  <!-- boton de cerrar -->
                  <v-btn color="primary" text @click="modalFormArticulo = false">
                    Cerrar
                  </v-btn>
                  <!-- boton de agregar -->
                  <v-btn color="primary" text @click="crearArticulo">
                    Agregar
                  </v-btn>
                </v-card-actions>
              </v-card>
            </v-dialog>
        </v-card>
    </v-container>
  </template>
  
  <script>
  import axios from "axios"
  export default {
  name: "Articulo",//Nombre de la exportación
  data() {//aqui estaran instanciadas todas las variables
    return {
        /* Variables */
        url: "http://localhost:3000/articulos",//ENDPOINT, de donde recive los datos
      columnas: [
        { text: 'ID', value: 'id', class: 'primary  white--text'},
        { text: 'DESCRIPCIÓN', value: 'descripcion', class: 'primary  white--text' },
        { text: 'PRECIO', value: 'precio', class: 'primary  white--text' },
        { text: 'STOCK', value: 'stock', class: 'primary  white--text' }
      ],//titulos de las columnas
      articulos: [],//el array de objetos, que viene del metodo GET
      modalFormArticulo: false,//ocultar el modal
      edtDescripcion: "",
      edtPrecio:0,
      edtStock:0,
    }
  },
  mounted() {//Lo 1ro que se monta al iniciar el componente
    /* El metodo que se iniciar por defecto*/
    this.obtenerArticulos()
  },
  methods: {
    obtenerArticulos(){
      ...
    },
    crearArticulo(){
       //realiza un POST que envia información y obtiene información
      axios.post(this.url, {
        "descripcion": this.edtDescripcion,
        "precio": this.edtPrecio,
        "stock": this.edtStock
      })
      .then((response) => {
        console.log(response)
        this.modalFormArticulo = false//ocultar al enviar
        this.obtenerArticulos()
      })
      .catch((e) => {
        console.log(e)
      })
    },
  }
}
  </script>
  <style>
  
  </style>
```
### 1.5.6. Mejorando el servicio de creacion, agregando el registro
1. Agregar la variable registro en data
```js
  data() {//aqui estaran instanciadas todas las variables
    return {
        /* Variables */
      ....
      //eliminar las variables innnecesarias edtDescripcion,edtPrecio y edtStock
      registro:{},//variable que usara en el modal
    }
  },
```
2. Modificar el modal para que guarde en el objeto registro, para ello cambiar el v-model, por value y change
```js
             <!-- Modal de nuevo articulo -->
            <v-dialog v-model="modalFormArticulo"
              width="500">
              <!-- Card que mostrara el modal -->
              <v-card>
                <!-- titulo card -->
                <v-card-title class="text-h5 primary white--text">
                  Nuevo Articulo
                </v-card-title>
                <!-- contenido del card -->
                <v-card-text>
                  <v-container>
                    <v-row>
                      <v-col cols="12" sm="6" md="4">
                        <v-text-field
                          :value="registro.descripcion" 
                          @change="(v) => (registro.descripcion = v)"
                          label="Descripción"
                        ></v-text-field>
                      </v-col>
                      <v-col cols="12" sm="6" md="4">
                        <v-text-field
                          :value="registro.precio" 
                          @change="(v) => (registro.precio = v)"
                          label="Precio"
                        ></v-text-field>
                      </v-col>
                      <v-col cols="12" sm="6" md="4">
                        <v-text-field
                          :value="registro.stock" 
                          @change="(v) => (registro.stock = v)"
                          label="Stock"
                        ></v-text-field>
                      </v-col>
                    </v-row>
                  </v-container>
                </v-card-text>
                <!-- Crea una linea divisora -->
                <v-divider></v-divider>
                <!-- Los botones de accion -->
                <v-card-actions>
                  <!-- Espacio -->
                  <v-spacer></v-spacer>
                  <!-- boton de cerrar -->
                  <v-btn color="primary" text @click="modalFormArticulo = false">
                    Cerrar
                  </v-btn>
                  <!-- boton de agregar -->
                  <v-btn color="primary" text @click="crearArticulo">
                    Agregar
                  </v-btn>
                </v-card-actions>
              </v-card>
            </v-dialog>
```
3. Cambiar el metodo de creación
```js
    crearArticulo(){
      //realiza un POST que envia información y obtiene información
      // el modal devuelve de tipo string, por ello convertir a lo que es
      this.registro.precio=parseFloat(this.registro.precio)
      this.registro.stock=parseInt(this.registro.stock)
      axios.post(this.url, this.registro)
      .then((response) => {
        console.log(response)
        this.modalFormArticulo = false//ocultar al enviar
        this.obtenerArticulos()
      })
      .catch((e) => {
        console.log(e)
      })
    },
```
### 1.5.7. Agregar el metodo de reseteo de datos del modal
1. Cambiar el container por un form, y agregar la referencia del formulario
```js
                <!-- Modal de nuevo articulo -->
            <v-dialog v-model="modalFormArticulo"
              width="500">
              <!-- Card que mostrara el modal -->
              <v-card>
                <!-- titulo card -->
                <v-card-title class="text-h5 primary white--text">
                  Nuevo Articulo
                </v-card-title>
                <!-- contenido del card -->
                <v-card-text>
                  <v-form :v-model="true" ref="formDialog" lazy-validation>
                    <v-row>
                      ...
                    </v-row>
                  </v-form>
                </v-card-text>
                <!-- Crea una linea divisora -->
                <v-divider></v-divider>
                <!-- Los botones de accion -->
                <v-card-actions>
                  ...
                </v-card-actions>
              </v-card>
            </v-dialog>
```
2. Agregar en methods
```js
cancelDialog(){
  this.registro={ }
  this.$refs.formDialog.reset()
  this.modalFormArticulo = false//ocultar al enviar
  this.obtenerArticulos()
}
```
3. Agregar al metodo crearArticulo, para que resete los datos, y colocar la referencia del formulario, y quitar el obtener articulos, ya que esta en el cancelDialog
```js
    crearArticulo(){
      //realiza un POST que envia información y obtiene información
      // el modal devuelve de tipo string, por ello convertir a lo que es
      this.registro.precio=parseFloat(this.registro.precio)
      this.registro.stock=parseInt(this.registro.stock)
      if (this.$refs.formDialog.validate()) {
        axios.post(this.url, this.registro)
        .then((response) => {
          console.log(response)
          this.cancelDialog()
        })
        .catch((e) => {
          console.log(e)
        })
      } else{
        this.$toast.error(this.$t('sispoa.requeridos')) 
      }
    },
```
4. Agregar el metodo de reseteo al cerrar el modal
```js
<!-- Los botones de accion -->
<v-card-actions>
  <!-- Espacio -->
  <v-spacer></v-spacer>
  <!-- boton de agregar -->

  <!-- boton de modificar -->

  <!-- boton de cerrar -->
  <v-btn color="primary" text @click="cancelDialog">
    Cerrar
  </v-btn>
</v-card-actions>
```
### 1.5.8. Agregar el metodo para usar el mismo modal, tanto para editar y crear
1. Agregar la bandera que mostrara el boton de crear cuando tenga que crear y editar cuando tenga que editar
```js
data() {
    //aqui estaran instanciadas todas las variables
    return {
      
      banderaDatos:0, //bandera de boton crear o editar

    }
  },
```
2. Crear el metodo para abrir el modal
```js
    openModal(bandera,item){
      if (bandera==1) {//para crear articulos
        this.modalFormArticulo=true
        this.banderaDatos=1
      } else if(bandera ==2){//para editar articulos
        this.modalFormArticulo=true
        this.banderaDatos=2
        this.registro=item
      }
    },
```
3. Modificar el titulo del modal
```js
<v-card-title class="text-h5 primary white--text">
  <span v-if="banderaDatos==1">Nuevo Articulo</span>
  <span v-if="banderaDatos==2">Modificar Articulo</span>
</v-card-title>
```
4. Cambiar la accion del boton que abre el modal para crear el articulo, que se encuentra en el toolbar
```js
<!--Aqui vendra el toolbar-->
<v-toolbar dense>
    ...
    <!-- boton que adiciona articulos -->
    <v-btn icon @click="openModal(1)">
    <v-icon>mdi-plus</v-icon>
  </v-btn>
</v-toolbar>
```
5. Si la bandera es 1 mostrar el boton de crear
```js
<v-card-actions>
  <!-- Espacio -->
  <v-spacer></v-spacer>
  <!-- boton de agregar -->
  <v-btn v-if="banderaDatos==1" color="primary" text @click="crearArticulo">
    Agregar
  </v-btn>
    <!-- boton de modificar -->
  <v-btn v-if="banderaDatos==2" color="primary" text @click="modificarArticulo">
    Modificar
  </v-btn>
...
</v-card-actions>
```
### 1.5.9. Agregando el metodo editar articulo
1. Agregar la columna de accion para editar por fila, en el headers, que se encuentra en el script en data
```js
data() {
    //aqui estaran instanciadas todas las variables
    return {
      
      columnas: [
        
        { text: 'Actions', value: 'actions', class: "primary  white--text", sortable: false },
      ], //titulos de las columnas

    }
  },
```
2. Agregar el boton para editar dentro del data-table, en un template
```js
  <v-data-table :headers="columnas" :items="articulos" class="elevation-19">
    <template>
      <!-- Boton de editar -->
      <v-icon
        small
        class="mr-2"
      >
        mdi-pencil
      </v-icon>
    </template>
  </v-data-table>
```
3. Darle una accion a el boton editar, para ello con el v-slot:[`item.actions`]="{ item }" mandarle tona la información de la fila, y enviar toda esa informacion al metodo openModal(2,item)
```vue
  <v-data-table :headers="columnas" :items="articulos" class="elevation-19">
    <template v-slot:[`item.actions`]="{ item }">
      <!-- Boton de editar -->
      <v-icon
        small
        class="mr-2"
        @click="openModal(2,item)"
      >
        mdi-pencil
      </v-icon>
    </template>
  </v-data-table>
```
4. Crear el metodo para modificar el articulo
```js
    modificarArticulo(){
      //realiza un PUT que envia información y obtiene información
      this.registro.precio=parseFloat(this.registro.precio)
      this.registro.stock=parseInt(this.registro.stock)
      if (this.$refs.formDialog.validate()) {
        axios.put(`${this.url}/${this.registro.id}`, this.registro)
        .then((response) => {
          console.log(response)
          this.cancelDialog()
        })
        .catch((e) => {
          console.log(e)
        })
      } else{
        this.$toast.error(this.$t('sispoa.requeridos')) 
      }
    },
```
5. La aplicación final queda
```vue
<template>
    <v-container pa-0>
        <v-card class="mt-1" max-width="100%">
            <!-- card con toolbar -->
            <v-card flat height="50px" tile>
              <!--Aqui vendra el toolbar-->
              <v-toolbar dense>
                ...
              </v-toolbar>
            </v-card>
            <!-- tabla -->
            <v-data-table
                :headers="columnas"
                :items="articulos"
                class="elevation-19"
            >
              <template v-slot:[`item.actions`]="{ item }">
                <!-- Boton de editar -->
                <v-icon
                  small
                  class="mr-2"
                  @click="openModal(2,item)"
                >
                  mdi-pencil
                </v-icon>
              </template>
            </v-data-table>
                <!-- Modal de nuevo articulo -->
            <v-dialog v-model="modalFormArticulo"
              width="500">
              <!-- Card que mostrara el modal -->
              <v-card>
                <!-- titulo card -->
                <v-card-title class="text-h5 primary white--text">
                  <span v-if="banderaDatos==1">Nuevo Articulo</span>
                  <span v-if="banderaDatos==2">Modificar Articulo</span>
                </v-card-title>
                <!-- contenido del card -->
                <v-card-text>
                  <v-form :v-model="true" ref="formDialog" lazy-validation>
                    <v-row>
                      <v-col cols="12" sm="6" md="4">
                        <v-text-field
                          :value="registro.descripcion" 
                          @change="(v) => (registro.descripcion = v)"
                          label="Descripción"
                        ></v-text-field>
                      </v-col>
                      <v-col cols="12" sm="6" md="4">
                        <v-text-field
                          :value="registro.precio" 
                          @change="(v) => (registro.precio = v)"
                          label="Precio"
                        ></v-text-field>
                      </v-col>
                      <v-col cols="12" sm="6" md="4">
                        <v-text-field
                          :value="registro.stock" 
                          @change="(v) => (registro.stock = v)"
                          label="Stock"
                        ></v-text-field>
                      </v-col>
                    </v-row>
                  </v-form>
                </v-card-text>
                <!-- Crea una linea divisora -->
                <v-divider></v-divider>
                <!-- Los botones de accion -->
                <v-card-actions>
                  <!-- Espacio -->
                  <v-spacer></v-spacer>
                  <!-- boton de agregar -->
                  <v-btn v-if="banderaDatos==1" color="primary" text @click="crearArticulo">
                    Agregar
                  </v-btn>
                  <!-- boton de modificar -->
                  <v-btn v-if="banderaDatos==2" color="primary" text @click="modificarArticulo">
                    Modificar
                  </v-btn>
                  <!-- boton de cerrar -->
                  <v-btn color="primary" text @click="modalFormArticulo = false">
                    Cerrar
                  </v-btn>
                </v-card-actions>
              </v-card>
            </v-dialog>
        </v-card>
    </v-container>
  </template>
  
  <script>
  import axios from "axios"
  export default {
  name: "Articulo",//Nombre de la exportación
  data() {//aqui estaran instanciadas todas las variables
    return {
        /* Variables */
        url: "http://localhost:3000/articulos",//ENDPOINT, de donde recive los datos
      columnas: [
      { text: 'Actions', value: 'actions', class: "primary  white--text", sortable: false },
        { text: 'ID', value: 'id', class: 'primary  white--text'},
        { text: 'DESCRIPCIÓN', value: 'descripcion', class: 'primary  white--text' },
        { text: 'PRECIO', value: 'precio', class: 'primary  white--text' },
        { text: 'STOCK', value: 'stock', class: 'primary  white--text' }
      ],//titulos de las columnas
      articulos: [],//el array de objetos, que viene del metodo GET
      modalFormArticulo: false,//ocultar el modal
      registro:{},//variable que usara en el modal
      banderaDatos:0, //bandera de boton crear o editar
    }
  },
  mounted() {//Lo 1ro que se monta al iniciar el componente
    /* El metodo que se iniciar por defecto*/
    this.obtenerArticulos()
  },
  methods: {
    obtenerArticulos(){
      ...
    },
    crearArticulo(){
      ...
    },
    modificarArticulo(){
      //realiza un PUT que envia información y obtiene información
      this.registro.precio=parseFloat(this.registro.precio)
      this.registro.stock=parseInt(this.registro.stock)
      if (this.$refs.formDialog.validate()) {
        axios.put(`${this.url}/${this.registro.id}`, this.registro)
        .then((response) => {
          console.log(response)
          this.cancelDialog()
        })
        .catch((e) => {
          console.log(e)
        })
      } else{
        this.$toast.error(this.$t('sispoa.requeridos')) 
      }
    },
    cancelDialog(){
      ...
    },
    openModal(bandera,item){
      this.modalFormArticulo=true
      if (bandera==1) {//para crear articulos
        this.banderaDatos=1
      } else if(bandera ==2){//para editar articulos
        this.banderaDatos=2
        this.registro=item
      }
    },
  }
}
  </script>
  <style>
  
  </style>
```
### 1.5.10. Agregando el metodo eliminar articulo
1. Agregar los boton de borrar dentro del data-table, en el template
```js
  <v-data-table :headers="columnas" :items="articulos" class="elevation-19">
    <template>
      <!-- Boton de borrar -->
      <v-icon
        small
        class="mr-2"
      >
        mdi-delete
      </v-icon>
    </template>
  </v-data-table>
```
2. Darle una accion a el boton borrar, para ello con el v-slot:[item.actions]="{ item }" mandarle el id de la fila, y enviar toda esa informacion al metodo verModalBorrar(item)
```vue
  <v-data-table :headers="columnas" :items="articulos" class="elevation-19">
    <template v-slot:[`item.actions`]="{ item }">
      <!-- Boton de borrar -->
      <v-icon
        small
        class="mr-2"
        @click="openModal(3,item)"
      >
        mdi-delete
      </v-icon>
    </template>
  </v-data-table>
```
3. Crear la variable para mostrar o ocultar el modal
```js
  data() {//aqui estaran instanciadas todas las variables
    return {
      ...
      modalFormArticuloBorrar:false,
    }
  },
```
4. Crear el modal para borrar, para confirmar el borrado del articulo, despues del otro modal
```js
 <!-- Modal para borrar articulo -->
<v-dialog v-model="modalFormArticuloBorrar" width="500">
  <!-- Card que mostrara el modal -->
  <v-card>
    <!-- titulo card -->
    <!-- h5=tamaño texto, color de relleno=primary, color texto=blanco -->
    <v-card-title class="text-h5 primary white--text">
      Borrar Articulo
    </v-card-title>
    <!-- contenido del card -->
    <v-card-text>
      <v-alert>
        <span style="color: red;">Esta seguro que quiere borrar el articulo?</span>
      </v-alert>
    </v-card-text>
    <!-- Crea una linea divisora -->
    <v-divider></v-divider>
    <!-- acciones del card -->
    <v-card-actions>
      <!-- Espacio -->
      <v-spacer></v-spacer>
      <!-- boton de aceptar -->
      <v-btn color="primary" text @click="borrarArticulo">
        Aceptar
      </v-btn>
      <!-- boton de cerrar -->
      <v-btn color="primary" text @click="cancelDialog">
        Cerrar
      </v-btn>
    </v-card-actions>
  </v-card>
</v-dialog>
```
5. Agregar al metodo de reseteo, que oculte el modal de eliminar
```js
    cancelDialog(){
      ...
      if (this.$refs.formDialog) this.$refs.formDialog.reset()//para que no de error, pq quiere resetear un modal q no esta abierto
      this.modalFormArticuloBorrar = false
    },
```
6. En el metodo openModal(3,item), mostrar el modal para borrar, ademas recuperar el id de la fila
```js
    openModal(bandera,item){
      if (bandera==1) {//para crear articulos
        this.modalFormArticulo=true
        this.banderaDatos=1
      } else if(bandera ==2){//para editar articulos
        this.modalFormArticulo=true
        this.banderaDatos=2
        this.registro=item
      } else if(bandera ==3){//para borrar articulos
        this.modalFormArticuloBorrar=true
        this.registro=item
      }
    },
```
7. Crear el metodo borrarArticulo(), que llamara a un metodo DELETE
```js
    borrarArticulo(){
      //realiza un DELETE que envia información y obtiene información
      //url=localhost:3000/articulos/:id
      axios.delete(`${this.url}/${this.registro.id}`)
      .then((response) => {
        console.log(response)
        this.cancelDialog()
      })
      .catch((e) => {
        console.log(e)
      })
    },
```
8. La aplicación final queda
```vue
<template>
    <v-container pa-0>
        <v-card class="mt-1" max-width="100%">
            <!-- card con toolbar -->
            <v-card flat height="50px" tile>
              ...
            </v-card>
            <!-- tabla -->
            <v-data-table
                :headers="columnas"
                :items="articulos"
                class="elevation-19"
            >
              <template v-slot:[`item.actions`]="{ item }">
                <!-- Boton de editar -->
                  ...
                <!-- Boton de borrar -->
                <v-icon
                  small
                  class="mr-2"
                  @click="openModal(3,item)"
                >
                  mdi-delete
                </v-icon>
              </template>
            </v-data-table>
                <!-- Modal de nuevo articulo -->
            <v-dialog v-model="modalFormArticulo"
              width="500">
              ...
            </v-dialog>
            <!-- Modal para borrar articulo -->
            <v-dialog v-model="modalFormArticuloBorrar" width="500">
              <!-- Card que mostrara el modal -->
              <v-card>
                <!-- titulo card -->
                <!-- h5=tamaño texto, color de relleno=primary, color texto=blanco -->
                <v-card-title class="text-h5 primary white--text">
                  Borrar Articulo
                </v-card-title>
                <!-- contenido del card -->
                <v-card-text>
                  <v-alert>
                    <span style="color: red;">Esta seguro que quiere borrar el articulo?</span>
                  </v-alert>
                </v-card-text>
                <!-- Crea una linea divisora -->
                <v-divider></v-divider>
                <!-- acciones del card -->
                <v-card-actions>
                  <!-- Espacio -->
                  <v-spacer></v-spacer>
                  <!-- boton de aceptar -->
                  <v-btn color="primary" text @click="borrarArticulo">
                    Aceptar
                  </v-btn>
                  <!-- boton de cerrar -->
                  <v-btn color="primary" text @click="cancelDialog">
                    Cerrar
                  </v-btn>
                </v-card-actions>
              </v-card>
            </v-dialog>
        </v-card>
    </v-container>
  </template>
  
  <script>
  import axios from "axios"
  export default {
  name: "Articulo",//Nombre de la exportación
  data() {//aqui estaran instanciadas todas las variables
    return {
        /* Variables */
      ...
      modalFormArticuloBorrar:false,
    }
  },
  mounted() {//Lo 1ro que se monta al iniciar el componente
    /* El metodo que se iniciar por defecto*/
    this.obtenerArticulos()
  },
  methods: {
    obtenerArticulos(){
      ...
    },
    crearArticulo(){
      ...
    },
    modificarArticulo(){
      ...
    },
    borrarArticulo(){
      //realiza un DELETE que envia información y obtiene información
      //url=localhost:3000/articulos/:id
      axios.delete(`${this.url}/${this.registro.id}`)
      .then((response) => {
        console.log(response)
        this.cancelDialog()
      })
      .catch((e) => {
        console.log(e)
      })
    },
    cancelDialog(){
      this.registro={ }
      if (this.$refs.formDialog) this.$refs.formDialog.reset()//para que no de error, pq quiere resetear un modal q no esta abierto
      this.modalFormArticulo = false//ocultar al enviar
      this.modalFormArticuloBorrar = false
      this.obtenerArticulos()
    },
    openModal(bandera,item){
      if (bandera==1) {//para crear articulos
        this.modalFormArticulo=true
        this.banderaDatos=1
      } else if(bandera ==2){//para editar articulos
        this.modalFormArticulo=true
        this.banderaDatos=2
        this.registro=item
      } else if(bandera ==3){//para borrar articulos
        this.modalFormArticuloBorrar=true
        this.registro=item
      }
    },
  }
}
  </script>
  <style>
  
  </style>
```
### 1.5.11. Agregando el metodo para ver un articulo
1. Agregar los botones de accion dentro del data-table, en un template
```vue
  <v-data-table :headers="columnas" :items="articulos" class="elevation-19">
    <template>
      <!-- Boton de ver -->
      <v-icon
        small
        class="mr-2"
      >
        mdi-eye
      </v-icon>
    </template>
  </v-data-table>
```
2. Darle una accion a el boton ver, para ello con el v-slot:[`item.actions`]="{ item }" mandarle tona la información de la fila, y enviar toda esa informacion al metodo openModal(4,item)
```vue
  <v-data-table :headers="columnas" :items="articulos" class="elevation-19">
    <template v-slot:[`item.actions`]="{ item }">
      <!-- Boton de ver -->
      <v-icon
        small
        class="mr-2"
        @click="openModal(4,item)"
      >
        mdi-eye
      </v-icon>
    </template>
  </v-data-table>
```
3. Crear la variable  para que sea de solo lectura
```js
  data() {//aqui estaran instanciadas todas las variables
    return {
        /* Variables */
      ...
      banderaLectura:false,//variable para el modal de solo lectura
    }
  },
```
4. Antes de crear la funcion openModal(4,item), modificar el modal para mostrar solo datos de lectura, similar a el modal editar articulo
```js
    <!-- Modal de nuevo articulo -->
<v-dialog v-model="modalFormArticulo"
  width="500">
  <!-- Card que mostrara el modal -->
  <v-card>
    <!-- titulo card -->
    <v-card-title class="text-h5 primary white--text">
      ...
      <span v-if="banderaDatos==3">Mostrar Articulo</span>
    </v-card-title>
    <!-- contenido del card -->
    <v-card-text>
      <v-form :v-model="true" ref="formDialog" lazy-validation :readonly="banderaLectura">
        <v-row>
          ...
        </v-row>
      </v-form>
    </v-card-text>
    <!-- Crea una linea divisora -->
    <v-divider></v-divider>
    <!-- Los botones de accion -->
    <v-card-actions>
      ...
    </v-card-actions>
  </v-card>
</v-dialog>
```
5. Crear la función openModal(4,item), y mostrar el modal de solo lectura
```js
    openModal(bandera,item){
      if (bandera==1) {//para crear articulos
        this.modalFormArticulo=true
        this.banderaDatos=1
      } else if(bandera ==2){//para editar articulos
        this.modalFormArticulo=true
        this.banderaDatos=2
        this.registro=item
      } else if(bandera ==3){//para borrar articulos
        this.modalFormArticuloBorrar=true
        this.registro=item
      } else if(bandera ==4){//para mostrar articulo
        this.modalFormArticulo=true
        this.banderaDatos=3
        this.registro=item
        this.banderaLectura=true
      }
    },
```
6. Modificar el metodo de reseteo
```js
   cancelDialog(){
      ...
      this.banderaLectura=false
    },
```
### 1.5.12. Agregar menu lateral
1. Ir a Articulo.vue y cambiar la posicion y el padding del container
```js
<template>
    <v-container style="position:absolute; padding: 0%;">
    </v-container>
</template>
```
2. Ir a Articulo.vue y quitar el boton del toolbar <v-app-bar-nav-icon></v-app-bar-nav-icon>
```js
  <v-toolbar dense>
    <!-- elementos del toolbar -->
    // quito el boton
  </v-toolbar>
```
3. Ir a App.vue y modificar el toolbar principal, para que el  boton abra y cierre un menu lateral, y el titulo del toolbar
```js
<v-app-bar
  app
  color="primary"
  dark
>
  <v-app-bar-nav-icon @click="drawer = !drawer"></v-app-bar-nav-icon>
  <v-toolbar-title>Sistema de Inventario</v-toolbar-title>
    ...
</v-app-bar>
```
4. Agregar la variable que sera el switch del menu lateral
```js
  data: () => ({
    drawer: null,  
  }),
```
5. En App.vue agregar el menu lateral
```js
<v-app>
  <v-navigation-drawer> Menu Lateral</v-navigation-drawer>
</v-app>
```
6. Crear el array de objetos, que tendra el menu lateral
```js
  data: () => ({
    drawer: null,
    menus: [
      { title: 'Articulos', icon: 'mdi-clipboard-list-outline' },
    ],  
  }),
```
7. Construir el menu lateral
```js
    <v-navigation-drawer
      v-model="drawer"
      app
    >
      <!-- titulos -->
      <v-list-item>
        <v-list-item-content>
          <v-list-item-title class="text-h6">
            Inventario
          </v-list-item-title>
          <v-list-item-subtitle>
            Tienda
          </v-list-item-subtitle>
        </v-list-item-content>
      </v-list-item>
      <!-- linea divisora -->
      <v-divider></v-divider>
      <!-- lista de iconos -->
      <v-list
        dense
        nav
      >
        <v-list-item
          v-for="item in menus"
          :key="item.title"
          link
        >
          <v-list-item-icon>
            <v-icon>{{ item.icon }}</v-icon>
          </v-list-item-icon>

          <v-list-item-content>
            <v-list-item-title>{{ item.title }}</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>
```
8. Agregar la accion colocando la referencia de la ruta en la lista
```js
  <v-list-item
    v-for="item in menus"
    :key="item.title"
    :href=item.ruta
  >
    <v-list-item-icon>
      <v-icon>{{ item.icon }}</v-icon>
    </v-list-item-icon>

    <v-list-item-content>
      <v-list-item-title>
        {{ item.title }}
      </v-list-item-title>
    </v-list-item-content>
  </v-list-item>
```
9. Agregar la ruta en el array de objetos
```js
  data: () => ({
    drawer: null,
    menus: [
      { title: 'Articulos', icon: 'mdi-clipboard-list-outline',ruta:"http://localhost:8080/articulos"},
    ],  
  }),
```
 ## 1.6. Referencias
 1. [Vue CLI](https://cli.vuejs.org/#getting-started)
 2. [Vuetify](https://vuetifyjs.com/en/getting-started/installation/)
 3. [ESLint Vue multiword components](https://stackoverflow.com/questions/70346829/eslint-vue-multiword-components)
  
[<< INDICE](../../README.md)


---


<div style="page-break-before: always;"></div>


# 📄 3.2.2. Instalando Vue y Vuetify

[<< INDICE](../../README.md)
# Vue(Js)

## Instalar vue
- Instalar
```console
npm install -g @vue/cli
```
- crear un proyecto
```console
vue create my-app
❯ Manually select features
>Router(space)
❯2.x
Use history mode for router? (Requires proper server setup for index fallback in production) (Y/n) y
❯ ESLint with error prevention only
❯Lint on save
❯ In dedicated config files
 Save this as a preset for future projects? (y/N) Y
  Save preset as: xx
```
- Ingresar en la carpeta
```console
cd my-app
```
- Iniciar
```console
npm run serve
```
## Instalar vuetify
- Instalar en un proyecto vue inicial
```console
vue add vuetify-cli  //para instalar vuetify globalmente
vue add vuetify
> Still proceed? (y/N) Y
❯ Default (recommended)
```
- Instalar libreira axios para leer los servicios APi rest
```console
npm install -D axios
```
[<< INDICE](../../README.md)

---


<div style="page-break-before: always;"></div>


# 📄 3.2.3. Componente Vuetify

[<< INDICE](../../README.md)
## Aplicacion principal Articulo.vue
```vue
<template>
  <Articulo />
</template>

<script>
  import Articulo from '../components/Articulo'

  export default {
    name: 'Home',

    components: {
      Articulo,
    },
  }
</script>
```
## Componente
```vue
<template>
  <v-container pa-0>
    <v-card class="mt-15" max-width="100%">//fondo
      <v-data-table :headers="columnas" :items="articulos"
        class="elevation-19">
      </v-data-table>
    </v-card>
  </v-container>
</template>
<script>
import axios from "axios"
export default {
  name: "Articulo",//Nombre de la exportación
  data() {//aqui estan todas las variables
    return {
url: "http://localhost:3000/articulos/",//ENDPOINT
columnas: [
{ text: 'ID', value: 'id', class: 'primary  white--text'},
{ text: 'DESC', value: 'desc', class: 'primary  white--text' },
{ text: 'PRECI', value: 'preci', class: 'primary  white--text' },
{ text: 'STOC', value: 'stoc', class: 'primary  white--text' }],
articulos: [],//el array que viene del metodo GET
}},
  mounted() {this.obtenerArticulos()},//Lo 1ro monta
  methods:{
    obtenerArticulos(){//realiza un GET
       axios.get(this.url)
      .then((response) => {
        this.articulos = response.data //Guardando datos
      })
      .catch((e) => {
        console.log(e)//Errores
      })},
  }
}
</script>
<style></style>
```

[<< INDICE](../../README.md)


---


<div style="page-break-before: always;"></div>


# 📄 3.2.5. Select Vuetify

[<< INDICE](../../README.md)
## Select
- En template
```js
<v-col cols="12" sm="12" md="6" xs="6">
  <v-select 
    :readonly="banderaDirectivo && !formReadonly" 
    label="Nivel*" 
    :items="datosNau"//array de objetos
    item-text="nau_nombre" //objeto.nombre
    item-value="nau_codigo"//objeto.codigo
    :rules="[$rules.obligatoria()]" 
    :value="registro.nau_codigo" 
    @change="(v) => (registro.nau_codigo = v)"// hace el cambio
    outlined>
  </v-select>
</v-col>
```
- En script, instanciando
```js
data() {
  return {
    ...
    datosNau: [],
    ...
  }
},
```
- Funcion que trae el array de objetos
```js
getAllNivelesAreasUnidadesConOSinDirectiva() {
  this.$service.get('SISPOA',`areas-unidades/areas-con-sin-directiva?org_codigo=(${this.orgCodigo})`).then(response =>{
    if (response) {
      this.datosNau = response
    }
  }).catch(error => {
    // this.$toast.info(error.error_mensaje)
    this.items = []
  })
},
```

[<< INDICE](../../README.md)

---


<div style="page-break-before: always;"></div>


# 📄 3.2.6. Estilos con Variables Vuetify

[<< INDICE](../../README.md)
## Usando dentro de estilos variables
```vue
    <v-row v-if="compruebaEstadoOrg" class="mt-2" style="text-align: center;">
      <v-col>
        <b class="text-h6" :style="{color:(compruebaEstadoOrg.org_estado==2 || compruebaEstadoOrg.org_estado==8?'#078f20':compruebaEstadoOrg.org_estado==5?'red':'')}">{{ compruebaEstadoOrg.org_estado==2 || compruebaEstadoOrg.org_estado==8? 'Áreas unidades y cargos ya estan verificadas ' : compruebaEstadoOrg.org_estado==5?'Las áreas/unidades y cargos corresponden a información historica, no se pueden realizar cambios':'' }}</b>
      </v-col>
    </v-row>
```
### cambiando el color de text
```vue
<td>
 <span :class="`${(item.aun_estado==0)?'red--text':''}`">{{ item.aun_sigla }} - {{ item.aun_nombre }}</span>
</td>
```

[<< INDICE](../../README.md)


---


<div style="page-break-before: always;"></div>


# 📄 3.2.7. TextField Vuetify

[<< INDICE](../../README.md)
## TextField
```vue
 <v-col v-if="banderaMuestraFormMover" cols="12" sm="12" md="12" xs="12">
   <v-text-field 
     outlined rows="2" 
     :value="registro.aun_nombre" 
     @change="(v) => (registro.aun_nombre = v)"
     :rules="[$rules.obligatoria()]" 
     label="Nombre*">
   </v-text-field>
 </v-col>
```


---


<div style="page-break-before: always;"></div>


# 📄 3.2.8. Checkbox Vuetify

[<< INDICE](../../README.md)
## Checkbox
- En template
```vue
 <v-col v-if="banderaMuestraFormMover" cols="12" sm="4" md="4" xs="4">
   <div v-if="banderaMuestraFormMover">
     <v-checkbox
       v-model="banderaOrganizacional"//esta es la variable que cambiara de true a false
       label="¿Es área organizacional?">
     </v-checkbox>
   </div>
 </v-col>
```
- En el script
```vue
data() {
  return {
    ...
    banderaOrganizacional:false,
    ...
  }
},
```


---


<div style="page-break-before: always;"></div>


# 📄 3.2.9. Emit y On Vuetify

[<< INDICE](../../README.md)
## emit y on
- Con on, este recibe la información, pero debe estar en el mountend(), no en created
```vue
<script>
  mounted() {
    //recibe un objeto item
    this.$nuxt.$on('clickedSeleccionGestion', (item) => {
      this.getAllGestionesOrganigramas(item)
    })
    this.getAllGestionesOrganigramas(null)
  },
  created() {
  },
  methods: {
    getAllGestionesOrganigramas(item) {
      const gestionStorage = this.$storage.get('gestionSeleccion')//es una variable que guuarda afuera  
      this.defaultSelectedGest = item ? item : gestionStorage
      this.listaOrganigramaGestion(this.defaultSelectedGest.ges_anio)//aqui entra el objeto item
    },
    listaOrganigramaGestion(gesAnio){
      this.$service.get('SISPOA', `gestiones-organigramas?ges_anio=(${gesAnio})&gor_estado=(2,3,8)`).then(response => {
          if (response) {
            this.datos = response
          }
        }).catch(error => {
          // this.$toast.info(error.error_mensaje)
          this.datos = []
        })
    },
  }
</script>
```
- con emit envia la información
```vue
<script>
    sendCode(item) {
      this.$nuxt.$emit('clickedSeleccionGestion', item)//item es un objeto
    },
</script>
```
[<< INDICE](../../README.md)

---


<div style="page-break-before: always;"></div>


# 📄 3.2.10. Centrar contenido de una fila

[<< INDICE](../../README.md)
## centrar y justificar 
- Para centrar y justificar el contenido de una fila
```js
<v-container fill-height fluid>
  <v-row align="center"
      justify="center">
      <v-col></v-col>
  </v-row>
</v-container>
```


---


<div style="page-break-before: always;"></div>


# 📄 3.2.11. V-DataTable

[<< INDICE](../../README.md)
## Nuevo
- Boton
```js
    <v-col class="text-right" v-if="ifAprobadorFormulador">
      <v-btn color="success" @click="accionNuevo(1)" outlined>
        <v-icon>add</v-icon>{{ $t('sispoa.nuevo') }}
      </v-btn>
    </v-col>
```
- Accion
```js
accionNuevo (bandera) {
  this.dialogNuevo = true
  this.bandera_muestra_datos = 1
},
```
- Modal
```js
<v-dialog v-model="dialogNuevo" scrollable persistent max-width="60%">
  <v-card>
    <v-toolbar dark color="primary" right>
      <v-toolbar-title>
        <h5 v-if="bandera_muestra_datos == 1">{{ $t('sispoa.nuevo') }} - {{ nombre_componente }}</h5>
      </v-toolbar-title>
      <v-spacer></v-spacer>
      <v-btn icon dark @click="cancelaDialog()">
        <v-icon>close</v-icon>
      </v-btn>
    </v-toolbar>
    <v-card-text style="padding-top: 0 !important;">
      <br>
      <v-form :readonly="formReadonly" :v-model="true" ref="formDialog" lazy-validation>
        <v-row class="no-gutters-y">
          <v-col cols="12" sm="12" md="12" xs="12">
            <v-text-field
              outlined :value="registro.ite_numero" @change="(v) => (registro.ite_numero = v)" :rules="[$rules.obligatoria() , $rules.longitudMaxima(9999)]"
              label="Número Ítem*">
            </v-text-field>
          </v-col>
          <v-col cols="12" sm="12" md="12" xs="12">
            <v-textarea
              outlined rows="2" :value="registro.ite_descripcion" @change="(v) => (registro.ite_descripcion = v)" :rules="[$rules.longitudMaxima(1000)]"
              label="Descripción*">
            </v-textarea>
          </v-col>
        </v-row>
      </v-form>
    </v-card-text>
    <v-card-actions>
      <v-spacer></v-spacer>
      <v-btn v-if="bandera_muestra_datos == 1" :loading="loading" color="primary" @click="agregar()">{{ $t('sispoa.botones.agregar') }}</v-btn>
      <v-btn color="error" @click="cancelaDialog()">{{ $t('sispoa.botones.cancelar') }}</v-btn>
    </v-card-actions>
  </v-card>
</v-dialog>
```
- Agregar acciòn
```js
agregar() {
  if (this.$refs.formDialog.validate()) {
      this.loading = true
      this.registro.ite_numero = parseInt(this.registro.ite_numero)
      this.$service.post('SISPOA',`items`, this.registro).then(response => {
        if (response) {
          this.$toast.success(response.err_mensaje)
          this.cancelaDialog()
        }
      }).catch(error => {
        this.loading = false
        this.$toast.error(error.error_mensaje)
      })
    } else {
      this.$toast.error(this.$t('sispoa.requeridos'))
    }
},
```
## V-DataTable
- Headers, el value es importante, porque ese valor se transmitira a los template
```js
  headers: [
    { text: 'Acciones', sortable: false, value: 'acciones' },
    { text: 'Estado', sortable: false, value: 'ite_estado' },
    { text: 'Número Item', sortable: true, value: 'ite_numero' },
    { text: 'Descripcion', sortable: true, value: 'ite_descripcion' },
    { text: 'Fecha Registro', sortable: true, value: 'fecha_registro' },
  ],
```
- Template, el ite_estado y otros se transmitio al template
```js
<template #[`item.ite_estado`]="{ item }">
  <v-badge
    :color="item.est_color"
    :content="item.ite_estado_descripcion"
    inline
  ></v-badge>
</template>
```
- Tabla
```js
    <v-data-table
      :headers="headers" :items="datos" :search="search" :no-results-text="$variables.noResultadosBusqueda()"
      class="elevation-1" :no-data-text="$variables.noResultados()"
      :footer-props="{
        'items-per-page-text': $variables.nombreFilas(),
        'itemsPerPageOptions': $variables.itemsPorPagina()
      }" v-show="table">
      <template #no-data>
        <v-alert :value="true" color="info" icon="info">NO EXISTE NINGUNA INFORMACIÓN REGISTRADA</v-alert>
      </template>
      <template #[`item.ite_estado`]="{ item }">
        <v-badge
          :color="item.est_color"
          :content="item.ite_estado_descripcion"
          inline
        ></v-badge>
      </template>
      <template #[`item.acciones`]="{ item }" v-if="ifAprobadorFormulador">
        <global-icon-tool-tip v-if="item.ite_estado == 1" @click="accionEditarEliminar(item, 2)" tooltip="Editar" prepend-icon="edit" iconColor="primary" toolTipColor="primary" ></global-icon-tool-tip>
        <!-- <global-icon-tool-tip v-if="item.ite_estado == 1" @click="accionEditarEliminar(item, 3)" tooltip="Inactivar" prepend-icon="cancel" iconColor="error" toolTipColor="error" ></global-icon-tool-tip>
        <global-icon-tool-tip v-if="item.ite_estado == 0" @click="accionEditarEliminar(item, 4)" tooltip="Activar" prepend-icon="check_circle" iconColor="success" toolTipColor="success" ></global-icon-tool-tip>  -->
      </template>
      <template
        slot="footer.page-text" slot-scope="props">
        {{ props.pageStart }} - {{ props.pageStop }} de {{ props.itemsLength }}
      </template>
    </v-data-table>
```
- Estado en ovoide
```js
<template #[`item.ite_estado`]="{ item }">
  <v-badge
    :color="item.est_color"
    :content="item.ite_estado_descripcion"
    inline
  ></v-badge>
</template>
```
- Botones de Accion de cada fila
```js
<template #[`item.acciones`]="{ item }" v-if="ifAprobadorFormulador">
  <global-icon-tool-tip v-if="item.ite_estado == 1" @click="accionEditarEliminar(item, 2)" tooltip="Editar" prepend-icon="edit" iconColor="primary" toolTipColor="primary" ></global-icon-tool-tip>
  <!-- <global-icon-tool-tip v-if="item.ite_estado == 1" @click="accionEditarEliminar(item, 3)" tooltip="Inactivar" prepend-icon="cancel" iconColor="error" toolTipColor="error" ></global-icon-tool-tip>
  <global-icon-tool-tip v-if="item.ite_estado == 0" @click="accionEditarEliminar(item, 4)" tooltip="Activar" prepend-icon="check_circle" iconColor="success" toolTipColor="success" ></global-icon-tool-tip>  -->
</template>
```
- Paginas de la tabla
```js
<template
  slot="footer.page-text" slot-scope="props">
  {{ props.pageStart }} - {{ props.pageStop }} de {{ props.itemsLength }}
</template>
```
## Editar
- Boton, se encuentra en el template de acciones
```js
<template #[`item.acciones`]="{ item }" v-if="ifAprobadorFormulador">
  <global-icon-tool-tip v-if="item.ite_estado == 1" @click="accionEditarEliminar(item, 2)" tooltip="Editar" prepend-icon="edit" iconColor="primary" toolTipColor="primary" ></global-icon-tool-tip>
</template>
```
- Accion
```js
accionEditarEliminar (item, bandera) {//bandera=2
  this.bandera_muestra_datos = bandera
  this.registro = item
  this.dialogNuevo = true
  if (this.bandera_muestra_datos === 3 || this.bandera_muestra_datos === 4) {
    this.formReadonly = true
  }
},
```
- Modal
```js
<v-dialog v-model="dialogNuevo" scrollable persistent max-width="60%">
  <v-card>
    <v-toolbar dark color="primary" right>
      <v-toolbar-title>
        <h5 v-if="bandera_muestra_datos == 2">{{ $t('sispoa.modificar') }} - {{ nombre_componente }}</h5>
      </v-toolbar-title>
      <v-spacer></v-spacer>
      <v-btn icon dark @click="cancelaDialog()">
        <v-icon>close</v-icon>
      </v-btn>
    </v-toolbar>
    <v-card-text style="padding-top: 0 !important;">
      <br>
      <v-form :readonly="formReadonly" :v-model="true" ref="formDialog" lazy-validation>
        <v-row class="no-gutters-y">
          <v-col cols="12" sm="12" md="12" xs="12">
            <v-text-field
              outlined :value="registro.ite_numero" @change="(v) => (registro.ite_numero = v)" :rules="[$rules.obligatoria() , $rules.longitudMaxima(9999)]"
              label="Número Ítem*">
            </v-text-field>
          </v-col>
          <v-col cols="12" sm="12" md="12" xs="12">
            <v-textarea
              outlined rows="2" :value="registro.ite_descripcion" @change="(v) => (registro.ite_descripcion = v)" :rules="[$rules.longitudMaxima(1000)]"
              label="Descripción*">
            </v-textarea>
          </v-col>
        </v-row>
      </v-form>
    </v-card-text>
    <v-card-actions>
      <v-spacer></v-spacer>
      <v-btn v-if="bandera_muestra_datos == 2" :loading="loading" color="primary" @click="modificar()">{{ $t('sispoa.botones.modificar') }}</v-btn>
      <v-btn color="error" @click="cancelaDialog()">{{ $t('sispoa.botones.cancelar') }}</v-btn>
    </v-card-actions>
  </v-card>
</v-dialog>
```
- Accion
```js
modificar() {
  if (this.$refs.formDialog.validate()) {
    this.loading = true
    this.registro.ite_numero = parseInt(this.registro.ite_numero)
    this.$service.put('SISPOA',`items`, this.registro).then(response => {
      if (response) {
        this.$toast.success(response.err_mensaje)
        this.cancelaDialog()
      }
    }).catch(error => {
      this.loading = false
      this.$toast.error(error.error_mensaje)
      this.cancelaDialog()
    })
  } else {
    this.$toast.error(this.$t('sispoa.requeridos'))
  }
},
```
## Inactivar
- Boton, se encuentra en el template de acciones
```js
<template #[`item.acciones`]="{ item }" v-if="ifAprobadorFormulador">
  <global-icon-tool-tip v-if="item.ite_estado == 1" @click="accionEditarEliminar(item, 3)" tooltip="Inactivar" prepend-icon="cancel" iconColor="error" toolTipColor="error" ></global-icon-tool-tip>
</template>
```
- Accion
```js
accionEditarEliminar (item, bandera) {//bandera=3
  this.bandera_muestra_datos = bandera
  this.registro = item
  this.dialogNuevo = true
  if (this.bandera_muestra_datos === 3 || this.bandera_muestra_datos === 4) {
    this.formReadonly = true
  }
},
```
- Modal
```js
 <v-dialog v-model="dialogNuevo" scrollable persistent max-width="60%">
  <v-card>
    <v-toolbar dark color="primary" right>
      <v-toolbar-title>
        <h5 v-if="bandera_muestra_datos == 3">{{ $t('sispoa.inactivar') }} - {{ nombre_componente }}</h5>
      </v-toolbar-title>
      <v-spacer></v-spacer>
      <v-btn icon dark @click="cancelaDialog()">
        <v-icon>close</v-icon>
      </v-btn>
    </v-toolbar>
    <v-card-text style="padding-top: 0 !important;">
      <br>
      <v-alert outlined v-if="bandera_muestra_datos == 3" type="warning"><b>Está seguro de inactivar el registro?</b></v-alert>
      <v-alert outlined v-if="bandera_muestra_datos == 4" type="warning"><b>Está seguro de activar el registro?</b></v-alert>
      <v-form :readonly="formReadonly" :v-model="true" ref="formDialog" lazy-validation>
        <v-row class="no-gutters-y">
          <v-col cols="12" sm="12" md="12" xs="12">
            <v-text-field
              outlined :value="registro.ite_numero" @change="(v) => (registro.ite_numero = v)" :rules="[$rules.obligatoria() , $rules.longitudMaxima(9999)]"
              label="Número Ítem*">
            </v-text-field>
          </v-col>
          <v-col cols="12" sm="12" md="12" xs="12">
            <v-textarea
              outlined rows="2" :value="registro.ite_descripcion" @change="(v) => (registro.ite_descripcion = v)" :rules="[$rules.longitudMaxima(1000)]"
              label="Descripción*">
            </v-textarea>
          </v-col>
        </v-row>
      </v-form>
    </v-card-text>
    <v-card-actions>
      <v-spacer></v-spacer>
      <v-btn v-if="bandera_muestra_datos == 3" :loading="loading" color="primary" @click="inactivar()">{{ $t('sispoa.botones.inactivar') }}</v-btn>
      <v-btn color="error" @click="cancelaDialog()">{{ $t('sispoa.botones.cancelar') }}</v-btn>
    </v-card-actions>
  </v-card>
</v-dialog>
```
- Accion
```js
inactivar() {
  this.loading = true
    this.$service.delete('SISPOA',`items/${this.registro.ite_codigo}`).then(response => {
      if (response) {
        this.$toast.success(response.err_mensaje)
        this.cancelaDialog()
      }
    }).catch(error => {
      this.loading = false
      this.$toast.error(error.error_mensaje)
    })
},
```
## Activar
- Boton, se encuentra en el template de acciones
```js
<template #[`item.acciones`]="{ item }" v-if="ifAprobadorFormulador">
  <global-icon-tool-tip v-if="item.ite_estado == 0" @click="accionEditarEliminar(item, 4)" tooltip="Activar" prepend-icon="check_circle" iconColor="success" toolTipColor="success" ></global-icon-tool-tip>
</template>
```
- Accion
```js
accionEditarEliminar (item, bandera) {//bandera=4
  this.bandera_muestra_datos = bandera
  this.registro = item
  this.dialogNuevo = true
  if (this.bandera_muestra_datos === 3 || this.bandera_muestra_datos === 4) {
    this.formReadonly = true
  }
},
```
- Modal
```js
<v-dialog v-model="dialogNuevo" scrollable persistent max-width="60%">
  <v-card>
    <v-toolbar dark color="primary" right>
      <v-toolbar-title>
        <h5 v-if="bandera_muestra_datos == 4">{{ $t('sispoa.activar') }} - {{ nombre_componente }}</h5>
      </v-toolbar-title>
      <v-spacer></v-spacer>
      <v-btn icon dark @click="cancelaDialog()">
        <v-icon>close</v-icon>
      </v-btn>
    </v-toolbar>
    <v-card-text style="padding-top: 0 !important;">
      <br>
      <v-alert outlined v-if="bandera_muestra_datos == 3" type="warning"><b>Está seguro de inactivar el registro?</b></v-alert>
      <v-alert outlined v-if="bandera_muestra_datos == 4" type="warning"><b>Está seguro de activar el registro?</b></v-alert>
      <v-form :readonly="formReadonly" :v-model="true" ref="formDialog" lazy-validation>
        <v-row class="no-gutters-y">
          <v-col cols="12" sm="12" md="12" xs="12">
            <v-text-field
              outlined :value="registro.ite_numero" @change="(v) => (registro.ite_numero = v)" :rules="[$rules.obligatoria() , $rules.longitudMaxima(9999)]"
              label="Número Ítem*">
            </v-text-field>
          </v-col>
          <v-col cols="12" sm="12" md="12" xs="12">
            <v-textarea
              outlined rows="2" :value="registro.ite_descripcion" @change="(v) => (registro.ite_descripcion = v)" :rules="[$rules.longitudMaxima(1000)]"
              label="Descripción*">
            </v-textarea>
          </v-col>
        </v-row>
      </v-form>
    </v-card-text>
    <v-card-actions>
      <v-spacer></v-spacer>
      <v-btn v-if="bandera_muestra_datos == 4" :loading="loading" color="primary" @click="activar()">{{ $t('sispoa.botones.activar') }}</v-btn>
      <v-btn color="error" @click="cancelaDialog()">{{ $t('sispoa.botones.cancelar') }}</v-btn>
    </v-card-actions>
  </v-card>
</v-dialog>
```
- Accion
```js
activar() {
  this.loading = true
    this.$service.patch('SISPOA',`items/${this.registro.ite_codigo}`).then(response => {
      if (response) {
        this.$toast.success(response.err_mensaje)
        this.cancelaDialog()
      }
    }).catch(error => {
      this.loading = false
      this.$toast.error(error.error_mensaje)
    })
},
```
[<< INDICE](../../README.md)

---


<div style="page-break-before: always;"></div>


# 📄 3.2.12. Nuxt (Frontend)

[<< INDICE](../../README.md)
- [1. Instalar Nuxt y Vuetify](#1-instalar-nuxt-y-vuetify)
  - [1.1. Crear proyecto](#11-crear-proyecto)
  - [1.2. Iniciar el proyecto en modo desarrollo](#12-iniciar-el-proyecto-en-modo-desarrollo)
  - [1.3. Instalar extensiones](#13-instalar-extensiones)
  - [1.4. Referencia](#14-referencia)

# 1. Instalar Nuxt y Vuetify
## 1.1. Crear proyecto
- Terminal
```console
npx create-nuxt-app ejemplo-nuxt
```
- Condiciones
```txt
✨  Generating Nuxt.js project in ejemplo-nuxt
? Project name: ejemplo-nuxt
? Programming language: JavaScript
? Package manager: Npm
? UI framework: Vuetify.js
? Template engine: HTML
? Nuxt.js modules: Axios - Promise based HTTP client
? Linting tools: Prettier
? Testing framework: None
? Rendering mode: Universal (SSR / SSG)
? Deployment target: Static (Static/Jamstack hosting)
? Development tools: jsconfig.json (Recommended for VS Code if you're not using typescript)
? Continuous integration: GitHub Actions (GitHub only)
? What is your GitHub username? richard teran
? Version control system: Git
```
## 1.2. Iniciar el proyecto en modo desarrollo
- Ingresar al proyecto
```console
cd ejemplo-nuxt
```
- Ejecutar
```console
npm run dev
```
- Ejecutar en el navegador
```txt
http://localhost:3000/
```
## 1.3. Instalar extensiones
```txt
vetur,Material icon theme, htmltagwrap
vue3 supoort all in one
```
## 1.4. Referencia
- Ir a [Crear Proyecto web con Nuxt y Vuetify](https://www.youtube.com/watch?v=Vh5wT0j9Czo)

[<< INDICE](../../README.md)

---


<div style="page-break-before: always;"></div>


# 📄 3.2.13. Vuetify Repositorio

# vuetify-repositorio
Curso de vuetify de video
***
## Referencia
- Tutoriales de referencia https://www.youtube.com/playlist?list=PLrAw40DbN0l2VfHxln1HiBGkSS7vN2oC3
- Pagina de referencia con que se creo el LEAME.md https://programminghistorian.org/es/lecciones/introduccion-a-markdown

---


<div style="page-break-before: always;"></div>


# 📄 3.2.14. Vuetify3 Repositorio

# vuetify3-repositorio
 Comience con Vuetify, el marco Vue.js más popular del mundo para crear aplicaciones ricas en funciones y ultrarrápidas
## instalando Vue
1. Crear proy
```console
vue create my-app
❯ Manually select features 
```
2. Seleccionar las rutas
```console
>Router(space)
❯2.x
Use history mode for router? (Requires proper server setup for index fallback in production) (Y/n) y
❯ ESLint with error prevention only
❯Lint on save
❯ In dedicated config files
 Save this as a preset for future projects? (y/N) Y
  Save preset as: xx
```
3. Correr el servidor
```console
cd my-app
npm run serve
```
## instalando Vuetify
1. Ahora colocar en el archivo slintrc.js
```JSON
// <projectRoot>/.eslintrc.js
module.exports = {
  ⋮
  rules: {
    'vue/multi-word-component-names': 0,
  },
}
```
2. Ahora que tiene un proyecto instanciado, puede agregar Vue CLI package utilizando el CLI.
```console
vue add vuetify
> Still proceed? (y/N) Y
❯ Default (recommended)
```
3. Corriendo
```console
npm run serve
```
4. Si muestra un error en el primer carácter de cualquier lectura de archivo colocar
```JSON
"parser": '@babel/eslint-parser',
"parserOptions": {
    "requireConfigFile": false,
}
```
 ## Referencias
 1. https://cli.vuejs.org/#getting-started
 2. https://vuetifyjs.com/en/getting-started/installation/
 3. https://stackoverflow.com/questions/70346829/eslint-vue-multiword-components
 4. https://stackoverflow.com/questions/71271760/parsing-error-no-babel-config-file-detected-when-ide-not-open-at-vue-projects

---


### 3.3. React + MUI


<div style="page-break-before: always;"></div>


# 📄 3.3. ReactMui (Intro)

[<< INDICE](../../README.md)

- [1. React(Js)](#1-reactjs)
  - [1.1. Inicio](#11-inicio)
  - [1.2. Preparativos](#12-preparativos)
    - [1.2.1. Aplicacion principal App.js](#121-aplicacion-principal-appjs)
    - [1.2.2. Componente](#122-componente)
- [2. React(Ts)](#2-reactts)
  - [2.1. Inicio](#21-inicio)
  - [2.2. Preparativos](#22-preparativos)
    - [2.2.1. Ir a index.html y modificar](#221-ir-a-indexhtml-y-modificar)
    - [2.2.2. Ir a index.tsx y modificar](#222-ir-a-indextsx-y-modificar)
    - [2.2.3. Crear rutas](#223-crear-rutas)
    - [2.2.4. Aplicacion principal App.tsx](#224-aplicacion-principal-apptsx)
- [3. React(Mui)](#3-reactmui)
  - [3.1. Inicio](#31-inicio)
  - [3.2. Agregar el tipo de fuente](#32-agregar-el-tipo-de-fuente)
  - [3.3. BOTON](#33-boton)
  - [3.4. Crear componente en proyecto base react mui IMANOL](#34-crear-componente-en-proyecto-base-react-mui-imanol)
# 1. React(Js)
## 1.1. Inicio
- Instalar
```console
npm install -g create-react-app
```
- crear un proyecto
```console
create-react-app aprendiendoreact
```
- Ingresar en la carpeta
```console
cd aprendiendoreact
```
- Iniciar
```console
npm start
```
## 1.2. Preparativos
### 1.2.1. Aplicacion principal App.js 
```js
// Llama a el componente de otro lado
import MiComponente from './components/MiComponente';
// Función
function imprimirApodo(apodo,edad){ 
  var mostrar =(
            <div> <h1>Mi apodo es {apodo}</h1>
              <h2>De edad {edad} anos</h2>
            </div>
  )
  return mostrar;
}
// Funcion principal
function App() {
  var nombre = "Richard Teran"// variable nombre
  var presentacion = <h2>{nombre}</h2>// variable etiqueta
  var apodo = "Xixay"// variable apodo
  var edad = 36// variable edad
  return (
    <div className="App">
      <header className="App-header">
        <p>Hola bienvenido</p>
        {/* Imprime la variable etiqueta */}
        {presentacion}
        {/* Imprime lo que hay dentro de la funcion */}
        {imprimirApodo(apodo,edad)}
      </header>
      <section className='componentes'>
        {/* Imprime todo lo que hay dentro de componente */}
        <MiComponente/>
      </section>
    </div>
  );
}
export default App;

```
### 1.2.2. Componente
```js
import React from 'react'
// Definir una clase
class MiComponente extends React.Component{
  // Crear el metodo Render, la vista que se mostrara
  // Aqui dentro estara el jsx
    render(){
        return (
            // Esto es lo que mostrara el componente
            <h1>Hola, soy el componente llamado: MiComponente</h1>
        )
    }
}
// Exportarlo para poder usarlo en otro lado
export default MiComponente
```
# 2. React(Ts)
## 2.1. Inicio
- Instalar
```console
npm install -g create-react-app
```
- crear un proyecto
```console
npx create-react-app my-app --template typescript
```
- Ingresar en la carpeta
```console
cd my-app
```
- Inicializar el remoto git
```console
git init
```
- Agregar al repositorio
```console
https://github.com/xixay/react-frontend-repositorio
```
- Agregar el cambio a subir
```console
git add .
```
- Comitear para subir
```console
git commit -m "Inicializando React"
```
- Subir los cambios a la rama master
```console
git push -u origin master
```
- Borrar la relacion remota
  - ver archivos ocultos
  ```console
  ls -a
  ```
  - borrar el git
  ```console
  rm -rf .git
  ```
  - subir un nivel
  ```console
  cd ..
  ```
  - borrar el proyecto para evitar choque al cambiar de rama
  ```console
  rm -rf my-app
  ```
  - ver si hay actualizaciones o cambios
  ```console
  git fetch
  ```
  - cambiar a la rama master porque ahi esta el proyecto subido
  ```console
  git checkout master
  ```
  - instalar los paquetes faltantes (node_modules)
  ```console
  npm install
  ```
- Iniciar
```console
npm start
```
## 2.2. Preparativos
### 2.2.1. Ir a index.html y modificar
- Borrar
```html
<!--manifest.json pro …https://developers.google.com/...-->
    <link rel="manifest" href="%PUBLIC_... />
    <!--Notice the use …`npm run build`.-->
    <!--This HTML file …`npm run build` or `yarn build`.-->

```
- Cambiar el titulo para la pestaña
```html
<head><title>Registro de farmacia</title></head>
```
- Borrar archivos innecesarios
  - package-lock.json
  - App.cssindex.css
  - App.test.tsx
  - logo.svg
  - react-app-env.d.ts
  - reportWebVitals.ts
  - setupTest.ts
### 2.2.2. Ir a index.tsx y modificar
- Borrar biblotecas y otros
```tsx
import './index.css';
import reportWebVitals from './reportWebVitals';
// If you …more: https://bit.ly/CRA-vitals
reportWebVitals();
```
- Modificar
```tsx
import React from 'react';
import ReactDOM from 'react-dom/client';
import {App} from './App';
const root = ReactDOM.createRoot(
  document.getElementById('root') as HTMLElement
);
root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);

```
### 2.2.3. Crear rutas
- Instalar
```console
npm install react-router-dom
```
- Estructura de carpetas
  - src
    - pages (solamente debe contener index.tsx)
    - routes (solamente debe contener index.tsx)
    - shared (Las Carpetas vacias deben tener index.ts  con lo siguiente: export {};)
      - components (.......................................... index.ts : export {};)
      - contexts (.......................................... index.ts : export {};)
      - environment (.......................................... index.ts : export {};)
      - hooks (.......................................... index.ts : export {};)
      - layouts (.......................................... index.ts : export {};)
      - services (.......................................... index.ts : export {};)
        - api (.......................................... index.ts : export {};)
      - themes (.......................................... index.ts : export {};)
- Ir a routes y crear el archivo index.tsx
```tsx
import {Routes, Route, Navigate} from 'react-router-dom'
export const AppRoutes = () => {
return (
 <Routes>
   {/* Ruta por defecto */}
   <Route path='/' element={<p>Paǵina inicial</p>}/>
   {/* Ruta hacia la pagina inicial */}
   <Route path='/pagina-inicial' element={<p>Paǵina inicial</p>}/>
   {/* Si se coloca cualquier ruta incorrecta, redirecciona a la pagina inicial */}
   <Route path='*' element={<Navigate to="/pagina-inicial"/>}/>
        </Routes>
 );
}

``` 
### 2.2.4. Aplicacion principal App.tsx
- Borrar biblioteca innecesaria en App.tsx
```tsx
import './index.css'; importación del logo y css, y React// ya no existen
```
- Modificar
```tsx
export const App = () =>{
  return (
    <div className="App"> 
    </div>
  );
}
export default App;

```
- Agregar bibliotecas y rutas
```tsx
import { BrowserRouter } from "react-router-dom";
import { AppRoutes } from "./routes";// llama a index.tsx
export const App = () =>{
  return (
    <BrowserRouter>// Cambia div por BrowserRouter
      <AppRoutes/>
    </BrowserRouter>
  );
}
export default App;
```
# 3. React(Mui)
## 3.1. Inicio
- Instalar en un proyecto react inicial
```console
npm install @mui/material @emotion/react @emotion/styled
```
- instalar iconos
```console
npm install @mui/icons-material
```
## 3.2. Agregar el tipo de fuente
- Ir a index.html
```html
<title>React App</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"/>
```
## 3.3. BOTON
- Por ejemplo en routes/index.tsx
```tsx
import {Routes, Route, Navigate} from 'react-router-dom'
import Button from '@mui/material/Button'
export const AppRoutes = () => {
return (
 <Routes>
   {/* Agregar el boton */}
   <Route path='/' element={<Button variant="contained" color="warning">Página Inicial</Button>}/>//defe
   <Route path='/pagina-inicial' element={<Button variant="contained" color="success">Página Inicial              
</Button>}/>//pagin inicial
   <Route path='*' element={<Navigate to="/pagina-inicial"/>}/>//cualquier ruta
        </Routes>
 );
}

```
## 3.4. Crear componente en proyecto base react mui IMANOL
- Usar el codigo base de abajo, llamarlo ejm(FormCheckbox.tsx), ubicado common/components/ui/form
```tsx
import TextField from '@mui/material/TextField'
import { Controller } from 'react-hook-form'
import Typography from '@mui/material/Typography'
import { RegisterOptions } from 'react-hook-form/dist/types/validator'
import { InputProps as StandardInputProps } from '@mui/material/Input/Input'
import { FormHelperText, IconButton, InputAdornment } from '@mui/material'
import ClearOutlined from '@mui/icons-material/ClearOutlined'
import { Variant } from '@mui/material/styles/createTypography'
import { InputHTMLAttributes, useState } from 'react'
import Visibility from '@mui/icons-material/Visibility'
import VisibilityOff from '@mui/icons-material/VisibilityOff'

export interface FormInputTextProps {
  id: string
  name: string
  control: any // TODO: Cambiar a tipo TFieldValues con tipo genérico
  label: string
  size?: 'small' | 'medium'
  type?: InputHTMLAttributes<unknown>['type']
  rules?: RegisterOptions
  disabled?: boolean
  onChange?: StandardInputProps['onChange']
  onEnter?: () => void
  onClear?: () => void
  variant?: 'standard' | 'outlined' | 'filled'
  rows?: number
  multiline?: boolean
  bgcolor?: string
  labelVariant?: Variant
  placeholder?: string
}

export const FormCheckbox = ({
  id,
  name,
  control,
  label,
  size = 'small',
  type,
  rules,
  disabled,
  onChange,
  onEnter,
  onClear,
  variant,
  rows = 1,
  multiline = false,
  bgcolor,
  labelVariant = 'subtitle2',
  placeholder = '',
}: FormInputTextProps) => {
  // Add these variables to your component to track the state
  const [showPassword, setShowPassword] = useState(false)
  const handleClickShowPassword = () => setShowPassword(!showPassword)
  const handleMouseDownPassword = () => setShowPassword(!showPassword)

  return (
    <div>
      <Typography
        variant={labelVariant}
        sx={{ fontWeight: 'fontWeightMedium' }}
      >
        {label}
      </Typography>
      <Controller
        name={name}
        control={control}
        render={({ field, fieldState: { error } }) => (
          <>
          //******Aqui pegar un componente de mui***************
            <Checkbox
              checked={!!field.value}
              onChange={field.onChange}
            />
          //****************************************************
            {!!error && <FormHelperText error>{error?.message}</FormHelperText>}
          </>
        )}
        defaultValue={''}
        rules={rules}
      />
    </div>
  )
}

```
- importar desde module/admin/openvox/ui
```tsx
import { FormCheckbox } from '../../../../common/components/ui/form/FormCheckbox'
```
- Agregarlo en el return
```tsx
<FormCheckbox id ='https' control={control} name='https' label='https'></FormCheckbox>
```

[<< INDICE](../../README.md)

---


<div style="page-break-before: always;"></div>


# 📄 3.3.1. Componente ReactMui

[<< INDICE](../../README.md)
- [1. Componente](#1-componente)
  - [1.1. Hero.tsx](#11-herotsx)
  - [1.2. index.ts](#12-indexts)
  - [1.3. page.tsx](#13-pagetsx)

## 1. Componente
- Crear la carpeta componente con 2 archivos: index.ts, Hero.tsx
### 1.1. Hero.tsx
```tsx
import React from 'react'
const Hero = () => {
    return (
        <div>Heros</div>
    )
}
export default Hero
```
### 1.2. index.ts
```ts
import Hero from './Hero';
export {
    Hero
}
```
- Llamarlo desde la aplicación principal
### 1.3. page.tsx
```tsx

import { Hero } from '@/components'

export default function Home() {
  return (
    <main>
      <Hero/>
    </main>
  )
}

```

[<< INDICE](../../README.md)

---


### 3.4. PrimeReact


<div style="page-break-before: always;"></div>


# 📄 3.4.1. Alineación

[<< INDICE](../../README.md)
## Alineaciones
### Alineacion horizontal
```jsx
<div className="flex justify-content-center">
    <AccionGroup/>
</div>
```
### Alineacion vertical
```jsx
<div className="flex align-content-center">
    <AccionGroup/>
</div>
```
[<< INDICE](../../README.md)

---


<div style="page-break-before: always;"></div>


# 📄 3.4.2. Responsividad

[<< INDICE](../../README.md)
## Responsividad
- Tipos de resolucion de pantalla
```txt
sm: pantallas pequeñas, p. Los telefonos
md: pantallas medianas, p.e. tabletas
lg: pantallas grandes, p.e. cuadernos
xl: pantallas más grandes, por ejemplo monitores.
```
- Aplicando responsividad
```jsx
      <div className="p-3">
        <div className="grid p-fluid">
          <div className="col-12 sm:col-3 md:col-3 lg:col-3 xl:col-3">{/* Cuando sea xl ocupara 3 de las 12*/}
            <Componente1/>
          </div>
          <div className="col-12 sm:col-2 md:col-2 lg:col-2 xl:col-2">{/* Cuando sea xl ocupara 2 de las 12*/}
            <p>dato1</p>
          </div>
          <div className="col-12 sm:col-2 md:col-2 lg:col-2 xl:col-2">{/* Cuando sea xl ocupara 2 de las 12*/}
            <Button onClick={() => enviarDatos(rowData)} disabled={true} type="button" size="small" severity="success" className="mr-2" outlined label="Inicio Seguimiento" icon="pi pi-search" />
          </div>
          <div className="col-12 sm:col-3 md:col-3 lg:col-3 xl:col-3">{/* Cuando sea xl ocupara 3 de las 12*/}
            <Card className="p-d-flex p-flex-column" style={{ textAlign: "justify", backgroundColor:"greenyellow" }}>
              <p>Cantidad de Viaticos:</p>
              <p>Personal Asignado:</p>
              <p>Fecha Inicio:</p>
            </Card>
          </div>
        </div>
      </div>

```


---


<div style="page-break-before: always;"></div>


# 📄 3.4.3. Estilos

[<< INDICE](../../README.md)
## Estilos
- Para agregar estilos, por ejemplo el fondo gris al fondo, y en el card un fondo verde amarillo
```jsx
<div className="col-12 sm:col-3 md:col-3 lg:col-3 xl:col-3" style={{backgroundColor:"grey"}}>
  <Card className="p-d-flex p-flex-column" style={{ textAlign: "justify", backgroundColor:"greenyellow" }}>
    <p>Cantidad de Viaticos:</p>
    <p>Personal Asignado:</p>
    <p>Fecha Inicio:</p>
  </Card>
</div>
```


---


<div style="page-break-before: always;"></div>


# 📄 3.4.4. Mostrar u ocultar

[<< INDICE](../../README.md)
## Ocultar o mostrar
- Se usa la variable showObservacion
```jsx
  const [observacion, setObservacion] = useState('');
  const [showObservacion, setShowObservacion] = useState(false);
 
  return (
    <>
          { showObservacion && (<div className='ml-5 mr-5 mb-5'>
            <label htmlFor="observacion">Observación</label>
            <span className="p-float-label">
              <InputTextarea
                value={observacion}
                keyfilter={/^[^<>*!]+$/}
                onChange={(e) => setObservacion(e.target.value)}
                rows={2}
                cols={30}
              />
            </span>
            </div>
          </div>)
          }
    </>
  );
};

export default InicioActividadMain;
```


---


<div style="page-break-before: always;"></div>


# 📄 3.4.5. Select

[<< INDICE](../../README.md)
## Autocomplete
- Importar el componente select
```jsx
import { Dropdown } from 'primereact/dropdown';
```
- Codigo que se seleccionara
```jsx
  const [eevCodigoSeleccionado, setEevCodigoSeleccionado] = useState(null);
```
- Array de objetos de donde saldra la seleccion
```jsx
  const [estados, setEstados] = useState([]);
```
- Servicio que obtendra el array de objetos
```jsx
    useEffect(() => {
    getEstadosDestinoByIemCodigo(iemCodigo)
      .then((res) => {
        setEstados(res);
      })
      .catch((err) => toast.error(err.message));
  }, []);
```
- El componente select
```jsx
	<Dropdown
	value={eevCodigoSeleccionado}
	options={estados}
	optionLabel="eev_sigla"
	optionValue="eev_codigo"
	onChange={(e)=>onChangeEstado(e.value)}
	/>
```
- La función que recoge el codigo seleccionado
```jsx
   const onChangeEstado = (item) => {
    console.log(item);
    // setGesCodigo(item.value);
    // getAllActividades(item.value);
  };
```
- Si se quiere traer un dato por defecto, y el dropdown tiene el formato:
```jsx
    <DropdownController
      name='ent_codigo'
      control={control}
      rules={rules.required()}
      label='Entidades*'
      options={entidades}
      optionLabel='ent_descripcion'
      optionValue='ent_codigo'
      showClear={false}
    />
```
- Setear el valor en el initform
```jsx
 useEffect(() => {
    setValue('ent_codigo',1)
  }, []);
```
[<< INDICE](../../README.md)	


---


<div style="page-break-before: always;"></div>


# 📄 3.4.6. Prime-Flex (Repositorio / Documentación)

# prime-flex

[<< INDICE](https://github.com/xixay/ayuda-memoria/tree/main)

## 📖 Índice de utilidades

---

### 🖼️ Layout
| Tema | Enlace | Tema | Enlace |
|------|--------|------|--------|
| **Display** | [Ver](./docs/Display.md) | **Overflow** | [Ver](./docs/Overflow.md) |
| **Position** | [Ver](./docs/Position.md) | **Z-Index** | [Ver](./docs/Zindex.md) |
| **Placement** | [Ver](./docs/Placement.md) |||

---

### 📐 Flexbox
| Tema | Enlace | Tema | Enlace |
|------|--------|------|--------|
| **Flex Direction** | [Ver](./docs/FlexBoxDirection.md) | **Flex Wrap** | [Ver](./docs/FlexBoxWrap.md) |
| **Justify Content** | [Ver](./docs/FlexBoxJustifyContent.md) | **Align Items** | [Ver](./docs/FlexBoxAlignItems.md) |
| **Align Content** | [Ver](./docs/FlexBoxAlignContent.md) | **Align Self** | [Ver](./docs/FlexBoxAlignSelf.md) |
| **Flex** | [Ver](./docs/FlexBoxFlex.md) | **Flex Grow** | [Ver](./docs/FlexBoxFlexGrow.md) |
| **Flex Shrink** | [Ver](./docs/FlexBoxFlexShrink.md) | **Flex Order** | [Ver](./docs/FlexBoxOrder.md) |
| **Gap** | [Ver](./docs/FlexBoxGap.md) |||

---

### 🗃️ Grid
| Tema | Enlace | Tema | Enlace |
|------|--------|------|--------|
| **Grid System** | [Ver](./docs/GridSystem.md) | **Grid Form Layout** | [Ver](./docs/GridFormLayout.md) |

---

### 🌄 Background
| Tema | Enlace | Tema | Enlace |
|------|--------|------|--------|
| **Background Color** | [Ver](./docs/BackgroundColor.md) | **Background Position** | [Ver](./docs/BackgroundPosition.md) |
| **Background Repeat** | [Ver](./docs/BackgroundRepeat.md) | **Background Size** | [Ver](./docs/BackgroundSize.md) |

---

### 🎨 Border
| Tema | Enlace | Tema | Enlace |
|------|--------|------|--------|
| **Border Style** | [Ver](./docs/BorderStyle.md) | **Border Width** | [Ver](./docs/BorderWidth.md) |
| **Border Color** | [Ver](./docs/BorderColor.md) | **Border Radius** | [Ver](./docs/BorderRadius.md) |

---

### 📏 Spacing
| Tema | Enlace | Tema | Enlace |
|------|--------|------|--------|
| **Margin** | [Ver](./docs/SpacingMargin.md) | **Padding** | [Ver](./docs/SpacingPadding.md) |
| **Gap** | [Ver](./docs/FlexBoxGap.md) |||

---

### 📐 Sizing
| Tema | Enlace | Tema | Enlace |
|------|--------|------|--------|
| **Width** | [Ver](./docs/SizingWidth.md) | **Min Width** | [Ver](./docs/SizingMinWidth.md) |
| **Max Width** | [Ver](./docs/SizingMaxWidth.md) | **Height** | [Ver](./docs/SizingHeight.md) |
| **Min Height** | [Ver](./docs/SizingMinHeight.md) | **Max Height** | [Ver](./docs/SizingMaxHeight.md) |

---

### ✍️ Typography
| Tema | Enlace | Tema | Enlace |
|------|--------|------|--------|
| **Font Size** | [Ver](./docs/TypographyFontSize.md) | **Font Style** | [Ver](./docs/TypographyFontStyle.md) |
| **Font Weight** | [Ver](./docs/TypographyFontWeight.md) | **Font Family** | [Ver](./docs/TypographyFontFamily.md) |
| **Text Align** | [Ver](./docs/TypographyTextAlign.md) | **Text Decoration** | [Ver](./docs/TypographyTextDecoration.md) |
| **Text Transform** | [Ver](./docs/TypographyTextTransform.md) | **Line Height** | [Ver](./docs/TypographyLineHeight.md) |
| **Letter Spacing** | [Ver](./docs/TypographyLetterSpacing.md) |||

---

### ✨ Effects
| Tema | Enlace | Tema | Enlace |
|------|--------|------|--------|
| **Shadow** | [Ver](./docs/EffectsShadow.md) | **Opacity** | [Ver](./docs/EffectsOpacity.md) |

---

### 🔄 Transition
| Tema | Enlace | Tema | Enlace |
|------|--------|------|--------|
| **Duration** | [Ver](./docs/TransitionDuration.md) | **Timing Function** | [Ver](./docs/TransitionTimingFunction.md) |
| **Property** | [Ver](./docs/TransitionProperty.md) |||

---

### 🎞️ Animation
| Tema | Enlace | Tema | Enlace |
|------|--------|------|--------|
| **Keyframes** | [Ver](./docs/AnimationKeyframes.md) | **Iteration Count** | [Ver](./docs/AnimationIteration.md) |
| **Delay** | [Ver](./docs/AnimationDelay.md) | **Direction** | [Ver](./docs/AnimationDirection.md) |
| **Fill Mode** | [Ver](./docs/AnimationFillMode.md) | **Play State** | [Ver](./docs/AnimationPlayState.md) |

---

### 🔁 Transforms
| Tema | Enlace | Tema | Enlace |
|------|--------|------|--------|
| **Scale** | [Ver](./docs/TransformScale.md) | **Rotate** | [Ver](./docs/TransformRotate.md) |
| **Translate** | [Ver](./docs/TransformTranslate.md) | **Skew** | [Ver](./docs/TransformSkew.md) |
| **Origin** | [Ver](./docs/TransformOrigin.md) |||

---

### 🖱️ Interactivity
| Tema | Enlace | Tema | Enlace |
|------|--------|------|--------|
| **Cursor** | [Ver](./docs/InteractivityCursor.md) | **Outline** | [Ver](./docs/InteractivityOutline.md) |
| **Pointer Events** | [Ver](./docs/InteractivityPointerEvents.md) | **User Select** | [Ver](./docs/InteractivityUserSelect.md) |
| **Resize** | [Ver](./docs/InteractivityResize.md) | **Scroll Behavior** | [Ver](./docs/InteractivityScrollBehavior.md) |


---


<div style="page-break-before: always;"></div>

## 4. 🛠️ Utilitarios


<div style="page-break-before: always;"></div>


# 📄 4.1. Array

[<< INDICE](../README.md)
- [1. map](#1-map)
- [2. Devolver un array de objetos con map](#2-devolver-un-array-de-objetos-con-map)
- [3. No repetidos](#3-no-repetidos)

## 1. map
- Para ilustrar cómo funciona map() en JavaScript, consideremos una lista de nombres de algunos de nuestros Vengadores favoritos. El problema es que los nombres de esta lista no están completos: les falta un sufijo importante.
- Con map(), podemos tomar todos los nombres de la matriz y añadir el sufijo "man" a todos y cada uno de ellos:
```js
let prefijos = ["super", "spider", "ant", "iron"]
let sufijo = "man";

let nombresCompletos = prefijos.map(prefijo => prefijo + sufijo);

console.log(nombresCompletos);

// ["superman", "spiderman", "antman", "ironman"]
```
## 2. Devolver un array de objetos con map
```js
this.datos = response//array
this.arrayAreas = this.datos.map(f => {
  let rObj ={nombre:f.aun_nombre,value:false}
  return rObj
})
```
## 3. No repetidos
- Se obtiene un array de codigos, pero alguien registro duplicado [1,3,6,7,1]
```js
let arrayHijo = resultAreaDep.map(m => m.aun_codigo_hijo)//devuelve [1,3,6,7,1]
``` 
- Para evitar que se dupliquen
```js
arrayHijo = [new Set(...arrayHijo)]//devuelve [1,3,6,7]
```

[<< INDICE](../README.md)

---


<div style="page-break-before: always;"></div>


# 📄 4.2. Formulario (Html)

[<< INDICE](../README.md)
- [1. Formulario-Repositorio](#1-formulario-repositorio)
- [2. Funcion Captura Datos](#2-funcion-captura-datos)

## 1. Formulario-Repositorio
- Capturar datos a través de formulario utilizando funciones en JavaScript
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario</title>
</head>
<body>
    <form action="">
        <input type="text" name="nomEst" id="nomEst" placeholder="Digite nombre estudiante" size="35">
        <br>
        <input type="text" name="celEst" id="celEst" placeholder="Digite el celular del estudiante" size="35">
        <br>
        <button type="button" onclick="captura()">Capturar</button>
    </form>
    <br><br>
    <script type="text/javascript" src="./instrucciones.js"></script>
</body>
</html>
```
## 2. Funcion Captura Datos
- Funcion js que captura datos desde un cuadro de texto de formulario
```js
//Funcion que captura datos desde un cuadro de texto de formulario
function captura(){
    //Captura el valor que digita en el cuadro estudiante
    var nombreEst=document.getElementById("nomEst").value;
    var celularEst=document.getElementById("celEst").value;
    //alert(nombreEst);
    if (nombreEst=="") {
        alert("El nombre es obligatorio digitarlo");
        //Hace que el cursor se pare en el cuadro de nombre, despues de dar aceptar
        document.getElementById("nomEst").focus();
    } else {
        if (celularEst=="") {
            alert("El celular es obligatorio digitarlo");
            //Hace que el cursor se pare en el cuadro de celular, despues de dar aceptar
            document.getElementById("celEst").focus();
        } else{
            //Muestra los datos por consola F12 en terminal
            console.log('nombre Estudiante', nombreEst, 'numero de celular', celularEst);
            //Borra los datos del cuadro de texto nombre
            document.getElementById("nomEst").value="";
            //Borra los datos del cuadro de texto celular
            document.getElementById("celEst").value="";
            //Despues de capturar, posiciona el nombre el cursor en el cuadro de nombre
            document.getElementById("nomEst").focus();
        }
    } 
}
```

[<< INDICE](../README.md)

---


<div style="page-break-before: always;"></div>


# 📄 4.3. Formulario 2 (Html)

[<< INDICE](../README.md)
- [1. Formulario-Repositorio](#1-formulario-repositorio)
- [2. Obtener los datos del formulario](#2-obtener-los-datos-del-formulario)

## 1. Formulario-Repositorio
- Utilizando funciones en JavaScript
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <div>
        <form id="guardarTransaccion">
            <div>
                <label for="descripcionTransaccion">Descripción</label>
                <input id="descripcionTransaccion" type="text" placeholder="Descripcion">
            </div>
            <br>
            <div>
                <label for="precioTransaccion">Precio</label>
                <input id="precioTransaccion" type="number" placeholder="Precio">
            </div>
            <br>
            <div>
                <button>Guardar Transaccion</button>
            </div>
        </form>
    </div>
    <!--Llama el script-->
    <script src="./scripts/script.js"></script>
</body>
</html>
```
## 2. Obtener los datos del formulario
- Obtener los datos del formulario
```js
//obtiene los elementos del formulario
const elementoForm=document.getElementById("guardarTransaccion");
console.log('####', elementoForm);
```
- Obtener datos
```js
//Al hacer click captura el evento
elementoForm.addEventListener("submit", (evento) => {
    //Cancelar el evento que tiene por defecto, osea recarga el navegador, cuando guarda
    evento.preventDefault();
    //obtiene los datos de la caja descripcion en una variable
    let edtDescripcion=document.getElementById('descripcionTransaccion').value;
    console.log('####', elementoForm);
    //obtiene los datos de la caja precio en una variable
    let edtPrecio=document.getElementById('precioTransaccion').value;
    //Crear el objeto 
    let transaccion={
        descripcion:edtDescripcion,
        precio:edtPrecio,
    };
    console.log('objeto transaccion', transaccion);
    //Convertir el objeto a Json
    let transaccionJson=JSON.stringify(transaccion);
    console.log('JSON transaccion', transaccionJson);
});
```

[<< INDICE](../README.md)

---


<div style="page-break-before: always;"></div>

## 5. 🎓 Cursos


<div style="page-break-before: always;"></div>


# 📄 5.1. React y Next_14(Incompleto)

[<< INDICE](https://github.com/xixay/ayuda-memoria/tree/main)
# React y Next_14
## 1. Fundamentos de Java Script

| Tema | Enlace | Tema | Enlace |
|------|--------|------|--------|
| **6. Variables var let y const** | [Ver](https://github.com/xixay/React_y_Next_14_JS/blob/main/docs/6.-%20varLetConst.md) | **7. Funciones Flecha** | [Ver](https://github.com/xixay/React_y_Next_14_JS/blob/main/docs/7.-funcionesFlecha.md) |
| **8. Template String** | [Ver](https://github.com/xixay/React_y_Next_14_JS/blob/main/docs/8.-templateString.md) | **9. Objetos** | [Ver](https://github.com/xixay/React_y_Next_14_JS/blob/main/docs/9.-objetos.md) |
| **10. Desestructuración de Objetos** | [Ver](https://github.com/xixay/React_y_Next_14_JS/blob/main/docs/10.-destructuracionObjetos.md) | **11. Objetos Ejm** | [Ver](https://github.com/xixay/React_y_Next_14_JS/blob/main/docs/11.-objetosEjm.md) |
| **12. Fetch Api** | [Ver](https://github.com/xixay/React_y_Next_14_JS/blob/main/docs/12.-fetchApi.md) | **13. Async Await** | [Ver](https://github.com/xixay/React_y_Next_14_JS/blob/main/docs/13.-asyncAwait.md) |
| **14. Map** | [Ver](https://github.com/xixay/React_y_Next_14_JS/blob/main/docs/14.-map.md) | **15. Fylter** | [Ver](https://github.com/xixay/React_y_Next_14_JS/blob/main/docs/15.-fylter.md) |

## 2. React + Vite + Fundamentos

| Tema | Enlace | Tema | Enlace |
|------|--------|------|--------|
| **17. Extensiones** | [Ver](https://github.com/xixay/React_y_Next_14_Fundamentos/blob/main/docs/17.-extensiones.md) | **19. Node JS y NPM** | [Ver](https://github.com/xixay/React_y_Next_14_JS/blob/main/docs/19.-nodeJsNpm.md) |
| **22. Instalar Ract Vite** | [Ver](https://github.com/xixay/React_y_Next_14_Fundamentos/blob/main/docs/22.-instalacionReactVite.md) | **23. Vistazo Rapido de Archivos** | [Ver](https://github.com/xixay/React_y_Next_14_JS/blob/main/docs/23.-VistazoRapidoArchivos.md) |
| **24. Export vs Export Default** | [Ver](https://github.com/xixay/React_y_Next_14_Fundamentos/blob/main/docs/24.-exportVsExportDefault.md) | **25. Archivos JSX** | [Ver](https://github.com/xixay/React_y_Next_14_JS/blob/main/docs/25.-jsx.md) |
| **26. Fragment** | [Ver](https://github.com/xixay/React_y_Next_14_Fundamentos/blob/main/docs/26.-fragment.md) | **27. Interpolación** | [Ver](https://github.com/xixay/React_y_Next_14_JS/blob/main/docs/27.-interpolacion.md) |
| **28. Mi Primer Componente** | [Ver](https://github.com/xixay/React_y_Next_14_Fundamentos/blob/main/docs/28.-miPrimerComponente.md) | **29. Operador ternario** | [Ver](https://github.com/xixay/React_y_Next_14_JS/blob/main/docs/29.-operadorTernario.md) |
| **30. Operador Ternario Componentes** | [Ver](https://github.com/xixay/React_y_Next_14_Fundamentos/blob/main/docs/30.-operadorTernarioComponentes.md) | **31. Operador &&** | [Ver](https://github.com/xixay/React_y_Next_14_JS/blob/main/docs/31.-operador&&.md) |
| **32. Reutilizar Componentes** | [Ver](https://github.com/xixay/React_y_Next_14_Fundamentos/blob/main/docs/32.-reutilizarComponentes.md) | **33. Importar Archivos Staticos** | [Ver](https://github.com/xixay/React_y_Next_14_JS/blob/main/docs/33.-importarArchivosEstaticos.md) |
| **34. Recorrer Elementos Map** | [Ver](https://github.com/xixay/React_y_Next_14_Fundamentos/blob/main/docs/34.-recorrerElementosMap.md) | **35. Uso de Props** | [Ver](https://github.com/xixay/React_y_Next_14_JS/blob/main/docs/35.-props.md) |
| **36. Advertencia Eslint** | [Ver](https://github.com/xixay/React_y_Next_14_Fundamentos/blob/main/docs/36.-AdvertenciaEslint.md) | **37. Tipos de Props** | [Ver](https://github.com/xixay/React_y_Next_14_JS/blob/main/docs/37.-propTypes.md) |
| **38. Evitar la repetición de mensaje por consola** | [Ver](https://github.com/xixay/React_y_Next_14_Fundamentos/blob/main/docs/38.-repitenConsolas.md) | **39. Desestructuración** | [Ver](https://github.com/xixay/React_y_Next_14_JS/blob/main/docs/39.-Desestructuracion.md) |
| **40. Uso de maps en componentes props** | [Ver](https://github.com/xixay/React_y_Next_14_Fundamentos/blob/main/docs/40.-mapsComponentesProps.md) | **41. Practicar Props** | [Ver](https://github.com/xixay/React_y_Next_14_JS/blob/main/docs/41.-practicarProps.md) |
| **42. Reducir Código** | [Ver](https://github.com/xixay/React_y_Next_14_Fundamentos/blob/main/docs/42.-reducirCodigo.md) | **43. Evento On Click** | [Ver](https://github.com/xixay/React_y_Next_14_JS/blob/main/docs/43.-eventoOnClick.md) |
| **44. Modularización de Componentes** | [Ver](https://github.com/xixay/React_y_Next_14_Fundamentos/blob/main/docs/44.-modularizacionComponentes.md) | **45. Seguir Modularizando** | [Ver](https://github.com/xixay/React_y_Next_14_JS/blob/main/docs/45.-seguimosModularizando.md) |
| **46. Componente que lista Frutas** | [Ver](https://github.com/xixay/React_y_Next_14_Fundamentos/blob/main/docs/46.-tareaComponenteListFruts.md) | **47. Otro Ejem** | [Ver](https://github.com/xixay/React_y_Next_14_JS/blob/main/docs/47.-tareaDos.md) |
| **48. Visualizando el problema** | [Ver](https://github.com/xixay/React_y_Next_14_Fundamentos/blob/main/docs/48.-visualizandoProblema.md) | **49. Hooks** | [Ver](https://github.com/xixay/React_y_Next_14_JS/blob/main/docs/49.-queSonLosHooks.md) |
| **50. Use State** | [Ver](https://github.com/xixay/React_y_Next_14_Fundamentos/blob/main/docs/50.-introduccionAUseState.md) | **51. Desestructuración con UseState** | [Ver](https://github.com/xixay/React_y_Next_14_JS/blob/main/docs/51.-desestructuracionUseState.md) |

## 3. Formularios en React + Vite

| Tema | Enlace | Tema | Enlace |
|------|--------|------|--------|
| **52. Introducción a esta sección** | [Ver](https://github.com/xixay/React_y_Next_14_Boostrap/blob/main/docs/52.-introduccion.md) | **53. React developer Tools** | [Ver](https://github.com/xixay/React_y_Next_14_Boostrap/blob/main/docs/53.-reactDeveloperTools.md) |
| **54. Instalación React con Vite** | [Ver](https://github.com/xixay/React_y_Next_14_Boostrap/blob/main/docs/54.-instalacionReactVite.md) | **55. Preparación** | [Ver](https://github.com/xixay/React_y_Next_14_Boostrap/blob/main/docs/55.-principal.md) |

### 3.1. Usando Boostrap (Original)

| Tema | Enlace | Tema | Enlace |
|------|--------|------|--------|
| **55. Boostrap 5** | [Ver](https://github.com/xixay/React_y_Next_14_Boostrap/blob/main/docs/55.-boostrap.md) | **56. Estructura Formulario JSX** | [Ver](https://github.com/xixay/React_y_Next_14_Boostrap/blob/main/docs/56.-estructuraForm.md) |
| **57. onSubmit** | [Ver](https://github.com/xixay/React_y_Next_14_Boostrap/blob/main/docs/57.-onSubmit.md) | **58. useRef** | [Ver](https://github.com/xixay/React_y_Next_14_Boostrap/blob/main/docs/58.-useRef.md) |
| **59. formData** | [Ver](https://github.com/xixay/React_y_Next_14_Boostrap/blob/main/docs/59.-formData.md) | **60. Validaciones** | [Ver](https://github.com/xixay/React_y_Next_14_Boostrap/blob/main/docs/60.-validaciones.md) |
| **61. Solución de Tarea** | [Ver](https://github.com/xixay/React_y_Next_14_Boostrap/blob/main/docs/61.-error.md) | **62. Formularios controlados (Introducción)** | [Ver](https://github.com/xixay/React_y_Next_14_Boostrap/blob/main/docs/62.-introControlados.md) |
| **63. onChange** | [Ver](https://github.com/xixay/React_y_Next_14_Boostrap/blob/main/docs/63.-onChange.md) | **64. useState con objetos** | [Ver](https://github.com/xixay/React_y_Next_14_Boostrap/blob/main/docs/64.-useStateConObjetos.md) |

### 3.2. Usando MUI

| Tema | Enlace | Tema | Enlace |
|------|--------|------|--------|
| **55. reactMui** | [Ver](https://github.com/xixay/React_y_Next_14_Mui/blob/main/docs/55.-reactMui.md) | **56. Estructura Formulario JSX** | [Ver](https://github.com/xixay/React_y_Next_14_Mui/blob/main/docs/56.-estructuraForm.md) |
| **57. onSubmit** | [Ver](https://github.com/xixay/React_y_Next_14_Mui/blob/main/docs/57.-onSubmit.md) | **58. useRef** | [Ver](https://github.com/xixay/React_y_Next_14_Mui/blob/main/docs/58.-useRef.md) |
| **59. formData** | [Ver](https://github.com/xixay/React_y_Next_14_Mui/blob/main/docs/59.-formData.md) | **60. Validaciones** | [Ver](https://github.com/xixay/React_y_Next_14_Mui/blob/main/docs/60.-validaciones.md) |
| **61. Solución de Tarea** | [Ver](https://github.com/xixay/React_y_Next_14_Mui/blob/main/docs/61.-error.md) | | |

### 3.2. Usando PrimeReac
| Tema | Enlace | Tema | Enlace |
|------|--------|------|--------|
| **55. PrimeReact** | [Ver](https://github.com/xixay/React_y_Next_14_Prime/blob/main/docs/55.-primeReact.md) | **56. Estructura Formulario JSX** | [Ver](https://github.com/xixay/React_y_Next_14_Prime/blob/main/docs/56.-estructuraForm.md) |
| **57. onSubmit** | [Ver](https://github.com/xixay/React_y_Next_14_Prime/blob/main/docs/57.-onSubmit.md) | **58. useRef** | [Ver](https://github.com/xixay/React_y_Next_14_Prime/blob/main/docs/58.-useRef.md) |
| **59. formData** | [Ver](https://github.com/xixay/React_y_Next_14_Prime/blob/main/docs/59.-formData.md) | **60. Validaciones** | [Ver](https://github.com/xixay/React_y_Next_14_Prime/blob/main/docs/60.-validaciones.md) |
| **61. Solución de Tarea** | [Ver](https://github.com/xixay/React_y_Next_14_Prime/blob/main/docs/61.-error.md) | | |

[<< INDICE](https://github.com/xixay/ayuda-memoria/tree/main)

---


<div style="page-break-before: always;"></div>


# 📄 5.2. Vue y JS

# curso_vue
[<< INDICE](https://github.com/xixay/ayuda-memoria/tree/main)

| Tema | Enlace | Tema | Enlace |
|------|--------|------|--------|
| **1.- Taller - Creación de Aplicaciones en Tiempo Real con Node.js, Socket.IO y OpenAI** | [Ver](https://github.com/xixay/curso_vue_clase_1) | **2. Taller - Creación de Aplicaciones en Tiempo Real con Node.js OpenAI** | [Ver](https://github.com/xixay/curso_vue_clase_2) |
| **3.- Introducción Node.js - Paquetes NPM** | [Ver](https://github.com/xixay/curso_vue_clase_3) | **4. Introducción Node.js - Creación Api Rest con Node** | [Ver](https://github.com/xixay/curso_vue_clase_4) |
| **5.- Introducción Vue.js - Bases e Instalación Vue 3 Javascript** | [Ver](https://github.com/xixay/curso_vue_clase_5) | **6. Introducción Vue.js - Instalación Vue 3 + Rutas Vue composition api** | [Ver](https://github.com/xixay/curso_vue_clase_6) |
| **7.- Introducción Vue.js - Vue 3 Consumo de Servicios Api Rest con Axios** | [Ver](https://github.com/xixay/curso_vue_clase_7) | **8. Configuración inicial (Babel y Sequelize)** | [Ver](https://github.com/xixay/curso_vue_clase_8) |
| **9.- Importación y exportación Javascript** | [Ver](https://github.com/xixay/curso_vue_clase_9) | **10. Modelo User y Login Autenticación Api Rest** | [Ver](https://github.com/xixay/curso_vue_clase_9) |
| **11.- CRUD Usuario Api Rest + Middlewares (JWT) - VuePress** | [Ver](https://github.com/xixay/curso_vue_clase_11) | **12.- Proyecto Vue + Servicios Axios Vue** | [Ver](https://github.com/xixay/curso_vue_clase_12) |
| **13.- LocalStorage + Consumo servicio User** | [Ver](https://github.com/xixay/curso_vue_clase_13) | **14.- Crud Usuarios y Guards en Vue** | [Ver](https://github.com/xixay/curso_vue_clase_14) |
| **15.- Base de datos Sequelize Relación migraciones+Models** | [Ver](https://github.com/xixay/curso_vue_clase_15) | **16.- Vue Diseño Sitio Web y Administración** | [Ver](https://github.com/xixay/curso_vue_clase_16) |
| **17.- PrimeVue Integración Template Sakai Panel Admin** | [Ver](https://github.com/xixay/curso_vue_clase_17) | **18.- Node Paginación Producto subida de Imágenes Multer** | [Ver](https://github.com/xixay/curso_vue_clase_18) |
| **19.- Node Paginación Producto subida de Imágenes Multer** | [Ver](https://github.com/xixay/curso_vue_clase_19) | **20.- Vue Registro y Edición Productos + diseño Pedido** | [Ver](https://github.com/xixay/curso_vue_clase_20) |
| **21.- Docker Mysql y Estructura de archivos Rutas NodeJS** | [Ver](https://github.com/xixay/curso_vue_clase_21) | **22.- Validaciones Express-validator, Perfil** | [Ver](https://github.com/xixay/curso_vue_clase_22) |
| **23.- Docker y NodeJs** | [Ver](https://github.com/xixay/curso_vue_clase_23) | **24.- Amazon Web Services S3** | [Ver](https://github.com/xixay/curso_vue_clase_24) |
| **25.- Extra 1 - Correcciones** | [Ver](https://github.com/xixay/curso_vue_extra_1) | **26.- Extra 2 - Morgan y Seeders** | [Ver](https://github.com/xixay/curso_vue_extra_2) |
| **27.- Extra 3 - Correcciones Visual Frontend** | [Ver](https://github.com/xixay/curso_vue_extra_3) | **28.- Extra 4 - Correcciones Logica Backend** | [Ver](https://github.com/xixay/curso_vue_extra_4) |
| **29.- Extra 5 - Correcciones Visual Frontend 2** | [Ver](https://github.com/xixay/curso_vue_extra_5) | | |
# repositorio backend
[>> EXPRESS](https://github.com/xixay/curso_vue_proyecto_base_backend)

# repositorio frontend
[>> VUE3 + VITE + VUEPRIME](https://github.com/xixay/curso_vue_proyecto_base_frontend)

# repositorio producción
[>> BACKEND + FRONTEND](https://github.com/xixay/docker-node-vue-production)


[<< INDICE](https://github.com/xixay/ayuda-memoria/tree/main)


---


<div style="page-break-before: always;"></div>


# 📄 5.4. NestJS y Angular(Incompleto)

# curso_nestjs_angular
[<< INDICE](https://github.com/xixay/ayuda-memoria/tree/main)

| Tema | Enlace | Tema | Enlace |
|------|--------|------|--------|
| **1.- NodeJs & Angular 19 - Hola Mundo** | [Ver](https://github.com/xixay/curso_nestjs_ang_clase_1) | **2.- NodeJS & Angular 19 - Inicio Proyecto - creacion DB** | [Ver](https://github.com/xixay/curso_nestjs_ang_clase_2) |
| **3. NodeJs & Angular 19 - Conexion DB & Entidades** | [Ver](https://github.com/xixay/curso_nestjs_ang_clase_3) | **4. Nestjs & Angular 19 - CRUD backend Api-rest** | [Ver](https://github.com/xixay/curso_nestjs_ang_clase4) |
| **5. NodeJs & Angular 19 - Configuracion proyecto angular** | [Ver](https://github.com/xixay/curso_nestjs_ang_clase_5) | **6. NodeJs & Angular 19 - Rutas en Angular** | [Ver](https://github.com/xixay/curso_nestjs_ang_clase_6) |
| **7. NodeJs & Angular 19 - Formularios Reactivos** | [Ver](https://github.com/xixay/curso_nestjs_ang_clase_7) | **7. NodeJs & Angular 19 - Formularios Reactivos** | [Ver](https://github.com/xixay/curso_nestjs_ang_clase_7) |

[<< INDICE](https://github.com/xixay/ayuda-memoria/tree/main)

---


<div style="page-break-before: always;"></div>


# 📄 5.5. React y JS(Incompleto)

# curso_react
[<< INDICE](https://github.com/xixay/ayuda-memoria/tree/main)

| Tema | Enlace | Tema | Enlace |
|------|--------|------|--------|
| **1.- Introducción React.jsx - Bases e Instalación React con vite Javascript** | [Ver](https://github.com/xixay/curso_react_clase_1) | **2.- Rutas React composition api** | [Ver](https://github.com/xixay/curso_react_clase_2) |
| **3.- Introducción React.jsx - React Consumo de Servicios Api Rest con Axios** | [Ver](https://github.com/xixay/curso_react_clase_3) | **4.- Proyecto React + Servicios Axios React y Login** | [Ver](https://github.com/xixay/curso_react_clase_4) |
| **5.- Local Storage - Consumo de Servicio User** | [Ver](https://github.com/xixay/curso_react_clase_5) | **6.- Crud Usuarios y Guards React** | [Ver](https://github.com/xixay/curso_react_clase_6) |

# repositorio backend(sera el mismo que el de vue)
[>> EXPRESS](https://github.com/xixay/curso_react_proyecto_base_backend)

# repositorio frontend
[>> REACT + VITE + REACTPRIME](https://github.com/xixay/curso_react_proyecto_base_frontend)

# repositorio producción
[>> BACKEND + FRONTEND](https://github.com/xixay/docker-node-react-production)


[<< INDICE](https://github.com/xixay/ayuda-memoria/tree/main)


---


<div style="page-break-before: always;"></div>


# 📄 5.6. React y Nesxt y TS(Incompleto)

# curso_react_next
[<< INDICE](https://github.com/xixay/ayuda-memoria/tree/main)

| Tema | Enlace | Tema | Enlace |
|------|--------|------|--------|
| **1.- Introducción** | [Ver](https://github.com/xixay/curso_react_next_clase_1) | **2. Creacion proyecto** | [Ver](https://github.com/xixay/curso_react_next_clase_2) |
| **3.- Estructura Proyecto** | [Ver](https://github.com/xixay/curso_react_next_clase_3) | **4. Introducción Node.js - Creación Api Rest con Node** | [Ver](https://github.com/xixay/curso_react_next_clase_4) |
| **5.- Rutas % Zustand** | [Ver](https://github.com/xixay/curso_react_next_clase_5) | **6. BEM & common components** | [Ver](https://github.com/xixay/curso_react_next_clase_6) |
| **7.- add css styles & useForm** | [Ver](https://github.com/xixay/curso_react_next_clase_7) | **8. Clase 8** | [Ver](https://github.com/xixay/curso_react_next_clase_8) |
| **9.- Clase 9** | [Ver](https://github.com/xixay/curso_react_next_clase_9) | **10. Clase 10** | [Ver](https://github.com/xixay/curso_react_next_clase_10) |

# repositorio backend
[>> EXPRESS](https://github.com/xixay/curso_vue_proyecto_base_backend)

# repositorio frontend
[>> VUE3 + VITE + VUEPRIME](https://github.com/xixay/curso_vue_proyecto_base_frontend)

# repositorio producción
[>> BACKEND + FRONTEND](https://github.com/xixay/docker-node-vue-production)


[<< INDICE](https://github.com/xixay/ayuda-memoria/tree/main)


---


<div style="page-break-before: always;"></div>


# 📄 5.7. NestJS

# curso_nestjs
[<< INDICE](https://github.com/xixay/ayuda-memoria/tree/main)

| Tema | Enlace | Tema | Enlace |
|------|--------|------|--------|
| **1.- clase 01** | [Ver](https://github.com/xixay/curso_nestjs_clase1) | **2. clase 02** | [Ver](https://github.com/xixay/curso_nestjs_clase2) |
| **3.- clase 03** | [Ver](https://github.com/xixay/curso_nestjs_clase3) | **4. clase 04** | [Ver](https://github.com/xixay/curso_nestjs_clase4) |
| **5.- clase 05** | [Ver](https://github.com/xixay/curso_nestjs_clase5) | **6. clase 06** | [Ver](https://github.com/xixay/curso_nestjs_clase6) |
| **7.- clase 07** | [Ver](https://github.com/xixay/curso_nestjs_clase7) | **8. clase 08** | [Ver](https://github.com/xixay/curso_nestjs_clase8) |
| **9.- clase 09** | [Ver](https://github.com/xixay/curso_nestjs_clase9) | **10.- extra 01** | [Ver](https://github.com/xixay/curso_nestjs_extra1) |

# Evaluaciones

| Tarea | Enlace | Tarea | Enlace |
|------|--------|------|--------|
| **1.- tarea 01** | [Ver](https://github.com/xixay/curso_nestjs_tarea1) | **2. cuestionarios** | [Ver](https://github.com/xixay/curso_nestjs_cuestionarios) |


# repositorio backend
<!-- [>> EXPRESS](https://github.com/xixay/curso_vue_proyecto_base_backend) -->

# repositorio frontend
<!-- [>> VUE3 + VITE + VUEPRIME](https://github.com/xixay/curso_vue_proyecto_base_frontend) -->

# repositorio producción
<!-- [>> BACKEND + FRONTEND](https://github.com/xixay/docker-node-vue-production) -->


[<< INDICE](https://github.com/xixay/ayuda-memoria/tree/main)


---


<div style="page-break-before: always;"></div>


# 📄 5.8. Angular

# curso_angular
[<< INDICE](https://github.com/xixay/ayuda-memoria/tree/main)

| Tema | Enlace | Tema | Enlace |
|------|--------|------|--------|
| **1.- clase 01** | [Ver](https://github.com/xixay/curso_angular_clase1) | **2. clase 02** | [Ver](https://github.com/xixay/curso_angular_clase2) |
| **3.- clase 03** | [Ver](https://github.com/xixay/curso_angular_clase3) | **4. clase 04** | [Ver](https://github.com/xixay/curso_angular_clase4) |
| **5.- clase 05** | [Ver](https://github.com/xixay/curso_angular_clase5) | **6. clase 06** | [Ver](https://github.com/xixay/curso_angular_clase6) |
| **7.- clase 07** | [Ver](https://github.com/xixay/curso_angular_clase7) | **8. clase 08** | [Ver](https://github.com/xixay/curso_angular_clase8) |
| **9.- clase 09** | [Ver](https://github.com/xixay/curso_angular_clase9) | | |

# Evaluaciones

| Tarea | Enlace | Tarea | Enlace |
|------|--------|------|--------|
| **1.- tarea 01** | [Ver](https://github.com/xixay/curso_angular_tarea1) | **2. cuestionarios** | [Ver](https://github.com/xixay/curso_angular_cuestionarios) |


# repositorio backend
<!-- [>> EXPRESS](https://github.com/xixay/curso_vue_proyecto_base_backend) -->

# repositorio frontend
<!-- [>> VUE3 + VITE + VUEPRIME](https://github.com/xixay/curso_vue_proyecto_base_frontend) -->

# repositorio producción
<!-- [>> BACKEND + FRONTEND](https://github.com/xixay/docker-node-vue-production) -->


[<< INDICE](https://github.com/xixay/ayuda-memoria/tree/main)


---


<div style="page-break-before: always;"></div>


# 📄 5.9. Vue TS

# curso_vue_ts
[<< INDICE](https://github.com/xixay/ayuda-memoria/tree/main)

| Tema | Enlace | Tema | Enlace |
|------|--------|------|--------|
| **1.- clase 01** | [Ver](https://github.com/xixay/curso_vue_ts_clase1) | **2. clase 02** | [Ver](https://github.com/xixay/curso_vue_ts_clase2) |
| **3.- clase 03** | [Ver](https://github.com/xixay/curso_vue_ts_clase3) | **4. clase 04** | [Ver](https://github.com/xixay/curso_vue_ts_clase4) |
| **5.- clase 05** | [Ver](https://github.com/xixay/curso_vue_ts_clase5) | **6. clase 06** | [Ver](https://github.com/xixay/curso_vue_ts_clase6) |
| **7.- clase 07** | [Ver](https://github.com/xixay/curso_vue_ts_clase7) | | |

# Evaluaciones

| Tarea | Enlace | Tarea | Enlace |
|------|--------|------|--------|
| **1.- tarea 01** | [Ver](https://github.com/xixay/curso_vue_ts_tarea1) | **2. cuestionarios** | [Ver](https://github.com/xixay/curso_vue_ts_cuestionarios) |


# repositorio backend
<!-- [>> EXPRESS](https://github.com/xixay/curso_vue_proyecto_base_backend) -->

# repositorio frontend
<!-- [>> VUE3 + VITE + VUEPRIME](https://github.com/xixay/curso_vue_proyecto_base_frontend) -->

# repositorio producción
<!-- [>> BACKEND + FRONTEND](https://github.com/xixay/docker-node-vue-production) -->


[<< INDICE](https://github.com/xixay/ayuda-memoria/tree/main)

---


<div style="page-break-before: always;"></div>

## 6. 🌐 Estado del Stack Tecnológico (2025)


<div style="page-break-before: always;"></div>


# 📄 6.1. Tecnologías con soporte y sin soporte (2025)

[<< INDICE](../README.md)
- [1. 📊 Estado de soporte de tecnologías (2025)](#1--estado-de-soporte-de-tecnologías-2025)
  - [1.1. 🧱 Tecnologías principales](#11--tecnologías-principales)
  - [1.2. 🧭 Resumen rápido](#12--resumen-rápido)
  - [1.3. ⚙️ Equivalencias prácticas](#13-️-equivalencias-prácticas)
    - [1.3.1. 🧩 **De PrimeFlex → Tailwind CSS**](#131--de-primeflex--tailwind-css)
    - [1.3.2. 🧠 **De Sequelize → Prisma ORM**](#132--de-sequelize--prisma-orm)
  - [1.4. 💬 Recomendaciones finales](#14--recomendaciones-finales)
  - [1.5. 🧰 Stack moderno recomendado (2025)](#15--stack-moderno-recomendado-2025)

# 1. 📊 Estado de soporte de tecnologías (2025)

Este documento resume el estado actual de soporte, mantenimiento y reemplazo recomendado
para las tecnologías más utilizadas en stacks modernos de **React**, **Vue**, **NestJS**, y **PostgreSQL**.

---

## 1.1. 🧱 Tecnologías principales

| Categoría | Tecnología | Estado actual | Recomendación | Reemplazo o Alternativa | Notas importantes |
|------------|-------------|----------------|----------------|--------------------------|------------------|
| 🧩 **Frontend UI Utilities** | **PrimeFlex** | ⚠️ Mantenimiento (sin nuevas versiones) | 🚫 No usar en proyectos nuevos | ✅ Tailwind CSS | PrimeTek recomienda Tailwind como sucesor oficial. |
| 🧱 **Frontend Framework (JSX)** | **React (v18 / v19 beta)** | ✅ Activo y con soporte a largo plazo | ✅ Seguir usando | — | Principal framework mantenido por Meta. Compatibilidad con PrimeReact total. |
| 🧱 **Frontend Framework (Templates)** | **Vue 3 / 3.5+** | ✅ Activo y recomendado | ✅ Seguir usando | — | Vue 3 es estable y ampliamente adoptado. Vue 2 ya está en EOL (fin de vida). |
| 💅 **UI Component Library (React)** | **PrimeReact (v10+)** | ✅ Activo | ✅ Recomendado | — | Compatible con Tailwind. PrimeTek sigue dando soporte activo. |
| 💅 **UI Component Library (Vue)** | **PrimeVue (v4)** | ✅ Activo | ✅ Recomendado | — | En soporte completo. Requiere Tailwind o CSS propio. |
| ⚙️ **Backend Framework (Node.js)** | **NestJS (v11)** | ✅ Activo y maduro | ✅ Recomendado | — | Framework modular con soporte a largo plazo. Ideal para microservicios y APIs. |
| 🧠 **ORM (Node.js)** | **Sequelize** | ⚠️ Mantenimiento estable (pocas mejoras nuevas) | ⚠️ Usar con precaución | ✅ Prisma ORM o TypeORM | Sequelize sigue funcionando, pero su evolución es lenta. Prisma tiene mejor soporte TypeScript. |
| 🗄️ **Base de datos** | **PostgreSQL (v16)** | ✅ Soporte activo hasta 2030+ | ✅ Recomendado | — | Base sólida, ampliamente soportada por NestJS, Prisma y Sequelize. |
| 🧰 **Lenguaje** | **JavaScript (ES2023+)** | ✅ Estándar activo | ✅ Recomendado | — | Mantener actualizado a ESNext. |
| ⚙️ **Runtime** | **Node.js (v20 LTS / v22 Current)** | ✅ Soporte oficial | ✅ Recomendado | — | LTS hasta 2026. Compatible con NestJS y Prisma. |
| 🎨 **CSS Framework** | **Tailwind CSS (v4 beta)** | ✅ Activo y en crecimiento | ✅ Recomendado | — | Amplio soporte en React, Vue, Svelte, etc. |
| 🧱 **Package Manager** | **npm** | ✅ Activo | ✅ Recomendado | pnpm / yarn | npm 10+ ya optimizado, aunque pnpm es más eficiente. |

---

## 1.2. 🧭 Resumen rápido

| Tipo | Tecnología antigua / en mantenimiento | Alternativa moderna |
|------|----------------------------------------|----------------------|
| Estilos utilitarios | PrimeFlex | Tailwind CSS |
| ORM | Sequelize | Prisma / TypeORM |
| Framework Vue 2 | Vue 3 | — |
| JS plano | TypeScript | — |

---

## 1.3. ⚙️ Equivalencias prácticas

### 1.3.1. 🧩 **De PrimeFlex → Tailwind CSS**

| PrimeFlex | Tailwind CSS | Descripción |
|------------|--------------|-------------|
| `flex` | `flex` | Activa flexbox |
| `flex-wrap` | `flex-wrap` | Permite envolver elementos |
| `align-items-center` | `items-center` | Centra verticalmente |
| `justify-content-center` | `justify-center` | Centra horizontalmente |
| `border-round` | `rounded-lg` | Bordes redondeados |
| `border-round-xl` | `rounded-2xl` | Bordes grandes |
| `m-2`, `m-3` | `m-2`, `m-3` | Margen idéntico |
| `p-2`, `p-3` | `p-2`, `p-3` | Padding idéntico |
| `bg-primary` | `bg-blue-500` (o tu color) | Fondo principal |
| `text-primary` | `text-blue-500` | Texto con color primario |
| `w-12rem` | `w-[12rem]` | Ancho fijo personalizado |
| `min-w-full` | `w-full` | Ocupa 100% del ancho |
| `h-full` | `h-full` | Ocupa 100% de alto |
| `gap-3` | `gap-3` | Espaciado entre elementos |
| `justify-content-between` | `justify-between` | Espacio entre elementos |
| `align-items-start` | `items-start` | Alinea arriba |
| `align-items-end` | `items-end` | Alinea abajo |
| `text-center` | `text-center` | Centra texto |

---

### 1.3.2. 🧠 **De Sequelize → Prisma ORM**

| Concepto | Sequelize | Prisma | Comentario |
|-----------|------------|---------|-------------|
| Definir modelo | `sequelize.define('User', { ... })` | `model User { ... }` (en `schema.prisma`) | Prisma usa un esquema declarativo. |
| Consultar registros | `User.findAll()` | `prisma.user.findMany()` | API similar pero tipada. |
| Buscar por PK | `User.findByPk(id)` | `prisma.user.findUnique({ where: { id } })` | Prisma usa un sistema de objetos. |
| Crear registro | `User.create({ name: 'X' })` | `prisma.user.create({ data: { name: 'X' } })` | Similar sintaxis. |
| Actualizar | `User.update({ name: 'Y' }, { where: { id } })` | `prisma.user.update({ where: { id }, data: { name: 'Y' } })` | Prisma más expresivo. |
| Eliminar | `User.destroy({ where: { id } })` | `prisma.user.delete({ where: { id } })` | Prisma mantiene consistencia tipada. |
| Relaciones | Definidas en JS | Definidas en `schema.prisma` | Prisma valida relaciones en compilación. |
| Migraciones | `sequelize-cli db:migrate` | `npx prisma migrate dev` | Prisma genera migraciones automáticas. |
| Tipos TS | Manual o con plugin | Automático | Prisma genera tipos a partir del esquema. |

---

## 1.4. 💬 Recomendaciones finales

1. ✅ **Mantén React, Vue 3, NestJS y PostgreSQL**: son tecnologías maduras con soporte a largo plazo.
2. ⚙️ **Migra gradualmente de PrimeFlex → Tailwind CSS**: Tailwind tiene equivalencias exactas y soporte oficial.
3. 🧠 **Evalúa migrar Sequelize → Prisma**: mayor productividad, tipado nativo y migraciones más seguras.
4. 🚀 **Actualiza a Node.js 20+ y PrimeReact 10 / PrimeVue 4** para máxima compatibilidad.
5. 📦 **Usa pnpm o npm 10+** para mejor rendimiento en proyectos grandes.

---

## 1.5. 🧰 Stack moderno recomendado (2025)

| Capa | Tecnología recomendada | Estado |
|------|--------------------------|---------|
| Frontend (UI) | React / Vue 3 + Tailwind + PrimeReact/PrimeVue | ✅ |
| Backend | NestJS + Prisma ORM | ✅ |
| Base de datos | PostgreSQL 16+ | ✅ |
| Estilos utilitarios | Tailwind CSS | ✅ |
| Gestor de paquetes | pnpm / npm 10 | ✅ |

[<< INDICE](../README.md)

---


<div style="page-break-before: always;"></div>

## 7. 🌐 Proyectos Antigravity


<div style="page-break-before: always;"></div>


# 📄 7.1. Nestjs

[<< INDICE](https://github.com/xixay/ayuda-memoria/tree/main)

# 📘 Super Manual Maestro: Backend NestJS Empresarial (Guía Definitiva)

Este documento es la referencia definitiva del proyecto. Documenta la transformación desde un backend artesanal en Express (Sequelize) hacia una arquitectura industrial, segura y escalable en **NestJS**.

---

## 🗂️ Índice de Contenidos

- [📘 Super Manual Maestro: Backend NestJS Empresarial (Guía Definitiva)](#-super-manual-maestro-backend-nestjs-empresarial-guía-definitiva)
  - [🗂️ Índice de Contenidos](#️-índice-de-contenidos)
  - [🏗️ 1. Arquitectura del Núcleo (NestJS Deep Dive)](#️-1-arquitectura-del-núcleo-nestjs-deep-dive)
    - [1.1. Modules (`*.module.ts`)](#11-modules-modulets)
    - [1.2. Controllers (`*.controller.ts`)](#12-controllers-controllerts)
    - [1.3. Services (`*.service.ts`)](#13-services-servicets)
  - [🔐 2. Autenticación y Seguridad Avanzada](#-2-autenticación-y-seguridad-avanzada)
    - [2.1. El Flujo de Login](#21-el-flujo-de-login)
      - [Ejemplo de Seguridad en `AuthService`:](#ejemplo-de-seguridad-en-authservice)
    - [2.2. Guards (El Portero)](#22-guards-el-portero)
  - [📦 3. Lógica de Módulos (Business Logic)](#-3-lógica-de-módulos-business-logic)
    - [3.1. Pedidos y Transacciones (Stock)](#31-pedidos-y-transacciones-stock)
    - [3.2. Clientes y Categorías](#32-clientes-y-categorías)
  - [🚀 4. Documentación e Interactividad (Swagger)](#-4-documentación-e-interactividad-swagger)
  - [📋 5. Guía de Comandos y Mantenimiento](#-5-guía-de-comandos-y-mantenimiento)
    - [5.1. Scripts de Ejecución](#51-scripts-de-ejecución)
    - [5.2. Gestión de Datos (Tablas Profesionales)](#52-gestión-de-datos-tablas-profesionales)
  - [🛠️ 6. Alineación Técnica y Estabilidad](#️-6-alineación-técnica-y-estabilidad)
    - [6.1. Columnas de Auditoría (Audit Columns)](#61-columnas-de-auditoría-audit-columns)
    - [6.2. Robustez del Seeding](#62-robustez-del-seeding)
  - [🛠️ 7. Blindaje Global (Middlewares)](#️-7-blindaje-global-middlewares)
  - [🏁 8. Inicio Rápido (Setup)](#-8-inicio-rápido-setup)

---

## 🏗️ 1. Arquitectura del Núcleo (NestJS Deep Dive)

NestJS se basa en la **Inyección de Dependencias** y la **Modularidad**. Aquí explicamos cómo se construye cada pieza con ejemplos reales de este proyecto:

### 1.1. Modules (`*.module.ts`)
Es el pegamento del sistema. Cada funcionalidad (Auth, Pedidos, etc.) tiene su propio módulo.
```typescript
@Module({
  imports: [TypeOrmModule.forFeature([Producto, Categoria])], // Conexión a tablas
  controllers: [ProductoController], // Quién recibe el tráfico
  providers: [ProductoService], // Quién tiene la lógica
  exports: [ProductoService], // Permitir que otros usen este servicio
})
export class ProductoModule {}
```

### 1.2. Controllers (`*.controller.ts`)
Manejan las rutas HTTP. Su única misión es recibir datos y pasárselos al servicio.
```typescript
@ApiTags('Productos')
@Controller('producto')
export class ProductoController {
  constructor(private readonly productoService: ProductoService) {}

  @Post()
  @ApiOperation({ summary: 'Crear producto' })
  async create(@Body() createDto: CreateProductoDto) {
    return this.productoService.create(createDto);
  }
}
```

### 1.3. Services (`*.service.ts`)
Aquí vive la **Lógica de Negocio**. Es donde ocurre la "magia".
```typescript
@Injectable()
export class ProductoService {
  constructor(
    @InjectRepository(Producto)
    private readonly repo: Repository<Producto>,
  ) {}

  async findAll() {
    return await this.repo.find({ relations: ['categoria'] });
  }
}
```

---

## 🔐 2. Autenticación y Seguridad Avanzada

Hemos implementado un flujo de autenticación de grado bancario.

### 2.1. El Flujo de Login
1. **Bcrypt**: Recibe la contraseña, la hashea y la compara. Nunca guardamos texto plano.
2. **Access Token**: Un JWT corto (15 min) que viaja en el header `Authorization`.
3. **Refresh Token**: Un JWT largo (7 días) que viaja en una **Cookie HttpOnly**.

#### Ejemplo de Seguridad en `AuthService`:
```typescript
const isMatch = await bcrypt.compare(password, user.password); // Bcrypt en acción
if (isMatch) {
  const tokens = await this.generateTokens(user);
  // El Refresh Token se envía por Cookie segura
  response.cookie('refreshToken', tokens.refresh_token, {
    httpOnly: true, // Invisible para hackers (XSS)
    secure: true,
    sameSite: 'lax'
  });
}
```

### 2.2. Guards (El Portero)
El `AuthGuard` protege las rutas. Si no envías un Token válido, NestJS te rebota con un 401.
```typescript
@UseGuards(AuthGuard) // Blindaje total de la ruta
@Get('profile')
getProfile(@Request() req) { ... }
```

---

## 📦 3. Lógica de Módulos (Business Logic)

### 3.1. Pedidos y Transacciones (Stock)
Es el módulo más complejo. Asegura que si compras algo, el stock se descuente **SÍ O SÍ** o falle todo el proceso (Rollback).
- **Validación**: ¿Existe el producto? ¿Tiene stock?
- **Descuento**: Se resta del inventario en tiempo real.
- **Anulación**: Si anulas un pedido, el stock **Regresa** automáticamente.

### 3.2. Clientes y Categorías
- **Clientes**: Implementamos una búsqueda `OR` que filtra por nombre completo o CI (Carnet).
- **Categorías**: Usamos `select` para no traer datos basura y hacer que la carga sea instantánea.

---

## 🚀 4. Documentación e Interactividad (Swagger)

La API está viva en **`http://localhost:3000/api/docs`**.

- **DTOs Inteligentes**: Cada campo tiene `@ApiProperty` con ejemplos reales.
- **Pruebas en Vivo**: Puedes hacer Login, copiar el token, pulsar el botón verde **Authorize** arriba a la derecha.
- **Imágenes**: El controlador de productos tiene soporte para subida de archivos binarios mediante Swagger.

---

## 📋 5. Guía de Comandos y Mantenimiento

### 5.1. Scripts de Ejecución
| Comando | Acción |
| :--- | :--- |
| `npm run start:dev` | Inicia el servidor con reinicio automático. |
| `npm run build` | Compila el proyecto para producción. |

### 5.2. Gestión de Datos (Tablas Profesionales)
| Herramienta | Acción | Comando |
| :--- | :--- | :--- |
| **Migraciones** | Historial de cambios en BD | `npm run migrate:gen` / `run` |
| **Seeders** | Carga de datos base (Admin/Productos) | `npm run seed` |
| **Wipe** | Limpieza total y reconstrucción | `npm run db:clean` |
| **Robustez** | Verificación de carga sin errores | **Verificado** ✅ |

---

## 🛠️ 6. Alineación Técnica y Estabilidad

Recientemente hemos realizado un proceso de auditoría y alineación para asegurar que este backend sea 100% compatible con el esquema original:

### 6.1. Columnas de Auditoría (Audit Columns)
Todas las tablas, incluyendo las tablas intermedias, cuentan ahora con:
- `createdAt`: Fecha de creación automática.
- `updatedAt`: Fecha de última actualización automática.
- **Caso Especial**: `PedidoProductos` ha sido actualizado para incluir estas columnas, resolviendo errores históricos de consulta (500 Internal Server Error) al listar pedidos.

### 6.2. Robustez del Seeding
El comando `npm run db:clean` (o el inicio del servidor) es ahora altamente robusto:
- **Limpieza Agresiva**: Se utiliza `SET FOREIGN_KEY_CHECKS = 0` para permitir limpiezas totales sin errores de restricción.
- **Sin Duplicados**: El proceso limpia los datos existentes antes de insertar, evitando errores de validación por correos o IDs duplicados.
- **Sincronización Segura**: El esquema se mantiene estable y sincronizado con las entidades de NestJS.

---

## 🛠️ 7. Blindaje Global (Middlewares)

En `main.ts` hemos inyectado:
1. **Helmet**: Cabeceras de seguridad automáticas (CSP, HSTS, etc.).
2. **Cookie Parser**: Para leer los tokens de forma segura.
3. **Throttler (Rate Limit)**: Bloquea a usuarios que intentan saturar el servidor (>100 peticiones/min).
4. **ValidationPipe**: Limpia y valida los datos antes de que toquen la base de datos.

---

## 🏁 8. Inicio Rápido (Setup)

1. **Instalar Dependencias**:
   ```bash
   npm install @nestjs/typeorm typeorm mysql2 @nestjs/config @nestjs/jwt bcrypt cookie-parser helmet @nestjs/throttler @nestjs/swagger
   ```
2. **Configurar Ambiente**: Copia `.env.example` a `.env` y ajusta tus credenciales de MySQL.
3. **Preparar BD**: Ejecuta `npm run db:clean`. Esto creará las tablas y cargará los datos reales del sistema anterior.
4. **Despegar**: `npm run start:dev`.

---
**Guía de Ingeniería**: Este backend está diseñado siguiendo los principios **SOLID** y las mejores prácticas de **Clean Architecture**.


---
