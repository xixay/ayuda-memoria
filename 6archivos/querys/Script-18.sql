SELECT 	*
FROM 	estructura_organizacional.cargos_items_persona cip
WHERE 	cip.cit_codigo IN (494,522,572,94)
;

SELECT 	*
FROM 	ejecucion_poa.asignaciones_cargos_item aci
WHERE 	TRUE
		AND aci.asi_codigo IN (482)
		AND aci.aci_estado IN (1,2,21,9)
ORDER BY aci.aci_codigo DESC
;