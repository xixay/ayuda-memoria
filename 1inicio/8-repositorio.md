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