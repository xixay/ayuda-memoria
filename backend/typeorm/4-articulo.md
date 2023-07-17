- [1. Iniciando el proyecto](#1-iniciando-el-proyecto)
- [2. Instalando las dependecias typeOrm(opcional)](#2-instalando-las-dependecias-typeormopcional)
- [3. Crear la base de datos](#3-crear-la-base-de-datos)
- [4. Modificar la entidad User por defecto a Articulo](#4-modificar-la-entidad-user-por-defecto-a-articulo)
- [5. Modficando el servidor](#5-modficando-el-servidor)
- [6. En la aplicacion principal](#6-en-la-aplicacion-principal)
- [7. Ejecutar la aplicacion principal](#7-ejecutar-la-aplicacion-principal)
- [8. Referencia](#8-referencia)

## 1. Iniciando el proyecto
- Si se es necesario instalar la libreria typeorm globalmente
```console
npm install -g typeorm
```
- Usar sus comandos CLI para generar un proyecto inicial
```console
npx typeorm init --name MyProject --database postgres
```
- Este comando generará un nuevo proyecto en el directorio MyProject con los siguientes archivos:
```txt
MyProject
├── src                   // lugar de su código TypeScript
│   ├── entity            // lugar donde se almacenan sus entidades (modelos de base de datos)
│   │   └── User.ts       // entidad de muestra
│   ├── migration         // lugar donde se almacenan sus migraciones
│   ├── data-source.ts    // origen de datos y toda la configuración de conexión
│   └── index.ts          // punto de inicio de su aplicación
├── .gitignore            // archivo estándar de gitignore
├── package.json          // dependencias del node module
├── README.md             // archivo Léame sencillo
└── tsconfig.json         // Opciones del compilador de TypeScript
```
- Ingresar al archivo MyProject
```console
cd MyProject
```
- Instalar sus librerias
```
npm install
```

## 2. Instalando las dependecias typeOrm(opcional)
- Si no quiere      generar un proyecto inicial
- Instale la dependencia de typeOrm
```console
npm i -D typeorm reflect-metadata --save
```
- Instale un controlador de base de datos, en este caso postgres:
```console
npm i -D pg --save
```
## 3. Crear la base de datos
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
- Crear la tabla articulo(opcional)
```console
CREATE TABLE articulo (
  id SERIAL PRIMARY KEY,
  descripcion VARCHAR(30),
  precio float,
  stock integer
);
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
## 4. Modificar la entidad User por defecto a Articulo
- Cambiar el nombre de la carpeta entity por entities
- En la carpeta src/entities (Donde se alojan las entidades), cambiar el nombre de la entidad User.ts por el de articulo.entity.ts
- (Opcional)Ademas agregar ! para cada atributo, asi evitamos el error que nos da typescript, por que todas las propiedades deban declararse con el constructor:
```ts
import { Entity, PrimaryGeneratedColumn, Column } from "typeorm"

@Entity()
export class Articulo {

    @PrimaryGeneratedColumn()
    id: number

    @Column()
    descripcion: string

    @Column({ type: "float" })//del tipo float
    precio: number

    @Column()
    stock: number

}

```
## 5. Modficando el servidor
- Ir src/data-source.ts y modificar la conexion con la base de datos
```js
import "reflect-metadata"
import { DataSource } from "typeorm"
//importando la entidad Articulo
import { Articulo } from "./entities/articulo.entity"

export const AppDataSource = new DataSource({
    type: "postgres",
    host: "172.17.0.2",
    port: 5432,
    username: "postgres",
    password: "postgres",
    database: "articulos_db",
    synchronize: true,
    logging: false,
    entities: [Articulo],//depende del numero de entidades
    migrations: [],
    subscribers: [],
})
```
## 6. En la aplicacion principal
- Cambiar el nombre de intex.ts por el de main.ts
- Modificar package.json, en la parte de script, en ves de index.ts por el de main.ts
```json
{
   "name": "MyProject",
   "version": "0.0.1",
   "description": "Awesome project developed with TypeORM.",
   "type": "commonjs",
   "devDependencies": {
      "ts-node": "10.7.0",
      "@types/node": "^16.11.10",
      "typescript": "4.5.2"
   },
   "dependencies": {
      "typeorm": "0.3.17",
      "reflect-metadata": "^0.1.13",
      "pg": "^8.4.0"
   },
   "scripts": {
      "start": "ts-node src/main.ts",//modificar
      "typeorm": "typeorm-ts-node-commonjs"
   }
}
```
- Modificar main.ts
```ts
//importar el servidor data-source
import { AppDataSource } from "./data-source"
//importar la entidad
import { Articulo } from "./entities/articulo.entity"

AppDataSource.initialize().then(async () => {

    console.log("Insertar un nuevo artículo en la base de datos...")
    const articulo = new Articulo()
    articulo.descripcion = "Cocacola"
    articulo.precio = 12.5
    articulo.stock = 25
    await AppDataSource.manager.save(articulo)
    console.log("Guardado un nuevo usuario con id: " + articulo.id)

    console.log("Cargando articulos desde la base de datos...")
    const articulos = await AppDataSource.manager.find(Articulo)
    console.log("Artículos cargados: ", articulos)

    console.log("Aquí puede configurar y ejecutar express / fastify / cualquier otro marco.")

}).catch(error => console.log(error))
```
## 7. Ejecutar la aplicacion principal
- Ejecutar main.ts, al hacerlo se creara el articulo en la base de datos directamente
```console
npm run start
```
## 8. Referencia
- [Example using TypeORM with Express](https://orkhan.gitbook.io/typeorm/docs/example-with-express)
- [typeorm-repositorio](https://github.com/xixay/typeorm-repositorio)
- [Example using TypeORM with Express](https://orkhan.gitbook.io/typeorm/docs/example-with-express)