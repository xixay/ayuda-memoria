## Crear Sql
```sql
/*
Autor: Richard Teran Funez
Fecha: 11/11/2024
Descripcion: Tabla para registro actividades informes
*/
-- object: parametricas.lugares_gestiones | type: TABLE --
DROP TABLE IF EXISTS ejecucion_actividades.actividades_informes CASCADE;
CREATE TABLE ejecucion_actividades.actividades_informes (
    ain_codigo integer NOT NULL,
    ain_observacion varchar,
    act_codigo integer NOT NULL,
    inf_codigo integer NOT NULL,
    ain_estado integer NOT NULL DEFAULT 1,
    usuario_registro integer NOT NULL,
    usuario_modificacion integer NOT NULL DEFAULT 0,
    usuario_baja integer NOT NULL DEFAULT 0,
    fecha_registro timestamp NOT NULL DEFAULT (now())::timestamp without time zone,
    fecha_modificacion timestamp NOT NULL DEFAULT '1900-01-01 00:00:00'::timestamp without time zone,
    fecha_baja timestamp NOT NULL DEFAULT '1900-01-01 00:00:00'::timestamp without time zone,
    CONSTRAINT lugares_gestiones_pkey PRIMARY KEY (ain_codigo)
);
-- ddl-end --
COMMENT ON TABLE ejecucion_actividades.actividades_informes IS E'Registra la relación de actividades con informes';
-- ddl-end --
COMMENT ON COLUMN ejecucion_actividades.actividades_informes.ain_codigo IS E'Identificador primario, generado por el <sistema>';
-- ddl-end --
COMMENT ON COLUMN ejecucion_actividades.actividades_informes.ain_observacion IS E'Registra observacion, Ej: Obs1';
-- ddl-end --
COMMENT ON COLUMN ejecucion_actividades.actividades_informes.act_codigo IS E'Identificador referencial tabla <estructura_poa.actividades>, se registra la actividad';
-- ddl-end --
COMMENT ON COLUMN ejecucion_actividades.actividades_informes.inf_codigo IS E'Identificador referencial tabla <ejecucion_actividades.informes>, se registra el informe de la actividad';
-- ddl-end --
COMMENT ON COLUMN ejecucion_actividades.actividades_informes.ain_estado IS E'Identificador referencial tabla <parametricas.estados>';
-- ddl-end --
COMMENT ON COLUMN ejecucion_actividades.actividades_informes.usuario_registro IS E'Identificador referencial, es el per_codigo del sistema de autenticacion para el registro';
-- ddl-end --
COMMENT ON COLUMN ejecucion_actividades.actividades_informes.usuario_modificacion IS E'Identificador referencial, es el per_codigo del sistema de autenticacion para la modificacion';
-- ddl-end --
COMMENT ON COLUMN ejecucion_actividades.actividades_informes.usuario_baja IS E'Identificador referencial, es el per_codigo del sistema de autenticacion para la baja logica';
-- ddl-end --
COMMENT ON COLUMN ejecucion_actividades.actividades_informes.fecha_registro IS E'Fecha registro';
-- ddl-end --
COMMENT ON COLUMN ejecucion_actividades.actividades_informes.fecha_modificacion IS E'Fecha modificacion';
-- ddl-end --
COMMENT ON COLUMN ejecucion_actividades.actividades_informes.fecha_baja IS E'Fecha baja';
-- ddl-end --
ALTER TABLE ejecucion_actividades.actividades_informes OWNER TO usr_poa;
-- ddl-end --

-- object: estado_fk | type: CONSTRAINT --
-- ALTER TABLE ejecucion_actividades.actividades_informes DROP CONSTRAINT IF EXISTS estado_fk CASCADE;
ALTER TABLE ejecucion_actividades.actividades_informes ADD CONSTRAINT fk_act_codigo FOREIGN KEY (act_codigo)
REFERENCES estructura_poa.actividades (act_codigo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: estado_fk | type: CONSTRAINT --
-- ALTER TABLE ejecucion_actividades.actividades_informes DROP CONSTRAINT IF EXISTS estado_fk CASCADE;
ALTER TABLE ejecucion_actividades.actividades_informes ADD CONSTRAINT fk_inf_codigo FOREIGN KEY (inf_codigo)
REFERENCES ejecucion_actividades.informes (inf_codigo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: estado_fk | type: CONSTRAINT --
-- ALTER TABLE ejecucion_actividades.actividades_informes DROP CONSTRAINT IF EXISTS estado_fk CASCADE;
ALTER TABLE ejecucion_actividades.actividades_informes ADD CONSTRAINT estado_fk FOREIGN KEY (ain_estado)
REFERENCES parametricas.estados (est_codigo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: "grant_rawdDxt_4c137bd291" | type: PERMISSION --
GRANT SELECT,INSERT,UPDATE,DELETE,TRUNCATE,REFERENCES,TRIGGER
ON TABLE ejecucion_actividades.actividades_informes
TO usr_app_poa;
```
## roles
### SCAT-GAAPIP


| 9945262 | CLAUDIA PARRA MAMANI             | RESPONSABLE          | EDICION |
| ------- | -------------------------------- | -------------------- | ------- |
| 486424  | LUIS FERNANDO SAAVEDRA MORATO    | GERENTE CONSOLIDADOR | EDICION |
| 486424  | LUIS FERNANDO SAAVEDRA MORATO    | SUPERVISOR           | EDICION |
| 3445997 | CAROLINA LEA RODRIGUEZ BONIVENTO | FORMULADOR           | EDICION |
| 3445997 | CAROLINA LEA RODRIGUEZ BONIVENTO | FORMULADOR GERENTE   | EDICION |
| 3445997 | CAROLINA LEA RODRIGUEZ BONIVENTO | APROBADOR            | EDICION |

- actividad : 520.0504.38.10.24
- ruta: http://172.16.22.243:3002/conaud/inicios-actividades?ges_codigo=2&act_codigo=3167
- componente: src/components/informes/component/informes.table.jsx
- Servicio Sushy: 
```http
http://172.16.22.232:7008/informes-resumen-ejecutivo?inf_codigo=(377)&rei_estado=(1)
```

- Componente donde estan las acciones cambio de estado
```
src/app/(main)/conaud/inicios-actividades/page.jsx

- botones de cambio de estado
{/* TODO: Botones de cambio de estado */}
```
- generar crud SONAUD
```
npx ts-node src/common/scripts/feature.generatorv2.ts Empresas parametricas

npx ts-node src/common/scripts/feature.generatorv2.ts ActividadesInformes ejecucion_actividades
```
### Requerimientos Crear Informes
```
const requirementsItemsInforme = [
'El usuario debe contar con el rol adecuado',//formulador_gerente,comisión
'La actividad debe estar consolidada',
'La actividad no cuenta con un inicio actividad POA',
];
```
### Componente con actividades
- src/components/sispoa-actividades/component/sispoa-actividades.table.jsx
### Query de trabajo
```sql
SELECT 	*
FROM	ejecucion_actividades.informes i
WHERE 	TRUE
		AND i.inf_codigo IN (380)
;

SELECT 	*
FROM 	ejecucion_actividades.inicio_actividad_poa iap 
WHERE 	TRUE
		AND iap.iac_codigo IN (685)
;--act_codigo = 3167

SELECT 	
		t.ain_codigo,
		t.ain_observacion,
		t.act_codigo,
		a.act_numero,
		CONCAT(a.act_numero, ' - ', a.act_descripcion) AS actividad,
		a.act_estado,
		au.aun_sigla,
		CONCAT(au.aun_sigla, ' - ', au.aun_nombre) AS aun_nombre_completo,
		p.poa_codigo,
		p.ges_codigo, 
		t.inf_codigo,
		i.inf_correlativo,
		i.inf_codigo_control,
		i.inf_nombre,
		CONCAT(i.inf_codigo_control, ' - ', i.inf_nombre) AS informe,
		i.inf_estado,
		ia.iac_codigo,
		ia.iac_estado,
		ia.iac_codigo_control_vista, 
		t.ain_estado,
		t.usuario_registro,
		t.usuario_modificacion,
		TO_CHAR(t.fecha_registro, 'HH24:MI am dd/mm/yyyy') AS fecha_registro,
		TO_CHAR(t.fecha_modificacion, 'HH24:MI am dd/mm/yyyy') AS fecha_modificacion
FROM 	ejecucion_actividades.actividades_informes t
		LEFT JOIN estructura_poa.actividades a ON t.act_codigo = a.act_codigo
		LEFT JOIN estructura_organizacional.areas_unidades au ON a.aun_codigo_ejecutora = au.aun_codigo
		LEFT JOIN estructura_poa.poas_objetivos po ON a.pobj_codigo = po.pobj_codigo 
		LEFT JOIN estructura_poa.poas p ON po.poa_codigo = p.poa_codigo 
		LEFT JOIN ejecucion_actividades.informes i ON t.inf_codigo = i.inf_codigo
		LEFT JOIN ejecucion_actividades.inicios_actividades ia ON i.iac_codigo = ia.iac_codigo 
		LEFT JOIN parametricas.estados e ON t.ain_estado = e.est_codigo
WHERE 	TRUE
--		AND t.ain_codigo IN (1)
		AND t.act_codigo IN (3167)
;
SELECT 	*
FROM 	estructura_poa.actividades a
WHERE 	TRUE
		AND a.act_estado IN (2)
;
--######### INICIO ACTIVIDAD INFORME ##############
SELECT 	*
FROM 	ejecucion_actividades.inicio_actividad_informe iai
ORDER BY iai.iai_codigo DESC
;
--######### INICIOS ACTIVIDADES ##############
SELECT 	*
FROM 	ejecucion_actividades.inicios_actividades ia
ORDER BY ia.iac_codigo DESC
;
--########## INICIO ACTIVIDAD POA ################
SELECT 	*
FROM 	ejecucion_actividades.inicio_actividad_poa iap
WHERE 	TRUE
--		AND iap.iac_codigo IN (685)
--ORDER BY iap.iap_codigo DESC
;
--######### INFORMES ##############
SELECT 	i.inf_codigo, i.inf_codigo_control, i.inf_nombre, i.inf_estado,
		ia.iac_codigo, ia.iac_codigo_control_vista, ia.iac_estado
FROM 	ejecucion_actividades.informes i
		LEFT JOIN ejecucion_actividades.inicios_actividades ia ON i.iac_codigo = ia.iac_codigo 
WHERE 	TRUE
		AND i.inf_estado IN (1)
--		AND i.inf_codigo IN (380)
ORDER BY i.inf_codigo DESC
;--iac_codigo = 685
```
### Servicio Conaud
- src/feature/sispoa-actividades/controller/sispoa-actividades.controller.ts