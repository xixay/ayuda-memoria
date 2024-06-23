[<< INDICE](../../README.md)
- [1. Instalando dependencias](#1-instalando-dependencias)
- [2. Crear la base de datos](#2-crear-la-base-de-datos)
- [3. Creando la conexion](#3-creando-la-conexion)
- [4. Creando la entidad Articulo](#4-creando-la-entidad-articulo)
- [5. En la aplicacion principal app.ts](#5-en-la-aplicacion-principal-appts)
- [6. Aplicación final terminada](#6-aplicación-final-terminada)
- [7. Referencia](#7-referencia)
## 1. Instalando dependencias
- Instale la dependencia de typeOrm
```console
npm i -D typeorm reflect-metadata --save
```
- Instale un controlador de base de datos, en este caso postgres:
```console
npm i -D pg --save
```
## 2. Crear la base de datos
- Usando docker crear la imagen contenedor
```console
sudo docker run --name conTypeOrm -e POSTGRES_PASSWORD=postgres -d   -p 5555:5432   postgres:14.6
```
- Iniciar
```console
docker start conTypeOrm
```
- Obtener el ip de la imagen contenedora
```console
docker inspect conTypeOrm
//out: "IPAddress": "172.17.0.2"
```
- Ingresar como root
```console
sudo docker exec -it conTypeOrm bash
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
docker inspect conTypeOrm(172.17.0.2) también colocar en .env
Host=172.17.0.2
port=5432
Database=articulos_db
- Ver la IP y puerto (windows wsl2) también colocar en el .env
Host=localhost
port=5555
Database=articulos_db
```
## 3. Creando la conexion
- En la carpeta src crear el archivo data-source.ts
```ts
import "reflect-metadata"
import { DataSource } from "typeorm"
//importando la entidad Articulo
import { Articulo } from "./entidad/Articulo"

export const AppDataSource = new DataSource({
    type: "postgres",
    host: "172.17.0.2",
    // host: "localhost",
    port: 5432,
    username: "postgres",
    password: "postgres",
    database: "articulos_db",
    entities: [Articulo], // depende del numero de entidades
    synchronize: true,
    logging: false,
})
```
## 4. Creando la entidad Articulo
- En la carpeta src crear la carpeta entidad(Donde se alojaran las entidades)
- Dentro de la carpeta entidad crear el archivo ArticuloE.ts
- Para evitar que nos de error al crear la entidad colocar, en el archivo tsconfig.json
```json
"emitDecoratorMetadata": true,
"experimentalDecorators": true
```
- Ademas agregar ! para cada atributo, asi evitamos el error que nos da typescript, por que todas las propiedades deban declararse con el constructor:
```ts
import { Entity, PrimaryGeneratedColumn, Column } from "typeorm"

@Entity()
export class ArticuloE {

    @PrimaryGeneratedColumn()
    id!: number

    @Column()
    descripcion!: string

    @Column()
    precio!: number

    @Column()
    stock!: number
}
```
## 5. En la aplicacion principal app.ts
- En app.ts importar el data-source y la entidad
```ts
// lib/app.ts
import express from "express"
import cors from "cors"
import bodyParser from "body-parser"
// importando entidades y data-source
import { AppDataSource } from "./data-source"
import { ArticuloE } from "./entidad/ArticuloE"
```
- Crear la conexión con express
```ts
const app: express.Application = express()
```
- Crear un puerto
```ts
const port = 3000
```
- Usar credenicial para poder usr GET, POST,etc
```ts
app.use(cors())
```
- accesar a la información del cuerpo
```ts
app.use(bodyParser.json())
```
- Instanciar la entidad
```ts
const articulo = new ArticuloE()
articulo.descripcion = "Coca-Cola 1L"
articulo.precio = 100
articulo.stock = 24
```
- Crear la funcion de trabajo
```ts
AppDataSource.initialize()
  .then(async () => {
    /* Se trabajara todo aqui */
  })
  .catch((error) => console.log(error))
```
- Llamar a el repositorio
```ts
const repositorioArticulo = AppDataSource.getRepository(ArticuloE)
``` 
- Guardar un articulo en la base de datos
```ts
await repositorioArticulo.save(articulo)
```
- Enviar el articulo por el metodo GET
```ts
    app.get("/", async (solicitud: express.Request, respuesta: express.Response) => {
      //status
      respuesta.status(200)
      // Cargando los articulos
      const articulosGuardados = await repositorioArticulo.find()
      //mensaje a mostrar en localhost:3000
      respuesta.send(articulosGuardados)
    })
```
- Iniciar Express
```ts
    app.listen(port, () => {
      console.log(
        "¡Aplicación de ejemplo corriendo en el puerto " + port + "!"
      )
    })
```
## 6. Aplicación final terminada
```ts
// lib/app.ts
import express from "express"
import cors from "cors"
import bodyParser from "body-parser"
// importando entidades y data-source
import { AppDataSource } from "./data-source"
import { ArticuloE } from "./entidad/ArticuloE"
// Crear una nueva instancia de aplicación express
const app: express.Application = express()

//puerto
const port = 3000
//credenciales(permisos de GET,POST,PUT,etc)
app.use(cors())
//accesar a la información del cuerpo(de donde se envia la solicitud) 
app.use(bodyParser.json())

/*Entidad Articulo */
const articulo = new ArticuloE()
/*Propiedades de Articulo */
articulo.descripcion = "Coca-Cola 1L"
articulo.precio = 100
articulo.stock = 24

AppDataSource.initialize()
  .then(async () => {
    // LLamando repositorio de articulo
    const repositorioArticulo = AppDataSource.getRepository(ArticuloE)
    // Insertando el Articulo
    await repositorioArticulo.save(articulo)
    console.log("El articulo ha sido guardado")
    //Metodo GET
    app.get("/", (solicitud: express.Request, respuesta: express.Response) => {
      //status
      respuesta.status(200)
      // Cargando los articulos
      const articulosGuardados = await repositorioArticulo.find()
      console.log(
        "Todos los articulos de la base de datos: ",
        articulosGuardados
      )
      //mensaje a mostrar en localhost:3000
      respuesta.send(articulosGuardados)
    })
    //Iniciando el servidor
    app.listen(port, () => {
      console.log(
        "¡Aplicación de ejemplo corriendo en el puerto " + port + "!"
      )
    })
  })
  .catch((error) => console.log(error))
```
## 7. Referencia
- [Example using TypeORM with Express](https://orkhan.gitbook.io/typeorm/docs/example-with-express)
- [typeorm-repositorio](https://github.com/xixay/typeorm-repositorio)

[<< INDICE](../../README.md)