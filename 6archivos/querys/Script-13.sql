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