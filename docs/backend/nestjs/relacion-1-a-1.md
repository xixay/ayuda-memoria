[<< INDICE](../../index.md)
- [1. Crear las entidades usuario y archivos](#1-crear-las-entidades-usuario-y-archivos)
- [2. Agregar las entidades donde esta la conexion de la base de datos](#2-agregar-las-entidades-donde-esta-la-conexion-de-la-base-de-datos)
- [3. Para manipular las entidad usuarios](#3-para-manipular-las-entidad-usuarios)
- [4. Para manipular la entidad archivoses](#4-para-manipular-la-entidad-archivoses)
- [5. Agregar la relacion 1 a 1 en la entidad usuarios](#5-agregar-la-relacion-1-a-1-en-la-entidad-usuarios)
- [6. Agregar la relacion 1 a 1 en la entidad archivoses, para que sea bidirecional](#6-agregar-la-relacion-1-a-1-en-la-entidad-archivoses-para-que-sea-bidirecional)
- [7. Agregar metodo api rest para usuarios](#7-agregar-metodo-api-rest-para-usuarios)
- [8. Post agregar Usuario](#8-post-agregar-usuario)
- [9. Get obtener todos los usuarios](#9-get-obtener-todos-los-usuarios)
- [10. El servicio final de usuario es](#10-el-servicio-final-de-usuario-es)
- [11. Tabla de api REST de usuarios](#11-tabla-de-api-rest-de-usuarios)
- [12. Agregar metodo api rest para archivoses](#12-agregar-metodo-api-rest-para-archivoses)
- [13. Post agregar Perfile](#13-post-agregar-archivose)
- [14. Get obtener todos los archivoses](#14-get-obtener-todos-los-archivoses)
- [15. El servicio final de archivose es](#15-el-servicio-final-de-archivose-es)
- [16. Tabla de api REST de archivoses](#16-tabla-de-api-rest-de-archivoses)
- [17. Referencia](#17-referencia)
# 1. Crear las entidades usuario y archivos
- Un usuario puede tener un archivos
```console
nest g resource usuarios
nest g resource archivoses
```
- Ir a usuario.entity.ts, y crear la entidad usuario
```ts
import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';
@Entity()
export class Usuario {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  email: string;

  @Column()
  password: string;
}

```
- Ir a archivose.entity.ts y crear la entidad archivos
```ts
import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';
@Entity()
export class Perfile {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  nombre: string;

  @Column({ name: 'ultimo_nombre' })
  ultimoNombre: string;
}

```
# 2. Agregar las entidades donde esta la conexion de la base de datos
- Ir a app.module.ts agregar las nuevas entidades en el array entities
```ts
import { Module } from '@nestjs/common';
// import { AppController } from './app.controller';
// import { AppService } from './app.service';
import { ArticulosModule } from './articulos/articulos.module';
// Importar TypeOrmModule y la entidad Articulo
import { TypeOrmModule } from '@nestjs/typeorm';
import { Articulo } from './articulos/entities/articulo.entity';
import { UsuariosModule } from './usuarios/usuarios.module';
import { PerfilesModule } from './archivoses/archivoses.module';
// importar las entidades usuario y archivose
import { Usuario } from './usuarios/entities/usuario.entity';
import { Perfile } from './archivoses/entities/archivose.entity';
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
      java-scriptbase: 'articulos_db',
      entities: [Articulo, Usuario, Perfile],//agregar
      synchronize: true,
    }),
    UsuariosModule,
    PerfilesModule,
  ],
  // controllers: [AppController],
  // providers: [AppService],
})
export class AppModule {}

```
# 3. Para manipular las entidad usuarios
- Agregar al modulo usuarios.module.ts la entidad usuarios, ademas de la entidad archivose
```ts
import { Module } from '@nestjs/common';
import { UsuariosService } from './usuarios.service';
import { UsuariosController } from './usuarios.controller';
// Los 3 nuevos
import { TypeOrmModule } from '@nestjs/typeorm';
import { Usuario } from './entities/usuario.entity';
import { Perfile } from '../archivoses/entities/archivose.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Usuario, Perfile])], // agregar
  controllers: [UsuariosController],
  providers: [UsuariosService],
})
export class UsuariosModule {}

```
# 4. Para manipular la entidad archivoses
- Agregar al modulo archivoses.module.ts las entidades
```ts
import { Module } from '@nestjs/common';
import { PerfilesService } from './archivoses.service';
import { PerfilesController } from './archivoses.controller';
// Los 3 nuevos
import { TypeOrmModule } from '@nestjs/typeorm';
import { Perfile } from './entities/archivose.entity';
import { Usuario } from '../usuarios/entities/usuario.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Perfile, Usuario])], // agregar
  controllers: [PerfilesController],
  providers: [PerfilesService],
})
export class PerfilesModule {}

```
# 5. Agregar la relacion 1 a 1 en la entidad usuarios
- Ir a usuario.entity.ts y agregar los decoradores y importar la otra entidad
```ts
import {
  Entity,
  Column,
  PrimaryGeneratedColumn,
  OneToOne,
  JoinColumn,
} from 'typeorm';
import { Perfile } from '../../archivoses/entities/archivose.entity';
@Entity()
export class Usuario {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  email: string;

  @Column()
  password: string;
  // Agregar la entidad Perfile y la relacion
  @OneToOne(() => Perfile)
  // Este decorador solo va estar en la propiedad que va cargar la relacion(el foraneo key), y con que nombre va estar en la base de datos
  @JoinColumn({ name: 'archivose_id' })
  archivose: Perfile;
}

```
# 6. Agregar la relacion 1 a 1 en la entidad archivoses, para que sea bidirecional
- Ir a archivose.entity.ts y agregar los decoradores y importar la otra entidad
```ts
import {
  Entity,
  Column,
  PrimaryGeneratedColumn,
  OneToOne,
  JoinColumn,
} from 'typeorm';
import { Usuario } from '../../usuarios/entities/usuario.entity';
@Entity()
export class Perfile {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  nombre: string;

  @Column({ name: 'ultimo_nombre' })
  ultimoNombre: string;

  // Agregar la entidad Perfile y la relacion
  @OneToOne(() => Usuario, (usuario) => usuario.archivose)
  usuario: Usuario;
}

```
# 7. Agregar metodo api rest para usuarios
- Ir a usuarios.service.ts, y crear los constructores, e importar las librerias y las 2 entidades
```ts
import { Injectable } from '@nestjs/common';
import { CreateUsuarioDto } from './dto/create-usuario.dto';
import { UpdateUsuarioDto } from './dto/update-usuario.dto';
// Agregar
import { Usuario } from './entities/usuario.entity';
import { Perfile } from '../archivoses/entities/archivose.entity';
import { Repository } from 'typeorm';
import { InjectRepository } from '@nestjs/typeorm';
@Injectable()
export class UsuariosService {
  // crear constructor
  constructor(
    @InjectRepository(Usuario)
    private usuarioRepositorio: Repository<Usuario>,
    @InjectRepository(Perfile)
    private archivoseRepositorio: Repository<Perfile>,
  ) {}
  create...

  findAll...

  findOne...

  update....

  remove...
}

```
# 8. Post agregar Usuario
- Ir a create-usuario.dto.ts
```ts
export class CreateUsuarioDto {
  nombre: string;
  ultimoNombre: string;
  email: string;
  password: string;
}

```
- Ir a usuarios.service.ts y modificar
```ts
  async create(createUsuarioDto: CreateUsuarioDto) {
    // Crear Perfile y guardarlo
    const archivose = new Perfile();
    archivose.nombre = createUsuarioDto.nombre;
    archivose.ultimoNombre = createUsuarioDto.ultimoNombre;
    const newPerfile = await this.archivoseRepositorio.save(archivose);
    // Crear Usuario y guardarlo
    const usuario = new Usuario();
    usuario.email = createUsuarioDto.email;
    usuario.password = createUsuarioDto.password;
    usuario.archivose = newPerfile;// Se agrega el atributo archivose
    return this.usuarioRepositorio.save(usuario);
  }
```
# 9. Get obtener todos los usuarios
- Ir a usuarios.service.ts agregar el metodo find y la relacion archivose 
```ts
 findAll() {
    return this.usuarioRepositorio.find({
      relations: ['archivose'],
    });
  }
```
# 10. El servicio final de usuario es 
```ts
import { Injectable } from '@nestjs/common';
import { CreateUsuarioDto } from './dto/create-usuario.dto';
import { UpdateUsuarioDto } from './dto/update-usuario.dto';
import { Usuario } from './entities/usuario.entity';
import { Perfile } from '../archivoses/entities/archivose.entity';
import { Repository } from 'typeorm';
import { InjectRepository } from '@nestjs/typeorm';
@Injectable()
export class UsuariosService {
  // crear constructor
  constructor(
    @InjectRepository(Usuario)
    private usuarioRepositorio: Repository<Usuario>,
    @InjectRepository(Perfile)
    private archivoseRepositorio: Repository<Perfile>,
  ) {}
  async create(createUsuarioDto: CreateUsuarioDto) {
    const archivose = new Perfile();
    archivose.nombre = createUsuarioDto.nombre;
    archivose.ultimoNombre = createUsuarioDto.ultimoNombre;
    const newPerfile = await this.archivoseRepositorio.save(archivose);
    const usuario = new Usuario();
    usuario.email = createUsuarioDto.email;
    usuario.password = createUsuarioDto.password;
    usuario.archivose = newPerfile;
    return this.usuarioRepositorio.save(usuario);
  }

  findAll() {
    return this.usuarioRepositorio.find({
      relations: ['archivose'],
    });
  }

  findOne...

  update...

  remove...
}

```
# 11. Tabla de api REST de usuarios
| Método | Función | Equivalente | Body |
| --------- | --------- | --------- | --------- |
| GET: /usuarios/ | findAll() | http://localhost:3000/usuarios/ | no tiene |
| POST: /usuarios/ | async create(createUsuarioDto: CreateUsuarioDto) | http://localhost:3000/usuarios/ | { "nombre": "Carlos", "ultimoNombre": "gabriel", "email": "ca@gmail.com", "password": "bbbb" } |
# 12. Agregar metodo api rest para archivoses
- Ir a archivoses.service.ts, y crear los constructores, e importar las librerias y las 2 entidades
```ts
import { Injectable } from '@nestjs/common';
import { CreatePerfileDto } from './dto/create-archivose.dto';
import { UpdatePerfileDto } from './dto/update-archivose.dto';
// Agregar
import { Perfile } from '../archivoses/entities/archivose.entity';
import { Usuario } from '../usuarios/entities/usuario.entity';
import { Repository } from 'typeorm';
import { InjectRepository } from '@nestjs/typeorm';
@Injectable()
export class UsuariosService {
  // crear constructor
  constructor(
    @InjectRepository(Perfile)
    private archivoseRepositorio: Repository<Perfile>,
    @InjectRepository(Usuario)
    private usuarioRepositorio: Repository<Usuario>,
  ) {}
  create...

  findAll...

  findOne...

  update....

  remove...
}

```
# 13. Post agregar Perfile
- Ir a create-archivose.dto.ts
```ts
export class CreatePerfileDto {
  nombre: string;
  ultimoNombre: string;
  email: string;
  password: string;
}

```
- Ir a archivoses.service.ts y modificar
```ts
  async create(createPerfileDto: CreatePerfileDto) {
    // Crear Usuario y guardarlo
    const usuario = new Usuario();
    usuario.email = createPerfileDto.email;
    usuario.password = createPerfileDto.password;
    const newUsuario = await this.usuarioRepositorio.save(usuario);
    // Crear Perfile y guardarlo
    const archivose = new Perfile();
    archivose.nombre = createPerfileDto.nombre;
    archivose.ultimoNombre = createPErfileDto.ultimoNombre;
    archivose.usuario = newUsuario;// Se agrega el atributo usuario
    return this.archivoseRepositorio.save(archivose)
  }
```
# 14. Get obtener todos los archivoses
- Ir a archivoses.service.ts agregar el metodo find y la relacion usuario 
```ts
 findAll() {
    return this.archivoseRepositorio.find({
      relations: ['usuario'],
    });
  }
```
# 15. El servicio final de archivose es 
```ts
import { Injectable } from '@nestjs/common';
import { CreatePerfileDto } from './dto/create-archivose.dto';
import { UpdatePerfileDto } from './dto/update-archivose.dto';

import { Perfile } from '../archivoses/entities/archivose.entity';
import { Usuario } from '../usuarios/entities/usuario.entity';
import { Repository } from 'typeorm';
import { InjectRepository } from '@nestjs/typeorm';
@Injectable()
export class PerfilesService {
  constructor(
    @InjectRepository(Perfile)
    private archivoseRepositorio: Repository<Perfile>,
    @InjectRepository(Usuario)
    private usuarioRepositorio: Repository<Usuario>,
  ) {}
  async create(createPerfileDto: CreatePerfileDto) {
    // Crear Usuario y guardarlo
    const usuario = new Usuario();
    usuario.email = createPerfileDto.email;
    usuario.password = createPerfileDto.password;
    const newUsuario = await this.usuarioRepositorio.save(usuario);
    // Crear Perfile y guardarlo
    const archivose = new Perfile();
    archivose.nombre = createPerfileDto.nombre;
    archivose.ultimoNombre = createPerfileDto.ultimoNombre;
    archivose.usuario = newUsuario; // Se agrega el atributo usuario
    return this.archivoseRepositorio.save(archivose);
  }

  findAll() {
    return this.archivoseRepositorio.find({
      relations: ['usuario'],
    });
  }

  findOne...

  update...

  remove...
}


```
# 16. Tabla de api REST de archivoses
| Método | Función | Equivalente | Body |
| --------- | --------- | --------- | --------- |
| GET: /archivoses/ | findAll() | http://localhost:3000/archivoses/ | no tiene |
| POST: /archivoses/ | async create(createPerfileDto: CreatePerfileDto) | http://localhost:3000/archivoses/ | { "nombre": "Dan", "ultimoNombre": "oru", "email": "dan@gmail.com", "password": "dddd" } |
# 17. Referencia
- [Relación 1 a 1](https://www.youtube.com/watch?v=s5qQf8ifj6I)

[<< INDICE](../../index.md)