SELECT 	*
FROM 	estructura_poa.poas_objetivos po 
WHERE 	po.pobj_codigo = 1662
ORDER BY po.pobj_codigo DESC 
;

SELECT 	*
FROM 	estructura_poa.objetivos_area_unidad oau
WHERE 	oau.pobj_codigo = 1662
ORDER BY oau.pobj_codigo DESC 
;

SELECT 	*
FROM 	parametricas.gestiones g 
;

SELECT 	*
FROM 	estructura_poa.poas p
WHERE	p.ges_codigo IN (2)
		AND p.poa_estado IN (2)
		AND p.poa_ejecucion_conaud = TRUE
;

SELECT 	*
FROM 	parametricas.gestiones g 
		INNER JOIN parametricas.estados e ON g.ges_estado = e.est_codigo
WHERE 	g.ges_ejecucion = TRUE 
  		AND e.est_codigo IN (1, 2)
ORDER BY g.ges_codigo ASC;

SELECT 	*
FROM 	parametricas.especificacion_tipos_trabajo ett ;

SELECT 	ia.iac_codigo ,ia.iac_estado, ia.iac_codigo_control ,
		iap.act_codigo ,
		a.act_numero ,a.aun_codigo_ejecutora ,
		au.aun_sigla ,
		tt.ttr_codigo ,tt.ttr_descripcion ,ett.ett_codigo ,ett.ett_nombre 
FROM 	ejecucion_actividades.inicios_actividades ia
		LEFT JOIN ejecucion_actividades.inicio_actividad_poa iap ON ia.iac_codigo = iap.iac_codigo 
		LEFT JOIN estructura_poa.actividades a ON iap.act_codigo = a.act_codigo 
		LEFT JOIN estructura_organizacional.areas_unidades au ON a.aun_codigo_ejecutora = au.aun_codigo 
		LEFT JOIN parametricas.tipos_trabajos tt ON ia.ttr_codigo = tt.ttr_codigo
		LEFT JOIN parametricas.especificacion_tipos_trabajo ett ON tt.ett_codigo = ett.ett_codigo 
--WHERE 	ett.ett_codigo IN (5)
;