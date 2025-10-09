--ADMINISTRACION ACP
SELECT 	
		oau.oau_indicador , po.pobj_indicador, oau.oau_codigo,oau_descripcion,oau.aun_codigo_ejecutora,oau.aun_codigo_supervisora, oau.oau_estado,
		au.aun_sigla, 
		po.pobj_codigo, po.pobj_estado ,po.aun_codigo_padre ,po.aeg_codigo 
FROM 	estructura_poa.objetivos_area_unidad oau
		LEFT JOIN estructura_organizacional.areas_unidades au ON oau.aun_codigo_ejecutora = au.aun_codigo 
		LEFT JOIN estructura_poa.poas_objetivos po ON oau.pobj_codigo = po.pobj_codigo
WHERE 	TRUE
		AND oau.pobj_codigo IN (2537)
ORDER BY oau.oau_codigo DESC
;

--HISTORIAL
SELECT 	*
FROM 	control_estados.estados_objetivos_area_unidad eoau
WHERE 	TRUE
		AND eoau.oau_codigo IN (2675)
--		AND eoau.eoau_estado IN (1)
ORDER BY eoau.eoau_codigo DESC
;
--ACTIVIDAD
SELECT 	
		a.act_codigo, a.act_numero, a.act_estado, a.act_descripcion, a.act_justificacion,
		au1.aun_sigla AS aun_sigla_ejecutora, au1.aun_inicial AS aun_inicial_ejecutora,
		au2.aun_sigla AS aun_sigla_supervisora, au2.aun_inicial AS aun_inicial_supervisora,
		a.iac_codigo_apoyo 
FROM 	estructura_poa.actividades a
		LEFT JOIN estructura_organizacional.areas_unidades au1 ON a.aun_codigo_ejecutora = au1.aun_codigo
		LEFT JOIN estructura_organizacional.areas_unidades au2 ON a.aun_codigo_supervisora = au2.aun_codigo
WHERE 	TRUE
--		AND a.act_codigo IN (4789)
ORDER BY a.act_codigo DESC
;
SELECT 	*
FROM 	estructura_poa.actividades a 
WHERE 	TRUE
--		AND a.act_codigo IN (4765)
;
--INICIO DE ACTIVIDAD
SELECT 	*
FROM 	ejecucion_actividades.inicios_actividades ia 
ORDER BY ia.iac_codigo DESC
;
--ACTIVIDAD CONTINUIDAD
SELECT 	*
FROM 	estructura_poa.actividades_continuidad ac 
ORDER BY ac.aco_codigo DESC
;
--INICIO ACTIVIDAD POA
SELECT 	*
FROM 	ejecucion_actividades.inicio_actividad_poa iap
ORDER BY iap.iap_codigo DESC
;
--AREAS UNIDADES
SELECT 	au.aun_codigo ,au.aun_nombre ,au.aun_sigla ,au.aun_inicial 
FROM 	estructura_organizacional.areas_unidades au
WHERE 	TRUE
		AND au.aun_sigla LIKE 'SCGD'
;
-- ESTADOS
SELECT 	*
FROM 	parametricas.estados e
;
--FLUJOS
SELECT 	*
FROM 	control_estados.flujos_tablas ft
WHERE 	ft.tab_codigo IN (1)
;

SELECT 	*
FROM 	estructura_poa.area_unidad_responsables aur 
;

UPDATE estructura_poa.area_unidad_responsables
SET per_codigo=1914
WHERE poa_codigo=4;

SELECT 	*
FROM 	estructura_organizacional.areas_unidades au 
WHERE 	au.aun_codigo IN (79)
;


        SELECT
              t.oau_codigo,
              t.oau_descripcion,
              t.pobj_codigo,
              po.pobj_nombre AS oau_pobj_nombre,
              t.aun_codigo_ejecutora,
              CONCAT_WS(' - ', au1.aun_nombre, au1.aun_sigla) AS oau_aun_nombre_ejecutora,
              au1.aun_sigla AS oau_aun_sigla_ejecutora,
              au1.aun_inicial AS aun_inicial_ejecutora,
              au1.cau_codigo,
              t.aun_codigo_supervisora,
              CONCAT_WS(' - ', au2.aun_nombre, au2.aun_sigla) AS oau_aun_nombre_supervisora,
              au2.aun_sigla AS oau_aun_sigla_supervisora,
              au2.aun_inicial AS aun_inicial_supervisora,
              t.oau_estado,
              e.est_color,
              e.est_nombre AS oau_estado_descripcion,
              TO_CHAR(t.fecha_registro, 'HH24:MI am dd/mm/yyyy') as fecha_registro,
              po.poa_codigo, poa.ges_codigo,
              (CASE WHEN po.aun_codigo_padre IS NOT NULL
              THEN CONCAT(pr.pro_numero, '.', au3.aun_numero, '.', po.pobj_numero)
              ELSE CONCAT(pr.pro_numero, '.', au1.aun_numero, '.', po.pobj_numero)  END) AS poa_pobj_oau_codigo,
              t.oau_indicador
        FROM    estructura_poa.objetivos_area_unidad t
              LEFT JOIN parametricas.estados e ON e.est_codigo = t.oau_estado
              LEFT JOIN estructura_poa.poas_objetivos po ON po.pobj_codigo = t.pobj_codigo
              LEFT JOIN estructura_poa.poas poa ON po.poa_codigo = poa.poa_codigo
              LEFT JOIN pei.programas pr ON pr.pro_codigo = po.pro_codigo
              LEFT JOIN estructura_organizacional.areas_unidades au1 ON au1.aun_codigo = t.aun_codigo_ejecutora
              LEFT JOIN estructura_organizacional.areas_unidades au2 ON au2.aun_codigo = t.aun_codigo_supervisora
              LEFT JOIN estructura_organizacional.areas_unidades au3 ON po.aun_codigo_padre = au3.aun_codigo
        WHERE   TRUE
              AND t.pobj_codigo IN (2537)
              AND t.aun_codigo_ejecutora IN (79)
              AND t.oau_estado IN (0,1,2,3,4,5,6,7,8)
        ORDER BY t.fecha_registro DESC
        ;

SELECT 	*
FROM 	estructura_poa.poas_objetivos po 
;

ALTER TABLE estructura_poa.poas_objetivos
ADD COLUMN aun_codigo_padre INTEGER;

ALTER TABLE estructura_poa.objetivos_area_unidad
ADD COLUMN oau_indicador INTEGER;

SELECT 	*
FROM 	parametricas.unidades_medidas um 
;
