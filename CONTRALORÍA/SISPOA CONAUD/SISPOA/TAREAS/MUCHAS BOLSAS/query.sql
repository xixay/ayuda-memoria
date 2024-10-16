/*
Autor: Richard Teran Funez
Fecha: 16/10/2024
Descripcion: Tabla para registro de movimiento de horas
*/
-- object: estructura_poa.tipo_movimientos_horas | type: TABLE --
DROP TABLE IF EXISTS parametricas.tipo_movimientos_horas CASCADE;
CREATE TABLE parametricas.tipo_movimientos_horas (
    tmh_codigo integer NOT NULL,
    tmh_descripcion varchar,
    tmh_estado integer NOT NULL DEFAULT 1,
    usuario_registro integer NOT NULL,
    usuario_modificacion integer NOT NULL DEFAULT 0,
    usuario_baja integer NOT NULL DEFAULT 0,
    fecha_registro timestamp NOT NULL DEFAULT (now())::timestamp without time zone,
    fecha_modificacion timestamp NOT NULL DEFAULT '1900-01-01 00:00:00'::timestamp without time zone,
    fecha_baja timestamp NOT NULL DEFAULT '1900-01-01 00:00:00'::timestamp without time zone,
    CONSTRAINT actividades_movimientos_horas_pkey PRIMARY KEY (tmh_codigo)
);
-- ddl-end --
COMMENT ON TABLE parametricas.tipo_movimientos_horas IS E'Registra el tipo de movimiento de horas';
-- ddl-end --
COMMENT ON COLUMN parametricas.tipo_movimientos_horas.tmh_codigo IS E'Identificador primario, generado por el <sistema>';
-- ddl-end --
COMMENT ON COLUMN parametricas.tipo_movimientos_horas.tmh_descripcion IS E'Registra descripcion, Ej: F21, F24';
-- ddl-end --
COMMENT ON COLUMN parametricas.tipo_movimientos_horas.tmh_estado IS E'Identificador referencial tabla <parametricas.estados>';
-- ddl-end --
COMMENT ON COLUMN parametricas.tipo_movimientos_horas.usuario_registro IS E'Identificador referencial, es el per_codigo del sistema de autenticacion para el registro';
-- ddl-end --
COMMENT ON COLUMN parametricas.tipo_movimientos_horas.usuario_modificacion IS E'Identificador referencial, es el per_codigo del sistema de autenticacion para la modificacion';
-- ddl-end --
COMMENT ON COLUMN parametricas.tipo_movimientos_horas.usuario_baja IS E'Identificador referencial, es el per_codigo del sistema de autenticacion para la baja logica';
-- ddl-end --
COMMENT ON COLUMN parametricas.tipo_movimientos_horas.fecha_registro IS E'Fecha registro';
-- ddl-end --
COMMENT ON COLUMN parametricas.tipo_movimientos_horas.fecha_modificacion IS E'Fecha modificacion';
-- ddl-end --
COMMENT ON COLUMN parametricas.tipo_movimientos_horas.fecha_baja IS E'Fecha baja';
-- ddl-end --
ALTER TABLE parametricas.tipo_movimientos_horas OWNER TO usr_poa;
-- ddl-end --

-- object: estado_fk | type: CONSTRAINT --
-- ALTER TABLE parametricas.tipo_movimientos_horas DROP CONSTRAINT IF EXISTS estado_fk CASCADE;
ALTER TABLE parametricas.tipo_movimientos_horas ADD CONSTRAINT estado_fk FOREIGN KEY (tmh_estado)
REFERENCES parametricas.estados (est_codigo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: "grant_rawdDxt_4c137bd291" | type: PERMISSION --
GRANT SELECT,INSERT,UPDATE,DELETE,TRUNCATE,REFERENCES,TRIGGER
ON TABLE parametricas.tipo_movimientos_horas
TO usr_app_poa;

-- object: estructura_poa.actividades_movimientos_horas | type: TABLE --
DROP TABLE IF EXISTS estructura_poa.actividades_movimientos_horas CASCADE;
CREATE TABLE estructura_poa.actividades_movimientos_horas (
    amh_codigo integer NOT NULL,
    act_codigo_adicion integer NOT NULL,
    act_codigo_disminucion integer NOT NULL,
    amh_horas integer NOT NULL DEFAULT 0,
    tmh_codigo integer NOT NULL,
    amh_estado integer NOT NULL DEFAULT 1,
    usuario_registro integer NOT NULL,
    usuario_modificacion integer NOT NULL DEFAULT 0,
    usuario_baja integer NOT NULL DEFAULT 0,
    fecha_registro timestamp NOT NULL DEFAULT (now())::timestamp without time zone,
    fecha_modificacion timestamp NOT NULL DEFAULT '1900-01-01 00:00:00'::timestamp without time zone,
    fecha_baja timestamp NOT NULL DEFAULT '1900-01-01 00:00:00'::timestamp without time zone,
    CONSTRAINT actividades_movimientos_horas_pkey PRIMARY KEY (amh_codigo)
);
-- ddl-end --
COMMENT ON TABLE estructura_poa.actividades_movimientos_horas IS E'Registra la cantidad de horas disponibles';
-- ddl-end --
COMMENT ON COLUMN estructura_poa.actividades_movimientos_horas.amh_codigo IS E'Identificador primario, generado por el <sistema>';
-- ddl-end --
COMMENT ON COLUMN estructura_poa.actividades_movimientos_horas.act_codigo_adicion IS E'Identificador referencial tabla <estructura_poa.actividades>, se registra la actividad a la cual se le adicionara horas';
-- ddl-end --
COMMENT ON COLUMN estructura_poa.actividades_movimientos_horas.act_codigo_disminucion IS E'Identificador referencial tabla <estructura_poa.actividades>, se registra la actividad a la cual se le adicionara horas';
-- ddl-end --
COMMENT ON COLUMN estructura_poa.actividades_movimientos_horas.amh_horas IS E'Calculo de horas disponibles, para una actividad';
-- ddl-end --
COMMENT ON COLUMN estructura_poa.actividades_movimientos_horas.tmh_codigo IS E'Identificador referencial tabla <parametricas.tipo_movimientos_horas>, se registra el tipo de movimiento de horas de la actividad';
-- ddl-end --
COMMENT ON COLUMN estructura_poa.actividades_movimientos_horas.amh_estado IS E'Identificador referencial tabla <parametricas.estados>';
-- ddl-end --
COMMENT ON COLUMN estructura_poa.actividades_movimientos_horas.usuario_registro IS E'Identificador referencial, es el per_codigo del sistema de autenticacion para el registro';
-- ddl-end --
COMMENT ON COLUMN estructura_poa.actividades_movimientos_horas.usuario_modificacion IS E'Identificador referencial, es el per_codigo del sistema de autenticacion para la modificacion';
-- ddl-end --
COMMENT ON COLUMN estructura_poa.actividades_movimientos_horas.usuario_baja IS E'Identificador referencial, es el per_codigo del sistema de autenticacion para la baja logica';
-- ddl-end --
COMMENT ON COLUMN estructura_poa.actividades_movimientos_horas.fecha_registro IS E'Fecha registro';
-- ddl-end --
COMMENT ON COLUMN estructura_poa.actividades_movimientos_horas.fecha_modificacion IS E'Fecha modificacion';
-- ddl-end --
COMMENT ON COLUMN estructura_poa.actividades_movimientos_horas.fecha_baja IS E'Fecha baja';
-- ddl-end --
ALTER TABLE estructura_poa.actividades_movimientos_horas OWNER TO postgres;
-- ddl-end --

-- object: fk_act_codigo_adicion | type: CONSTRAINT --
-- ALTER TABLE estructura_poa.actividades_movimientos_horas DROP CONSTRAINT IF EXISTS fk_act_codigo_adicion CASCADE;
ALTER TABLE estructura_poa.actividades_movimientos_horas ADD CONSTRAINT fk_act_codigo_adicion FOREIGN KEY (act_codigo_adicion)
REFERENCES estructura_poa.actividades (act_codigo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_fk_act_codigo_disminucion | type: CONSTRAINT --
-- ALTER TABLE estructura_poa.actividades_movimientos_horas DROP CONSTRAINT IF EXISTS fk_act_codigo_disminucion CASCADE;
ALTER TABLE estructura_poa.actividades_movimientos_horas ADD CONSTRAINT fk_act_codigo_disminucion FOREIGN KEY (act_codigo_disminucion)
REFERENCES estructura_poa.actividades (act_codigo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_tmh_codigo | type: CONSTRAINT --
-- ALTER TABLE estructura_poa.actividades_movimientos_horas DROP CONSTRAINT IF EXISTS fk_tmh_codigo CASCADE;
ALTER TABLE estructura_poa.actividades_movimientos_horas ADD CONSTRAINT fk_tmh_codigo FOREIGN KEY (tmh_codigo)
REFERENCES parametricas.tipo_movimientos_horas (tmh_codigo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: estado_fk | type: CONSTRAINT --
-- ALTER TABLE estructura_poa.actividades_movimientos_horas DROP CONSTRAINT IF EXISTS estado_fk CASCADE;
ALTER TABLE estructura_poa.actividades_movimientos_horas ADD CONSTRAINT estado_fk FOREIGN KEY (amh_estado)
REFERENCES parametricas.estados (est_codigo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: "grant_rawdDxt_4c137bd291" | type: PERMISSION --
GRANT SELECT,INSERT,UPDATE,DELETE,TRUNCATE,REFERENCES,TRIGGER
ON TABLE estructura_poa.actividades_movimientos_horas
TO usr_app_poa;
--
SELECT 	*
FROM 	parametricas.tipo_movimientos_horas;

INSERT INTO parametricas.tipo_movimientos_horas
(tmh_codigo, tmh_descripcion, usuario_registro)
VALUES(1, 'F21', 0);

INSERT INTO parametricas.tipo_movimientos_horas
(tmh_codigo, tmh_descripcion, usuario_registro)
VALUES(2, 'F26', 0);

INSERT INTO parametricas.tipo_movimientos_horas
(tmh_codigo, tmh_descripcion, usuario_registro)
VALUES(3, 'F21-F24', 0);

INSERT INTO parametricas.tipo_movimientos_horas
(tmh_codigo, tmh_descripcion, usuario_registro)
VALUES(4, 'F26-F24', 0);

INSERT INTO parametricas.tipo_movimientos_horas
(tmh_codigo, tmh_descripcion, usuario_registro)
VALUES(5, 'F24', 0);

SELECT 	*
FROM 	estructura_poa.actividades_movimientos_horas;

INSERT INTO estructura_poa.actividades_movimientos_horas
(amh_codigo, act_codigo_adicion, act_codigo_disminucion, amh_horas, tmh_codigo, amh_estado, usuario_registro)
VALUES(1, 4787, 2606, 950, 1, 1, 0);
