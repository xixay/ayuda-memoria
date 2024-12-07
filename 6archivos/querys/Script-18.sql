--################### inicio_evaluacion ######################
SELECT 	
		asi.asi_codigo, asi.asi_estado,
		inicio_evaluacion.iua_codigo, inicio_evaluacion.iua_fecha, inicio_evaluacion.iua_fecha_inicio_evaluacion, inicio_evaluacion.ttr_codigo
FROM 	ejecucion_poa.asignaciones asi
		LEFT JOIN (
			SELECT 	
					iu.iua_codigo, iu.iua_estado,iu.iua_fecha,iu.iua_fecha_inicio_evaluacion,
					a.ttr_codigo,	
					iei.iei_codigo, iei.iei_estado,
					ieia.ieia_codigo, ieia.ieia_estado, ieia.asi_codigo
			FROM 	ejecucion_informes.informes_uai iu
					LEFT JOIN estructura_poa.actividades a ON iu.act_codigo = a.act_codigo
					LEFT JOIN ejecucion_informes.inicio_evaluacion_informe iei ON iu.iua_codigo = iei.iua_codigo
					LEFT JOIN ejecucion_informes.inicio_evaluacion_informe_asignaciones ieia ON iei.iei_codigo = ieia.iei_codigo
			WHERE	iu.iua_estado IN (22)
		) inicio_evaluacion ON asi.asi_codigo = inicio_evaluacion.asi_codigo
WHERE 	asi.asi_codigo IN (136)
;
--
SELECT 	
		iu.iua_codigo, iu.iua_codigo_control, iu.ttr_codigo,
		tt.ttr_codigo, tt.ttr_sigla, tt.ttr_descripcion, 
		a.act_codigo, a.act_numero, a.aun_codigo_ejecutora,
		au.aun_sigla 
FROM 	ejecucion_informes.informes_uai iu
		LEFT JOIN estructura_poa.actividades a ON iu.act_codigo = a.act_codigo 
		LEFT JOIN parametricas.tipos_trabajos tt ON iu.ttr_codigo = tt.ttr_codigo 
		LEFT JOIN estructura_organizacional.areas_unidades au ON a.aun_codigo_ejecutora = au.aun_codigo 
ORDER BY iu.iua_codigo DESC
;

SELECT 	*
FROM 	parametricas.tipos_trabajos tt
;	