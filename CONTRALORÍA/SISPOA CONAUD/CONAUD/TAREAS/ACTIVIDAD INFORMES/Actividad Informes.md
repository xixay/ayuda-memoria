### Crear Sql
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
### roles
-  SCAT-GAAPIP

| 9945262 | CLAUDIA PARRA MAMANI             | RESPONSABLE          | EDICION |
| ------- | -------------------------------- | -------------------- | ------- |
| 486424  | LUIS FERNANDO SAAVEDRA MORATO    | GERENTE CONSOLIDADOR | EDICION |
| 486424  | LUIS FERNANDO SAAVEDRA MORATO    | SUPERVISOR           | EDICION |
| 3445997 | CAROLINA LEA RODRIGUEZ BONIVENTO | FORMULADOR           | EDICION |
| 3445997 | CAROLINA LEA RODRIGUEZ BONIVENTO | FORMULADOR GERENTE   | EDICION |
| 3445997 | CAROLINA LEA RODRIGUEZ BONIVENTO | APROBADOR            | EDICION |

- actividad : 520.0504.38.10.24
- http://172.16.22.243:3002/conaud/inicios-actividades?ges_codigo=2&act_codigo=3167
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
FROM 	ejecucion_actividades.actividades_informes ai
;
--
WITH informes_estados_unicos AS (
  SELECT 
	    ie.inf_codigo,
	    ie.ies_codigo,
	    ie.ies_estado,
	    ie.eev_codigo,
	    ee.eev_estado,
	    ee.eev_sigla,
    	ROW_NUMBER() OVER (PARTITION BY ie.inf_codigo ORDER BY ie.ies_codigo DESC) AS row_num
  FROM 	ejecucion_actividades.informes_estados ie
  		LEFT JOIN parametricas.estados_evolucion ee ON ie.eev_codigo = ee.eev_codigo
)
SELECT
    	t.act_codigo,
    	MAX(a.aun_codigo_ejecutora) AS aun_codigo_ejecutora,
	    CONCAT(MAX(a.act_numero)) AS act_numero,
	    CONCAT(MAX(a.act_descripcion)) AS act_sujeto,
	    MAX(a.act_estado) AS act_estado,
	    CONCAT(MAX(au.aun_sigla)) AS aun_sigla,
	    -- Agregar solo los inf_codigo como un array de enteros
	    array_agg(i.inf_codigo) AS informes,
	    -- Agregar todos los informes como un array JSON
	    json_agg(
	      json_build_object(
	        'informe', CONCAT(i.inf_codigo, '(', i.inf_codigo_control, ') - (', ia.iac_codigo_control, ') - (', ieu.eev_sigla, ')', ieu.eev_estado)
	      )
	    ) AS informes_datos,
	    MAX(t.ain_estado) AS ain_estado,
	    MAX(e.est_nombre) AS ain_estado_descripcion,
	    MAX(t.usuario_registro) AS usuario_registro,
	    MAX(t.usuario_modificacion) AS usuario_modificacion,
	    MAX(e.est_nombre) AS ain_estado_descripcion
FROM    ejecucion_actividades.actividades_informes t
		LEFT JOIN estructura_poa.actividades a ON t.act_codigo = a.act_codigo
		LEFT JOIN estructura_organizacional.areas_unidades au ON a.aun_codigo_ejecutora = au.aun_codigo
		LEFT JOIN ejecucion_actividades.informes i ON t.inf_codigo = i.inf_codigo
-- Unir solo el último registro de la tabla informes_estados
		LEFT JOIN informes_estados_unicos ieu ON i.inf_codigo = ieu.inf_codigo AND ieu.row_num = 1
		LEFT JOIN ejecucion_actividades.inicios_actividades ia ON i.iac_codigo = ia.iac_codigo
		LEFT JOIN parametricas.estados e ON t.ain_estado = e.est_codigo
WHERE 	TRUE
  		AND t.ain_estado NOT IN (0,9)
  		AND ia.ges_codigo IN (2)
  		AND t.act_codigo IN (2578)
GROUP BY t.act_codigo
ORDER BY t.act_codigo ASC;

--
WITH informes_estados_unicos AS (
  SELECT 
    ie.inf_codigo,
    ie.ies_codigo,
    ie.ies_estado,
    ie.eev_codigo,
    ee.eev_estado,
    ee.eev_sigla,
    ROW_NUMBER() OVER (PARTITION BY ie.inf_codigo ORDER BY ie.ies_codigo DESC) AS row_num
  FROM ejecucion_actividades.informes_estados ie
  LEFT JOIN parametricas.estados_evolucion ee ON ie.eev_codigo = ee.eev_codigo
)
SELECT
    inf.inf_codigo,
    inf.inf_estado,
    CONCAT('(', inf.inf_codigo_control, ')', ' - (', ia.iac_codigo_control, ') - (', COALESCE(ieu.eev_sigla, '-'), ')') AS informe,
    inf.iac_codigo,
    ia.iac_estado,
    ia.iac_codigo_control_vista
FROM ejecucion_actividades.informes inf
LEFT JOIN ejecucion_actividades.inicios_actividades ia ON inf.iac_codigo = ia.iac_codigo
-- Unir solo el último registro de la tabla informes_estados
LEFT JOIN informes_estados_unicos ieu ON inf.inf_codigo = ieu.inf_codigo AND ieu.row_num = 1
LEFT JOIN parametricas.estados e ON inf.inf_estado = e.est_codigo
WHERE TRUE
  AND inf.inf_estado NOT IN (0, 9)
  AND ia.ges_codigo IN (2);
--%%%%%%%%%%%%%%%%%%%%%%%
 SELECT	t.inf_codigo, t.inf_estado,
 		ie.ies_codigo,ie.ies_estado,
 		ee.eev_codigo,ee.eev_estado 
 FROM 	ejecucion_actividades.informes t
 		LEFT JOIN ejecucion_actividades.informes_estados ie ON t.inf_codigo  = ie.inf_codigo 
 		LEFT JOIN parametricas.estados_evolucion ee ON ie.eev_codigo = ee.eev_codigo 
 WHERE 	t.inf_codigo IN (386)
 ;
ejecucion_actividades.informes_estados ie
  		LEFT JOIN parametricas.estados_evolucion ee ON ie.eev_codigo = ee.eev_codigo
```
### Crear

|ain_codigo|ain_observacion|act_codigo|inf_codigo|ain_estado|usuario_registro|usuario_modificacion|usuario_baja|fecha_registro|fecha_modificacion|fecha_baja|
|----------|---------------|----------|----------|----------|----------------|--------------------|------------|--------------|------------------|----------|
|2||3167|376|1|1349|1349|1349|2024-11-12 14:39:15.831|2024-11-12 15:38:40.854|2024-11-12 15:38:33.535|
|3||3167|380|1|1349|1349|1349|2024-11-12 15:01:59.811|2024-11-13 09:12:09.697|2024-11-12 16:30:32.953|
|1||3167|372|1|1914|1349|0|2024-11-11 12:33:42.242|2024-11-13 09:12:33.526|1900-01-01 00:00:00.000|
|4||2567|50|1|1349|0|0|2024-11-12 17:01:22.791|1900-01-01 00:00:00.000|1900-01-01 00:00:00.000|


### Servicio Conaud
- src/feature/sispoa-actividades/controller/sispoa-actividades.controller.ts
### Componente Con seleccion Areas Ejecutoras y actividades
- src/components/apoyo-inicio-actividad-poa/component/apoyo-inicio-actividad-poa-comision.form.jsx
### No tiene informes
- http://172.16.22.243:3002/conaud/inicios-actividades?ges_codigo=2&act_codigo=2782
### No esta iniciado y sin informes
- http://172.16.22.243:3002/conaud/inicios-actividades?ges_codigo=2&act_codigo=3176
### View Personalizado
- src/components/actividades-informes/component/actividades-informes.view.jsx
### Inicios Actividades sin Inicio Actividad POA

| 138 | iac_codigo |       |
| --- | ---------- | ----- |
| 140 | iac_codigo |       |
| 155 | iac_codigo |       |
| 160 | iac_codigo |       |
| 166 | iac_codigo |       |
| 203 | iac_codigo |       |
| 207 | iac_codigo |       |
| 309 | iac_codigo | igual |
| 314 | iac_codigo |       |
| 309 | iac_codigo | igual |
| 358 | iac_codigo |       |
### Servicios Nuevos
```
src/feature/actividades-informes/service/update-actividades-informes.service.ts
src/components/common/ControllerMultiSelectAjusted.jsx
```
### Data Table
```
src/feature/actividades-informes/service/findAll-actividades-informes.service.ts
findAllActividadConInformes
```
### Multi Select de Informes
```
src/feature/actividades-informes/service/findAll-actividades-informes.service.ts
findAllInformesPorActividad
```
- Código Informe: iac_codigo_control_vista + inf_codigo_control = K4/GP485/O24 G5
## Query Sushy
```sql
SELECT  a.asi_codigo, a.asi_estado,
		t.aci_codigo, t.aci_estado,t.aci_horas,t.per_codigo,
		ci.cit_codigo, ci.cit_estado, ci.aun_codigo,
		ahu.ahu_codigo,ahu.ahu_estado,ahu.ahu_horas, ahu.ahu_fecha,
		a2.act_codigo, a2.act_numero, au.aun_sigla
FROM 	ejecucion_poa.asignaciones a
		LEFT JOIN ejecucion_actividades.inicio_actividad_poa_asignaciones iapa ON a.asi_codigo = iapa.asi_codigo
		LEFT JOIN ejecucion_actividades.inicio_actividad_poa iap ON iapa.iap_codigo = iap.iap_codigo
		LEFT JOIN estructura_poa.actividades a2 ON iap.act_codigo = a2.act_codigo
		LEFT JOIN estructura_organizacional.areas_unidades au ON a2.aun_codigo_ejecutora = au.aun_codigo
		LEFT JOIN ejecucion_poa.asignaciones_cargos_item t ON a.asi_codigo = t.asi_codigo AND t.aci_estado NOT IN (0,5,9)
		LEFT JOIN estructura_organizacional.cargos_items ci ON t.cit_codigo = ci.cit_codigo AND ci.cit_estado NOT IN (0,5,9)
		LEFT JOIN ejecucion_poa.asignaciones_horas_usadas ahu ON t.aci_codigo = ahu.aci_codigo AND ahu.ahu_estado NOT IN (0,5,9)
WHERE 	ci.aun_codigo IN (56)
		AND ci.cit_codigo IN (2)
		AND a.asi_codigo IN (1476)
		AND a.asi_estado NOT IN (0,5,9)
		AND a2.act_codigo IS NOT NULL
UNION ALL
SELECT  a.asi_codigo, a.asi_estado,
		t.aci_codigo, t.aci_estado,t.aci_horas,t.per_codigo,
		ci.cit_codigo, ci.cit_estado, ci.aun_codigo,
		ahu.ahu_codigo,ahu.ahu_estado,ahu.ahu_horas, ahu.ahu_fecha,
		a2.act_codigo, a2.act_numero, au.aun_sigla
FROM 	ejecucion_poa.asignaciones a
		LEFT JOIN ejecucion_informes.inicio_evaluacion_informe_asignaciones ieia ON a.asi_codigo = ieia.asi_codigo
		LEFT JOIN ejecucion_informes.inicio_evaluacion_informe iei ON ieia.iei_codigo = iei.iei_codigo
		LEFT JOIN ejecucion_informes.informes_uai iu ON iei.iua_codigo = iu.iua_codigo
		LEFT JOIN estructura_poa.actividades a2 ON iu.act_codigo = a2.act_codigo
		LEFT JOIN estructura_organizacional.areas_unidades au ON a2.aun_codigo_ejecutora = au.aun_codigo
		LEFT JOIN ejecucion_poa.asignaciones_cargos_item t ON a.asi_codigo = t.asi_codigo AND t.aci_estado NOT IN (0,5,9)
		LEFT JOIN estructura_organizacional.cargos_items ci ON t.cit_codigo = ci.cit_codigo AND ci.cit_estado NOT IN (0,5,9)
		LEFT JOIN ejecucion_poa.asignaciones_horas_usadas ahu ON t.aci_codigo = ahu.aci_codigo AND ahu.ahu_estado NOT IN (0,5,9)
WHERE 	ci.aun_codigo IN (56)
		AND ci.cit_codigo IN (2)
		AND a.asi_codigo IN (1476)
		AND a.asi_estado NOT IN (0,5,9)
		AND a2.act_codigo IS NOT NULL
;
SELECT 	*
FROM 	parametricas.especificacion_tipos_trabajo ett ;
```