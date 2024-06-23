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
