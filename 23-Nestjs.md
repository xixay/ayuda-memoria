- [1. Instalar bibliotecas](#1-instalar-bibliotecas)
- [2. Crear base de datos linux](#2-crear-base-de-datos-linux)
- [3. Crear la base de datos en postgres en windows](#3-crear-la-base-de-datos-en-postgres-en-windows)
- [4. Instalar bibliotecas](#4-instalar-bibliotecas)
- [5. crear recurso articulos](#5-crear-recurso-articulos)
- [6. Crear la conexion base de datos](#6-crear-la-conexion-base-de-datos)
- [7. agregando metodos API REST](#7-agregando-metodos-api-rest)
- [8. GET obtener todos los articulos](#8-get-obtener-todos-los-articulos)
- [9. GET:id obtener el articulo por id](#9-getid-obtener-el-articulo-por-id)
- [10. DELETE borrar articulo por id](#10-delete-borrar-articulo-por-id)
- [11. POST agregar articulo](#11-post-agregar-articulo)
- [12. PATCH Actualizar un articulo](#12-patch-actualizar-un-articulo)
- [13. Servicio final](#13-servicio-final)
- [14. Comandos](#14-comandos)
- [15. Hacer backups, o restaurar](#15-hacer-backups-o-restaurar)
  - [15.1. backups](#151-backups)
  - [15.2. restaurar](#152-restaurar)
- [16. Referencia](#16-referencia)
## 1. Instalar bibliotecas
- Instalar cli de Nestjs
```console
npm i -g @nestjs/cli
```
- crear un archivo nestjs en un nivel arriba, para que no haya choque de repositorios
```console
cd ..
```
- Crear el proyecto Nestjs, e ingresar en el
```
nest new my-app(seleccionar npm)
cd my-app
```
- Inicializar el git
```console
git init
```
- Agregar el proyecto nestJs al repositorio en github creado(articulo-repositorio-backend)
```console
git remote add origin https://github.com/xixay/articulo-repositorio-backend
```
- Agregar los cambios
```console
git add .
```
- Hacer el commit
```console
git commit -m "Inicializando NestJs"
```
- Subirlo a la rama master, para que no choque con la rama main de https://github.com/xixay/articulo-repositorio-backend, si sale un alert, dale aceptar
```console
git push -u origin master
```
- Borrar la relacion remota y el archivo carpeta my-app
```console
ls -a
rm -rf .git
cd ..
rm -rf my-app
```
```txt
Despues de borrar la carpeta my-app, volver a la carpeta original de nuestro repo(articulo-repositorio-backend)
```
- Cambiar a la rama master, donde esta nestJs
```console
git checkout master
```
- Instalar los paquetes
```console
npm i
```
## 2. Crear base de datos linux
- Crear la imagen en docker
```console
sudo docker run   --name conNestJs   -e POSTGRES_PASSWORD=postgres   -d   -p 5555:5432   postgres:14.6
```
- Iniciar
```console
docker start conNestJs
```
- obtener el ip del contenedor
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
- Crear la base de datos
```console
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
docker inspect conNestJs(172.17.0.2) también colocar en .env
Host=172.17.0.2
port=5432
Database=articulos_db
- Ver la IP y puerto (windows wsl2) también colocar en el .env
Host=localhost
port=5555
Database=articulos_db
```
## 3. Crear la base de datos en postgres en windows
- Ejecutar en el terminal
```console
psql -U postgres -h localhost
Contraseña para usuario postgres:postgres
```
- Dentro de postgres Ejecutar
```console
\pset pager off
```
- Utilizar el comando de postgres para crear la base de datos
```sql
CREATE DATABASE articulos_db;
```
- Listar la base de datos
```console
\l;
```
- Conectémonos a la nueva base de datos articulos_db usando el comando de conexión:
```console
\c articulos_db
```
## 4. Instalar bibliotecas
- instalar las bibliotecas de API de cliente asociadas para su base de datos seleccionada, en este caso sera postgres.
```console
npm i -D --save @nestjs/typeorm typeorm pg
```
## 5. crear recurso articulos
- Use el comando
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
import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class Articulo {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  descripcion: string;

  @Column()
  precio: number;

  @Column()
  stock: number;
}

```
## 6. Crear la conexion base de datos
- Ir a app.module.ts y cambiar, agregando la conexion y la nueva entidad
```ts
import { Module } from '@nestjs/common';
/**Eliminar las importaciones innecesarias por defecto  */
// import { AppController } from './app.controller';
// import { AppService } from './app.service';
import { ArticulosModule } from './articulos/articulos.module';
/** Importar TypeOrmModule y la entidad Articulo*/
import { TypeOrmModule } from '@nestjs/typeorm';
import { Articulo } from './articulos/entities/articulo.entity';
@Module({
  imports: [
    ArticulosModule,
    TypeOrmModule.forRoot({
      type: 'postgres',
      host: 'localhost', // windows
      // host: '172.17.0.2',// linux
      port: 5432,
      username: 'postgres',
      password: 'postgres',
      database: 'articulos_db',
      entities: [Articulo],
      synchronize: true,
    }),
  ],
  // eliminar El controller y provider innecesarios
  // controllers: [AppController],
  // providers: [AppService],
})
export class AppModule {}

```
## 7. agregando metodos API REST
- Agregar los credenciales cors, en main.ts
```ts
import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  // Agregar los credenciales cors
  app.enableCors({
    origin: true,
    methods: 'GET,HEAD,PUT,PATCH,POST,DELETE,OPTIONS',
    credentials: true,
  });
  await app.listen(3000);
}
bootstrap();

```
- Ir articulos.module.ts , agregarla biblioteca y entidad articulo(Si es que no se lo hizo antes)
```ts
import { Module } from '@nestjs/common';
import { ArticulosService } from './articulos.service';
import { ArticulosController } from './articulos.controller';
// Los 2 nuevos
import { TypeOrmModule } from '@nestjs/typeorm';
import { Articulo } from './entities/articulo.entity';
@Module({
  imports: [TypeOrmModule.forFeature([Articulo])], // agregar importante
  controllers: [ArticulosController],
  providers: [ArticulosService],
})
export class ArticulosModule {}


```
- articulos.controller.ts, deberia verse de la sgte manera:
```ts
import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { ArticulosService } from './articulos.service';
import { CreateArticuloDto } from './dto/create-articulo.dto';
import { UpdateArticuloDto } from './dto/update-articulo.dto';

@Controller('articulos')
export class ArticulosController {
  constructor(private readonly articulosService: ArticulosService) {}

  @Post()
  create(@Body() createArticuloDto: CreateArticuloDto) {
    return this.articulosService.create(createArticuloDto);
  }

  @Get()
  findAll() {
    return this.articulosService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.articulosService.findOne(+id);
  }

  @Patch(':id')
  update(
    @Param('id') id: string,
    @Body() updateArticuloDto: UpdateArticuloDto,
  ) {
    return this.articulosService.update(+id, updateArticuloDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.articulosService.remove(+id);
  }
}


```
- Ir a articulos.service.ts, y crear un constructor, e importar las librerias y la entidad
```ts
import { Injectable } from '@nestjs/common';
import { CreateArticuloDto } from './dto/create-articulo.dto';
import { UpdateArticuloDto } from './dto/update-articulo.dto';
// Importar librerias y entidad
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Articulo } from './entities/articulo.entity';
@Injectable()
export class ArticulosService {
  // crear constructor
  constructor(
    @InjectRepository(Articulo)
    private articuloRepositorio: Repository<Articulo>,
  ) {}
  create...

  findAll...

  findOne...

  update...

  remove...
}

```
## 8. GET obtener todos los articulos
- Ir a articulos.service.ts agregar array de usuario y buscar en la base de datos
```ts
  findAll() {
    return this.articuloRepositorio.find();
  }
```
## 9. GET:id obtener el articulo por id
- Ir a articulos.service.ts agregar articulo y buscar en la base de datos por id
```ts
  findOne(id: number) {
    return this.articuloRepositorio.findOneBy({ id });
  }
```
## 10. DELETE borrar articulo por id
- Ir a articulos.service.ts buscar en la base de datos por id
```ts
  remove(id: number) {
    this.articuloRepositorio.delete(id);
  }
```
## 11. POST agregar articulo
- Ir a create-articulo.dto.ts y crear el cuerpo
```ts
export class CreateArticuloDto {
  descripcion: string;
  precio: number;
  stock: number;
}

```
- Ir a articulos.service.ts y modificar
```ts
create(createUsuarioDto: CreateUsuarioDto) {
    return this.articuloRepositorio.save(createArticuloDto);
  }
```
## 12. PATCH Actualizar un articulo
- Ir a articulos.services.ts y modificar el metodo update
```ts
  async update(id: number, updateArticuloDto: UpdateArticuloDto) {
    // return `This action updates a #${id} articulo`;
    const aActualizar = await this.articuloRepositorio.findOneBy({ id });
    this.articuloRepositorio.merge(aActualizar, updateArticuloDto);
    return this.articuloRepositorio.save(aActualizar);
  }
```
## 13. Servicio final
- articulos.service.ts queda
```ts
import { Injectable } from '@nestjs/common';
import { CreateArticuloDto } from './dto/create-articulo.dto';
import { UpdateArticuloDto } from './dto/update-articulo.dto';
// Importar librerias y entidad
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Articulo } from './entities/articulo.entity';
@Injectable()
export class ArticulosService {
  // crear constructor
  constructor(
    @InjectRepository(Articulo)
    private articuloRepositorio: Repository<Articulo>,
  ) {}
  create(createArticuloDto: CreateArticuloDto) {
    // return 'This action adds a new articulo';
    return this.articuloRepositorio.save(createArticuloDto);
  }

  findAll() {
    // return `This action returns all articulos`;
    return this.articuloRepositorio.find();
  }

  findOne(id: number){
    // return `This action returns a #${id} articulo`;
    return this.articuloRepositorio.findOneBy({ id });
  }

  async update(id: number, updateArticuloDto: UpdateArticuloDto) {
    // return `This action updates a #${id} articulo`;
    const aActualizar = await this.articuloRepositorio.findOneBy({ id });
    this.articuloRepositorio.merge(aActualizar, updateArticuloDto);
    return this.articuloRepositorio.save(aActualizar);
  }

  remove(id: number) {
    // return `This action removes a #${id} articulo`;
    this.articuloRepositorio.delete(id);
  }
}

```
Creación de rutas para operaciones CRUD
| Método | Función | Equivalente | Body |
| --------- | --------- | --------- | --------- |
| GET: /articulos/ | findAll() | http://localhost:3000/articulos/ | no tiene |
| GET: /articulos/id | findOne(id: number) | http://localhost:3000/articulos/1 | no tiene |
| POST: /articulos/ | create(createArticuloDto: CreateArticuloDto) | http://localhost:3000/articulos/ | { "descripcion": "Pepsi", "precio": 113, "stock": 37 } |
| PATCH: /articulos/id | update(id: number, updateArticuloDto: UpdateArticuloDto) | http://localhost:3000/articulos/7 | { "descripcion": "PepsiCola", "precio": 10, "stock": 20 } |
| DELETE: /articulos/id | remove(id: number) | http://localhost:3000/articulos/1 | no tiene |
## 14. Comandos
- Ver lo en modo desarrollo
```console
npm run start:dev
```
- Ver lo en producion(Los archivos se guardan en la carpeta dist)
```console
npm run build
```
## 15. Hacer backups, o restaurar
- Crear la carpeta backups, en el nivel superior y dentro crear 2 archivos
### 15.1. backups
- Crear el archivo create-backup.sh
```sh
#!/usr/bin/bash

set -e -o errtrace
trap "echo -e '\n\nERROR: Ocurrió un error mientras se ejecutaba el script :(\n\n'" ERR

arg1=${1:-pg14}
arg2=${2:-database_db}
arg3=${3:-database_db.gz}

arg4=${4:-localhost}
arg5=${5:-5432}
arg6=${6:-postgres}
arg7=${7:-postgres}

dockerContainer="${arg1}"

dbname="${arg2}"
dbhost="${arg4}"
dbport="${arg5}"
dbuser="${arg6}"
dbpass="${arg7}"
dbfile="${arg3}"

echo -e "\n >>> Creando SQL backup desde $dbname ($dbhost:$dbport) al archivo $dbfile.."

docker exec -it $dockerContainer pg_dump -h $dbhost -p $dbport -U $dbuser $dbname | gzip > $dbfile

echo -e "\n >>> ¡Backup creado con éxito! :)\n"

```
- Para hacer un backup de la base de datos
```console
sudo bash create-backup.sh conNestJs articulos_db database_db.gz
```
### 15.2. restaurar
- Crear el archivo restore-backup.sh
```sh
#!/usr/bin/bash

set -e -o errtrace
trap "echo -e '\n\nERROR: Ocurrió un error mientras se ejecutaba el script :(\n\n'" ERR

arg1=${1:-pg14}
arg2=${2:-database_db}
arg3=${3:-database_db.gz}

arg4=${4:-localhost}
arg5=${5:-5432}
arg6=${6:-postgres}
arg7=${7:-postgres}

dockerContainer="${arg1}"

dbname="${arg2}"
dbhost="${arg4}"
dbport="${arg5}"
dbuser="${arg6}"
dbpass="${arg7}"

filename="${arg3/.gz/''}"
dbfile="$filename.gz"

# [INI] SQL
echo -e "\n\n >>> Restaurando SQL backup desde $dbfile a $dbname ($dbhost:$dbport)...\n"

docker restart $dockerContainer

echo -e "\nReiniciando el contenedor $dockerContainer...\n";
sleep 2;

docker exec $dockerContainer psql -h $dbhost -U postgres -c "DROP DATABASE IF EXISTS $dbname"
docker exec $dockerContainer psql -h $dbhost -U postgres -c "CREATE DATABASE $dbname ENCODING 'UTF-8'"

echo " - Copiando..."
docker cp "$dbfile" $dockerContainer:/
sleep 1;

echo " - Descomprimiendo..."
docker exec $dockerContainer gunzip -kf "$filename".gz
sleep 1;

echo " - Removiendo $filename.gz..."
docker exec $dockerContainer rm -rf "$filename".gz
sleep 1;

echo " - Restaurando..."
docker exec $dockerContainer psql -h $dbhost -U postgres -d "$dbname" -f "$filename"
sleep 1;

echo " - Removiendo $filename..."
docker exec $dockerContainer rm -rf "$filename"
sleep 1;

echo -e "\n - [éxito] $dbname ($dbhost)"
# [END] SQL

echo -e "\n\n >>> ¡Base de datos restaurada con éxito! :)\n"
```
- Para hacer una restauración de la base de datos
```console
sudo bash restore-backup.sh conNestJs database_db database_db.gz
```
## 16. Referencia
- [NestJsOtro-Repositorio](https://github.com/xixay/NestJsOtro-Repositorio/blob/base_datos/base.md)
- [NestJS + PostgreSQL + TypeORM](https://www.youtube.com/watch?v=2HfGdpr4PPg)
