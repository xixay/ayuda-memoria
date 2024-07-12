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
      	iei.iei_codigo, iei.iei_estado 
FROM	ejecucion_informes.informes_uai iu
		LEFT JOIN ejecucion_informes.inicio_evaluacion_informe iei ON iu.iua_codigo = iei.iua_codigo 
WHERE 	TRUE
--      	AND iu.iua_estado IN (22)
      	AND iu.act_codigo IN (1512)
;