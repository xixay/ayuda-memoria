SELECT 	DISTINCT 
		ia.iac_codigo,
    	ia.iac_codigo_control AS trabajo_codigo,
    	ac.conaud_detalle->>'entidad_descripcion' AS entidad_descripcion,
    	ia.iac_objeto AS auditoria_objeto,
    	ia.iac_objetivo AS auditoria_objetivo,
    	g.ges_anio AS actividad_gestion
FROM 	ejecucion_actividades.inicios_actividades ia
		LEFT JOIN estructura_poa.actividades_continuidad ac ON ia.iac_codigo = ac.iac_codigo
		LEFT JOIN parametricas.gestiones g ON ia.ges_codigo = g.ges_codigo 
WHERE 	ia.iac_estado NOT IN (0)
--		AND ia.iac_codigo_control LIKE '%Y24';
		AND ia.iac_codigo_control LIKE '%Y22';--GCEP69Y22
--		AND ia.iac_codigo_control LIKE '%J23';

SELECT 	ac.aco_codigo , ac.aco_estado , ac.conaud_codigo , ac.conaud_correlativo, ac.conaud_detalle, ac.act_codigo , ac.iac_codigo ,
		ia.iac_codigo_control 
FROM 	estructura_poa.actividades_continuidad ac
		LEFT JOIN ejecucion_actividades.inicios_actividades ia ON ac.iac_codigo = ia.iac_codigo
WHERE 	TRUE 
		AND ia.iac_estado NOT IN (0)
		AND ac.iac_codigo IN (117)
--		AND ia.iac_codigo_control LIKE '%Y22'
--		AND ia.iac_codigo_control LIKE '%J23'
ORDER BY ac.aco_codigo DESC 
;


SELECT	DISTINCT 
		ia.iac_codigo,
    	ac.conaud_detalle->>'entidad_descripcion' AS entidad_descripcion
FROM 	ejecucion_actividades.inicios_actividades ia
		LEFT JOIN estructura_poa.actividades_continuidad ac ON ia.iac_codigo = ac.iac_codigo
WHERE 	ia.iac_estado NOT IN (0)
		AND ia.iac_codigo_control LIKE 'GCEP69Y22';
	
SELECT 	*--ac.aco_codigo , ac.conaud_codigo , ac.conaud_correlativo, ac.conaud_detalle,ac.iac_codigo 
FROM 	estructura_poa.actividades_continuidad ac
--WHERE 	ac.aco_codigo IN (320)
ORDER BY ac.aco_codigo DESC
;

SELECT 	*--ia.iac_codigo , ia.iac_correlativo , ia.iac_codigo_control 
FROM 	ejecucion_actividades.inicios_actividades ia
WHERE 	ia.iac_codigo_control LIKE 'P5FP41Y22'
ORDER BY ia.iac_codigo DESC
;

SELECT 	*
FROM 	estructura_poa.actividades a 
ORDER BY a.act_codigo DESC ;



