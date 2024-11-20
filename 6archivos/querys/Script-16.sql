SELECT
		(CASE
			WHEN inicio_auditoria.asi_codigo IS NOT NULL THEN 1 -- AUDITORIA
			WHEN inicio_evaluacion.asi_codigo IS NOT NULL THEN 2 -- EVALUACION
			WHEN inicio_apoyos.asi_codigo IS NOT NULL THEN 3 -- APOYOS
		END) tipo_inicio,
		inicio_auditoria.iac_codigo_control,
		inicio_evaluacion.iua_codigo_control,
		aci.aci_codigo,aci.aci_horas,
		ahu.ahu_codigo, ahu.ahu_estado, ahu.ahu_horas,ahu.hrc_codigo, ahu.ahu_descripcion, ahu.ahu_fecha 
		--CONCAT(a2.act_numero,'-(',ia.iac_codigo_control,')-[',ahu.ahu_horas,']:',ahu.ahu_descripcion) AS info_horas
FROM 	ejecucion_poa.asignaciones_cargos_item aci
		LEFT JOIN ejecucion_poa.asignaciones_horas_usadas ahu ON aci.aci_codigo = ahu.aci_codigo AND ahu.ahu_estado NOT IN (0)
		LEFT JOIN ejecucion_poa.asignaciones a ON aci.asi_codigo = a.asi_codigo AND a.asi_estado NOT IN (0)
		LEFT JOIN (
			SELECT	iapa.asi_codigo, iap.iap_codigo, iap.act_codigo, iap.tia_codigo, iap.iap_estado,
					ia.iac_codigo, ia.iac_codigo_control, ia.iac_codigo_control_vista, ia.iac_estado
			FROM	ejecucion_actividades.inicio_actividad_poa_asignaciones iapa
					LEFT JOIN ejecucion_actividades.inicio_actividad_poa iap ON iapa.iap_codigo = iap.iap_codigo AND iap.iap_estado NOT IN (0)
					LEFT JOIN ejecucion_actividades.inicios_actividades ia ON iap.iac_codigo = ia.iac_codigo
		) inicio_auditoria ON a.asi_codigo = inicio_auditoria.asi_codigo
		LEFT JOIN (
			SELECT 	ieia.asi_codigo, ieia.ieia_codigo, ieia.ieia_estado,
					iu.iua_codigo,iua_codigo_control, iu.iua_estado 
			FROM 	ejecucion_informes.inicio_evaluacion_informe_asignaciones ieia
					LEFT JOIN ejecucion_informes.inicio_evaluacion_informe iei ON ieia.iei_codigo = iei.iei_codigo 
					LEFT JOIN ejecucion_informes.informes_uai iu ON iei.iua_codigo = iu.iua_codigo AND iu.iua_estado NOT IN (0)
		) inicio_evaluacion ON a.asi_codigo = inicio_evaluacion.asi_codigo
		LEFT JOIN (
			SELECT 	aiap.asi_codigo, aiap.aiap_codigo, aiap.aiap_estado 
			FROM	ejecucion_actividades.apoyo_inicio_actividad_poa aiap
		) inicio_apoyos ON a.asi_codigo = inicio_apoyos.asi_codigo
		--LEFT JOIN estructura_poa.actividades a2 ON iap.act_codigo = a2.act_codigo AND a2.act_estado IN (2)
WHERE 	TRUE
		--AND aci.aci_estado NOT IN (0)
		--AND ahu.ahu_codigo NOTNULL 
		--AND a2.act_codigo NOTNULL
--		AND aci.cit_codigo IN (2)--auditoria
		AND aci.cit_codigo IN (448)--evaluacion--aci_codigo=4126, asi_codigo=1114[http://172.16.22.232:3002/conaud/evaluaciones/2281]
;