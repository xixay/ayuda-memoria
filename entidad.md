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
