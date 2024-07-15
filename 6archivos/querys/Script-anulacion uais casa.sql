--UAI EVALUACION
SELECT	
      	iu.iua_codigo, iu.iua_estado, iu.iua_cite,
      	ie.iev_codigo, ie.iev_estado, ie.iev_nombre 
FROM	ejecucion_informes.informes_uai iu
		LEFT JOIN ejecucion_informes.informes_evaluaciones ie ON iu.iua_codigo = ie.iua_codigo 
WHERE 	TRUE
--      	AND iu.iua_estado IN (22)
      	AND iu.act_codigo IN (1512)
;
--UAI NORMAL
SELECT		
      	iu.iua_codigo, iu.iua_estado, iu.iua_cite,
      	iei.iei_codigo, iei.iei_estado, iei.tia_codigo,
      	tia.tia_nombre,
		ieia.ieia_codigo, ieia.ieia_estado,
		a.asi_codigo, a.asi_estado,
		aci.aci_codigo, aci.aci_estado 
FROM	ejecucion_informes.informes_uai iu
		LEFT JOIN ejecucion_informes.inicio_evaluacion_informe iei ON iu.iua_codigo = iei.iua_codigo
		LEFT JOIN parametricas.tipos_inicios_actividades tia ON iei.tia_codigo = tia.tia_codigo
		LEFT JOIN ejecucion_informes.inicio_evaluacion_informe_asignaciones ieia ON iei.iei_codigo = ieia.ieia_codigo
		LEFT JOIN ejecucion_poa.asignaciones a ON ieia.asi_codigo = a.asi_codigo
		LEFT JOIN ejecucion_poa.asignaciones_cargos_item aci ON a.asi_codigo = aci.asi_codigo 
WHERE 	TRUE
--      	AND iu.iua_codigo IN (796)
--      	AND iu.iua_codigo IN (797)
      	AND iu.act_codigo IN (1512)
;
--UAI REINGRESO
SELECT 	iur.*
--		iu.iua_codigo, iu.iua_estado, iu.iua_cite
FROM 	ejecucion_informes.informes_uai iu
		LEFT JOIN	ejecucion_informes.informes_uai_reingreso iur ON iu.iua_codigo = iur.iua_codigo 
WHERE 	TRUE 
		AND iu.iua_codigo IN (796)
;