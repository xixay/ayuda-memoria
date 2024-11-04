## scripts
```sql
/*
Autor: Richard Teran Funez
Fecha: 04/11/2024
Descripcion: Tabla para registro de lugares gestion
*/
-- object: parametricas.lugares_gestiones | type: TABLE --
DROP TABLE IF EXISTS parametricas.lugares_gestiones CASCADE;
CREATE TABLE parametricas.lugares_gestiones (
    lge_codigo integer NOT NULL,
    lge_observacion varchar,
    ges_codigo integer NOT NULL,
    lug_codigo integer NOT NULL,
    lge_horas_laborales integer NOT NULL DEFAULT 0,
    lge_estado integer NOT NULL DEFAULT 1,
    usuario_registro integer NOT NULL,
    usuario_modificacion integer NOT NULL DEFAULT 0,
    usuario_baja integer NOT NULL DEFAULT 0,
    fecha_registro timestamp NOT NULL DEFAULT (now())::timestamp without time zone,
    fecha_modificacion timestamp NOT NULL DEFAULT '1900-01-01 00:00:00'::timestamp without time zone,
    fecha_baja timestamp NOT NULL DEFAULT '1900-01-01 00:00:00'::timestamp without time zone,
    CONSTRAINT lugares_gestiones_pkey PRIMARY KEY (lge_codigo)
);
-- ddl-end --
COMMENT ON TABLE parametricas.lugares_gestiones IS E'Registra la cantidad de horas por departamento';
-- ddl-end --
COMMENT ON COLUMN parametricas.lugares_gestiones.lge_codigo IS E'Identificador primario, generado por el <sistema>';
-- ddl-end --
COMMENT ON COLUMN parametricas.lugares_gestiones.lge_observacion IS E'Registra observacion, Ej: Obs1';
-- ddl-end --
COMMENT ON COLUMN parametricas.lugares_gestiones.ges_codigo IS E'Identificador referencial tabla <parametricas.gestiones>, se registra la gestión del departamento';
-- ddl-end --
COMMENT ON COLUMN parametricas.lugares_gestiones.lug_codigo IS E'Identificador referencial tabla <parametricas.lugares>, se registra el lugar del departamento';
-- ddl-end --
COMMENT ON COLUMN parametricas.lugares_gestiones.lge_horas_laborales IS E'Calculo de horas por departamento';
-- ddl-end --
COMMENT ON COLUMN parametricas.lugares_gestiones.lge_estado IS E'Identificador referencial tabla <parametricas.estados>';
-- ddl-end --
COMMENT ON COLUMN parametricas.lugares_gestiones.usuario_registro IS E'Identificador referencial, es el per_codigo del sistema de autenticacion para el registro';
-- ddl-end --
COMMENT ON COLUMN parametricas.lugares_gestiones.usuario_modificacion IS E'Identificador referencial, es el per_codigo del sistema de autenticacion para la modificacion';
-- ddl-end --
COMMENT ON COLUMN parametricas.lugares_gestiones.usuario_baja IS E'Identificador referencial, es el per_codigo del sistema de autenticacion para la baja logica';
-- ddl-end --
COMMENT ON COLUMN parametricas.lugares_gestiones.fecha_registro IS E'Fecha registro';
-- ddl-end --
COMMENT ON COLUMN parametricas.lugares_gestiones.fecha_modificacion IS E'Fecha modificacion';
-- ddl-end --
COMMENT ON COLUMN parametricas.lugares_gestiones.fecha_baja IS E'Fecha baja';
-- ddl-end --
ALTER TABLE parametricas.lugares_gestiones OWNER TO usr_poa;
-- ddl-end --

-- object: estado_fk | type: CONSTRAINT --
-- ALTER TABLE parametricas.lugares_gestiones DROP CONSTRAINT IF EXISTS estado_fk CASCADE;
ALTER TABLE parametricas.lugares_gestiones ADD CONSTRAINT fk_ges_codigo FOREIGN KEY (ges_codigo)
REFERENCES parametricas.gestiones (ges_codigo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: estado_fk | type: CONSTRAINT --
-- ALTER TABLE parametricas.lugares_gestiones DROP CONSTRAINT IF EXISTS estado_fk CASCADE;
ALTER TABLE parametricas.lugares_gestiones ADD CONSTRAINT fk_lug_codigo FOREIGN KEY (lug_codigo)
REFERENCES parametricas.lugares (lug_codigo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: estado_fk | type: CONSTRAINT --
-- ALTER TABLE parametricas.lugares_gestiones DROP CONSTRAINT IF EXISTS estado_fk CASCADE;
ALTER TABLE parametricas.lugares_gestiones ADD CONSTRAINT estado_fk FOREIGN KEY (lge_estado)
REFERENCES parametricas.estados (est_codigo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: "grant_rawdDxt_4c137bd291" | type: PERMISSION --
GRANT SELECT,INSERT,UPDATE,DELETE,TRUNCATE,REFERENCES,TRIGGER
ON TABLE parametricas.lugares_gestiones
TO usr_app_poa;
```
## hacer