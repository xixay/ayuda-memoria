## Opción nueva tabla backup_20241016_122056.sql
### Crear Tabla
```sql
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
```
### Crear los cruds
```c
npx ts-node src/common/scripts/feature.generator.ts ActividadesMovimientosHoras estructura_poa
```
## Acciones a Realizar
### Crea la actividad bolsa
- Se registra en la tabla actividad_bolsa:
	- se obtiene de que acción estratégica que se selecciono
	- se toma la actividad de donde viene
	- se agrega las horas iniciales
	- se agrega las horas disponibles por comisión
- Se debe validar para que no se pueda registrar la misma  bolsa, osea que tenga los mismos datos que de otra acción estratégica
- el componente en base a su act_codigo, debe traer los datos , solo para el caso de F21(cacCodigo = 2)
- al ir al componente nuevo,verifica si ya tiene un act_codigo_bolsa, de los que eran antes, y si tiene que lo adicione a la tabla actividad_bolsa(pero que esta no este registrada en la tabla actividad_bolsa)
### Modifica la actividad bolsa
- se modifica la acción estratégica
-  se modifica las horas iniciales
- se modifica las horas disponibles por comisión
- al ir al componente nuevo,verifica si ya tiene un act_codigo_bolsa, de los que eran antes, y si tiene que lo adicione a la tabla actividad_bolsa(pero que esta no este registrada en la tabla actividad_bolsa)
### Servicios que se afectarían
#### creación
- que al crear ya no guarde el act_codigo_bolsa, se registraran en la tabla actividades_bolsa , el act_codigo de donde viene
#### Validaciones
- revisar el servicio validateHorasPlanificadasBolsa, considera solo una bolsa, que a su ves usa el servicio: verificarActividadBolsa
#### findAll
- Crear un nuevo findAll que considere para muchas actividades bolsa, tal ves que envié un array de bolsas
- Como en el caso de poas_objetivos, a su findAll de actividades, se podria agregar un array de actiivdades_bolsa, pero que verifique si tiene un act_codigo_bolsa, para agregarlo a la tabla actividades bolsa
#### reportes
- Se debe modificar los servicios que traen los reportes, para que considere muchas bolsas(hay por lo menos 3)
- revisar el servicio getReportActividadesF21, solo considera una bolsa
- revisar el servicio getReporteActividadesPoa, solo considera una bolsa
- revisar el servicio para Excel: findAllAccionCorto, para que considere mas de una bolsa
#### reformulación
- Se debe considerar en la reformulación, para que considere las muchas bolsas,  y ya no solo uno
- Revisar el servicio : createNewActividad, donde usa checkBolsa, solo considera una bolsa para la reformulacion
### Opción array de actividades bolsa
- Se agrega un nuevo campo que tiene act_codigo_bolsa, que representa las actividades bolsa que tiene
```
[2,3,4,5,22,45]
```
- cada ves que se agrega o modifica una actividad bolsa, se actualiza el array
- osea se filtra, o se elimina cada ves.
## Pruebas
### Área de Prueba GDH-GSL
### Roles 

| 4374363 | EDINO CLAUDIO CLAVIJO PONCE | GERENTE CONSOLIDADOR | EDICION |
| ------- | --------------------------- | -------------------- | ------- |
| 5244166 | FLADIMIR HUARACHI HUARACHI  | FORMULADOR           | EDICION |
| 4374363 | EDINO CLAUDIO CLAVIJO PONCE | SUPERVISOR           | EDICION |
| 4088924 | MARY JHOANNA ACUÑA ANIBARRO | APROBADOR            | EDICION |
| 5244166 | FLADIMIR HUARACHI HUARACHI  | FORMULADOR GERENTE   | EDICION |

### Actividad de Prueba 00.1501.105.9.24
- área unidad = Gerencia Departamental de Servicios Legales - GDH-GSL
- act_codigo = 4787
- accion_estrategica = 00.1501.105
- act_numero = 00.1501.105.9.24
- act_horas_planificadas = 500(DB)
- act_horas_real = 500
- lo que dice en el sistema
	- horas hombre planificadas = 500
### Datos Actividad Bolsa
- area unidad = Gerencia Departamental de Servicios Legales - GDH-GSL
- act_codigo = 2606
- accion_estrategica = 540.1501.51
- act_numero = 540.1501.51.1.24
- act_horas_planificadas = 1074(DB)
- lo que dice en el sistema
	- horas iniciales = 1074(es lo mismo horas planificadas)
	- horas disponibles comision = 1074
lo que trae el servicio
```json
{ "codigo": 0, "error_existente": 0, "error_mensaje": "SE OBTUVIERON DATOS DE FORMA CORRECTA.", "error_codigo": 2001, "trace_id": "1527b3cd-5ad1-4bfe-ac1a-689c36a8c76a", 
 "datos": 
 { "act_codigo": 1539, 
 "act_numero": "520.1202.270.1.24", 
 "act_descripcion": "GOBIERNO AUTÓNOMO MUNICIPAL DE ACHACACHI", "horas_iniciales": 400, 
 "suma_horas": 0, 
 "horas_disponibles": 400, 
 "horas_disponibles_comision": 400, 
 "aun_sigla": "GPA2-GAM1" } }
```

### La bolsa escogida
![[bolsa0.png]]
#### Bolsa
![[bolsa.png]]


### Inicio Actividad Poa 00.1501.105.9.24
#### antes de agregar comision  00.1501.105.9.24
![[antes de crear comision.png]]
#### Inicio act poa despues de agregar comision
![[actividad despues de crear comision y añadir horas.png]]
#### Despues de agregar comision actividad
![[despues de crear comision y añadir horas.png]]
### Datos Actividad Bolsa despues de agregar comisoines
- area unidad = Gerencia Departamental de Servicios Legales - GDH-GSL
- act_codigo = 2606
- accion_estrategica = 540.1501.51
- act_numero = 540.1501.51.1.24
- act_horas_planificadas = 1074(DB)
- lo que dice en el sistema
	- horas iniciales = 1074(es lo mismo horas planificadas)
	- horas disponibles comision = 954
### me creo otra actividad backup_20241015_152820.sql
![[bolsa0.png]]

|           | Unidad x       |                 |
| --------- | -------------- | --------------- |
| Actividad | hr planificada | quedan          |
| a         | 50             | 50              |
| b         | 100            | 90(usadas 10)   |
| c         | 200            | 100(usadas 100) |
| d         | 150            |                 |


hacer un componente nuevo
se debe buscar uno y agregarle las horas
para F21 debe estar bloqueado esas horas

| Actividades | numero            | act_codigo |
| ----------- | ----------------- | ---------- |
| Act1        | 00.1501.105.4.24  | 2840       |
| Act2        | 00.1501.105.3.24  | 2839       |
| Act3        | 00.1501.105.2.24  | 2838       |
| Act4        | 00.1501.105.10.24 | 4793       |
| Act5        | 00.0202.19.6.24   | 4792       |
| Act6        | 00.1601.110.17.24 | 4791       |
| Act7        | 00.1301.95.13.24  | 4790       |
| Act8        | 500.1201.46.3.24  | 4789       |


## SERVICIOS
### Calculo de horas
```http
### ------------------- OBTENER - HORAS CALC MOIVIMIENTO
# GET {{Host}}/actividades-movimientos-horas/calculo-horas?act_codigo_bolsa=(2840)&amh_horas=(100)
# GET {{Host}}/actividades-movimientos-horas/calculo-horas?act_codigo_bolsa=(2840)
# GET {{Host}}/actividades-movimientos-horas/calculo-horas?act_codigo_bolsa=(2839)
# GET {{Host}}/actividades-movimientos-horas/calculo-horas?act_codigo_bolsa=(2838)
# GET {{Host}}/actividades-movimientos-horas/calculo-horas?act_codigo_bolsa=(4793)
# GET {{Host}}/actividades-movimientos-horas/calculo-horas?act_codigo_bolsa=(4792)
# GET {{Host}}/actividades-movimientos-horas/calculo-horas?act_codigo_bolsa=(4791)
# GET {{Host}}/actividades-movimientos-horas/calculo-horas?act_codigo_bolsa=(4790)
GET {{Host}}/actividades-movimientos-horas/calculo-horas?act_codigo_bolsa=(4789)
Content-Type: application/json
Authorization: {{AuthTokenInterno}}
```
## Querys
### DBEABER
```sql
SELECT 	*
FROM 	estructura_poa.actividades a 
WHERE 	TRUE 
--		AND a.act_codigo IN (2840)
--		AND a.act_codigo IN (2839)
--		AND a.act_codigo IN (2838)
ORDER BY a.act_codigo DESC  
;
SELECT 	--*
		amh.amh_codigo, amh.act_codigo_adicion, amh.act_codigo_disminucion, amh.amh_horas,amh.amh_estado,
		tmh.tmh_descripcion,
		e.est_color,
        e.est_nombre AS amh_estado_descripcion
FROM 	estructura_poa.actividades_movimientos_horas amh
		LEFT JOIN parametricas.tipo_movimientos_horas tmh ON amh.tmh_codigo = tmh.tmh_codigo
		LEFT JOIN parametricas.estados e ON e.est_codigo = amh.amh_estado
;
SELECT 	*
FROM 	estructura_poa.actividades_movimientos_horas amh 
;
ALTER TABLE estructura_poa.actividades_movimientos_horas ADD amh_detalle json NULL;
-- ddl-end --
COMMENT ON COLUMN estructura_poa.actividades_movimientos_horas.amh_detalle IS E'Registra los datos con los que se calculo el movimiento de horas';
-- ddl-end --
SELECT 	*
FROM 	parametricas.tipo_movimientos_horas tmh ;
--##############################################################################################
--$$$$ M1 $$$$
--Act4	Act2	100	F21
INSERT INTO estructura_poa.actividades_movimientos_horas
(amh_codigo, act_codigo_adicion, act_codigo_disminucion, amh_horas, tmh_codigo, amh_estado, usuario_registro)
VALUES(1, 4793, 2839, 100, 1, 1, 0);
--Act5	Act2	100	F21
INSERT INTO estructura_poa.actividades_movimientos_horas
(amh_codigo, act_codigo_adicion, act_codigo_disminucion, amh_horas, tmh_codigo, amh_estado, usuario_registro)
VALUES(2, 4792, 2839, 100, 1, 1, 0);
--Act6	Act2	100	F21
INSERT INTO estructura_poa.actividades_movimientos_horas
(amh_codigo, act_codigo_adicion, act_codigo_disminucion, amh_horas, tmh_codigo, amh_estado, usuario_registro)
VALUES(3, 4791, 2839, 100, 1, 1, 0);
--$$$$ M2 $$$$
--Act7	Act3	50	F21
INSERT INTO estructura_poa.actividades_movimientos_horas
(amh_codigo, act_codigo_adicion, act_codigo_disminucion, amh_horas, tmh_codigo, amh_estado, usuario_registro)
VALUES(4, 4790, 2838, 50, 1, 1, 0);
--Act7	Act1	50	F21
INSERT INTO estructura_poa.actividades_movimientos_horas
(amh_codigo, act_codigo_adicion, act_codigo_disminucion, amh_horas, tmh_codigo, amh_estado, usuario_registro)
VALUES(5, 4790, 2840, 120, 1, 1, 0);
--$$$$ M3 $$$$
--Act8	Act1	200	F21
INSERT INTO estructura_poa.actividades_movimientos_horas
(amh_codigo, act_codigo_adicion, act_codigo_disminucion, amh_horas, tmh_codigo, amh_estado, usuario_registro)
VALUES(6, 4789, 2840, 200, 1, 1, 0);
--Act8	Act3	30	F21
INSERT INTO estructura_poa.actividades_movimientos_horas
(amh_codigo, act_codigo_adicion, act_codigo_disminucion, amh_horas, tmh_codigo, amh_estado, usuario_registro)
VALUES(7, 4789, 2838, 30, 1, 1, 0);
--Act8	Act5	100	F21
INSERT INTO estructura_poa.actividades_movimientos_horas
(amh_codigo, act_codigo_adicion, act_codigo_disminucion, amh_horas, tmh_codigo, amh_estado, usuario_registro)
VALUES(8, 4789, 4792, 100, 1, 1, 0);
--Act8	Act6	20	F21
INSERT INTO estructura_poa.actividades_movimientos_horas
(amh_codigo, act_codigo_adicion, act_codigo_disminucion, amh_horas, tmh_codigo, amh_estado, usuario_registro)
VALUES(9, 4789, 4791, 20, 1, 1, 0);
--#########################################################################
SELECT 	*
FROM 	estructura_poa.actividades a 
ORDER BY a.act_codigo DESC;

SELECT 	*
FROM 	estructura_poa.actividades a 
		LEFT JOIN estructura_poa.poas_objetivos po ON a.pobj_codigo = po.pobj_codigo 
		LEFT JOIN estructura_poa.poas p ON po.poa_codigo = p.poa_codigo 
WHERE 	TRUE
		AND p.poa_codigo IN (3)
--		AND a.cac_codigo IN (1,3)
		AND a.cac_codigo IN (2)
		AND a.act_estado NOT IN (0,5,9)
--		AND a.act_horas_planificadas IN (100)
ORDER BY a.act_codigo DESC	
;


--######################################################################################################
WITH tmp_actividad AS (
	SELECT
	    	a.act_codigo,
	    	COALESCE(SUM(inicio_auditoria.horas_auditorias), 0) AS horas_auditorias,
	    	COALESCE(SUM(inicio_evaluacion.horas_evaluaciones), 0) AS horas_evaluaciones,
	    	COALESCE(SUM(inicio_auditoria.horas_auditorias), 0) + COALESCE(SUM(inicio_evaluacion.horas_evaluaciones), 0) AS horas_comision
	FROM 	estructura_poa.actividades a
			LEFT JOIN (
			    SELECT 
			        	iap.act_codigo,
			        	SUM(aci.aci_horas) AS horas_auditorias
			    FROM 	ejecucion_actividades.inicio_actividad_poa iap
			    		LEFT JOIN ejecucion_actividades.inicio_actividad_poa_asignaciones iapa ON iap.iap_codigo = iapa.iap_codigo
			    		LEFT JOIN ejecucion_poa.asignaciones_cargos_item aci ON iapa.asi_codigo = aci.asi_codigo AND aci.aci_estado NOT IN (0, 5, 9)
			    WHERE 	iap.iap_estado NOT IN (0, 5, 9)
			    GROUP BY iap.act_codigo
			) inicio_auditoria ON a.act_codigo = inicio_auditoria.act_codigo
			LEFT JOIN (
				SELECT 
			    		iu.act_codigo, 
			            SUM(aci.aci_horas) AS horas_evaluaciones
			    FROM 	ejecucion_informes.informes_uai iu
			        	LEFT JOIN ejecucion_informes.inicio_evaluacion_informe iei ON iu.iua_codigo = iei.iua_codigo AND iei.iei_estado NOT IN (0, 5, 9)
			        	LEFT JOIN ejecucion_informes.inicio_evaluacion_informe_asignaciones ieia ON iei.iei_codigo = ieia.iei_codigo
			        	LEFT JOIN ejecucion_poa.asignaciones_cargos_item aci ON ieia.asi_codigo = aci.asi_codigo AND aci.aci_estado NOT IN (0, 5, 9)
			    WHERE 	iu.iua_estado NOT IN (0, 5, 9)
			    GROUP BY iu.act_codigo
			    ORDER BY iu.act_codigo
			    ) inicio_evaluacion ON a.act_codigo = inicio_evaluacion.act_codigo
	WHERE 	TRUE
			AND a.act_estado IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18)
	--		AND a.act_codigo IN (2840)
	--		AND a.act_codigo IN (2839)
			AND a.act_codigo IN (2838)
	GROUP BY a.act_codigo
)
SELECT
      	t.act_codigo,
      	t.act_numero,
      	t.cac_codigo,
      	t.act_estado,
      	t.act_descripcion,
      	(
      	CASE
			WHEN ((t.cac_codigo = 1 OR t.cac_codigo = 3) AND t.act_estado = 2) THEN 'F26'
			WHEN (t.cac_codigo = 2) THEN 'F21'
			ELSE '' END
		) AS tipo,
      	t.act_horas_planificadas AS horas_iniciales,
      	(COALESCE(ta.horas_comision, 0))::INT AS horas_comision,
      	au.aun_sigla
FROM	estructura_poa.actividades t
      	LEFT JOIN estructura_organizacional.areas_unidades au ON t.aun_codigo_ejecutora = au.aun_codigo
      	LEFT JOIN tmp_actividad ta on ta.act_codigo = t.act_codigo
WHERE	TRUE
		AND t.act_codigo IN (2838)
		AND t.act_estado IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18)
;
--&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
SELECT 
	    amh.amh_codigo,
	    amh.act_codigo_adicion,
	    amh.act_codigo_disminucion,
	    amh.amh_horas,
	    amh.amh_estado,
	    tmh.tmh_descripcion,
	    e.est_color,
	    e.est_nombre AS amh_estado_descripcion,
	    CASE 
	        WHEN amh.act_codigo_adicion = 2840 THEN 1
	        WHEN amh.act_codigo_disminucion = 2840 THEN 2
	        ELSE 0
	    END AS ubicacion_codigo
FROM 	estructura_poa.actividades_movimientos_horas amh
    	LEFT JOIN parametricas.tipo_movimientos_horas tmh ON amh.tmh_codigo = tmh.tmh_codigo
    	LEFT JOIN parametricas.estados e ON e.est_codigo = amh.amh_estado
WHERE 	amh.amh_estado IN (1)
;
--&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
SELECT	*
FROM 	information_schema.referential_constraints rco
;

SELECT 	*
FROM 	estructura_poa.actividades_movimientos_horas amh 
;

--#########################################################################################
WITH 
-- CTE para calcular horas_adicion (excluyendo act_codigo_adicion con tmh_codigo = 1)
tmp_adicion AS (
	SELECT 	amh.act_codigo_adicion AS act_codigo,
			COALESCE(SUM(amh.amh_horas), 0) AS horas_adicion
	FROM 	estructura_poa.actividades_movimientos_horas amh 
	WHERE 	amh.amh_estado NOT IN (0,5,9)
			AND amh.act_codigo_adicion IN (2839)
			AND amh.tmh_codigo != 1 -- Excluir cuando tmh_codigo es 1 en act_codigo_adicion
	GROUP BY amh.act_codigo_adicion
),
-- CTE para calcular horas_disminucion
tmp_disminucion AS (
	SELECT 	amh.act_codigo_disminucion AS act_codigo,
			COALESCE(SUM(amh.amh_horas), 0) AS horas_disminucion
	FROM 	estructura_poa.actividades_movimientos_horas amh 
	WHERE 	amh.amh_estado NOT IN (0,5,9)
			AND amh.act_codigo_disminucion IN (2839)
	GROUP BY amh.act_codigo_disminucion
)
-- Consulta final
SELECT	
	COALESCE(tmp_adicion.act_codigo, tmp_disminucion.act_codigo) AS act_codigo,
	COALESCE(tmp_adicion.horas_adicion, 0)::INT AS horas_adicion,
	COALESCE(tmp_disminucion.horas_disminucion, 0)::INT AS horas_disminucion,
	COALESCE(tmp_adicion.horas_adicion, 0)::INT - COALESCE(tmp_disminucion.horas_disminucion, 0)::INT AS horas_calculo_movimiento
FROM 
	tmp_adicion
	FULL OUTER JOIN tmp_disminucion
ON tmp_adicion.act_codigo = tmp_disminucion.act_codigo;


--&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
        WITH
        -- CTE para calcular horas_adicion
        tmp_adicion AS (
          SELECT        amh.act_codigo_adicion AS act_codigo,
                  COALESCE(SUM(amh.amh_horas), 0) AS horas_adicion
          FROM    estructura_poa.actividades_movimientos_horas amh
          WHERE         amh.amh_estado NOT IN (0,5,9)
                  AND amh.act_codigo_adicion IN (4793)
                  AND amh.tmh_codigo != 1 -- Excluir cuando tmh_codigo es 1 en act_codigo_adicion
          GROUP BY amh.act_codigo_adicion
        ),
        -- CTE para calcular horas_disminucion
        tmp_disminucion AS (
          SELECT        amh.act_codigo_disminucion AS act_codigo,
                  COALESCE(SUM(amh.amh_horas), 0) AS horas_disminucion
          FROM    estructura_poa.actividades_movimientos_horas amh
          WHERE         amh.amh_estado NOT IN (0,5,9)
                  AND amh.act_codigo_disminucion IN (4793)
          GROUP BY amh.act_codigo_disminucion
        )
        -- Consulta final
        SELECT
          COALESCE(tmp_adicion.act_codigo, tmp_disminucion.act_codigo) AS act_codigo,
                COALESCE(tmp_adicion.horas_adicion, 0)::INT AS horas_adicion,
                COALESCE(tmp_disminucion.horas_disminucion, 0)::INT AS horas_disminucion,
                COALESCE(tmp_adicion.horas_adicion, 0)::INT - COALESCE(tmp_disminucion.horas_disminucion, 0)::INT AS horas_calculo_movimiento
        FROM
          tmp_adicion
          FULL OUTER JOIN tmp_disminucion
        ON tmp_adicion.act_codigo = tmp_disminucion.act_codigo
      ;

```

## Área de Prueba GDH-GSL
## Roles 

| 4374363 | EDINO CLAUDIO CLAVIJO PONCE | GERENTE CONSOLIDADOR | EDICION |
| ------- | --------------------------- | -------------------- | ------- |
| 5244166 | FLADIMIR HUARACHI HUARACHI  | FORMULADOR           | EDICION |
| 4374363 | EDINO CLAUDIO CLAVIJO PONCE | SUPERVISOR           | EDICION |
| 4088924 | MARY JHOANNA ACUÑA ANIBARRO | APROBADOR            | EDICION |
| 5244166 | FLADIMIR HUARACHI HUARACHI  | FORMULADOR GERENTE   | EDICION |

## Bases de Prueba

| en edicion:                               | backup_20241015_113322.sql |
| ----------------------------------------- | -------------------------- |
| ya consolidado                            | backup_20241015_114157.sql |
| bolsas sin comisiones                     | backup_20241017_105934.sql |
| bolsas sin comisiones                     | backup_20241017_105934.sql |
| ### base con amh_detalle, hasta Momento 1 | backup_20241021_123326.sql |
| base de mucho uso                         | backup_20241021_174534.sql |
| base de prueba para inactivar             | backup_20241023_171602.sql |
| base con amh_detalle                      | backup_20241021_152831.sql |
| base inactivar                            | backup_20241022_161725.sql |
| base para anular 2                        | backup_20241022_162211.sql |
| Base para retiros                         | backup_20241022_152252.sql |
| ### lista retirar                         | backup_20241022_153244.sql |
