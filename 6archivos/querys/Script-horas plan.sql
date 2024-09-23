--actividad con problema
SELECT * FROM estructura_poa.actividades a WHERE a.act_codigo = 2480;
--FG: 3346274
--Unidad: GPA2-GAM2
--#########################
SELECT  
    	a.act_codigo, a.act_numero, a.ttr_codigo, tt.ett_codigo , a.act_estado, -- ACTIVIDAD
    	iap.tia_codigo, iap.iap_codigo,  iap.iap_estado, -- INICIO-ACTIVIDAD-POA
    	ia.iac_codigo, ia.iac_codigo_control, ia.iac_correlativo ,ia.iac_estado, -- INICIOS-ACTIVIDADES
    	asi.asi_codigo, asi.asi_estado,-- asi.asi_detalle_asignaciones_cargos_items, asi.asi_detalle_asignaciones_horas_usadas, asi.asi_detalle_reposicion_cargos_item,  -- ASIGNACION
    	aci.per_codigo, aci.aci_codigo,  aci.aci_estado, aci.aci_horas,  -- ASIGNACION-CARGOS-ITEM
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
WHERE 	TRUE
--		AND aci.per_codigo = 21
		AND aci.asi_codigo IN (1393)
		AND aci.aci_estado IN (1,2,21)
--		AND aci.aci_codigo IN (5145)
;



--asaignaciones-carg-item
      WITH
      actividad AS (
        SELECT
          a.act_codigo, a.act_numero, a.ttr_codigo, a.act_estado,
          asi.asi_codigo, asi.asi_estado,
          iei.iua_codigo, iu.iua_estado,
          tt.ett_codigo
        FROM  estructura_poa.actividades a
          JOIN parametricas.tipos_trabajos tt ON a.ttr_codigo = tt.ttr_codigo
          LEFT JOIN ejecucion_informes.informes_uai iu ON iu.act_codigo = a.act_codigo
          LEFT JOIN ejecucion_informes.inicio_evaluacion_informe iei ON iei.iua_codigo = iu.iua_codigo
          LEFT JOIN ejecucion_informes.inicio_evaluacion_informe_asignaciones ieia ON ieia.iei_codigo = iei.iei_codigo
          LEFT JOIN ejecucion_poa.asignaciones asi ON ieia.asi_codigo = asi.asi_codigo
        WHERE TRUE
          AND asi.asi_codigo IN (1393)
          AND asi.asi_estado IN (21,1,2)
          LIMIT 1
      ),
      horas_actividad AS (
        SELECT a.act_codigo, a.act_horas_planificadas
        FROM estructura_poa.actividades a
        WHERE a.act_codigo IN (SELECT actividad.act_codigo FROM actividad)
      ),
      aci_horas AS (
        SELECT
          a.act_codigo,
          sum(aci.aci_horas) aci_horas_total -- ASIGNACION-CARGOS-ITEM
        FROM  estructura_poa.actividades a
          LEFT JOIN ejecucion_informes.informes_uai iu ON iu.act_codigo = a.act_codigo
          LEFT JOIN ejecucion_informes.inicio_evaluacion_informe iei ON iei.iua_codigo = iu.iua_codigo
          LEFT JOIN ejecucion_informes.inicio_evaluacion_informe_asignaciones ieia ON ieia.iei_codigo = iei.iei_codigo
          LEFT JOIN ejecucion_poa.asignaciones asi ON ieia.asi_codigo = asi.asi_codigo
          LEFT JOIN ejecucion_poa.asignaciones_cargos_item aci ON asi.asi_codigo = aci.asi_codigo
        WHERE TRUE
          AND a.act_codigo IN (SELECT actividad.act_codigo FROM actividad)
          AND aci.aci_estado IN (1, 2, 21)
          GROUP BY a.act_codigo
      )
      SELECT actividad.act_codigo,
          actividad.ttr_codigo,
          actividad.ett_codigo,
          horas_actividad.act_horas_planificadas,
          aci_horas.aci_horas_total::integer,
          (horas_actividad.act_horas_planificadas-aci_horas.aci_horas_total)::integer AS resta --horas disponibles
      FROM actividad
      JOIN horas_actividad USING (act_codigo)
      JOIN aci_horas USING (act_codigo)
      ;
     
--asaignaciones-carg-item
      WITH
      actividad AS (
        SELECT
          a.act_codigo, a.act_numero, a.ttr_codigo, a.act_estado,
          asi.asi_codigo, asi.asi_estado,
          iei.iua_codigo, iu.iua_estado,
          tt.ett_codigo
        FROM  estructura_poa.actividades a
          JOIN parametricas.tipos_trabajos tt ON a.ttr_codigo = tt.ttr_codigo
          LEFT JOIN ejecucion_informes.informes_uai iu ON iu.act_codigo = a.act_codigo
          LEFT JOIN ejecucion_informes.inicio_evaluacion_informe iei ON iei.iua_codigo = iu.iua_codigo
          LEFT JOIN ejecucion_informes.inicio_evaluacion_informe_asignaciones ieia ON ieia.iei_codigo = iei.iei_codigo
          LEFT JOIN ejecucion_poa.asignaciones asi ON ieia.asi_codigo = asi.asi_codigo
        WHERE TRUE
          AND asi.asi_codigo IN (1393)
          AND asi.asi_estado IN (21,1,2)
          LIMIT 1
      ),
      horas_actividad AS (
        SELECT a.act_codigo, a.act_horas_planificadas
        FROM estructura_poa.actividades a
        WHERE a.act_codigo IN (SELECT actividad.act_codigo FROM actividad)
      ),
      aci_horas AS (
        SELECT
          a.act_codigo,
          sum(aci.aci_horas) aci_horas_total -- ASIGNACION-CARGOS-ITEM
        FROM  estructura_poa.actividades a
          LEFT JOIN ejecucion_informes.informes_uai iu ON iu.act_codigo = a.act_codigo
          LEFT JOIN ejecucion_informes.inicio_evaluacion_informe iei ON iei.iua_codigo = iu.iua_codigo
          LEFT JOIN ejecucion_informes.inicio_evaluacion_informe_asignaciones ieia ON ieia.iei_codigo = iei.iei_codigo
          LEFT JOIN ejecucion_poa.asignaciones asi ON ieia.asi_codigo = asi.asi_codigo
          LEFT JOIN ejecucion_poa.asignaciones_cargos_item aci ON asi.asi_codigo = aci.asi_codigo
        WHERE TRUE
          AND a.act_codigo IN (SELECT actividad.act_codigo FROM actividad)
          AND aci.aci_estado IN (1, 2, 21)
          GROUP BY a.act_codigo
      )
      SELECT actividad.act_codigo,
          actividad.ttr_codigo,
          actividad.ett_codigo,
          horas_actividad.act_horas_planificadas,
          aci_horas.aci_horas_total::integer,
          (horas_actividad.act_horas_planificadas-aci_horas.aci_horas_total)::integer AS resta --horas disponibles
      FROM actividad
      JOIN horas_actividad USING (act_codigo)
      JOIN aci_horas USING (act_codigo)
      ;


--  EEEEEEEEEEEEEVALUACIONES
SELECT 	aci.aci_horas
FROM  	estructura_poa.actividades a
        LEFT JOIN ejecucion_informes.informes_uai iu ON iu.act_codigo = a.act_codigo
        LEFT JOIN ejecucion_informes.inicio_evaluacion_informe iei ON iei.iua_codigo = iu.iua_codigo
        LEFT JOIN ejecucion_informes.inicio_evaluacion_informe_asignaciones ieia ON ieia.iei_codigo = iei.iei_codigo
        LEFT JOIN ejecucion_poa.asignaciones asi ON ieia.asi_codigo = asi.asi_codigo
        LEFT JOIN ejecucion_poa.asignaciones_cargos_item aci ON asi.asi_codigo = aci.asi_codigo
WHERE 	TRUE
        AND a.act_codigo IN (2480)--2480
        AND aci.aci_estado IN (1, 2, 21);
--
SELECT
  a.act_codigo,
  sum(aci.aci_horas) aci_horas_total -- ASIGNACION-CARGOS-ITEM
FROM  estructura_poa.actividades a
  LEFT JOIN ejecucion_informes.informes_uai iu ON iu.act_codigo = a.act_codigo
  LEFT JOIN ejecucion_informes.inicio_evaluacion_informe iei ON iei.iua_codigo = iu.iua_codigo
  LEFT JOIN ejecucion_informes.inicio_evaluacion_informe_asignaciones ieia ON ieia.iei_codigo = iei.iei_codigo
  LEFT JOIN ejecucion_poa.asignaciones asi ON ieia.asi_codigo = asi.asi_codigo
  LEFT JOIN ejecucion_poa.asignaciones_cargos_item aci ON asi.asi_codigo = aci.asi_codigo
WHERE TRUE
  AND a.act_codigo IN (2480)
  AND aci.aci_estado IN (1, 2, 21)
  GROUP BY a.act_codigo;
--  AUDITORIAAAAAAAAAAAAAAA
SELECT 	aci.aci_horas, asi.asi_codigo 
FROM  	estructura_poa.actividades a
		LEFT JOIN ejecucion_actividades.inicio_actividad_poa iap ON a.act_codigo = iap.act_codigo
		LEFT JOIN ejecucion_actividades.inicio_actividad_poa_asignaciones iapa ON iap.iap_codigo = iapa.iap_codigo 
        LEFT JOIN ejecucion_poa.asignaciones asi ON iapa.asi_codigo = asi.asi_codigo
        LEFT JOIN ejecucion_poa.asignaciones_cargos_item aci ON asi.asi_codigo = aci.asi_codigo
WHERE 	TRUE
        AND a.act_codigo IN (2961)
        AND aci.aci_estado IN (1, 2, 21);
--
SELECT
  a.act_codigo,
  sum(aci.aci_horas) aci_horas_total -- ASIGNACION-CARGOS-ITEM
FROM  estructura_poa.actividades a
		LEFT JOIN ejecucion_actividades.inicio_actividad_poa iap ON a.act_codigo = iap.act_codigo
		LEFT JOIN ejecucion_actividades.inicio_actividad_poa_asignaciones iapa ON iap.iap_codigo = iapa.iap_codigo 
        LEFT JOIN ejecucion_poa.asignaciones asi ON iapa.asi_codigo = asi.asi_codigo
        LEFT JOIN ejecucion_poa.asignaciones_cargos_item aci ON asi.asi_codigo = aci.asi_codigo
WHERE TRUE
  AND a.act_codigo IN (2961)--2961
  AND aci.aci_estado IN (1, 2, 21)
  GROUP BY a.act_codigo;
--%%%%%%%%%%%%%%%%%%%%%%
SELECT
          a.act_codigo, a.act_numero, a.ttr_codigo, a.act_estado,
          asi.asi_codigo, asi.asi_estado,
          iei.iua_codigo, iu.iua_estado,
          tt.ett_codigo
        FROM  estructura_poa.actividades a
          JOIN parametricas.tipos_trabajos tt ON a.ttr_codigo = tt.ttr_codigo
          LEFT JOIN ejecucion_informes.informes_uai iu ON iu.act_codigo = a.act_codigo
          LEFT JOIN ejecucion_informes.inicio_evaluacion_informe iei ON iei.iua_codigo = iu.iua_codigo
          LEFT JOIN ejecucion_informes.inicio_evaluacion_informe_asignaciones ieia ON ieia.iei_codigo = iei.iei_codigo
          LEFT JOIN ejecucion_poa.asignaciones asi ON ieia.asi_codigo = asi.asi_codigo
        WHERE TRUE
          AND asi.asi_codigo IN (1393)
          AND asi.asi_estado IN (21,1,2)
          LIMIT 1;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	