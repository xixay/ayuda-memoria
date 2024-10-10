--inicio_actividad_poa
SELECT  
		iap.iap_codigo,
		iap.per_codigo_gerente,
		iap.per_codigo_responsable,
  		iap.iap_justificacion_ampliacion,
  		iap.iap_observaciones,
  		iap.tia_codigo,
  		TO_CHAR(iap.iap_fecha_aprobacion, 'dd/mm/yyyy') AS fecha_aprobacion,
  		ia.iac_codigo,
  		ia.iac_codigo_control_vista AS iac_codigo_control,
  		ia.iac_objeto,
  		ia.iac_objetivo,
  		ia.iac_alcance,
  		ia.iac_dias_habiles, ia.iac_dias_calendario,
  		TO_CHAR(ia.iac_fecha_inicio, 'dd/mm/yyyy') AS iac_fecha_inicio,
  		TO_CHAR(ia.iac_mes_inicio, 'MM/YYYY') AS mes_inicio,  -- Formato MM/YYYY
  		TO_CHAR(ia.iac_fecha_borrador, 'dd/mm/yyyy') AS iac_fecha_borrador,
 		TO_CHAR(ia.iac_fecha_emision, 'dd/mm/yyyy') AS iac_fecha_emision,
  		TO_CHAR(ia.iac_mes_fin, 'MM/YYYY') AS mes_fin,  -- Formato MM/YYYY
  		ia.iac_observaciones,
  		ia.iac_recomendacion_seguir,
  		ia.iac_migrado,
  		a.act_codigo,
  		a.act_numero,
		CONCAT_WS('.',
		  split_part(a.act_numero, '.', 1),
		  split_part(a.act_numero, '.', 2),
		  split_part(a.act_numero, '.', 3)
		) AS cod_areas,
		split_part(a.act_numero, '.', 4) AS cod_correlativo,
		split_part(a.act_numero, '.', 5) AS cod_gestion,
		a.ent_codigo,
		a.ent_descripcion AS entidad_nombre,
		a.act_denuncia,
		a.act_horas_planificadas, 
		g.ges_anio,
		tt.ttr_sigla,
		(
    	CASE
      		WHEN (a.tipact_codigo = 2 ) THEN 1
      		ELSE 0 END
        ) AS bandera_continuidad,
		tt.ttr_descripcion,
		tt.ett_codigo,
		iap.iap_estado
FROM    ejecucion_actividades.inicio_actividad_poa iap
        LEFT JOIN ejecucion_actividades.inicios_actividades ia ON iap.iac_codigo = ia.iac_codigo
        LEFT JOIN estructura_poa.actividades a ON iap.act_codigo = a.act_codigo
        LEFT JOIN parametricas.gestiones g ON ia.ges_codigo = g.ges_codigo
        LEFT JOIN parametricas.tipos_trabajos tt ON a.ttr_codigo = tt.ttr_codigo 
WHERE   TRUE
--		AND ia.iac_migrado IN (true)
--		AND iap.tia_codigo IN (1)
        AND iap.iap_codigo IN (785)
--		AND iap.iap_fecha_aprobacion NOTNULL 
;
SELECT 	*
FROM 	ejecucion_poa.asignaciones_cargos_item aci 



SELECT 	*
FROM 	ejecucion_actividades.inicios_actividades ia 
;
--//////////////////
SELECT 	*
FROM 	ejecucion_actividades.inicio_actividad_poa iap
WHERE 	iap.act_codigo IN (2939)
--		AND iap_estado IN (5)
--		AND iap.tia_codigo IN (1)
;
--***********************
SELECT 	*
FROM 	ejecucion_actividades.inicio_actividad_poa_asignaciones iapa 
WHERE 	TRUE 
--		AND iapa.asi_codigo IN (637)
--		AND iapa.iap_codigo IN (393)
--		AND iapa.iap_codigo IN (707)
		AND iapa.iap_codigo IN (695)
;
--asignaciones
SELECT 	*
FROM 	ejecucion_poa.asignaciones a
WHERE 	TRUE 
--		AND a.asi_estado IN (5)
--		AND a.asi_codigo IN (637)
--		AND a.asi_codigo IN (1534)
		AND a.asi_codigo IN (1518)	
ORDER BY a.asi_codigo DESC
;
--asignacion cargos item
SELECT 	*
FROM 	ejecucion_poa.asignaciones_cargos_item aci 
WHERE 	aci.aci_codigo IN (2536)
;
SELECT 	*
FROM 	estructura_poa.actividades a 
WHERE 	a.act_codigo IN (2939)
;
--asignaciones horas usadas
SELECT 	*
FROM 	ejecucion_poa.asignaciones_horas_usadas ahu
WHERE 	ahu.aci_codigo IN (5704)
;
--reposicion
SELECT 	*
FROM 	ejecucion_poa.reposicion_cargos_item rci
WHERE 	rci.aci_codigo IN (5704)
;


