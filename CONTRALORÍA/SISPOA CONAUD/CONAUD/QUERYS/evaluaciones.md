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
