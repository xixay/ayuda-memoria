SELECT 	iap.iap_codigo, iap.iap_estado,
		a.act_codigo, a.act_numero, a.act_estado,
		au.aun_sigla 
FROM 	ejecucion_actividades.inicio_actividad_poa iap
LEFT JOIN estructura_poa.actividades a ON iap.act_codigo = a.act_codigo 
LEFT JOIN estructura_organizacional.areas_unidades au ON a.aun_codigo_ejecutora = au.aun_codigo 
WHERE 	a.act_codigo IN (1138)
ORDER BY iap.iap_codigo DESC; 