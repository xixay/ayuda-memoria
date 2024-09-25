--######## addAsignacionesCargosItem #######
SELECT 	*
FROM 	estructura_organizacional.cargos_items_persona cip 
WHERE 	TRUE
		AND cip.cip_estado IN (2,42)
		AND cip.per_codigo IN (42)--cit_codigo=398
;

SELECT 	*
FROM 	ejecucion_actividades.inicio_actividad_poa_asignaciones iapa
WHERE 	TRUE
		AND iapa.iap_codigo IN (499)--asi_codigo = 960
;

SELECT 	*
FROM 	ejecucion_poa.asignaciones a
WHERE 	TRUE
		AND a.asi_codigo IN (960)
		AND a.asi_estado IN (2)
;

SELECT 	*
FROM 	ejecucion_poa.asignaciones_cargos_item aci
WHERE 	TRUE
		AND aci.asi_codigo IN (960)--aci_codigo=2802
		AND aci.cit_codigo IN (398)
		AND aci.aci_estado IN (2)
;

--########### addFormulariosObjetivos ############
















