- [1. Iniciando el proyecto](#1-iniciando-el-proyecto)
- [2. Instalando las dependecias typeOrm(opcional)](#2-instalando-las-dependecias-typeormopcional)
- [3. Crear base de datos](#3-crear-base-de-datos)
- [4. crear la entidad Articulo](#4-crear-la-entidad-articulo)
  - [4.1. Agregar Decoradores](#41-agregar-decoradores)
- [5. Creando el servidor](#5-creando-el-servidor)
- [6. Ejecutar la aplicacion principal](#6-ejecutar-la-aplicacion-principal)
  - [6.1. Viendo los comandos de ejecución](#61-viendo-los-comandos-de-ejecución)
    - [6.1.1. Ejecutar en modo desarrollo](#611-ejecutar-en-modo-desarrollo)
    - [6.1.2. Para llevar a producción](#612-para-llevar-a-producción)
    - [6.1.3. Ejecutar el producto final main.js](#613-ejecutar-el-producto-final-mainjs)
- [7. Referencia](#7-referencia)

## 1. Iniciando el proyecto
- Si se es necesario instalar la libreria cli de Nestjs globalmente
```console
npm i -g @nestjs/cli
```
- Usar el comando nestJs para generar un proyecto inicial
```console
nest new MyProject(seleccionar npm)
```
- Este comando generará un nuevo proyecto en el directorio MY-PROJECT con los siguientes archivos:
```txt
MY-PROJECT
├── node_modules           // librerias nest
├── src                   // lugar de su código TypeScript
│   ├── app.controller.spec.ts //Las pruebas unitarias para el controlador.
│   ├── app.controller.ts  //Un controlador básico con una sola ruta.
│   ├── app.module.ts //El módulo raíz de la aplicación.
│   ├── app.service.ts  //Un servicio básico con un solo método.
│   └── main.ts          // El archivo de entrada de la aplicación que utiliza la función central NestFactory para crear una instancia de la aplicación Nest.
├── test                   // lugar de test
│   ├── app.e2e-spec.ts
│   ├── jest-e2e.json
├── .eslintrc.js
├── .gitignore            // archivo estándar de gitignore
├── .prettierrc
├── nest-cli.json
├── package-lock.json
├── package.json          // dependencias del node module
├── README.md             // archivo Léame sencillo
├── tsconfig.build.json   
└── tsconfig.json         // Opciones del compilador de TypeScript
```
- Ingresar al archivo MY-PROJECT
```
cd MY-PROJECT
```
## 2. Instalando las dependecias typeOrm(opcional)
- Instale la dependencia de typeOrm con las bibliotecas de API de cliente asociadas para su base de datos seleccionada, en este caso sera postgres.
```console
npm i -D --save @nestjs/typeorm typeorm pg
```
## 3. Crear base de datos
- Usando docker crear la imagen contenedor
```console
sudo docker run   --name conNestJs   -e POSTGRES_PASSWORD=postgres   -d   -p 5555:5432   postgres:14.6
```
- Iniciar
```console
docker start conNestJs
```
- Obtener el ip de la imagen contenedora
```console
docker inspect conNestJs
//out: "IPAddress": "172.17.0.2"
```
- Ingresar como root
```console
sudo docker exec -it conNestJs bash
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
docker inspect conNestJs(172.17.0.2) también colocar en .env
Host=172.17.0.2
port=5432
Database=articulos_db
- Ver la IP y puerto (windows wsl2) también colocar en el .env
Host=localhost
port=5555
Database=articulos_db
```
## 4. crear la entidad Articulo
- Use el comando recurso
```console
nest g resource articulos(REST API>yes)
```
- Si  sale error cambiar LF, en ves de CRLF, o Intente configurar el "endOfLine":"auto" en su archivo .prettierrc (dentro del objeto) O establecer
```text
"prettier/prettier": ["error", {
     ..
    "endOfLine":"auto"
     ..
  }],
```
- Modificar la entidad articulo en articulo.entity.ts
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
### 4.1. Agregar Decoradores
- Instalar la siguiente libreria, para tener los decoradores
```console
npm i -D --save class-validator class-transformer
```
- Ir a main.ts y agregar el decorador  global
```ts
...
import { ValidationPipe } from '@nestjs/common';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  //puerto
  ...
  //credenciales(permisos de GET,POST,PUT,etc)
  ...
  //Agregar los decoradores
  app.useGlobalPipes(new ValidationPipe());
  ...
}
bootstrap();

``` 
- Ir a articulo.entity.ts, y agregar los decoradores faltantes
```ts
import { IsNotEmpty } from "class-validator"
import { Entity, PrimaryGeneratedColumn, Column } from "typeorm"

@Entity()
export class Articulo {

    @PrimaryGeneratedColumn()
    @IsNotEmpty()
    id: number

    @Column()
    @IsNotEmpty()
    descripcion: string

    @Column({ type: "float" })//del tipo float
    @IsNotEmpty()
    precio: number

    @Column()
    @IsNotEmpty()
    stock: number

}
```
## 5. Creando el servidor
- Crear el archivo src/data-source.ts y crear la conexion de base de datos y agregar la nueva entidad
```ts
/** Importar TypeOrmModule y la entidad Articulo*/
import { TypeOrmModule } from '@nestjs/typeorm';
import { Articulo } from './articulos/entities/articulo.entity'

export const AppDataSource = TypeOrmModule.forRoot({
    type: 'postgres',
    // host: 'localhost', // windows
    host: '172.17.0.2',// linux
    port: 5432,
    username: 'postgres',
    password: 'postgres',
    database: 'articulos_db',
    entities: [Articulo],
    synchronize: true,
  })
```
- Ir a app.module.ts y agregar la conexion y la nueva entidad
```ts
import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { ArticulosModule } from './articulos/articulos.module';
/** Importar la conecxion con la base de datos*/
import { AppDataSource } from './data-source';

@Module({
  imports: [ArticulosModule, AppDataSource],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}

```
## 6. Ejecutar la aplicacion principal
### 6.1. Viendo los comandos de ejecución
- Dentro de nuestro package.json estan los script para ejecutar las tareas desde consola
```json
  "scripts": {
    "build": "nest build",//Lo llevara para produccion, osea lo compilara
    "format": "prettier --write \"src/**/*.ts\" \"test/**/*.ts\"",
    "start": "nest start",
    "start:dev": "nest start --watch",// Iniciara en el modo desarrollo
    "start:debug": "nest start --debug --watch",
    "start:prod": "node dist/main",
    "lint": "eslint \"{src,apps,libs,test}/**/*.ts\" --fix",
    "test": "jest",
    "test:watch": "jest --watch",
    "test:cov": "jest --coverage",
    "test:debug": "node --inspect-brk -r tsconfig-paths/register -r ts-node/register node_modules/.bin/jest --runInBand",
    "test:e2e": "jest --config ./test/jest-e2e.json"
  },
```
| Tipo | Función |
|----------|----------|
| nest start --watch   | Ejecuta archivos typeScript   |
| nest build    | Transforma typeScript a javaScript   |
| node    | Ejecuta archivos javaScript   |

#### 6.1.1. Ejecutar en modo desarrollo
```console
npm run start:dev
```
>Ir a localhost:3000
#### 6.1.2. Para llevar a producción
```console
npm run build
```
```text
De esta manera se crea el archivo main.js
```
#### 6.1.3. Ejecutar el producto final main.js
```console
npm run start:prod
```
>Ir a localhost:3000
## 7. Referencia
- [NestJsOtro-Repositorio](https://github.com/xixay/NestJsOtro-Repositorio/blob/base_datos/base.md)
- [NestJS + PostgreSQL + TypeORM](https://www.youtube.com/watch?v=2HfGdpr4PPg)