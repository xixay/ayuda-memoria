[<< INDICE](../../README.md)
- [1. Instalar localmente](#1-instalar-localmente)
- [2. crear el archivo .env](#2-crear-el-archivo-env)
- [3. Colocar las variables donde se necesite](#3-colocar-las-variables-donde-se-necesite)
  - [3.1. Donde esta la aplicación principal](#31-donde-esta-la-aplicación-principal)
  - [3.2. Donde esta la conexion base de datos](#32-donde-esta-la-conexion-base-de-datos)
- [4. Agregar al archivo gitignore](#4-agregar-al-archivo-gitignore)
- [5. Crear el archivo .env.sample](#5-crear-el-archivo-envsample)
- [6. Referencias](#6-referencias)
# 1. Instalar localmente
```console
npm i dotenv --save
```
# 2. crear el archivo .env
- En aqui estara información que no debe ser compartida en la nube
```ts
# Datos de despliegue
NODE_ENV=development
PORT=3000

# Configuración de la base de datos
DB_HOST=172.17.0.4
DB_USERNAME=postgres
DB_PASSWORD=postgres
DB_DATABASE=articulos_db
DB_PORT=5432
```
# 3. Colocar las variables donde se necesite
## 3.1. Donde esta la aplicación principal
- Importar las librerias y colocar en ves del puerto
```ts
/**otras librerias */
//importar librerias para variablesde entorno
import * as dotenv from 'dotenv';
dotenv.config();

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  app.enableCors();

  app.enableCors({
    origin: true,
    methods: 'GET,HEAD,PUT,PATCH,POST,DELETE,OPTIONS',
    credentials: true,
  });
  await app.listen(process.env.PORT);// por el puerto 3000
}
bootstrap();

```
## 3.2. Donde esta la conexion base de datos
- Importar las librerias y colocar en ves de ip, usuario, password, base de datos
```ts
import { Module } from '@nestjs/common';
/**otras librerias */
//importar librerias para variablesde entorno
import * as dotenv from 'dotenv';
dotenv.config();

@Module({
  imports: [
    ArticulosModule,
    TypeOrmModule.forRoot({
      type: 'postgres',
      host: process.env.DB_HOST,//172.17.0.2
      port: parseInt(process.env.DB_PORT),//5432 por ser number
      username: process.env.DB_USERNAME,//postgres
      password: process.env.DB_PASSWORD,//postgres
      database: process.env.DB_DATABASE,//articulos_db
      entities: [Articulo, Usuario, Perfile, Foto],
      synchronize: true,
    }),
    UsuariosModule,
    PerfilesModule,
    FotosModule,
  ],
})
export class AppModule {}
```
# 4. Agregar al archivo gitignore
- Para que no lo suba al repositorio, ontraseñas y otros
```ts
.env
```
# 5. Crear el archivo .env.sample
- Aqui estara un modelo de como seria el archivo .env
```ts
# Datos de despliegue
NODE_ENV=development
PORT=3000//puede estar

# Configuración de la base de datos
DB_HOST=172.17.0.4//cambia depende de la maquina
DB_USERNAME=postgres//mejor si se pone ejm
DB_PASSWORD=postgres//mejor si se pone ejm
DB_DATABASE=articulos_db//mejor si se pone ejm
DB_PORT=5432//puede estar
```
# 6. Referencias
- [Variable de entorno](https://www.npmjs.com/package/dotenv)

[<< INDICE](../../README.md)