- [1. Iniciando el proyecto](#1-iniciando-el-proyecto)
  - [1.1. Creando el package.json](#11-creando-el-packagejson)
- [2. Instalando las dependecias](#2-instalando-las-dependecias)
  - [2.1. Crear el tsconfig.json](#21-crear-el-tsconfigjson)
- [3. Crear las rutas de alojamiento de desarrollo y producción](#3-crear-las-rutas-de-alojamiento-de-desarrollo-y-producción)
- [4. Crear la base de datos](#4-crear-la-base-de-datos)
- [5. Creando el servidor](#5-creando-el-servidor)
- [6. Crear la aplicación principal](#6-crear-la-aplicación-principal)
- [7. Ejecutar la aplicacion principal](#7-ejecutar-la-aplicacion-principal)
  - [7.1. Creando los comando de ejecución](#71-creando-los-comando-de-ejecución)
    - [7.1.1. Ejecutar en modo desarrollo](#711-ejecutar-en-modo-desarrollo)
    - [7.1.2. Para llevar a producción](#712-para-llevar-a-producción)
    - [7.1.3. Ejecutar el producto final main.js](#713-ejecutar-el-producto-final-mainjs)
- [8. Referencia](#8-referencia)

## 1. Iniciando el proyecto
- Crea el archivo .gitignore y coloca node modules para que no te suba al github las dependencias
```console
node_modules
```
### 1.1. Creando el package.json
- Inicializa el proyecto npm init
```json
{
  "name": "articulo-repositorio-express-backend",
  "version": "1.0.0",
  "description": "backend usando express",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "author": "Xixay",
  "license": "ISC"
}

```
## 2. Instalando las dependecias
- Para que reconozca type script y node y express de manera local
```console
$>npm i -D express @types/express @types/node nodemon ts-node typescript cors --save-dev @types/cors
```
### 2.1. Crear el tsconfig.json
- Usar el sgte comando para inicializar el proyecto creando el fichero tsconfig.json, si no aparece instalar typescript npm install typescript -g
```console
tsc --init
```
## 3. Crear las rutas de alojamiento de desarrollo y producción
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
## 4. Crear la base de datos
- Usando docker crear la imagen contenedor
```console
sudo docker run   --name conExpress -e POSTGRES_PASSWORD=postgres -d   -p 5555:5432   postgres:14.6
```
- Iniciar
```console
docker start conExpress
```
- obtener el ip de la imagen contenedora
```console
docker inspect conExpress
//out: "IPAddress": "172.17.0.2"
```
- Ingresar como root
```console
sudo docker exec -it conExpress bash
```
- Ingresar a los comandos de postgres y editar
```console
root@1eb0e04e9457:/# psql -U postgres(luego se ejecuta postgres)
```
- Utilizar el comando de postgres para crear la base de datos
```sql
CREATE DATABASE articulos_db;
```
- Conectarse BD(Si se necesita)
```console
\c articulos_db;
```
- Crear la tabla articulo(opcional)
```sql
CREATE TABLE articulo (
  id SERIAL PRIMARY KEY,
  descripcion VARCHAR(30),
  precio float,
  stock integer
);
```
- Salir postgres
```console
\q
```
- Salir de root
```console
ctrl+D
```
- Conectarse DBeaver
```txt
- Ver la IP y puerto (linux)
docker inspect conExpress(172.17.0.2) también colocar en .env
Host=172.17.0.2
port=5432
Database=articulos_db
- Ver la IP y puerto (windows wsl2) también colocar en el .env
Host=localhost
port=5555
Database=articulos_db
```
## 5. Creando el servidor
- Instalar las siguientes librerias
```console
npm i pg-pool --save
npm install --save @types/pg-pool
npm install pg-format --save
npm install pg --save
```
- Ir y crear la carpeta src, dentro el archivo data-source.ts, donde estara la conexion con la base de datos
```ts
import {PoolConfig, Pool} from "pg"
const pool =new Pool({
    user:"postgres",
    host:"172.17.0.2",
    database:"articulos_db",
    password:"postgres",
    port:5432,
})
module.exports =pool
```
## 6. Crear la aplicación principal
- entro de la carpeta src crear el archivo main.ts
```ts
//importar la libreria de express
import express from "express"
//importar cors para cabecera
import cors from 'cors'
// Crear una nueva instancia de aplicación express
const app: express.Application = express()
//puerto
const port = 3000
//credenciales(permisos de GET,POST,PUT,etc)
app.use(cors())
//metodo get por defecto
app.get("/", (solicitud: express.Request, respuesta: express.Response) => {
    //status
    respuesta.status(200)
    //mensaje a mostrar en localhost:3000
    respuesta.send("Hola TypeScript con Node y Express!")
})
app.listen(port)
console.log("¡Aplicación de ejemplo corriendo en el puerto " + port + "!")
```
## 7. Ejecutar la aplicacion principal
### 7.1. Creando los comando de ejecución
- Dentro de nuestro package.json introduciremos los script para ejecutar las tareas desde consola
```json
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1",
    "start": "node dist/main.js",// Iniciara el archivo compilado
    "dev": "nodemon src/main.ts",// Iniciara en el modo desarrollo
    "build": "tsc -p ."//Lo llevara para produccion, osea lo compilara
  },
```
| Tipo | Función |
|----------|----------|
| nodemon   | Ejecuta archivos typeScript   |
| tsc    | Transforma typeScript a javaScript   |
| node    | Ejecuta archivos javaScript   |

#### 7.1.1. Ejecutar en modo desarrollo
```console
npm run dev
```
>Ir a localhost:3000
#### 7.1.2. Para llevar a producción
```console
npm run build
```
```text
De esta manera se crea el archivo main.js
```
#### 7.1.3. Ejecutar el producto final main.js
```console
npm run start
```
>Ir a localhost:3000
## 8. Referencia
- [¿Cómo configurar NodeJS y Express con Typescript? ¡Configuración inicial!](https://www.youtube.com/watch?v=HONRQUFqFkA)
- [Solicitudes HTTP con Axios](https://styde.net/solicitudes-http-con-axios/)
- [Nodejs, PostgreSQL & Typescript, REST API CRUD](https://github.com/FaztWeb/postgresql-node-restapi-ts/tree/master)
- [Nodejs, PostgreSQL & Typescript, REST API CRUD video](https://www.youtube.com/watch?v=z4BNZfZ1Wq8)