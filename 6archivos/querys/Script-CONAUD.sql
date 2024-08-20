SELECT 	DISTINCT 
		ia.iac_codigo,
    	ia.iac_codigo_control AS trabajo_codigo,
    	ia.iac_objeto AS auditoria_objeto,
    	ia.iac_objetivo AS auditoria_objetivo,
    	g.ges_anio AS actividad_gestion
FROM 	ejecucion_actividades.inicios_actividades ia
		LEFT JOIN estructura_poa.actividades_continuidad ac ON ia.iac_codigo = ac.iac_codigo
		LEFT JOIN parametricas.gestiones g ON ia.ges_codigo = g.ges_codigo 
WHERE 	ia.iac_estado NOT IN (0)
		AND ia.iac_codigo_control LIKE '%Y24';
--		AND ia.iac_codigo_control LIKE '%Y22';
--		AND ia.iac_codigo_control LIKE 'GCEP69Y22';
--		AND ia.iac_codigo_control LIKE '%J23';
	

	
SELECT DISTINCT 
    ac.conaud_detalle->>'entidad_descripcion' AS entidad_descripcion
FROM 
    ejecucion_actividades.inicios_actividades ia
    LEFT JOIN estructura_poa.actividades_continuidad ac ON ia.iac_codigo = ac.iac_codigo
WHERE 
    ia.iac_codigo_control LIKE 'GCEP69Y22'
    AND ac.conaud_detalle->>'trabajo_codigo' = ia.iac_codigo_control;


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
--		AND ia.iac_codigo_control LIKE 'GCEP69Y22';
		AND ia.iac_codigo IN (631);
	
SELECT *--	ac.aco_codigo , ac.aco_estado ,ac.conaud_codigo , ac.conaud_correlativo, ac.conaud_detalle,ac.iac_codigo 
FROM 	estructura_poa.actividades_continuidad ac 
--WHERE 	ac.act_codigo IN (2975)
--WHERE 	ac.act_codigo NOTNULL 
ORDER BY ac.aco_codigo DESC
;

SELECT 	*--ia.iac_codigo , ia.iac_correlativo , ia.iac_codigo_control 
FROM 	ejecucion_actividades.inicios_actividades ia
WHERE 	TRUE 
--		AND ia.iac_codigo_control LIKE 'P5FP41Y22'
		AND ia.iac_codigo IN  (631)
ORDER BY ia.iac_codigo DESC
;

SELECT 	a.act_codigo, a.act_numero ,a.cac_codigo ,au.aun_sigla ,a.act_estado, a.tipact_codigo, a.aun_codigo_ejecutora,a.pobj_codigo,a.act_ejecucion_conaud, 
		po.pobj_estado,po.pobj_numero,
		p.poa_codigo 
FROM 	estructura_poa.actividades a
		LEFT JOIN estructura_poa.poas_objetivos po ON a.pobj_codigo = po.pobj_codigo
		LEFT JOIN estructura_poa.poas p ON po.poa_codigo = p.poa_codigo 
		LEFT JOIN estructura_organizacional.areas_unidades au ON a.aun_codigo_ejecutora = au.aun_codigo
		LEFT JOIN estructura_poa.actividades_continuidad ac ON a.act_codigo = ac.act_codigo 
WHERE 	TRUE
--		AND a.act_codigo IN (1639)
		AND ac.iac_codigo NOTNULL 
		AND a.tipact_codigo IN (2)
		AND a.act_estado IN (17)
--		AND a.cac_codigo IN (3)
		AND a.act_ejecucion_conaud IN (true)
ORDER BY a.act_codigo DESC ;
SELECT * FROM estructura_poa.actividades a WHERE a.act_codigo = 1639;

SELECT 	*
FROM 	ejecucion_actividades.inicios_actividades ia 
;


