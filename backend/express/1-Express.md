- [1. Iniciando el proyecto](#1-iniciando-el-proyecto)
- [2. Creando el package.json](#2-creando-el-packagejson)
- [3. Instalando las dependecias](#3-instalando-las-dependecias)
- [4. Crear el tsconfig.json](#4-crear-el-tsconfigjson)
- [5. Crear las rutas de alojamiento de desarrollo y producción](#5-crear-las-rutas-de-alojamiento-de-desarrollo-y-producción)
- [6. Creando el servidor](#6-creando-el-servidor)
- [7. Crear base de datos linux](#7-crear-base-de-datos-linux)
- [8. Creando la conexion con la base de datos](#8-creando-la-conexion-con-la-base-de-datos)
- [9. Creando los apis rest](#9-creando-los-apis-rest)
- [10. Creación de rutas para operaciones CRUD](#10-creación-de-rutas-para-operaciones-crud)
- [11. Creando los comando de ejecución](#11-creando-los-comando-de-ejecución)
- [12. Ejecutar en modo desarrollo](#12-ejecutar-en-modo-desarrollo)
- [13. Para llevar a producción](#13-para-llevar-a-producción)
- [14. Ejecutar el producto final app.js](#14-ejecutar-el-producto-final-appjs)
- [15. Referencia](#15-referencia)

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
- Para que reconozca type script y node y express de manera local
```console
$>npm i -D express @types/express @types/node nodemon ts-node typescript cors --save-dev @types/cors
```
## 4. Crear el tsconfig.json
- Usar el sgte comando para inicializar el proyecto creando el fichero tsconfig.json, si no aparece instalar typescript npm install typescript -g
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
- Dentro de nuestro proyecto crearemos una carpeta llamada src. Dentro de esta carpeta crearemos un fichero llamado app.ts con el siguiente contenido de prueba:
```ts
// lib/app.ts
import express from "express"
//importar cors para cabecera
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
## 7. Crear base de datos linux
- Crear la imagen en docker
```console
sudo docker run   --name conExpress   -e POSTGRES_PASSWORD=postgres   -d   -p 5555:5432   postgres:14.6
```
- Iniciar
```console
docker start conExpress
```
- obtener el ip del contenedor
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
- Crear la base de datos
```console
CREATE DATABASE articulos_db;
```
- Conectarse BD(Si se necesita)
```console
\c articulos_db;
```
- Crear la tabla articulo
```console
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
docker inspect conNestJs(172.17.0.2) también colocar en .env
Host=172.17.0.2
port=5432
Database=articulos_db
- Ver la IP y puerto (windows wsl2) también colocar en el .env
Host=localhost
port=5555
Database=articulos_db
```
## 8. Creando la conexion con la base de datos
- Instalar las siguientes librerias
```console
npm i pg-pool --save
npm install --save @types/pg-pool
npm install pg-format --save
npm install pg --save
```
- Crear el archivo data-source.ts, dentro de la carpeta src
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
## 9. Creando los apis rest
- Crear la carpeta controllers, dentro el archivo index.controller.ts, donde estaran los querys
```ts
import { Request, Response } from 'express'
import { QueryResult } from 'pg'
// traer la conexion de base de datos
import { pool } from '../data-source'
// Escribir la función aqui
export const getArticulos = async (solicitud: Request, respuesta: Response): Promise<Response> => {
    try {
        //hacer la consulta
        const response: QueryResult = await pool.query('SELECT * FROM articulo ORDER BY id ASC')
        //ver por consola los datos y en formato json
        return respuesta.status(200).json(response.rows);
    } catch (error) {
        console.log(error);
        return respuesta.status(500).json('Error Interno del Servidor');
    }
}
export const getArticuloById = async (solicitud: Request, respuesta: Response): Promise<Response> => {
    const id = parseInt(solicitud.params.id);
    const response: QueryResult = await pool.query('SELECT * FROM articulo WHERE id = $1', [id]);
    //ver por consola los datos y en formato json
    return respuesta.json(response.rows);
};

export const createArticulo = async (solicitud: Request, respuesta: Response) => {
    // dto con el body
    const { descripcion, precio, stock } = solicitud.body;
    const response = await pool.query('INSERT INTO articulo (descripcion, precio, stock) VALUES ($1, $2, $3)', [descripcion, precio, stock]);
    respuesta.json({
        mensaje: 'Articulo Agregado con exito',
        datos: {
            descripcion,
            precio,
            stock 
        }
    })
};

export const updateArticulo = async (solicitud: Request, respuesta: Response) => {
    const id = parseInt(solicitud.params.id);
    // dto con el body
    const { descripcion, precio, stock } = solicitud.body;
    const response = await pool.query('UPDATE articulo SET descripcion = $1, precio = $2, stock = $3 WHERE id = $4', [
        descripcion,
        precio,
        stock,
        id
    ]);
    respuesta.json('Artículo actualizado con éxito');
};

export const deleteArticulo = async (solicitud: Request, respuesta: Response) => {
    const id = parseInt(solicitud.params.id);
    await pool.query('DELETE FROM articulo where id = $1', [
        id
    ]);
    respuesta.json(`Artículo ${id} eliminado con éxito`);
};
```
- crear la carpeta routes dentro de la carpeta src, con el archivo index.ts, donde estaran las rutas
```ts
// lib/app.ts
import { Router } from "express"
// traer los apis
import { getArticulos, getArticuloById, createArticulo, updateArticulo, deleteArticulo } from "../controllers/index.controller"
// Crear una nueva instancia de aplicación express
const router = Router()

//trae todos los articulos
router.get("/articulos", getArticulos)
//trae el articulo por id
router.get("/articulos/:id", getArticuloById)
//crea el articulo
router.post("/articulos", createArticulo)
//modifica un articulo
router.put("/articulos/:id", updateArticulo)
//borra un articulo 
router.delete("/articulos/:id", deleteArticulo)
//manda estas rutas a app.ts
export default router
```
- Llamar a las rutas en la aplicacion principal
```ts
// lib/app.ts
import express from "express"
// importando las rutas
import route from './routes'
//importar cors para cabecera
import cors from 'cors'
// Crear una nueva instancia de aplicación express
const app = express()
// convertir los datos que llegan a formato json
app.use(express.json())
// convierte datos de un formulario a un  json
app.use(express.urlencoded({ extended: false }))
//puerto
const port = 3000
//credenciales(permisos de GET,POST,PUT,etc)
app.use(cors())
//metodo get defecto
app.get("/", (solicitud: express.Request, respuesta: express.Response) => {
    //status
    respuesta.status(200)
    //mensaje a mostrar en localhost:3000
    respuesta.send("Hola TypeScript con Node y Express!")
})
//usando las rutas
app.use(route)
app.listen(port)
console.log("¡Aplicación de ejemplo corriendo en el puerto " + port + "!")
```
## 10. Creación de rutas para operaciones CRUD

| Método | Función | Equivalente | Body |
| --------- | --------- | --------- | --------- |
| GET: /articulos/ | getArticulos | http://localhost:3000/articulos/ | no tiene |
| GET: /articulos/id | getArticuloById | http://localhost:3000/articulos/1 | no tiene |
| POST: /articulos/ | createArticulo | http://localhost:3000/articulos/ | { "descripcion": "Pepsi", "precio": 113, "stock": 37 } |
| PUT: /articulos/id | updateArticulo | http://localhost:3000/articulos/7 | { "descripcion": "PepsiCola", "precio": 10, "stock": 20 } |
| DELETE: /articulos/id | deleteArticulo | http://localhost:3000/articulos/1 | no tiene |
## 11. Creando los comando de ejecución
- Dentro de nuestro package.json introduciremos los script para ejecutar las tareas desde consola
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
## 12. Ejecutar en modo desarrollo
```console
npm run dev
```
>Ir a localhost:3000
## 13. Para llevar a producción
```console
npm run build
```
```text
De esta manera se crea el archivo app.js
```
## 14. Ejecutar el producto final app.js
```console
npm run start
```
>Ir a localhost:3000
## 15. Referencia
- [¿Cómo configurar NodeJS y Express con Typescript? ¡Configuración inicial!](https://www.youtube.com/watch?v=HONRQUFqFkA)
- [Solicitudes HTTP con Axios](https://styde.net/solicitudes-http-con-axios/)
- [Nodejs, PostgreSQL & Typescript, REST API CRUD](https://github.com/FaztWeb/postgresql-node-restapi-ts/tree/master)
- [Nodejs, PostgreSQL & Typescript, REST API CRUD video](https://www.youtube.com/watch?v=z4BNZfZ1Wq8)