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
## 3. Instalando las dependecias
- para que reconozca type script y node y express de manera local
```console
$>npm i -D express @types/express @types/node nodemon ts-node typescript cors --save-dev @types/cors
```
## 4. Crear el tsconfig.json
- Usar el sgte comando para inicializar el proyecto creando el fichero tsconfig.json
```console
tsc --init
```
## 5. Crear las rutas de alojamiento de desarrollo y producción
- Dentro de este fichero descomentaremos la opción outDir elegiremos una localización donde se dejarán los ficheros .js compilados,  y en rootDir estaran los archivos de desarrollo type script .
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
>Ir a localhost:3000
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
>Ir a localhost:3000
## 11. Referencia
- [¿Cómo configurar NodeJS y Express con Typescript? ¡Configuración inicial!](https://www.youtube.com/watch?v=HONRQUFqFkA)
- [Solicitudes HTTP con Axios](https://styde.net/solicitudes-http-con-axios/)