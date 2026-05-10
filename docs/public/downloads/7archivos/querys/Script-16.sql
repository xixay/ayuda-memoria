
SELECT  
    aci.fecha_registro ,au.aun_sigla, a.act_codigo, a.act_numero, a.ttr_codigo, tt.ett_codigo , a.act_estado, -- ACTIVIDAD
    iap.tia_codigo, iap.iap_codigo,  iap.iap_estado, -- INICIO-ACTIVIDAD-POA
    ia.iac_codigo, ia.iac_codigo_control, ia.iac_correlativo ,ia.iac_estado, -- INICIOS-ACTIVIDADES
    asi.asi_codigo, asi.asi_estado,-- asi.asi_detalle_asignaciones_cargos_items, asi.asi_detalle_asignaciones_horas_usadas, asi.asi_detalle_reposicion_cargos_item,  -- ASIGNACION
    aci.aci_codigo,  aci.aci_estado, aci.aci_horas,  -- ASIGNACION-CARGOS-ITEM
    iai.iai_codigo, iai.iai_estado, ---INICIOS ACTIVIDADES INFORMES 
    i.inf_codigo, i.inf_estado , i.iac_codigo AS iac_codigo_inf, ---INFORMES
    iei.iua_codigo, iu.iua_estado
FROM  estructura_poa.actividades a
	JOIN parametricas.tipos_trabajos tt ON a.ttr_codigo = tt.ttr_codigo
    LEFT JOIN ejecucion_actividades.inicio_actividad_poa iap ON a.act_codigo = iap.act_codigo --AND iap.iap_estado NOT IN (5)
    LEFT JOIN ejecucion_actividades.inicios_actividades ia ON iap.iac_codigo = ia.iac_codigo 
    LEFT JOIN ejecucion_actividades.inicio_actividad_informe iai ON ia.iac_codigo = iai.iac_codigo
    LEFT JOIN ejecucion_actividades.informes i ON iai.inf_codigo = i.inf_codigo 
    LEFT JOIN ejecucion_informes.informes_uai iu ON iu.act_codigo = a.act_codigo      
    LEFT JOIN ejecucion_informes.inicio_evaluacion_informe iei ON iei.iua_codigo = iu.iua_codigo  
    LEFT JOIN ejecucion_informes.inicio_evaluacion_informe_asignaciones ieia ON ieia.iei_codigo = iei.iei_codigo   
    LEFT JOIN ejecucion_poa.asignaciones asi ON ieia.asi_codigo = asi.asi_codigo
    LEFT JOIN ejecucion_poa.asignaciones_cargos_item aci ON asi.asi_codigo = aci.asi_codigo
    LEFT JOIN estructura_organizacional.areas_unidades au ON a.aun_codigo_ejecutora = au.aun_codigo 
WHERE true
AND aci.per_codigo = 784;	


SELECT 	*
FROM 	estructura_poa.actividades a
;
--OBTIENE LOS DETALLES DE F1 que se quedo historico con iapCodigo
SELECT
  		au.aun_sigla,
  		a2.act_numero ,
		t.iap_codigo, t.iap_estado, t.iac_codigo , t.act_codigo, t.tia_codigo, t.iap_fecha_aprobacion,
  		ett.ett_codigo,
  		iapa.asi_codigo,
  		a.asi_codigo, a.asi_estado,
	  (
	    CASE
	        WHEN (tt.ett_codigo = 0 and t.tia_codigo = 1) THEN 'REPORTE F1'
	        WHEN (tt.ett_codigo = 0 and t.tia_codigo = 2) THEN 'REPORTE F1-A'
	        WHEN (tt.ett_codigo = 1 and t.tia_codigo = 1) THEN 'REPORTE F1'
	        WHEN (tt.ett_codigo = 1 and t.tia_codigo = 2) THEN 'REPORTE F1-A'
	       	WHEN (tt.ett_codigo = 2 and t.tia_codigo = 1) THEN 'REPORTE F1'
	        WHEN (tt.ett_codigo = 2 and t.tia_codigo = 2) THEN 'REPORTE F1-A'
	       	WHEN (tt.ett_codigo = 3 and t.tia_codigo = 3) THEN 'REPORTE F2'
	        WHEN (tt.ett_codigo = 3 and t.tia_codigo = 4) THEN 'REPORTE F2-A'
	       	WHEN (tt.ett_codigo = 4 and t.tia_codigo = 1) THEN 'REPORTE F1'
	        WHEN (tt.ett_codigo = 4 and t.tia_codigo = 2) THEN 'REPORTE F1-A'
	       	WHEN (tt.ett_codigo = 5 and t.tia_codigo = 1) THEN 'REPORTE F1'
	        WHEN (tt.ett_codigo = 5 and t.tia_codigo = 2) THEN 'REPORTE F1-A'
	        ELSE '' END
	  ) AS nombre_reporte,
	  (
	    CASE
	        WHEN (tt.ett_codigo = 0 and t.tia_codigo = 1) THEN 1
	        WHEN (tt.ett_codigo = 0 and t.tia_codigo = 2) THEN 2
	        WHEN (tt.ett_codigo = 1 and t.tia_codigo = 1) THEN 1
	        WHEN (tt.ett_codigo = 1 and t.tia_codigo = 2) THEN 2
	       	WHEN (tt.ett_codigo = 2 and t.tia_codigo = 1) THEN 1
	        WHEN (tt.ett_codigo = 2 and t.tia_codigo = 2) THEN 2
	       	WHEN (tt.ett_codigo = 3 and t.tia_codigo = 3) THEN 3
	        WHEN (tt.ett_codigo = 3 and t.tia_codigo = 4) THEN 4
	       	WHEN (tt.ett_codigo = 4 and t.tia_codigo = 1) THEN 1
	        WHEN (tt.ett_codigo = 4 and t.tia_codigo = 2) THEN 2
	       	WHEN (tt.ett_codigo = 5 and t.tia_codigo = 1) THEN 1
	        WHEN (tt.ett_codigo = 5 and t.tia_codigo = 2) THEN 2
	        ELSE 0 END
	  ) AS tipo_reporte
FROM ejecucion_actividades.inicio_actividad_poa t
		LEFT JOIN ejecucion_actividades.inicios_actividades ia on t.iac_codigo = ia.iac_codigo
		LEFT JOIN parametricas.tipos_trabajos tt on ia.ttr_codigo = tt.ttr_codigo
		LEFT JOIN parametricas.especificacion_tipos_trabajo ett on tt.ett_codigo = ett.ett_codigo
		LEFT JOIN estructura_poa.actividades a2 on t.act_codigo = a2.act_codigo
		LEFT JOIN estructura_organizacional.areas_unidades au ON a2.aun_codigo_ejecutora = au.aun_codigo 
		LEFT JOIN ejecucion_actividades.inicio_actividad_poa_asignaciones iapa on t.iap_codigo = iapa.iap_codigo
		LEFT JOIN ejecucion_poa.asignaciones a on iapa.asi_codigo = a.asi_codigo
where	TRUE
		AND t.iap_estado IN (17)
--		AND t.iap_codigo IN (588)
--		and t.tia_codigo in (3)
--		and t.act_codigo in (1121)
--		and	t.act_codigo = 1448
--		and t.act_codigo = 1200
--		and t.act_codigo = 1181
--		and	t.act_codigo = 1156 --no da
--		and t.act_codigo in (933) 
ORDER BY t.fecha_registro DESC
;
	


SELECT 	a.act_codigo ,a.act_numero ,a.act_estado
FROM 	estructura_poa.actividades a
		LEFT JOIN estructura_organizacional
WHERE 	TRUE
		AND a.act_numero LIKE '520.1801.131.4.24'
;	
SELECT 	iap.iap_codigo , iap.iap_estado 
FROM 	ejecucion_actividades.inicio_actividad_poa iap 
WHERE 	iap.iap_codigo IN (563)
	
	