SELECT	aci.*
FROM	ejecucion_poa.asignaciones_cargos_item aci
		LEFT JOIN estructura_organizacional.cargos_items_persona cip ON aci.cit_codigo = cip.cit_codigo
WHERE	TRUE
--		AND aci.asi_codigo = 1384
--		AND aci.asi_codigo = 162
--		AND aci.asi_codigo = 1385
--		AND cip.per_codigo IN (216)
--		AND aci.cit_codigo IN (564)
		AND aci.persona_detalle NOTNULL 
;



SELECT *, iapa.asi_codigo 
FROM ejecucion_actividades.inicio_actividad_poa_asignaciones iapa
WHERE iapa.iap_codigo = 155
;

SELECT 	*
FROM 	ejecucion_actividades.inicio_actividad_poa iap
WHERE 	TRUE 
		AND iap.iap_codigo IN (155)
;

SELECT 	a.act_codigo, a.act_numero, a.act_estado,
		au.aun_codigo, au.aun_sigla 
FROM 	estructura_poa.actividades a 
		LEFT JOIN estructura_organizacional.areas_unidades au ON a.aun_codigo_ejecutora = au.aun_codigo 
WHERE 	TRUE 
		AND a.act_codigo IN (1326)
;
SELECT	aci.*
FROM	ejecucion_poa.asignaciones_cargos_item aci
		LEFT JOIN estructura_organizacional.cargos_items_persona cip ON aci.cit_codigo = cip.cit_codigo
WHERE	TRUE
--		AND aci.asi_codigo = 162
		AND aci.per_codigo NOTNULL 
;
		
		
		
		
		
		
		
		
		
		
		
		