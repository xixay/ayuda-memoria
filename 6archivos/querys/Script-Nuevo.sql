SELECT 	*
FROM 	estructura_poa.actividades a
--WHERE 	a.act_codigo IN (2982)
ORDER BY a.act_codigo DESC
;

SELECT 	*
FROM 	estructura_poa.actividades_continuidad ac 
ORDER BY ac.aco_codigo DESC
;

SELECT 	*
FROM 	ejecucion_actividades.inicios_actividades ia
ORDER BY ia.iac_codigo DESC 
;

SELECT 	*
FROM 	ejecucion_actividades.inicio_actividad_poa iap 
ORDER BY iap.iap_codigo DESC
;
SELECT 	*
FROM 	parametricas.estados e ;