--ACTIVIDAD
SELECT 	*
FROM 	estructura_poa.actividades a
--WHERE 	a.act_codigo IN (2982)
ORDER BY a.act_codigo DESC
;
--ACTIVIDAD CONTINUIDAD
SELECT 	*
FROM 	estructura_poa.actividades_continuidad ac 
ORDER BY ac.aco_codigo DESC
;
--INICIOS ACTIVIDADES
SELECT 	*
FROM 	ejecucion_actividades.inicios_actividades ia
ORDER BY ia.iac_codigo DESC 
;
--########### CAMBIOS DE ESTADO ################
--INICIO ACTIVIDAD POA
SELECT 	iap.iap_codigo ,iap.iap_estado ,iap.act_codigo,iap.iac_codigo,
		ia.iac_estado 
FROM 	ejecucion_actividades.inicio_actividad_poa iap 
		LEFT JOIN ejecucion_actividades.inicios_actividades ia ON iap.iac_codigo = ia.iac_codigo 
WHERE 	TRUE 
		AND iap.act_codigo IN (4749)--PRIMERO
--		AND iap.act_codigo IN (4748)--SEGUNDO
--		AND iap.act_codigo IN (4747)--TERCERO
--		AND iap.iap_codigo IN (617)
--		AND ia.iac_codigo IN (637)
ORDER BY iap.iap_codigo DESC
;
--INICIOS ACTIVIDADES ADICIONAL
SELECT 	iaa.iaa_codigo , iaa.iaa_estado ,iaa.iaa_codigo 
FROM 	ejecucion_actividades.inicios_actividades_adicional iaa 
WHERE 	TRUE 
		AND iaa.iac_codigo IN (637)--PRIMERO Y TERCERO
--		AND iaa.iac_codigo IN (640)--SEGUNDO
;
--ASIGNACIONES
SELECT 	iap.iap_codigo, iap.iap_estado, iap.iac_codigo ,a.asi_codigo, a.asi_estado 
FROM 	ejecucion_actividades.inicio_actividad_poa_asignaciones iapa
		LEFT JOIN ejecucion_actividades.inicio_actividad_poa iap ON iapa.iap_codigo = iap.iap_codigo 
		LEFT JOIN ejecucion_poa.asignaciones a ON iapa.asi_codigo = a.asi_codigo 
WHERE 	TRUE 
		AND iapa.iap_codigo IN (619)--PRIMERO
--		AND iapa.iap_codigo IN (618)--SEGUNDO
--		AND iapa.iap_codigo IN (617)--TERCERO
;
--ASIGNACIONES CARGOS ITEM
SELECT 	aci.aci_codigo ,aci.aci_estado ,aci.asi_codigo 
FROM 	ejecucion_poa.asignaciones_cargos_item aci
WHERE 	TRUE 
		AND aci.asi_codigo IN (1390)--PRIMERO
--		AND aci.asi_codigo IN (1389)--SEGUNDO
--		AND aci.asi_codigo IN (1388)--TERCERO
;
--FLUJO
SELECT 	*
FROM 	control_estados.flujos_tablas ft
WHERE 	TRUE 
		AND ft.tab_codigo IN (65)
ORDER BY ft.fta_codigo DESC
;


INSERT INTO control_estados.flujos_tablas (fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro) VALUES((select max(fta_codigo)+1 from control_estados.flujos_tablas), 65, '', 21, 21, 1, 0);

--#########################################################################################################
--INICIO EVALUACION INFORME
SELECT 	*
--		iei.iei_codigo , iei.iei_estado, iei.iua_codigo,
--		iu.iua_estado, iu.act_codigo 
FROM 	ejecucion_informes.inicio_evaluacion_informe iei
		LEFT JOIN ejecucion_informes.informes_uai iu ON iei.iua_codigo = iu.iua_codigo 
WHERE 	TRUE 
--		AND iu.iua_codigo IN (47)
ORDER BY iei.iei_codigo DESC
;

SELECT iei.iei_codigo, iei.iei_estado, iei.iua_codigo, iu.iua_estado, iu.act_codigo
FROM ejecucion_informes.inicio_evaluacion_informe iei
LEFT JOIN ejecucion_informes.informes_uai iu ON iei.iua_codigo = iu.iua_codigo
WHERE TRUE --iu.act_codigo IN (2726)
AND iei.iua_codigo IN (
  SELECT iua_codigo
  FROM ejecucion_informes.inicio_evaluacion_informe
  GROUP BY iua_codigo
  HAVING COUNT(iua_codigo) > 1
)
ORDER BY iei.iei_codigo DESC;


SELECT 	iap.iap_codigo ,iap.iap_estado ,iap.act_codigo,iap.iac_codigo,
		ia.iac_estado 
FROM 	ejecucion_actividades.inicio_actividad_poa iap 
		LEFT JOIN ejecucion_actividades.inicios_actividades ia ON iap.iac_codigo = ia.iac_codigo 
WHERE 	TRUE 
		AND iap.act_codigo IN (4749)--PRIMERO
--		AND iap.act_codigo IN (4748)--SEGUNDO
--		AND iap.act_codigo IN (4747)--TERCERO
--		AND iap.iap_codigo IN (617)
--		AND ia.iac_codigo IN (637)
ORDER BY iap.iap_codigo DESC
;




