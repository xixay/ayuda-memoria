
- [1. Creación de ramas](#1-creación-de-ramas)
  - [1.1. Mostrar ramas](#11-mostrar-ramas)
  - [1.2. Cambiar de rama](#12-cambiar-de-rama)
  - [1.3. Crear nueva rama](#13-crear-nueva-rama)
  - [1.4. Elimina una rama](#14-elimina-una-rama)
- [2. Guardar cambios](#2-guardar-cambios)
  - [2.1. Mostrar estado](#21-mostrar-estado)
  - [2.2. Mostrar cambios](#22-mostrar-cambios)
  - [2.3. Adiciona un cambio de archivo, que puede ser commiteado y subido.](#23-adiciona-un-cambio-de-archivo-que-puede-ser-commiteado-y-subido)
  - [2.4. Adiciona todos los cambios](#24-adiciona-todos-los-cambios)
  - [2.5. Quita un cambio de archivo, que no sera commiteado y subido.](#25-quita-un-cambio-de-archivo-que-no-sera-commiteado-y-subido)
  - [2.6. Quita todos los cambios](#26-quita-todos-los-cambios)
  - [2.7. Hacer un commit despues de hacer cambios](#27-hacer-un-commit-despues-de-hacer-cambios)
  - [2.8. Mostrar ultimos commits](#28-mostrar-ultimos-commits)
  - [2.9. Guardar cambios en GitHub](#29-guardar-cambios-en-github)
- [3. Deshacer cambios](#3-deshacer-cambios)
- [4. Fusión de ramas](#4-fusión-de-ramas)
  - [4.1. Te avisa si hay cambios en internet (en el repositorio)](#41-te-avisa-si-hay-cambios-en-internet-en-el-repositorio)
  - [4.2. Trae los cambios realizados](#42-trae-los-cambios-realizados)
- [5. Llevar los cambios de una rama a la otra](#5-llevar-los-cambios-de-una-rama-a-la-otra)
- [6. Probar commits anteriores](#6-probar-commits-anteriores)
  - [6.1. Resguardar mis cambios](#61-resguardar-mis-cambios)
  - [6.2. Realizar mas resguardos](#62-realizar-mas-resguardos)
  - [6.3. Ver los stash guardados](#63-ver-los-stash-guardados)
  - [6.4. Traer los cambios resguardados](#64-traer-los-cambios-resguardados)
  - [6.5. Eliminar los stash](#65-eliminar-los-stash)
  - [6.6. Ver versiones anteriores](#66-ver-versiones-anteriores)
- [7. Adicionar cambios al último commit](#7-adicionar-cambios-al-último-commit)
- [8. Volver a una versión anterior de commit](#8-volver-a-una-versión-anterior-de-commit)
- [9. Crear una rama con una versión anterior de commit](#9-crear-una-rama-con-una-versión-anterior-de-commit)
- [10. Como Deshacer Un Git Pull en Git De Manera Eficiente](#10-como-deshacer-un-git-pull-en-git-de-manera-eficiente)
- [11. Referencia](#11-referencia)

# 1. Creación de ramas
## 1.1. Mostrar ramas
```console
git branch -a
```
```txt
* main(Lo que se tiene en la compu)
  remotes/origin/main(Lo que se tiene en internet)
```
## 1.2. Cambiar de rama
- Cambia a la rama main, desde otra ram
```console
git checkout main
```
## 1.3. Crear nueva rama
- Crea una nueva rama(por ejemplo develop), manteniendo la informacion de donde se creo, cambiando a la nueva rama(Esta rama no estara publicada en github).
```console
git checkout -b develop
```
- Para tenerlo en github 
```console
git push origin develop
```
## 1.4. Elimina una rama
- elimina la rama que se desea, pero se debe estar en otra rama, no en ella
```console
git branch -d rama_eliminar
```
- Si no quiere se puede forzar
```console
git branch -D rama_eliminar
```
# 2. Guardar cambios
## 2.1. Mostrar estado
- Muestra la rama actual y su estado
```console
git status
```
```txt
En la rama develop
nada para hacer commit, el árbol de trabajo está limpio
```
## 2.2. Mostrar cambios
- Muestra en la terminal si se hizo algun cambio
```console
git diff
```

## 2.3. Adiciona un cambio de archivo, que puede ser commiteado y subido.
- Adiciona un archivo al indice de contenidos para el próximo commit.
```console
git add comandos_git.md
```
## 2.4. Adiciona todos los cambios
```console
git add .
```
## 2.5. Quita un cambio de archivo, que no sera commiteado y subido.
- Remueve un archivo del indice de contenidos para el próximo commit.
```console
git reset comandos_git.md
```
## 2.6. Quita todos los cambios
- Quita los cambios a ser comiteado, pero no elimina los cambios
```console
git reset .
```
## 2.7. Hacer un commit despues de hacer cambios
- Confirma los cambios junto con un mensaje.
```console
git commit -m "Archivo comandos_git.md creado"
```
## 2.8. Mostrar ultimos commits
```console
git log
```
## 2.9. Guardar cambios en GitHub
- Guardar cambios en el repositorio remoto:(Puede ser en la rama actual o otros, mientras esten vacios, o no afecten los cambios)
```console
git push origin master (funciona tambien git push     Usa la rama en la que esta)
```
```console
git push origin main
```
# 3. Deshacer cambios
- Deshace los cambios de un archivo.
```console
git checkout comandos_git.md(solo si esta encima)
git checkout 'src/main.ts'(si se encuentra dentro de la carpeta src)
```
- Deshace TODOS los cambios realizados.
```console
git reset --hard origin/develop(funciona tambien git reset --hard     Usa la rama en la que esta)
```
# 4. Fusión de ramas
## 4.1. Te avisa si hay cambios en internet (en el repositorio)
- Obtiene los últimos cambios del repositorio remoto pero no los fusiona.
```console
git fetch origin develop(funciona tambien git fetch     Usa la rama en la que esta)
```
## 4.2. Trae los cambios realizados
- Recupera y fusiona el repositorio remoto sobre el repositorio local.
```console
git pull origin develop(funciona tambien git pull     Usa la rama en la que esta)
```
# 5. Llevar los cambios de una rama a la otra
- Ir a la rama donde se traera o fusionara los cambios
```console
git checkout prueba1
```
- Fusiona las ramas prueba1 y prueba2 creando un nuevo commit sobre prueba1.
```console
git merge prueba2
```
- Si existe error 'fatal: rehusando fusionar historias no relacionadas', o fatal: refusing to merge unrelated histories, esto es debido a que hay 2 archivos, con diferentes cambios
```console
git merge prueba2 --allow-unrelated-histories
```
- Te pide elegir 2 opciones(mayormente se elige incoming change)
```txt
current change(cambio actual), [lo que tiene la rama prueba1]
incoming change(cambio entrante), [lo que tiene la rama prueba2]
```
- talves pida combinar y hacer commit
- Si no hay el error 'fatal: rehusando fusionar historias no relacionadas' abre un editor de texto(Donde se realizara el commit)
```txt
# Esta es la union de dos ramas 
Combinar rama 'prueba2' en prueba1
# Por favor ingrese un mensaje de commit que explique por qué es necesaria esta fusión,
# especialmente si esto fusiona un upstream actualizado en una rama de tópico.
#
# Líneas comenzando con '#' serán ignoradas, y un mensaje vacío aborta
#  el commit.
```
```txt
GUARDAR(ctrl+o)
CONFIRMAR(enter)
SALIR(ctrl+x)
```
- Lo que sucedio fue que, trajo lo que era diferente (main copy 2.ts), sin afectar (main.ts) y no borrar (main copy.ts).

| **ANTES**    |                | **DESPUES**        |                |
|--------------|----------------|--------------------|----------------|
| _prueba1_    | _prueba2_      | _prueba1_          | _prueba2_      |
| main.ts      | main.ts        | main.ts            | main.ts        |
|              | main copy 2.ts | **main copy 2.ts** | main copy 2.ts |
| main copy.ts |                | main copy.ts       |                |
# 6. Probar commits anteriores
## 6.1. Resguardar mis cambios
- Crea un nuevo espacio de trabajo (por ejemplo: desde la rama develop).
```console
git stash(se colocara en la posicion 0)
```
- Si se hicieron cambios en archivos ya existentes te permite resguardar
```txt
Directorio de trabajo guardado y estado de índice WIP on prueba2: 1802a7f feat : commit de prueba 2
```
- Pero si se copio o creo nuevos archivos y aunque se modificaran no guardara(debe agregarlos con git add .)
```txt
No hay cambios locales para guardar
```
## 6.2. Realizar mas resguardos
- si se hace otro cambio y este se guarda, este espacio de trabajo ocupara la posicion 1, y asi sucesivamente
```console
git stash(se colocara en la posicion 1)
```
## 6.3. Ver los stash guardados
- Para ver los stash
```console
git stash list
```
| **posicion** | **cambio**          |
|--------------|---------------------|
| **0**        | _ultimo_            |
| 1            | penultimo           |
| 2            | ante penultimo      |
| 3            | ante ante penultimo |
## 6.4. Traer los cambios resguardados
- Trae los ultimos cambios(de la posicion 0)
```console
git stash apply
```
- Si se quiere traer el penultimo cambio
```console
git stash apply 1
```
- Si se quiere traer el ante penultimo cambio
```console
git stash apply 2
```
## 6.5. Eliminar los stash
- Elimina los espacios de trabajo.
```
git stash clear
``` 
## 6.6. Ver versiones anteriores
- Para realizar esto no se debe tener tareas, mejor si se guarda con git stash
- Muestra los commits realizados
```console
git log --oneline
```
```txt
1802a7f (HEAD -> prueba2, origin/prueba2) feat : commit de prueba 2
4ba9cc1 (origin/master, origin/develop, master, develop) doc: falta pm2
193378a Inicializando NestJs
```
- Cambia de rama, en este caso a un commit(version) específico(ya no se estara en prueba 2)
```console
git checkout 193378a
```
- Para volver a la version actual, luego de realizar otras operaciones, restaura el espacio de trabajo inicial.
```console
git checkout prueba2
```
- Si se tenian cambios que se resguardaron, volverlos a traer
```console
git stash apply
```
# 7. Adicionar cambios al último commit
- Mejor si usan antes de haber hecho push y comiteado, podría afectar al trabajo de otros miembros del equipo
- Ver el ultimo commit
```console
git log --oneline
```
- Agregar el cambio 
```console
git add .
```
- Registra los cambios
```console
git commit --amend --no-edit
```
- Cambia el mensaje del último commit.
```console
git commit --amend -m "Se cambio el ultimo commit"
```
- Si el commit se encuentra en el repositorio remoto habrá que forzar el guardado de cambios
```console
git push -f origin develop
```
# 8. Volver a una versión anterior de commit
- Ver el historial de commits(o sea de versiones)
```console
git log --oneline
```
```txt
708e0a0 (HEAD -> master, origin/master) feat: Adicionando react-router-dom
436aba7 Falta rutas
0198a98 doc: Estructurado por carpetas
...
```
- Volver a la version 0198a98 (doc: Estructurado por carpetas), se debe revertir los 2 ultimos commits, puede ser mas o menos(no debe incluir los que fueron mergeados)
```console
git revert 708e0a0 436aba7
```
- Abre un editor de texto(Donde se realizara el commit)
```txt
GUARDAR(ctrl+o)
CONFIRMAR(enter)
SALIR(ctrl+x)
```
- Luego de hacer el commit, subir al repositorio
```console
git push
```
# 9. Crear una rama con una versión anterior de commit
- Ver el historial de commits(o sea de versiones)
```console
git log --oneline
```
- Por lo tanto, haríamos lo sgte
```console
git checkout -b falta-ruta-rama 436aba7
```
# 10. Como Deshacer Un Git Pull en Git De Manera Eficiente
- Una vez que hayas realizado esta copia de seguridad, obtener una lista de todo tu historial de confirmaciones o Commits
```console
git reflog
```
```txt
git reflog 
 
468e304 (HEAD -> master, origin/master) HEAD@{0}: commit: Primer Cambio
b116d4e HEAD@{1}: commit: Corrección en el CSS
456a37f HEAD@{2}: commit: Se Agrego una Función de JavaScript En el Footer
b234b7a HEAD@{3}: commit: Agregado Dark Mode
a356e87 HEAD@{4}: commit: Se elimino código JavaScript Excesivo
cd98t4e HEAD@{5}: commit: Se añadio Redes Sociales
bt63gf5 HEAD@{6}: commit: Se agrego el campo email al formulario de contacto
```
- Si quisieras volver a ‘Se elimino código JavaScript Excesivo’, selecciona el ID a356e87
```console
git reset --hard a356e87
```
# 11. Referencia
- [Tablas de markdown](https://www.tablesgenerator.com/markdown_tables#)
- [Como Deshacer Un Git Pull en Git De Manera Eficiente](https://blog.nubecolectiva.com/como-deshacer-un-git-pull-en-git-de-manera-eficiente/)