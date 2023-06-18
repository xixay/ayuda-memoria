- [1. GitHub Descktop](#1-github-descktop)
  - [1.1. Creando repositorio](#11-creando-repositorio)
  - [1.2. GitHubDescktop](#12-githubdescktop)
    - [1.2.1. Changes](#121-changes)
    - [1.2.2. History](#122-history)
    - [1.2.3. Current branch](#123-current-branch)
# 1. GitHub Descktop
## 1.1. Creando repositorio
- Abrir GitHubDescktop
- Ir a File>New Repository

| **Name**    | **Primer-Repositorio**                             |
|-------------|----------------------------------------------------|
| Description | Primer backend y frontend en github GitHubDescktop |
| Local path  | V:\curso de backend y frontend                     |
- Click Create repository
- Publicar en GitHub.com, click en Publish repository>Publish repository
```txt
La pagina sera "https://github.com/xixay/Primer-Repositorio"
```
- El Primer commit sera automatico, creara los archivos .gitattributes y README.md
- Tendra cero cambios y se puede empezar a trabajar
- Por Default tendra solo la rama "main"
## 1.2. GitHubDescktop
- Empezar a trabajar
- Abrir en GitHubDescktop visual studio code, Open in Visual Studio Code
- Cualquier cambio que se realize en vscode se vera en GitHubDescktop
### 1.2.1. Changes
- Aqui se veran los cambios
  - Una ves hecho los cambios realizar un commit en Summary(required)>Commit to main
  - Push commits to the origin remote>Push Origin
  - Se pueden ver que se craron los archivos en "https://github.com/xixay/Primer-Repositorio"
- Aparecen cero cambios en Changes
### 1.2.2. History
- Se pueden ver los cambios realizados en commits
### 1.2.3. Current branch
- originalmente esta en la rama main, pero se puede crear nuevas ramas
  - clic en Current branch agregar nueva rama(New branch)
  - Hacer push nueva rama(Publish branch)
- Se ha creado la rama con todo lo que tenia main, sin necesidad de hacer un pull
  - Al hacer click en (Create pull Request) nos redirige a una pagina "https://github.com/xixay/Primer-Repositorio/compare/develop?expand=1", donde se veran los cambios de ambas ramas
- En current branch se ve en que rama se encuentra para realizar los cambios
- Al hacer cambios en develop y commits, al hacer click en Create Pull Request, redirigira a la pagina https://github.com/xixay/Primer-Repositorio/compare/develop?expand=1
- Click en Create pull request
- click en Merge pull request
- click en Confirm merge y Cerramos la pagina
  - Estando en GitHubDescktop en la rama main, hacer click en Fetch origin
- Hacer click en pull origin
- Con lo anterior se tendra todo lo de develop en main