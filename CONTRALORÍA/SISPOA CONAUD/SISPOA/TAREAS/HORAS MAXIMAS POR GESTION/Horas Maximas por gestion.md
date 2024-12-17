## Consideraciones
- Crear la tabla para registrar las maximas horas por gestion
- Crear los Cruds para horas_gestiones
- crear en el frontend un btn para registrar las horas maximas, la gestion debe ser la misma, o sea la actual no debe cambiarse
- validar que cuando se cree o se modifique lugares gestiones, se considere lo maximo de horas
## Ramas
- front:  feature/horas_gestiones
- back:  feature/horas_gestiones
## Lugares
- 
## url
- 
## Base
- backup_20241216_095954.sql
## Roles
- Norka
## Query
```sql
SELECT 
		t.hog_codigo,
		t.hog_descripcion,
		t.hog_horas,
		t.ges_codigo,
		g.ges_anio,
		g.ges_estado, 
        t.hog_estado, 
        e.est_color, 
        e.est_nombre AS hge_estado_descripcion,
        TO_CHAR(t.fecha_registro, 'dd/mm/yyyy') AS fecha_registro,
        TO_CHAR(t.fecha_modificacion, 'dd/mm/yyyy') AS fecha_modificacion
FROM 	parametricas.horas_gestiones t
		LEFT JOIN parametricas.gestiones g ON t.ges_codigo = g.ges_codigo 
  		LEFT JOIN parametricas.estados e ON e.est_codigo = t.hog_estado
WHERE 	TRUE
--		AND t.hog_codigo IN (1)
--		AND t.hog_estado IN (1)
--		AND g.ges_codigo IN (1)
ORDER BY t.hog_codigo DESC
;
```
## Query Crear
```sql
/*
Autor: Richard Teran Funez
Fecha: 17/12/2024
Descripcion: Tabla para registro maxima cantidad horas por departamento
*/
-- object: parametricas.horas_gestiones | type: TABLE --
--DROP TABLE IF EXISTS parametricas.horas_gestiones CASCADE;
CREATE TABLE parametricas.horas_gestiones (
    hog_codigo integer NOT NULL,
    hog_descripcion varchar,
    ges_codigo integer NOT NULL,
    hog_horas integer NOT NULL,
    hog_estado integer NOT NULL DEFAULT 1,
    usuario_registro integer NOT NULL,
    usuario_modificacion integer NOT NULL DEFAULT 0,
    usuario_baja integer NOT NULL DEFAULT 0,
    fecha_registro timestamp NOT NULL DEFAULT (now())::timestamp without time zone,
    fecha_modificacion timestamp NOT NULL DEFAULT '1900-01-01 00:00:00'::timestamp without time zone,
    fecha_baja timestamp NOT NULL DEFAULT '1900-01-01 00:00:00'::timestamp without time zone,
    CONSTRAINT horas_gestiones_pkey PRIMARY KEY (hog_codigo)
);
-- ddl-end --
COMMENT ON TABLE parametricas.horas_gestiones IS E'Registra la relación de horas con gestiones';
-- ddl-end --
COMMENT ON COLUMN parametricas.horas_gestiones.hog_codigo IS E'Identificador primario, generado por el <sistema>';
-- ddl-end --
COMMENT ON COLUMN parametricas.horas_gestiones.hog_descripcion IS E'Registra descripcion, Ej: Desc 1';
-- ddl-end --
COMMENT ON COLUMN parametricas.horas_gestiones.ges_codigo IS E'Identificador referencial tabla <parametricas.gestiones>, se registra la gestion';
-- ddl-end --
COMMENT ON COLUMN parametricas.horas_gestiones.hog_horas IS E'Se registra la maxima cantidad de horas que puede tener una gestión';
-- ddl-end --
COMMENT ON COLUMN parametricas.horas_gestiones.hog_estado IS E'Identificador referencial tabla <parametricas.estados>';
-- ddl-end --
COMMENT ON COLUMN parametricas.horas_gestiones.usuario_registro IS E'Identificador referencial, es el per_codigo del sistema de autenticacion para el registro';
-- ddl-end --
COMMENT ON COLUMN parametricas.horas_gestiones.usuario_modificacion IS E'Identificador referencial, es el per_codigo del sistema de autenticacion para la modificacion';
-- ddl-end --
COMMENT ON COLUMN parametricas.horas_gestiones.usuario_baja IS E'Identificador referencial, es el per_codigo del sistema de autenticacion para la baja logica';
-- ddl-end --
COMMENT ON COLUMN parametricas.horas_gestiones.fecha_registro IS E'Fecha registro';
-- ddl-end --
COMMENT ON COLUMN parametricas.horas_gestiones.fecha_modificacion IS E'Fecha modificacion';
-- ddl-end --
COMMENT ON COLUMN parametricas.horas_gestiones.fecha_baja IS E'Fecha baja';
-- ddl-end --
ALTER TABLE parametricas.horas_gestiones OWNER TO usr_poa;
-- ddl-end --

-- object: estado_fk | type: CONSTRAINT --
-- ALTER TABLE parametricas.horas_gestiones DROP CONSTRAINT IF EXISTS estado_fk CASCADE;
ALTER TABLE parametricas.horas_gestiones ADD CONSTRAINT fk_ges_codigo FOREIGN KEY (ges_codigo)
REFERENCES parametricas.gestiones (ges_codigo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: estado_fk | type: CONSTRAINT --
-- ALTER TABLE parametricas.horas_gestiones DROP CONSTRAINT IF EXISTS estado_fk CASCADE;
ALTER TABLE parametricas.horas_gestiones ADD CONSTRAINT estado_fk FOREIGN KEY (hog_estado)
REFERENCES parametricas.estados (est_codigo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: "grant_rawdDxt_4c137bd291" | type: PERMISSION --
GRANT SELECT,INSERT,UPDATE,DELETE,TRUNCATE,REFERENCES,TRIGGER
ON TABLE parametricas.horas_gestiones
TO usr_app_poa;
```

## Componentes
- components/sispoa/organigrama/AdministracionHoras.vue
- 
## Revisar
- 