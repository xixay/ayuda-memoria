- [1. Crear la entidad Foto](#1-crear-la-entidad-foto)
  - [1.1. Modelo de Foto](#11-modelo-de-foto)
  - [1.2. Volver nuestro modelo una entidad](#12-volver-nuestro-modelo-una-entidad)
  - [1.3. Agregando columnas de tablas](#13-agregando-columnas-de-tablas)
  - [1.4. Creando una columna principal](#14-creando-una-columna-principal)
  - [1.5. Creando una columna generada automáticamente](#15-creando-una-columna-generada-automáticamente)
  - [1.6. Tipos de datos de columna](#16-tipos-de-datos-de-columna)
- [2. Creando un nuevoDataSource](#2-creando-un-nuevodatasource)
  - [2.1. Configurar  DataSource en index.ts](#21-configurar--datasource-en-indexts)
- [3. Crear e insertar una foto en la base de datos](#3-crear-e-insertar-una-foto-en-la-base-de-datos)
- [4. Cargar la entidad guardada con el administrador de entidades](#4-cargar-la-entidad-guardada-con-el-administrador-de-entidades)
- [5. Uso de repositorios](#5-uso-de-repositorios)
- [6. Cargando desde la base de datos](#6-cargando-desde-la-base-de-datos)
- [7. Actualizando en la base de datos](#7-actualizando-en-la-base-de-datos)
- [8. Eliminando de la base de datos](#8-eliminando-de-la-base-de-datos)
- [9. Creando una relación uno a uno](#9-creando-una-relación-uno-a-uno)
  - [9.1. Guardar una relación uno a uno](#91-guardar-una-relación-uno-a-uno)
  - [9.2. Lado inverso de la relación](#92-lado-inverso-de-la-relación)
  - [9.3. Relaciones en proyectos ESM](#93-relaciones-en-proyectos-esm)
- [10. Cargando objetos con sus relaciones](#10-cargando-objetos-con-sus-relaciones)
  - [10.1. Metodos find\*](#101-metodos-find)
  - [10.2. funcionalidad QueryBuilder](#102-funcionalidad-querybuilder)
- [11. Usar cascadas para guardar automáticamente objetos relacionados](#11-usar-cascadas-para-guardar-automáticamente-objetos-relacionados)
- [12. Creando una relación muchos a uno / uno a muchos](#12-creando-una-relación-muchos-a-uno--uno-a-muchos)
  - [12.1. Creando una relación de muchos a muchos](#121-creando-una-relación-de-muchos-a-muchos)
- [13. Referencias](#13-referencias)
## 1. Crear la entidad Foto
- Crear el archivo Foto.ts, dentro de la carpeta entity
### 1.1. Modelo de Foto
```ts
export class Foto {
    id: number
    nombre: string
    descripcion: string
    nombreArchivo: string
    vistas: number
    estaPublicado: boolean
}
```
### 1.2. Volver nuestro modelo una entidad
```ts
import { Entity } from "typeorm"

@Entity()
export class Foto {
    id: number
    nombre: string
    descripcion: string
    nombreArchivo: string
    vistas: number
    estaPublicado: boolean
}   
```
### 1.3. Agregando columnas de tablas
```ts
import { Entity, Column } from "typeorm"

@Entity()
export class Foto {
     @Column()
    id: number

     @Column()
    nombre: string

     @Column()
    descripcion: string

     @Column()
    nombreArchivo: string

     @Column()
    vistas: number

     @Column()
    estaPublicado: boolean
}   
```
### 1.4. Creando una columna principal
```ts
import { Entity, Column, PrimaryColumn} from "typeorm"

@Entity()
export class Foto {
     @PrimaryColumn()
    id: number

     @Column()
    nombre: string

     @Column()
    descripcion: string

     @Column()
    nombreArchivo: string

     @Column()
    vistas: number

     @Column()
    estaPublicado: boolean
}   
```
### 1.5. Creando una columna generada automáticamente
```ts
import { Entity, Column, PrimaryGeneratedColumn} from "typeorm"

@Entity()
export class Foto {
     @PrimaryGeneratedColumn()
    id: number

     @Column()
    nombre: string

     @Column()
    descripcion: string

     @Column()
    nombreArchivo: string

     @Column()
    vistas: number

     @Column()
    estaPublicado: boolean
}   
```
### 1.6. Tipos de datos de columna
```ts
import { Entity, Column, PrimaryGeneratedColumn} from "typeorm"

@Entity()
export class Foto {
     @PrimaryGeneratedColumn()
    id: number

     @Column({
        length: 100,
    })
    nombre: string

     @Column("text")
    descripcion: string

     @Column()
    nombreArchivo: string

     @Column("int")
    vistas: number

     @Column()
    estaPublicado: boolean
}   
```
## 2. Creando un nuevoDataSource
- Ir a index.ts, comentar o borrar lo que se encuentre ahi
### 2.1. Configurar  DataSource en index.ts
```ts
import "reflect-metadata"
import { DataSource } from "typeorm"
import { Foto } from "./entity/Foto"

const AppDataSource = new DataSource({
    type: "postgres",
    host: "172.17.0.6",
    port: 5432,
    username: "postgres",
    password: "postgres",
    database: "prueba_db",
    entities: [Foto],
    synchronize: true,
    logging: false,
})

// para inicializar la conexión inicial con la base de datos, registrar todas las entidades
// y "sincronizar" el esquema de la base de datos, llame al método "inicializar ()" de una base de datos recién creada
// una vez en el arranque de su aplicación
AppDataSource.initialize()
    .then(() => {
        // aquí puedes empezar a trabajar con tu base de datos
    })
    .catch((error) => console.log(error))
```
- Al ejecutar la aplicación dentro de project.
```console
npm start
```
- Queda
```text
+--------------+--------------+----------------------------+
|                         foto                             |
+--------------+--------------+----------------------------+
| id           | int(11)      | PRIMARY KEY AUTO_INCREMENT |
| nombre       | varchar(100) |                            |
| descripcion  | text         |                            |
| nombreArchivo| varchar(255) |                            |
| vistas       | int(11)      |                            |
| estaPublicado| boolean      |                            |
+------------- +--------------+----------------------------+
```
## 3. Crear e insertar una foto en la base de datos
- Ahora vamos a crear una nueva foto para guardarla en la base de datos, en index.ts:
```ts
import "reflect-metadata"
import { DataSource } from "typeorm"
import { Foto } from "./entity/Foto"

const foto = new Foto()
foto.nombre = "yo y los osos"
foto.descripcion = "estoy cerca de los osos polares"
foto.nombreArchivo = "foto-con-osos.jpg"
foto.vistas = 1
foto.estaPublicado = true

AppDataSource.initialize()
    .then(async () => {
        // aquí puedes empezar a trabajar con tu base de datos
        // METODO INSERTAR
        await AppDataSource.manager.save(foto)
        console.log("La foto ha sido guardada. El id de la foto es: ", foto.id)
    })
    .catch((error) => console.log(error))
```
- Ejecutar para insertar, estando en la carpeta project
```console
npm start
```
## 4. Cargar la entidad guardada con el administrador de entidades
```ts
import "reflect-metadata"
import { DataSource } from "typeorm"
import { Foto } from "./entity/Foto"

AppDataSource.initialize()
    .then(async () => {
        // aquí puedes empezar a trabajar con tu base de datos

        //Cargar la entidad
        const fotosGuardadas = await AppDataSource.manager.find(Foto)
        console.log("Todas las fotos de la base de datos: ", fotosGuardadas)
    })
    .catch((error) => console.log(error))
```
## 5. Uso de repositorios
- Repositorios son más convenientes de usar que los EntityManagers:
- Cuando trata mucho con entidades, los Repositorios son más convenientes de usar que los EntityManagers:
```ts
import "reflect-metadata"
import { DataSource } from "typeorm"
import { Foto } from "./entity/Foto"

const foto = new Foto()
foto.nombre = "yo y los osos"
foto.descripcion = "estoy cerca de los osos polares"
foto.nombreArchivo = "foto-con-osos.jpg"
foto.vistas = 1
foto.estaPublicado = true

AppDataSource.initialize()
    .then(async () => {
        // aquí puedes empezar a trabajar con tu base de datos
        // LLamando repositorio de foto
        const repositorioFoto = AppDataSource.getRepository(Foto)
        // Insertando datos
        await repositorioFoto.save(foto)
        console.log("La foto ha sido guardada")
        // Cargando las fotos
        const fotosGuardadas = await repositorioFoto.find()
        console.log("Todas las fotos de la base de datos: ", fotosGuardadas)
    })
    .catch((error) => console.log(error))
```
## 6. Cargando desde la base de datos
- Probemos más operaciones de carga usando el Repositorio:
```ts
import "reflect-metadata"
import { DataSource } from "typeorm"
import { Foto } from "./entity/Foto"

AppDataSource.initialize()
    .then(async () => {
        // aquí puedes empezar a trabajar con tu base de datos
        // LLamando repositorio de foto
        const repositorioFoto = AppDataSource.getRepository(Foto)
        // Insertando datos
        await repositorioFoto.save(foto)
        console.log("La foto ha sido guardada")
        // Cargando las fotos
        const fotosGuardadas = await repositorioFoto.find()
        console.log("Todas las fotos de la base de datos: ", fotosGuardadas)
        // Primera Foto
        const primeraFoto = await repositorioFoto.findOneBy({
        id: 1,
        })
        console.log("Primera foto de la base de datos:", primeraFoto)
        // Buscando por nombre
        const fotoYoYLosOsos = await repositorioFoto.findOneBy({
        nombre: "yo y los osos",
        })
        console.log("Foto de los osos y yo de la base de datos: ", fotoYoYLosOsos)
        // Buscando por vistas
        const todasLasFotosVistas = await repositorioFoto.findBy({ vistas: 1 })
        console.log("Todas las fotos vistas: ", todasLasFotosVistas)
        // Busqueda por publicado
        const todasLasFotosPublicadas = await repositorioFoto.findBy({ estaPublicado: true })
        console.log("Todas las fotos publicadas: ", todasLasFotosPublicadas)
        // Buscar y contar
        const [fotos, contarFotos] = await repositorioFoto.findAndCount()
        console.log("Todas las fotos: ", fotos)
        console.log("Cuenta de fotos: ", contarFotos)
    })
    .catch((error) => console.log(error))
```
## 7. Actualizando en la base de datos
- Ahora vamos a cargar una sola foto de la base de datos, actualizarla y guardarla:
```ts
import "reflect-metadata"
import { DataSource } from "typeorm"
import { Foto } from "./entity/Foto"

AppDataSource.initialize()
    .then(async () => {
        // aquí puedes empezar a trabajar con tu base de datos
        // LLamando repositorio de foto
        const repositorioFoto = AppDataSource.getRepository(Foto)
        // Actualizando datos
        const fotoParaActualizar = await repositorioFoto.findOneBy({
        id: 1,
        })
        fotoParaActualizar.nombre = "Yo, mis amigos y los lobos"
        await repositorioFoto.save(fotoParaActualizar)
        console.log("Foto actualizada");
        })
    .catch((error) => console.log(error))
```
## 8. Eliminando de la base de datos
- Ahora eliminemos nuestra foto de la base de datos:
```ts
import "reflect-metadata"
import { DataSource } from "typeorm"
import { Foto } from "./entity/Foto"

AppDataSource.initialize()
    .then(async () => {
        // aquí puedes empezar a trabajar con tu base de datos
        // LLamando repositorio de foto
        const repositorioFoto = AppDataSource.getRepository(Foto)
        // Eliminando foto
        const fotoParaEliminar = await repositorioFoto.findOneBy({
        id: 1,
        })
        await repositorioFoto.remove(fotoParaEliminar)
        console.log("Foto eliminada");
        })
    .catch((error) => console.log(error))
```
## 9. Creando una relación uno a uno
- Crear el archivo FotoMetadata.ts dentro de la carpeta entity. Se supone que esta clase PhotoMetadata contiene la metainformación adicional de nuestra foto
```ts
import {
    Entity,
    Column,
    PrimaryGeneratedColumn,
    OneToOne,
    JoinColumn,
} from "typeorm"
import { Foto } from "./Foto"

@Entity()
export class FotoMetadata {
    @PrimaryGeneratedColumn()
    id: number

    @Column("int")
    alto: number

    @Column("int")
    ancho: number

    @Column()
    orientacion: string

    @Column()
    comprimido: boolean

    @Column()
    commentario: string
    //  permite crear una relación uno a uno entre dos entidades
    // () => Foto, es una función que devuelve la clase de la entidad con la que queremos hacer nuestra relación
    @OneToOne(() => Foto)
    //  indica que este lado de la relación será el propietario de la relación
    @JoinColumn()
    foto: Foto
}
```
- Si ejecuta la aplicación, verá una tabla recién generada y contendrá una columna con una clave externa para la relación de la foto:
```text
+-------------+--------------+----------------------------+
|                     FotoMetadata                        |
+-------------+--------------+----------------------------+
| id          | int(11)      | PRIMARY KEY AUTO_INCREMENT |
| alto        | int(11)      |                            |
| ancho       | int(11)      |                            |
| commentario | varchar(255) |                            |
| comprimido  | boolean      |                            |
| orientacion | varchar(255) |                            |
| fotoId      | int(11)      | FOREIGN KEY                |
+-------------+--------------+----------------------------+
```
### 9.1. Guardar una relación uno a uno
- Ahora guardemos una foto, sus metadatos y adjúntelos entre sí.
```ts
import "reflect-metadata";
import { DataSource } from "typeorm";
import { Foto } from "./entity/Foto";
import { FotoMetadata } from "./entity/FotoMetadata"
const AppDataSource = new DataSource({
  ...
  entities: [Foto,FotoMetadata],
  ...
});
// Agregando datos de foto
const foto = new Foto();
foto.nombre = "yo y los osos";
foto.descripcion = "estoy cerca de los osos polares";
foto.nombreArchivo = "foto-con-osos.jpg";
foto.vistas = 1;
foto.estaPublicado = true;

// Agregando datos a fotoMetadata
const metadata = new FotoMetadata()
metadata.alto = 640
metadata.ancho = 480
metadata.comprimido = true
metadata.commentario = "cybershoot"
metadata.orientacion = "portrait"
metadata.foto = foto // De esta manera las conectamos

AppDataSource.initialize()
  .then(async () => {
 
    // LLamando repositorio de foto
    const repositorioFoto = AppDataSource.getRepository(Foto);

    // Llamando repositorio de fotoMetadata
    const repositorioMetadata = AppDataSource.getRepository(FotoMetadata);
    
    // primero debemos guardar una foto
    await repositorioFoto.save(foto)

    // se guarda la foto. Ahora necesitamos guardar los metadatos de una foto.
    await repositorioMetadata.save(metadata)

    // hecho
    console.log(
        "Los metadatos se guardan y la relación entre los metadatos y la foto también se crea en la base de datos.",
    )
        
    })
  .catch((error) => console.log(error));

```
2. Probar en dbeaver la consulta es
```sql
select *from foto f , foto_metadata fm where f.id =fm."fotoId"
```
### 9.2. Lado inverso de la relación
```text
Las relaciones pueden ser unidireccionales o bidireccionales. Actualmente, nuestra relación entre FotoMetadata y Foto es unidireccional. El propietario de la relación es FotoMetadata, y Foto no sabe nada sobre FotoMetadata. Esto hace que sea complicado acceder a FotoMetadata desde el lado de la foto. Para solucionar este problema, debemos agregar una relación inversa y hacer que las relaciones entre FotoMetadata y Foto sean bidireccionales. Modifiquemos nuestras entidades:
```
- En FotoMetadata.ts
```ts
import {
    Entity,
    Column,
    PrimaryGeneratedColumn,
    OneToOne,
    JoinColumn,
} from "typeorm"
import { Foto } from "./Foto"

@Entity()
export class FotoMetadata {
    
    /* ... otras columnas */

    //  permite crear una relación uno a uno entre dos entidades
    // () => Foto, es una función que devuelve la clase de la entidad con la que queremos hacer nuestra relación
    // es una función que devuelve el nombre del lado inverso de la relación
    @OneToOne(() => Foto, (foto) => foto.metadata)
    //  indica que este lado de la relación será el propietario de la relación(SOLO DEBE ESTAR EN UN LADO)
    @JoinColumn()
    foto: Foto
}
```
- En Foto.ts
```ts
import { Entity, Column, PrimaryGeneratedColumn, OneToOne } from "typeorm"
import { FotoMetadata } from "./FotoMetadata"

@Entity()
export class Foto {
    /* ... otras columnas */

     @OneToOne(() => FotoMetadata, (fotoMetadata) => fotoMetadata.foto)
    metadata: FotoMetadata
} 
```
### 9.3. Relaciones en proyectos ESM
```text
Si usa ESM en su proyecto de TypeScript, debe usar el Relation tipo contenedor en las propiedades de relación para evitar problemas de dependencia circular. Modifiquemos nuestras entidades:
```
- En FotoMetadata.ts
```ts
import {
    Entity,
    Column,
    PrimaryGeneratedColumn,
    OneToOne,
    JoinColumn,
    Relation,
} from "typeorm"
import { Foto } from "./Foto"

@Entity()
export class FotoMetadata {
    
    /* ... otras columnas */
    @OneToOne(() => Foto, (foto) => foto.metadata)
    @JoinColumn()
    foto: Relation<Foto>
}
```
- En Foto.ts
```ts
import { Entity, Column, PrimaryGeneratedColumn, OneToOne, Relation } from "typeorm"
import { FotoMetadata } from "./FotoMetadata"

@Entity()
export class Foto {
    /* ... otras columnas */

     @OneToOne(() => FotoMetadata, (fotoMetadata) => fotoMetadata.foto)
    metadata: Relation<FotoMetadata>
} 
```
## 10. Cargando objetos con sus relaciones
- Ahora carguemos nuestra foto y sus metadatos de foto en una sola consulta. Hay dos formas de hacerlo:
```text
1. metodos find*
2. funcionalidad QueryBuilder
``` 
### 10.1. Metodos find*
- Permiten especificar un objeto con la interfaz FindOneOptions/ .FindManyOptions
```ts
import "reflect-metadata";
import { DataSource } from "typeorm";
import { Foto } from "./entity/Foto";
import { FotoMetadata } from "./entity/FotoMetadata"

AppDataSource.initialize()
  .then(async () => {

        // LLamando repositorio de foto
        const repositorioFoto = AppDataSource.getRepository(Foto);
        
        // Cargando las fotos y sus metadatos
        const fotos = await repositorioFoto.find({
          relations: {
              metadata: true,
          },
        })

        // hecho
        console.log("Las fotos con sus relaciones : ", fotos)
        
  })
  .catch((error) => console.log(error));

```
### 10.2. funcionalidad QueryBuilder
- Si necesita una consulta más compleja, debe usar en lugar de find, QueryBuilder. QueryBuilder permite utilizar consultas más complejas de forma elegante:
```ts
import "reflect-metadata";
import { DataSource } from "typeorm";
import { Foto } from "./entity/Foto";
import { FotoMetadata } from "./entity/FotoMetadata"

AppDataSource.initialize()
  .then(async () => {

        // LLamando repositorio de foto
        const repositorioFoto = AppDataSource.getRepository(Foto);
        
        // Cargando las fotos y sus metadatos
        const fotos = await repositorioFoto
        .createQueryBuilder("foto")
        .innerJoinAndSelect("foto.metadata", "metadata")
        .getMany()

        // hecho
        console.log("Las fotos con sus relaciones : ", fotos)
        
  })
  .catch((error) => console.log(error));

```
- Lo bueno de este metodo es que devolvio solo las fotos con datos en metadata
## 11. Usar cascadas para guardar automáticamente objetos relacionados
- Podemos configurar opciones en cascada en nuestras relaciones, en los casos en que queramos que nuestro objeto relacionado se guarde cada vez que se guarde el otro objeto. Cambiemos un poco el decorador @OneToOne de nuestra foto:
```ts
import { Entity, Column, PrimaryGeneratedColumn, OneToOne } from "typeorm"
import { FotoMetadata } from "./FotoMetadata"

@Entity()
export class Foto {
    /* ... otras columnas */

     @OneToOne(() => FotoMetadata, (fotoMetadata) => fotoMetadata.foto, {
        cascade: true,
    })
    metadata: FotoMetadata
} 
```
- El uso cascade nos permite, no guardar fotos por separado y guardar objetos de metadatos por separado. Ahora podemos simplemente guardar un objeto de foto, y el objeto de metadatos se guardará automáticamente debido a las opciones en cascada.
```ts
import "reflect-metadata";
import { DataSource } from "typeorm";
import { Foto } from "./entity/Foto";
import { FotoMetadata } from "./entity/FotoMetadata"

// Agregando datos de foto
const foto = new Foto();
foto.nombre = "yo y los osos";
foto.descripcion = "estoy cerca de los osos polares";
foto.nombreArchivo = "foto-con-osos.jpg";
foto.vistas = 1;
foto.estaPublicado = true;

// Agregando datos a fotoMetadata
const metadata = new FotoMetadata()
metadata.alto = 640
metadata.ancho = 480
metadata.comprimido = true
metadata.commentario = "cybershoot"
metadata.orientacion = "portrait"

foto.metadata = metadata // De esta manera las conectamos

AppDataSource.initialize()
  .then(async () => {
 
    // LLamando repositorio de foto
    const repositorioFoto = AppDataSource.getRepository(Foto);
    
    // guardar una foto también guardar los metadatos
    await repositorioFoto.save(foto)

    // hecho
    console.log(
        "La foto se guarda, los metadatos de la foto también se guardan.",
    )
        
    })
  .catch((error) => console.log(error));

```
- Observe que ahora establecemos la metadata propiedad de la foto, en lugar de la propiedad de los metadatos foto como antes. La función cascade solo funciona si conecta la foto a sus metadatos desde el lado de la foto. Si configura el lado de los metadatos, los metadatos no se guardarán automáticamente.
## 12. Creando una relación muchos a uno / uno a muchos
- Vamos a crear una relación de muchos a uno/uno a muchos. Digamos que una foto tiene un autor y cada autor puede tener muchas fotos. Primero, vamos a crear la entidad Autor, en la carpeta entity Autor.ts:
```ts
import {
    Entity,
    Column,
    PrimaryGeneratedColumn,
    OneToMany,// Realcion 1 a n
    JoinColumn,
} from "typeorm"
import { Foto } from "./Foto"

@Entity()
export class Autor {
    @PrimaryGeneratedColumn()
    id: number

    @Column()
    nombre: string

    @OneToMany(() => Foto, (foto) => foto.autor)// nota: crearemos una propiedad de autor en la clase Foto a continuación
    fotos: Foto[]
}
```
- Creando la propiedad autor en la clase Foto
```ts
import { Entity, Column, PrimaryGeneratedColumn, OneToOne, } from "typeorm"
import { FotoMetadata } from "./FotoMetadata"
import { Autor } from "./Autor"// importar
@Entity()
export class Foto {

    /* ... otras columnas */
    autor: Autor
} 
```
- Autor contiene un lado inverso de una relación. OneToMany es siempre un lado inverso de la relación, y no puede existir sin ManyToOne el otro lado de la relación.
- Ahora agreguemos el lado propietario de la relación en la entidad Foto:
```ts
import { Entity, Column, PrimaryGeneratedColumn, OneToOne, ManyToOne, } from "typeorm"// Se agrego ManyToOne
import { FotoMetadata } from "./FotoMetadata"
import { Autor } from "./Autor"

@Entity()
export class Foto {
    /* ... otras columnas */

    @ManyToOne(() => Autor, (autor) => autor.fotos)
    autor: Autor
    
}
```
- En una relación de muchos a uno/uno a muchos, el lado del propietario siempre es de muchos a uno. Significa que la clase que usa @ManyToOne almacenará la identificación del objeto relacionado.
- Después de ejecutar la aplicación, el ORM creará la tabla autor:
```text
+-------------+--------------+----------------------------+
|                          autor                          |
+-------------+--------------+----------------------------+
| id          | int(11)      | PRIMARY KEY AUTO_INCREMENT |
| nombre      | varchar(255) |                            |
+-------------+--------------+----------------------------+
```
- También modificará la tabla foto, agregando una nueva columna autor y creando una clave externa para ella:
```text
+---------------+--------------+----------------------------+
|                         foto                              |
+---------------+--------------+----------------------------+
| id            | int(11)      | PRIMARY KEY AUTO_INCREMENT |
| nombre        | varchar(255) |                            |
| descripcion   | varchar(255) |                            |
| nombreArchivo | varchar(255) |                            |
| estaPublicado | boolean      |                            |
| autorId       | int(11)      | FOREIGN KEY                |
+---------------+--------------+----------------------------+
```
- Un ejm 1 autor con muchas fotos
- Colocando metodo cascade a autor
```ts
import { Entity, Column, PrimaryGeneratedColumn, OneToMany } from "typeorm"
import { Foto } from "./Foto"

@Entity()
export class Autor {
    /* ... otras columnas */

     @OneToMany(() => Foto, (foto) => foto.autor, {
        cascade: true,
    })
    foto: Foto[]
} 
```
- En index.ts
```ts
import "reflect-metadata";
import { DataSource } from "typeorm";
import { Foto } from "./entity/Foto";
import { FotoMetadata } from "./entity/FotoMetadata"
import { Autor } from "./entity/Autor";
const AppDataSource = new DataSource({
  ...
  entities: [Foto,FotoMetadata,Autor],
  ...
});
// Agregando datos a autor ale
const autor = new Autor();
autor.nombre = "ale";

// foto 1 de autor ale
const foto1 = new Foto();
foto1.nombre = "yo y los peces";
foto1.descripcion = "estoy cerca de los osos polares";
foto1.nombreArchivo = "foto-con-peces.jpg";
foto1.vistas = 2;
foto1.estaPublicado = true;

// Agregando metadata 1 a foto 1
const metadata1 = new FotoMetadata()
metadata1.alto = 720
metadata1.ancho = 1080
metadata1.comprimido = true
metadata1.commentario = "cybershoot2"
metadata1.orientacion = "portrait2"

foto1.metadata = metadata1 // De esta manera las conectamos

// foto 2 de autor ale
const foto2 = new Foto();
foto2.nombre = "yo y las ardillas";
foto2.descripcion = "estoy cerca de los osos polares";
foto2.nombreArchivo = "foto-con-ardillas.jpg";
foto2.vistas = 6;
foto2.estaPublicado = false;

// Agregando metadata 2 a foto 2
const metadata2 = new FotoMetadata()
metadata2.alto = 600
metadata2.ancho = 780
metadata2.comprimido = true
metadata2.commentario = "cybershoot3"
metadata2.orientacion = "portrait3"

foto2.metadata = metadata2 // De esta manera las conectamos

// foto 3 de autor ale
const foto3 = new Foto();
foto3.nombre = "yo y los castorez";
foto3.descripcion = "estoy cerca de los osos polares";
foto3.nombreArchivo = "foto-con-castorez.jpg";
foto3.vistas = 0;
foto3.estaPublicado = true;

// Agregando metadata 3 a foto 3
const metadata3 = new FotoMetadata()
metadata3.alto = 2220
metadata3.ancho = 1780
metadata3.comprimido = false
metadata3.commentario = "cybershoot4"
metadata3.orientacion = "portrait4"

foto3.metadata = metadata3 // De esta manera las conectamos
// Agregando las 3 fotos
const fot=[]
fot.push(foto1)
fot.push(foto2)
fot.push(foto3)

autor.fotos=fot

AppDataSource.initialize()
  .then(async () => {
 
    // LLamando repositorio de autor
    const repositorioAutor = AppDataSource.getRepository(Autor);

    // guardar un autor también se guardaran las fotos y a la vez sus metadatos
    await repositorioAutor.save(autor)

    // hecho
    console.log(
        "El autor se guarda con sus fotos, los metadatos de las fotos también se guardan.",
    )
        
    })
  .catch((error) => console.log(error));

```
- Al ejecutar se guardaron todos los cambios
- Para mostrar utilizar funcionalidad QueryBuilder
```ts
import "reflect-metadata";
import { DataSource } from "typeorm";
import { Foto } from "./entity/Foto";
import { FotoMetadata } from "./entity/FotoMetadata";
import { Autor } from "./entity/Autor";

AppDataSource.initialize()
  .then(async () => {

        // LLamar el repositorio de autor
        const repositorioAutor = AppDataSource.getRepository(Autor);
        
        // Cargando el autor y sus fotos
        const autores = await repositorioAutor
        .createQueryBuilder("autor")
        .innerJoinAndSelect("autor.fotos", "fotos")
        .getMany()

        // hecho
        console.log("El autor con sus fotos : ", autores)
        
  })
  .catch((error) => console.log(error));

```
### 12.1. Creando una relación de muchos a muchos
- Vamos a crear una relación de muchos a muchos. Digamos que una foto puede estar en muchos álbumes y cada álbum puede contener muchas fotos. Vamos a crear una clase Album:
```ts
import {
    Entity,
    Column,
    PrimaryGeneratedColumn,
    ManyToMany,// Realcion n a n
    JoinTable,
} from "typeorm"
import { Foto } from "./Foto"

@Entity()
export class Album {
    @PrimaryGeneratedColumn()
    id: number

    @Column()
    nombre: string

    @ManyToMany(() => Foto, (foto) => foto.albums)// nota: crearemos una propiedad de album en la clase Foto a continuación
    @JoinTable()// es necesario especificar que este es el lado propietario de la relación.
    fotos: Foto[]
}
```
- Ahora agreguemos el lado inverso de nuestra relación con la clase Foto:

```ts
import { Entity, Column, PrimaryGeneratedColumn, OneToOne, ManyToOne, ManyToMany } from "typeorm"
import { FotoMetadata } from "./FotoMetadata"
import { Autor } from "./Autor"// importar
import { Album } from "./Album"
@Entity()
export class Foto {
    /* ... otras columnas */

    @ManyToMany(() => Album, (album) => album.fotos)
    albums: Album[]
}
```
- Después de ejecutar la aplicación, el ORM creará una tabla de unión album_fotos_foto_albums :
```text
+-------------+--------------+----------------------------+
|                album_fotos_foto_albums                  |
+-------------+--------------+----------------------------+
| album_id    | int(11)      | PRIMARY KEY FOREIGN KEY    |
| foto_id     | int(11)      | PRIMARY KEY FOREIGN KEY    |
+-------------+--------------+----------------------------+
```
- Colocando cascade a album
```ts
import {
    Entity,
    Column,
    PrimaryGeneratedColumn,
    ManyToMany,// Realcion n a n
    JoinTable,
} from "typeorm"
import { Foto } from "./Foto"

@Entity()
export class Album {
    /* ... otras columnas */

    @ManyToMany(() => Foto, (foto) => foto.albums, {
        cascade: true,
    })// nota: crearemos una propiedad de album en la clase Foto a continuación
    @JoinTable()// es necesario especificar que este es el lado propietario de la relación.
    fotos: Foto[]
}
```
- Colocando cascade en foto
```ts
import { Entity, Column, PrimaryGeneratedColumn, OneToOne, } from "typeorm"
import { FotoMetadata } from "./FotoMetadata"
import { Autor } from "./Autor"// importar
@Entity()
export class Foto {
    /* ... otras columnas */

    @ManyToMany(() => Album, (album) => album.fotos, {
        cascade: true,
    })
    albums: Album[]
}
```
- En index.js
```ts
import "reflect-metadata";
import { DataSource } from "typeorm";
import { Foto } from "./entity/Foto";
import { FotoMetadata } from "./entity/FotoMetadata"
import { Autor } from "./entity/Autor";
import { Album } from "./entity/Album";
const AppDataSource = new DataSource({
  ...
  entities: [Foto,FotoMetadata,Autor,Album],
  ...
});
// crear algunos álbumes
const album1 = new Album()
album1.nombre = "Osos"

const album2 = new Album()
album2.nombre = "Yo"

// crear algunas fotos
const foto = new Foto()
foto.nombre = "Yo y los osos pandas"
foto.descripcion = "estoy cerca de los osos polares"
foto.nombreArchivo = "foto-con-osos-pandas.jpg"
foto.vistas = 1
foto.estaPublicado = true
foto.albums = [album1, album2]

// Agregando metadata a foto 
const metadata = new FotoMetadata()
metadata.alto = 3720
metadata.ancho = 5080
metadata.comprimido = true
metadata.commentario = "cybershoot5"
metadata.orientacion = "portrait5"

foto.metadata = metadata // De esta manera las conectamos

AppDataSource.initialize()
  .then(async () => {
 
    // LLamando repositorio de foto
    const repositorioFoto = AppDataSource.getRepository(Foto);

    // guardar una foto también se guardaran los albunes
    await repositorioFoto.save(foto)

    // hecho
    console.log(
        "La foto se guarda con sus albunes, el metadato de la fotos también se guardan.",
    )
    // ahora nuestra foto está guardada y los álbumes están adjuntos
    // ahora vamos a cargarlos:
    //&&&& Find &&&&&&
    const fotoCargada = await AppDataSource.getRepository(Foto).findOne({
        where: {
            id: 1,
        },
        relations: {
            albums: true,
        },
    })
    console.log('&&& Con find &&& Foto : ', fotoCargada)
    //&&&& QueryBuilder &&&&&&
    const fotoCargada2 = await AppDataSource.getRepository(Foto)
      .createQueryBuilder("foto") // primer argumento es un alias. Alias es lo que está seleccionando: fotos. Debe especificarlo.
      .where("foto.estaPublicado = true")
      .orderBy("foto.id", "DESC")
      .getMany();
    console.log("&&& Con QueryBuilder &&& Foto : ", fotoCargada2);
    })
  .catch((error) => console.log(error));

```
## 13. Referencias
- https://typeorm.io/
- https://typeorm.io/update-query-builder