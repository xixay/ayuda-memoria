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
		CONCAT('(',i.inf_codigo_control,')', ' - (', ia.iac_codigo_control, ') - ',i.inf_nombre) AS informe,
		i.inf_estado,
		ia.iac_codigo,
		ia.iac_estado,
		ia.iac_codigo_control_vista, 
		t.ain_estado,
		t.usuario_registro,
		t.usuario_modificacion,
		TO_CHAR(t.fecha_registro, 'dd/mm/yyyy') AS fecha_registro,
		TO_CHAR(t.fecha_modificacion, 'dd/mm/yyyy') AS fecha_modificacion
FROM 	ejecucion_actividades.actividades_informes t
		LEFT JOIN estructura_poa.actividades a ON t.act_codigo = a.act_codigo
		LEFT JOIN estructura_organizacional.areas_unidades au ON a.aun_codigo_ejecutora = au.aun_codigo
		LEFT JOIN estructura_poa.poas_objetivos po ON a.pobj_codigo = po.pobj_codigo 
		LEFT JOIN estructura_poa.poas p ON po.poa_codigo = p.poa_codigo 
		LEFT JOIN ejecucion_actividades.informes i ON t.inf_codigo = i.inf_codigo
		LEFT JOIN ejecucion_actividades.inicios_actividades ia ON i.iac_codigo = ia.iac_codigo 
		LEFT JOIN parametricas.estados e ON t.ain_estado = e.est_codigo
WHERE 	TRUE
		AND t.ain_estado IN (1)
--		AND t.act_codigo IN (3167)
;
--######### INICIOS ACTIVIDADES ##############
SELECT 	*
FROM 	ejecucion_actividades.inicios_actividades ia
WHERE 	TRUE
--		AND ia.iac_codigo IN (685)
ORDER BY ia.iac_codigo DESC
;
--########## INICIO ACTIVIDAD POA ################
SELECT 	*
FROM 	ejecucion_actividades.inicio_actividad_poa iap
WHERE 	TRUE
--		AND iap.iac_codigo IN (685)
--		AND iap.act_codigo IN (3167)
		AND iap.iac_codigo IN (140)--(138,140,155,160,166,203,207,309,314,309,358)
ORDER BY iap.iap_codigo DESC
;--act_codigo=3167
--########### ACTIVIDADES #############
SELECT 	a.act_codigo, a.act_numero, a.act_estado, a.aun_codigo_ejecutora
FROM 	estructura_poa.actividades a
WHERE 	a.act_codigo IN (3167)
;
--########### INFORMES #############
SELECT 	*
FROM 	ejecucion_actividades.informes inf
WHERE 	TRUE
		AND inf.iac_codigo IN (685)
;
--######### INFORMES JOIN##############
SELECT 	i.inf_codigo, i.inf_estado, i.inf_codigo_control, i.inf_nombre, i.inf_estado,
		ia.iac_codigo, ia.iac_codigo_control_vista, ia.iac_estado
FROM 	ejecucion_actividades.informes i
		LEFT JOIN ejecucion_actividades.inicios_actividades ia ON i.iac_codigo = ia.iac_codigo 
WHERE 	TRUE
--		AND i.inf_estado IN (1)
		AND i.inf_codigo IN (380)
ORDER BY i.inf_codigo DESC
;--iac_codigo = 685
-- ########## ACTIVIDADES INFORMES ###############
SELECT 	*
FROM 	ejecucion_actividades.actividades_informes ai
WHERE 	TRUE
--		AND ai.ain_codigo =:ain_codigo
;
--&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
SELECT 
	inf.inf_codigo,
	inf.inf_estado,
	CONCAT(ia.iac_codigo_control, ' - ', inf.inf_nombre, ' - ','(',inf.inf_codigo_control,')') AS informe,
	inf.iac_codigo,
	ia.iac_estado,
	ia.iac_codigo_control_vista
FROM ejecucion_actividades.informes inf
    LEFT JOIN ejecucion_actividades.inicio_actividad_poa iap ON inf.iac_codigo = iap.iac_codigo
    LEFT JOIN ejecucion_actividades.inicios_actividades ia ON inf.iac_codigo = ia.iac_codigo
WHERE TRUE
    AND inf.inf_estado NOT IN (0,9)
    AND (
        CASE 
            -- Si existe el act_codigo en inicio_actividad_poa, lo usa para filtrar
            WHEN EXISTS (
                SELECT 1
                FROM ejecucion_actividades.inicio_actividad_poa iap_sub
                WHERE iap_sub.act_codigo = :act_codigo
            )
            THEN iap.act_codigo = :act_codigo
            -- Si no existe en inicio_actividad_poa, filtra solo por ges_codigo de inicios_actividades
            ELSE iap.iac_codigo IS NULL AND ia.ges_codigo = :ges_codigo
        END
    )
ORDER BY inf.inf_codigo ASC;
--&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
SELECT 
	inf.inf_codigo,
	inf.inf_estado,
	CONCAT('(',inf.inf_codigo_control,')', ' - (', ia.iac_codigo_control, ') - ',inf.inf_nombre) AS informe,
	inf.iac_codigo,
	ia.iac_estado,
	ia.iac_codigo_control_vista
FROM ejecucion_actividades.informes inf
    LEFT JOIN ejecucion_actividades.inicio_actividad_poa iap ON inf.iac_codigo = iap.iac_codigo
    LEFT JOIN ejecucion_actividades.inicios_actividades ia ON inf.iac_codigo = ia.iac_codigo
WHERE TRUE
    AND inf.inf_estado NOT IN (0,9)
    AND (
        -- Si existe el act_codigo en inicio_actividad_poa, filtra por act_codigo
        CASE 
            WHEN EXISTS (
                SELECT 1
                FROM ejecucion_actividades.inicio_actividad_poa iap_sub
                WHERE iap_sub.act_codigo = :act_codigo
            )
            THEN iap.act_codigo = :act_codigo
            -- Si no existe, no se aplica ninguna condición adicional
            ELSE TRUE
        END
    )
ORDER BY inf.inf_codigo ASC;

SELECT 	*
FROM 	ejecucion_actividades.informes i;
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$44444444
SELECT 	
		t.act_codigo,
		MAX(a.aun_codigo_ejecutora) AS aun_codigo_ejecutora,
		CONCAT(MAX(a.act_numero), ' - ', MAX(a.act_descripcion)) AS actividad,
		MAX(a.act_estado) AS act_estado,
		CONCAT(MAX(au.aun_sigla), ' - ', MAX(au.aun_nombre)) AS aun_nombre_completo, 
		-- Agregar solo los inf_codigo como un array de enteros
		array_agg(i.inf_codigo) AS informes,
		MAX(t.ain_estado) AS ain_estado,
		MAX(t.usuario_registro) AS usuario_registro,
		MAX(t.usuario_modificacion) AS usuario_modificacion,
		MAX(e.est_nombre) AS ain_estado_descripcion
FROM 	ejecucion_actividades.actividades_informes t
		LEFT JOIN estructura_poa.actividades a ON t.act_codigo = a.act_codigo
		LEFT JOIN estructura_organizacional.areas_unidades au ON a.aun_codigo_ejecutora = au.aun_codigo
		LEFT JOIN ejecucion_actividades.informes i ON t.inf_codigo = i.inf_codigo
		LEFT JOIN parametricas.estados e ON t.ain_estado = e.est_codigo
WHERE 	TRUE
		AND t.ain_estado NOT IN (0,9)
		--AND t.act_codigo IN (3167)
GROUP BY 
		t.act_codigo
ORDER BY t.act_codigo ASC;
--===========================================================
WITH 
-- Esta tabla con el act_codigo indicado busca su existencia en inicio_actividad_poa
act_codigo_existe AS (
    SELECT 1
    FROM ejecucion_actividades.inicio_actividad_poa iap_sub
    WHERE iap_sub.act_codigo = :act_codigo
),
-- Datos de informes y su información relacionada
informes AS (
    SELECT 
        inf.inf_codigo,
        inf.inf_estado,
        CONCAT('(', inf.inf_codigo_control, ')', ' - (', ia.iac_codigo_control, ') - ', inf.inf_nombre) AS informe,
        inf.iac_codigo,
        ia.iac_estado,
        ia.iac_codigo_control_vista,
        iap.act_codigo AS act_codigo_encontrado
    FROM 
        ejecucion_actividades.informes inf
        LEFT JOIN ejecucion_actividades.inicio_actividad_poa iap ON inf.iac_codigo = iap.iac_codigo
        LEFT JOIN ejecucion_actividades.inicios_actividades ia ON inf.iac_codigo = ia.iac_codigo
    WHERE 
        inf.inf_estado NOT IN (0, 9)
)
-- Consulta final con la lógica condicional
SELECT 
    inf.inf_codigo,
    inf.inf_estado,
    inf.informe,
    inf.iac_codigo,
    inf.iac_estado,
    inf.iac_codigo_control_vista
FROM 
    informes inf
WHERE 
    (
        -- Verifica si el act_codigo existe en inicio_actividad_poa
        EXISTS (SELECT 1 FROM act_codigo_existe)
        AND inf.act_codigo_encontrado = :act_codigo
    ) 
    OR 
    (
        -- Si act_codigo no existe en inicio_actividad_poa, se devuelven todos los informes
        NOT EXISTS (SELECT 1 FROM act_codigo_existe)
    );
--act_codigo=3152
-------------------------------------------------------------------------------------------
WITH 
-- Verificar si el act_codigo existe en inicio_actividad_poa
act_codigo_existe AS (
    SELECT 	1	
    FROM 	ejecucion_actividades.inicio_actividad_poa iap_sub
    WHERE 	iap_sub.act_codigo = :act_codigo
),
-- Verificar si existen informes asociados al act_codigo
informes_asociados AS (
    SELECT 	1
    FROM 	ejecucion_actividades.informes inf_sub
    		LEFT JOIN ejecucion_actividades.inicio_actividad_poa iap ON inf_sub.iac_codigo = iap.iac_codigo
    WHERE 	iap.act_codigo = :act_codigo
),
-- Datos de informes y su información relacionada
informes AS (
	SELECT 
        	inf.inf_codigo,
        	inf.inf_estado,
	        CONCAT('(', inf.inf_codigo_control, ')', ' - (', ia.iac_codigo_control, ') - ', inf.inf_nombre) AS informe,
	        inf.iac_codigo,
	        ia.iac_estado,
	        e.est_nombre AS inf_est_descripcion,
	        ia.iac_codigo_control_vista,
	        iap.act_codigo AS act_codigo_encontrado
	FROM 	ejecucion_actividades.informes inf
        	LEFT JOIN ejecucion_actividades.inicio_actividad_poa iap ON inf.iac_codigo = iap.iac_codigo
        	LEFT JOIN ejecucion_actividades.inicios_actividades ia ON inf.iac_codigo = ia.iac_codigo
        	LEFT JOIN parametricas.estados e ON inf.inf_estado = e.est_codigo
    WHERE 	inf.inf_estado NOT IN (0, 9)
)
-- Consulta final con la lógica completa
SELECT 
		inf.inf_codigo,
    	inf.inf_estado,
    	inf.informe,
    	inf.iac_codigo,
    	inf.iac_estado,
    	inf.iac_codigo_control_vista
FROM 	informes inf
WHERE 	(
	        -- Si act_codigo existe pero no tiene informes asociados, devolver todos los informes
	        EXISTS (SELECT 1 FROM act_codigo_existe) 
	        AND NOT EXISTS (SELECT 1 FROM informes_asociados)
    	)
    	OR 
	    (
	        -- Si hay informes asociados al act_codigo, solo devolver esos
	        EXISTS (SELECT 1 FROM informes_asociados) 
	        AND inf.act_codigo_encontrado = :act_codigo
	    )
	    OR 
	    (
	        -- Si act_codigo no existe en inicio_actividad_poa, devolver todos los informes
	        NOT EXISTS (SELECT 1 FROM act_codigo_existe)
	    );--3152

----------------------------------------------------------------------------------------
--
SELECT 	*
FROM 	estructura_poa.actividades a
WHERE 	a.act_codigo = :act_codigo
;
--
SELECT 	*
FROM 	ejecucion_actividades.inicio_actividad_poa iap
WHERE 	iap.act_codigo IN (3152)
;

SELECT 	*
FROM 	ejecucion_actividades.informes i
WHERE 	i.iac_codigo IN (690)
;
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
SELECT 	
		t.act_codigo,
		MAX(a.act_numero) AS act_numero,
		MAX(CONCAT(a.act_numero, ' - ', a.act_descripcion)) AS actividad,
		MAX(a.act_estado) AS act_estado,
		MAX(au.aun_sigla) AS aun_sigla,
		MAX(CONCAT(au.aun_sigla, ' - ', au.aun_nombre)) AS aun_nombre_completo,
		MAX(p.poa_codigo) AS poa_codigo,
		MAX(p.ges_codigo) AS ges_codigo, 
		-- Agregar todos los informes como un array JSON
		json_agg(
			json_build_object(
				'inf_codigo', i.inf_codigo,
				'inf_correlativo', i.inf_correlativo,
				'inf_codigo_control', i.inf_codigo_control,
				'inf_nombre', i.inf_nombre,
				'informe', CONCAT('(', i.inf_codigo_control, ') - (', ia.iac_codigo_control, ') - ', i.inf_nombre, ' (', e1.est_nombre,')'),
				'inf_estado', i.inf_estado,
				'iac_codigo', ia.iac_codigo,
				'iac_estado', ia.iac_estado,
				'iac_codigo_control_vista', ia.iac_codigo_control_vista
			)
		) AS informes,
		MAX(t.ain_estado) AS ain_estado,
		MAX(e.est_nombre) AS ain_estado_descripcion,
		MAX(t.usuario_registro) AS usuario_registro,
		MAX(t.usuario_modificacion) AS usuario_modificacion
FROM 	ejecucion_actividades.actividades_informes t
		LEFT JOIN estructura_poa.actividades a ON t.act_codigo = a.act_codigo
		LEFT JOIN estructura_organizacional.areas_unidades au ON a.aun_codigo_ejecutora = au.aun_codigo
		LEFT JOIN estructura_poa.poas_objetivos po ON a.pobj_codigo = po.pobj_codigo 
		LEFT JOIN estructura_poa.poas p ON po.poa_codigo = p.poa_codigo 
		LEFT JOIN ejecucion_actividades.informes i ON t.inf_codigo = i.inf_codigo
		LEFT JOIN ejecucion_actividades.inicios_actividades ia ON i.iac_codigo = ia.iac_codigo 
		LEFT JOIN parametricas.estados e ON t.ain_estado = e.est_codigo
		LEFT JOIN parametricas.estados e1 ON i.inf_estado = e1.est_codigo
WHERE 	TRUE
		AND t.act_codigo IN (3167)
GROUP BY t.act_codigo
ORDER BY t.act_codigo ASC;
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
