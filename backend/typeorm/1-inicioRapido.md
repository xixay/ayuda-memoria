- [1. Instalar dependencias](#1-instalar-dependencias)
- [2. crear el proyecto](#2-crear-el-proyecto)
- [3. Instalar las librerias](#3-instalar-las-librerias)
- [4. configuración de conexión a la base de datos](#4-configuración-de-conexión-a-la-base-de-datos)
  - [4.1. Crear la base datos](#41-crear-la-base-datos)
  - [4.2. Editar e servidor](#42-editar-e-servidor)

## 1. Instalar dependencias
- Instalar el tipo de base de datos
```console
npm install pg --save
```
- Instalar npx si no se tiene
```console
npm install -g npx
```
## 2. crear el proyecto
```console
npx typeorm init --name MyProject --database prueba_db
```
- Archivos que se crearon
```text
MyProject
├── src                   //  lugar de su código TypeScript
│   ├── entity            // lugar donde se almacenan sus entidades (modelos de base de datos)
│   │   └── User.ts       // entidad de muestra
│   ├── migration         // lugar donde se almacenan tus migraciones
│   ├── data-source.ts    // fuente de datos y toda la configuración de conexión
│   └── index.ts          // punto de inicio de su aplicación
├── .gitignore            // archivo estándar de gitignore
├── package.json          // dependencias de node module
├── README.md             // archivo Léame simple
└── tsconfig.json         // Opciones del compilador TypeScript
```
## 3. Instalar las librerias
- instalar nuevas dependencias
```console
cd MyProject
npm install
```
## 4. configuración de conexión a la base de datos
### 4.1. Crear la base datos
- Por terminal
```console
sudo docker run --name prueba -e POSTGRES_PASSWORD=postgres -d postgres:13.5
```
- Encontrar la ip de la imagen
```console
docker inspect prueba
    "IPAddress": "172.17.0.6",
```
- Ingresar al contenedor postgres
```console
psql -h 172.17.0.6 -U postgres -W
```
- password
```console
Contraseña:postgres
```
- Crear la base de datos
```console
CREATE DATABASE prueba_db;
\q
```
### 4.2. Editar e servidor
- Edite data-source.ts
```ts
export const AppDataSource = new DataSource({
    type: "postgres",
    host: "172.17.0.6",
    // host: "localhost",
    port: 5432,
    username: "postgres",
    password: "postgres",
    database: "prueba_db",
    synchronize: true,
    logging: false,
    entities: [User],
    migrations: [],
    subscribers: [],
})
```
- Ejecutar la aplicación.
```console
npm start
```
-  Se inserto un nuevo usuario en la base de datos
```text
Archivo donde se creo el usuario
    MyProject/src/index.ts
Formato de la entidad user
    MyProject/src/entity/User.ts
```
- Por consola
```console
> MyProject@0.0.1 start
> ts-node src/index.ts

Inserting a new user into the database...
Saved a new user with id: 1
Loading users from the database...
Loaded users:  [ User { id: 1, firstName: 'Timber', lastName: 'Saw', age: 25 } ]
Here you can setup and run express / fastify / any other framework.
```
- Se creo la entidad usuario
```text
con:
id=1
Nombre=Timber
2doNombre=Saw
Edad=25

```