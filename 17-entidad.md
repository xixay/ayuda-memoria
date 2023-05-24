# ENTIDAD
## DIMENSION
- La entidad dimension
```ts
import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  OneToMany,
} from "typeorm";
import { Estados } from "./Estados";
import { ObjetivosEstrategicos2 } from "./ObjetivosEstrategicos2";

@Index("dimensiones_pkey", ["dim_codigo"], { unique: true })
@Entity("dimensiones", { schema: "pei" })
export class Dimensiones {
  @Column("integer", { primary: true, name: "dim_codigo" })
  dim_codigo: number;

  @Column("character varying", { name: "dim_numero" })
  dim_numero: string;

  @Column("character varying", { name: "dim_descripcion", nullable: true })
  dim_descripcion: string | null;

  @Column("integer", { name: "dim_gestion_inicio", nullable: true })
  dim_gestion_inicio: number | null;

  @Column("integer", { name: "dim_gestion_fin", nullable: true })
  dim_gestion_fin: number | null;

  @Column("integer", { name: "usuario_registro" })
  usuario_registro: number;

  @Column("integer", { name: "usuario_modificacion", default: () => "0" })
  usuario_modificacion: number;

  @Column("integer", { name: "usuario_baja", default: () => "0" })
  usuario_baja: number;

  @Column("timestamp without time zone", {
    name: "fecha_registro",
    default: () => "(now())::timestamp without time zone",
  })
  fecha_registro: Date;

  @Column("timestamp without time zone", {
    name: "fecha_modificacion",
    default: () => "'1900-01-01 00:00:00'",
  })
  fecha_modificacion: Date;

  @Column("timestamp without time zone", {
    name: "fecha_baja",
    default: () => "'1900-01-01 00:00:00'",
  })
  fecha_baja: Date;

  @ManyToOne(() => Estados, (estados) => estados.dimensiones)
  @JoinColumn([{ name: "dim_estado", referencedColumnName: "est_codigo" }])
  dim_estado: Estados;

  @OneToMany(
    () => ObjetivosEstrategicos2,
    (objetivos_estrategicos2) => objetivos_estrategicos2.dim_codigo
  )
  objetivos_estrategicos: ObjetivosEstrategicos2[];
}
```
## OBJETIVOS ESTRATEGICOS2
- La entidad objetivos estrategicos2
```ts
import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  OneToMany,
} from "typeorm";
import { Estrategias } from "./Estrategias";
import { Dimensiones } from "./Dimensiones";
import { Estados } from "./Estados";

@Index("objetivos_estrategicos2_pkey", ["oes_codigo"], { unique: true })
@Entity("objetivos_estrategicos2", { schema: "pei" })
export class ObjetivosEstrategicos2 {
  @Column("integer", { primary: true, name: "oes_codigo" })
  oes_codigo: number;

  @Column("character varying", { name: "oes_numero" })
  oes_numero: string;

  @Column("character varying", { name: "oes_descripcion", nullable: true })
  oes_descripcion: string | null;

  @Column("numeric", { name: "oes_porcentaje", nullable: true })
  oes_porcentaje: string | null;

  @Column("integer", { name: "usuario_registro" })
  usuario_registro: number;

  @Column("integer", { name: "usuario_modificacion", default: () => "0" })
  usuario_modificacion: number;

  @Column("integer", { name: "usuario_baja", default: () => "0" })
  usuario_baja: number;

  @Column("timestamp without time zone", {
    name: "fecha_registro",
    default: () => "(now())::timestamp without time zone",
  })
  fecha_registro: Date;

  @Column("timestamp without time zone", {
    name: "fecha_modificacion",
    default: () => "'1900-01-01 00:00:00'",
  })
  fecha_modificacion: Date;

  @Column("timestamp without time zone", {
    name: "fecha_baja",
    default: () => "'1900-01-01 00:00:00'",
  })
  fecha_baja: Date;

  @OneToMany(() => Estrategias, (estrategias) => estrategias.oes_codigo)
  estrategias: Estrategias[];

  @ManyToOne(
    () => Dimensiones,
    (dimensiones) => dimensiones.objetivos_estrategicos
  )
  @JoinColumn([{ name: "dim_codigo", referencedColumnName: "dim_codigo" }])
  dim_codigo: Dimensiones;

  @ManyToOne(() => Estados, (estados) => estados.objetivos_estrategicos2)
  @JoinColumn([{ name: "oes_estado", referencedColumnName: "est_codigo" }])
  oes_estado: Estados;
}
```
## ESTADOS
- Entidad Estados
```ts
import { Column, Entity, Index, OneToMany } from "typeorm";
import { Dimensiones } from "./Dimensiones";
import { ObjetivosEstrategicos2 } from "./ObjetivosEstrategicos2";

@Index("estados_pkey", ["est_codigo"], { unique: true })
@Entity("estados", { schema: "parametricas" })
export class Estados {
  @Column("integer", { primary: true, name: "est_codigo", default: () => "1" })
  est_codigo: number;

  @Column("character varying", { name: "est_nombre" })
  est_nombre: string;

  @Column("character varying", { name: "est_descripcion", nullable: true })
  est_descripcion: string | null;

  @Column("integer", { name: "usuario_registro" })
  usuario_registro: number;

  @Column("integer", { name: "usuario_modificacion", default: () => "0" })
  usuario_modificacion: number;

  @Column("integer", { name: "usuario_baja", default: () => "0" })
  usuario_baja: number;

  @Column("timestamp without time zone", {
    name: "fecha_registro",
    default: () => "(now())::timestamp without time zone",
  })
  fecha_registro: Date;

  @Column("timestamp without time zone", {
    name: "fecha_modificacion",
    default: () => "'1900-01-01 00:00:00'",
  })
  fecha_modificacion: Date;

  @Column("timestamp without time zone", {
    name: "fecha_baja",
    default: () => "'1900-01-01 00:00:00'",
  })
  fecha_baja: Date;

  @Column("character varying", { name: "est_color", nullable: true })
  est_color: string | null;

  @OneToMany(() => Dimensiones, (dimensiones) => dimensiones.dim_estado)
  dimensiones: Dimensiones[];

  @OneToMany(
    () => ObjetivosEstrategicos2,
    (objetivos_estrategicos2) => objetivos_estrategicos2.oes_estado
  )
  objetivos_estrategicos2: ObjetivosEstrategicos2[];

}
```
