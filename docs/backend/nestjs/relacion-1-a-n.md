[<< INDICE](../../index.md)
- [1. Crear las entidades archivose y fotos](#1-crear-las-entidades-archivose-y-fotos)
- [2. Agregar las entidades donde esta la conexion de la base de datos](#2-agregar-las-entidades-donde-esta-la-conexion-de-la-base-de-datos)
- [3. Para manipular las entidad archivose](#3-para-manipular-las-entidad-archivose)
- [4. Para manipular la entidad fotos](#4-para-manipular-la-entidad-fotos)
- [5. Agregar la relacion 1 a N en la entidad archivoses](#5-agregar-la-relacion-1-a-n-en-la-entidad-archivoses)
- [6. Agregar la relacion N a 1 en la entidad foto, para que sea bidirecional](#6-agregar-la-relacion-n-a-1-en-la-entidad-foto-para-que-sea-bidirecional)
- [7. Agregar metodo api rest para fotos](#7-agregar-metodo-api-rest-para-fotos)
- [8. Post agregar Foto](#8-post-agregar-foto)
- [9. Get obtener todas las fotos](#9-get-obtener-todas-las-fotos)
- [10. El servicio final de fotos es](#10-el-servicio-final-de-fotos-es)
- [11. Tabla de api REST de fotos](#11-tabla-de-api-rest-de-fotos)
- [12. Referencia](#12-referencia)
# 1. Crear las entidades archivose y fotos
- Un archivose puede tener muchas fotos
- En consola
```console
nest g resource archivoses(Ya se creo en relacion 1:1)
nest g resource fotos
```
- Ir a archivose.entity.ts, y crear la entidad archivose(Si es que no se creo)
- Ir a foto.entity.ts y crear la entidad foto
```ts
import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class Foto {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  url: string;
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
// importar modulo de fotos
import { FotosModule } from './fotos/fotos.module';
// importar entidad foto
import { Foto } from './fotos/entities/foto.entity';
@Module({
  imports: [
    ArticulosModule,
    UsuariosModule,
    PerfilesModule,
    FotosModule,
    TypeOrmModule.forRoot({ // Agregar la coneccion
      type: 'postgres',
      host: 'localhost', // windows
      // host: '172.17.0.2',// linux
      port: 5432,
      username: 'postgres',
      password: 'postgres',
      java-scriptbase: 'articulos_db',
      entities: [Articulo, Usuario, Perfile, Foto],// Agregar
      synchronize: true,
    }),
  ],
  // controllers: [AppController],
  // providers: [AppService],
})
export class AppModule {}

```
# 3. Para manipular las entidad archivose
- Agregar al modulo archivoses.module.ts la entidad foto
```ts
import { Module } from '@nestjs/common';
import { PerfilesService } from './archivoses.service';
import { PerfilesController } from './archivoses.controller';
// Agregar TypeOrmModule y las entidades faltantes
import { TypeOrmModule } from '@nestjs/typeorm';
import { Perfile } from './entities/archivose.entity';
import { Usuario } from '../usuarios/entities/usuario.entity';

import { Foto } from '../fotos/entities/foto.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Perfile, Usuario, Foto])], // agregar
  controllers: [PerfilesController],
  providers: [PerfilesService],
})
export class PerfilesModule {}
```
# 4. Para manipular la entidad fotos
- Agregar al modulo fotos.module.ts la entidad fotos y archivose
```ts
import { Module } from '@nestjs/common';
import { FotosService } from './fotos.service';
import { FotosController } from './fotos.controller';
// Los 3 nuevos
import { TypeOrmModule } from '@nestjs/typeorm';
import { Foto } from '../fotos/entities/foto.entity';
import { Perfile } from '../archivoses/entities/archivose.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Perfile, Usuario])], // agregar
  controllers: [PerfilesController],
  providers: [PerfilesService],
})
export class PerfilesModule {}

```
# 5. Agregar la relacion 1 a N en la entidad archivoses
- Como un archivose puede tener muchas fotos
- Ir a archivose.entity.ts y agregar los decoradores y importar la otra entidad
```ts
import {
  Entity,
  Column,
  PrimaryGeneratedColumn,
  OneToOne,
  OneToMany,
} from 'typeorm';

import { Usuario } from '../../usuarios/entities/usuario.entity';
//Agregar la entidad foto
import { Foto } from '../../fotos/entities/foto.entity';
@Entity()
export class Usuario {
   @PrimaryGeneratedColumn()
  id: number;

  @Column()
  nombre: string;

  @Column({ name: 'ultimo_nombre' })
  ultimoNombre: string;

  @OneToOne(() => Usuario, (usuario) => usuario.archivose)
  usuario: Usuario;

  // Agregar la entidad Foto y la relacion
  @OneToMany(() => Foto, (foto) => foto.archivose)
  fotos: Foto[];// 1 archivose tiene varias fotos
}

```
# 6. Agregar la relacion N a 1 en la entidad foto, para que sea bidirecional
- Ir a foto.entity.ts y agregar los decoradores y importar la otra entidad
```ts
import {
  Entity,
  Column,
  PrimaryGeneratedColumn,
  ManyToOne,
  JoinColumn,
} from 'typeorm';
// Importar la entidad 
import { Perfile } from '../../archivoses/entities/archivose.entity';
@Entity()
export class Foto {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  url: string;
  // Por ser entidad debil fotos lleva el Join(muchas fotos tienen 1 id_archivose )
  @ManyToOne(() => Perfile, (archivose) => archivose.fotos)
  @JoinColumn({ name: 'archivose_id' })
  archivose: Perfile;
}

```


























# 7. Agregar metodo api rest para fotos
- Ir a fotos.service.ts, y crear los constructores, e importar las librerias y las 2 entidades
```ts
import { Injectable } from '@nestjs/common';
import { CreateFotoDto } from './dto/create-foto.dto';
import { UpdateFotoDto } from './dto/update-foto.dto';
// Agregar
import { Foto } from '../fotos/entities/foto.entity';
import { Perfile } from '../archivoses/entities/archivose.entity';
import { Repository } from 'typeorm';
import { InjectRepository } from '@nestjs/typeorm';
@Injectable()
export class FotosService {
  // crear constructor
  constructor(
    @InjectRepository(Foto)
    private fotoRepositorio: Repository<Foto>,
    @InjectRepository(Perfile)
    private archivoseRepositorio: Repository<Perfile>,
  ) {}
  create...

  findAll...

  findOne...

  update...

  remove...
}

```
# 8. Post agregar Foto
- Ir a create-foto.dto.ts
```ts
export class CreateFotoDto {
  idPerfile: number;
  url: string;
}

```
- Ir a fotos.service.ts y modificar
```ts
  async create(createFotoDto: CreateFotoDto) {
    const id = createFotoDto.idPerfile;
    // Busca el archivose al que se le va agregar la foto
    const archivose = await this.archivoseRepositorio.findOneBy({ id });
    // Si no existe
    if (!archivose) {
      throw new NotFoundException('Perfile no encontrado');
    }
    const newFoto = new Foto();
    newFoto.archivose = archivose;//agrega el archivos buscado
    newFoto.url = createFotoDto.url;
    return this.fotoRepositorio.save(newFoto);
  }
```
# 9. Get obtener todas las fotos
- Ir a fotos.service.ts agregar el metodo find y la relacion archivose y la relacion archivose.fotos
```ts
 findAll() {
    return this.usuarioRepositorio.find({
      relations: ['archivose', 'archivose.fotos'],
    });
  }
```
# 10. El servicio final de fotos es 
```ts
import { Injectable, NotFoundException } from '@nestjs/common';
import { CreateFotoDto } from './dto/create-foto.dto';
import { UpdateFotoDto } from './dto/update-foto.dto';

import { Foto } from '../fotos/entities/foto.entity';
import { Perfile } from '../archivoses/entities/archivose.entity';
import { Repository } from 'typeorm';
import { InjectRepository } from '@nestjs/typeorm';
@Injectable()
export class FotosService {
  // crear constructor
  constructor(
    @InjectRepository(Foto)
    private fotoRepositorio: Repository<Foto>,
    @InjectRepository(Perfile)
    private archivoseRepositorio: Repository<Perfile>,
  ) {}
  async create(createFotoDto: CreateFotoDto) {
    const id = createFotoDto.idPerfile;
    const archivose = await this.archivoseRepositorio.findOneBy({ id });

    if (!archivose) {
      throw new NotFoundException('Perfile no encontrado');
    }

    const newFoto = new Foto();
    newFoto.archivose = archivose;
    newFoto.url = createFotoDto.url;
    return this.fotoRepositorio.save(newFoto);
  }

  findAll() {
    return this.fotoRepositorio.find({
      relations: ['archivose', 'archivose.fotos'],
    });
  }

  findOne...

  update...

  remove...
}


```
# 11. Tabla de api REST de fotos
| Método | Función | Equivalente | Body |
| --------- | --------- | --------- | --------- |
| GET: /fotos/ | findAll() | http://localhost:3000/usuarios/ | no tiene |
| POST: /fotos/ | async create(createFotoDto: CreateFotoDto) | http://localhost:3000/fotos/ | { "url": "http://placeimg.com/1280/720/any", "idPerfile": 5 } |

# 12. Referencia
- [Relación 1 a 1](https://www.youtube.com/watch?v=s5qQf8ifj6I)
- [Relación 1 a N](https://www.youtube.com/watch?v=tEf-ch1OknA)

[<< INDICE](../../index.md)
