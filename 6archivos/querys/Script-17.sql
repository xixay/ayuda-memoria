SELECT	*
FROM 	estructura_poa.actividades_continuidad ac 
WHERE 	TRUE
--		AND ac.aco_codigo IN (398)
ORDER BY ac.aco_codigo DESC
;

SELECT 	*
FROM 	ejecucion_actividades.inicios_actividades ia
WHERE 	TRUE
--		AND ia.iac_codigo_control LIKE 'ETEP%'
ORDER BY ia.iac_codigo DESC
;