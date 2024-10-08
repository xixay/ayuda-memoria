--inicio_actividad_poa
SELECT  
		iap.iap_codigo,
		iap.per_codigo_gerente,
		iap.per_codigo_responsable,
  		iap.iap_justificacion_ampliacion,
  		iap.iap_observaciones,
  		iap.tia_codigo,
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
        AND iap.iap_codigo IN (262);



SELECT 	*
FROM 	ejecucion_actividades.inicios_actividades ia 
;

SELECT 	*
FROM 	ejecucion_actividades.inicio_actividad_poa iap 
;
SELECT 	*
FROM 	estructura_poa.actividades a 
;
SELECT 	*
FROM 	parametricas.especificacion_tipos_trabajo ett 
;
SELECT 	*
FROM 	parametricas.tipos_trabajos tt 
;
SELECT 	*
FROM 	parametricas.tipos_inicios_actividades tia 
;
--
SELECT
      eiap.eiap_codigo, eiap.eiap_descripcion, eiap.eiap_detalle, eiap.iap_codigo, eiap.eiap_estado,
      eiap.usuario_registro, eiap.fecha_registro, TO_CHAR(eiap.fecha_registro, 'dd/mm/yyyy') AS fecha_registro_format
FROM	control_estados.estados_inicio_actividad_poa eiap
WHERE	TRUE
      AND eiap.iap_codigo IN (262)
      AND eiap.eiap_estado IN (18)
ORDER BY eiap.fecha_registro DESC;
--
SELECT 	
		a.asi_codigo , a.asi_detalle_asignaciones_cargos_items, a.asi_estado,
		aci.aci_codigo, aci.aci_horas, aci.cit_codigo, aci.aci_estado,
		iapa.iapa_codigo, iapa.iapa_estado,
		iap.iap_codigo ,iap.iap_estado, iap.iac_codigo, iap.act_codigo, iap.tia_codigo 
FROM 	ejecucion_poa.asignaciones a
		LEFT JOIN ejecucion_poa.asignaciones_cargos_item aci ON a.asi_codigo = aci.asi_codigo
		LEFT JOIN ejecucion_actividades.inicio_actividad_poa_asignaciones iapa ON a.asi_codigo = iapa.asi_codigo 
		LEFT JOIN ejecucion_actividades.inicio_actividad_poa iap ON iapa.iap_codigo = iap.iap_codigo 
WHERE 	TRUE 
		AND a.asi_estado IN (5)
		AND iap.iap_codigo NOTNULL
		AND iap.tia_codigo IN (1)
;









