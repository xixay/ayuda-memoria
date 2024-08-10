SELECT	*--aci.*
FROM	ejecucion_poa.asignaciones_cargos_item aci
		LEFT JOIN estructura_organizacional.cargos_items_persona cip ON aci.cit_codigo = cip.cit_codigo
WHERE	TRUE
--		AND cip.cip_estado NOT IN (5)
--		AND aci.asi_codigo = 1384--ELIMINO CLAUDIA VERONICA AILLON CRESPO aci_codigo=5121
--		AND aci.asi_codigo = 1222--
		AND aci.asi_codigo = 386
;
--CARGOS ITEM
SELECT 	*
FROM 	estructura_organizacional.cargos_items ci
WHERE 	ci.cit_codigo IN (556,477,493,439,393,108)
;
--
SELECT 	*
FROM 	ejecucion_poa.asignaciones_cargos_item aci 
WHERE 	TRUE
		AND aci.asi_codigo IN (1387)
;
--
SELECT 	*
FROM 	estructura_organizacional.cargos_items_persona cip
WHERE 	TRUE 
		AND cip.cit_codigo IN (452)
;

SELECT *, iapa.asi_codigo 
FROM ejecucion_actividades.inicio_actividad_poa_asignaciones iapa
WHERE iapa.iap_codigo = 155
;

SELECT 	*
FROM 	ejecucion_actividades.inicio_actividad_poa iap
WHERE 	TRUE 
		AND iap.iap_codigo IN (155)
;

SELECT 	a.act_codigo, a.act_numero, a.act_estado,
		au.aun_codigo, au.aun_sigla 
FROM 	estructura_poa.actividades a 
		LEFT JOIN estructura_organizacional.areas_unidades au ON a.aun_codigo_ejecutora = au.aun_codigo 
WHERE 	TRUE 
		AND a.act_codigo IN (1326)
;
SELECT	aci.*
FROM	ejecucion_poa.asignaciones_cargos_item aci
		LEFT JOIN estructura_organizacional.cargos_items_persona cip ON aci.cit_codigo = cip.cit_codigo
WHERE	TRUE
--		AND aci.asi_codigo = 162
		AND aci.per_codigo NOTNULL 
;
  WITH tmp_cargo_item_persona as ( -- Filtro de cargos items persona
    SELECT cip.cip_codigo, cip.cip_estado, cip.cit_codigo, cip.per_codigo
    FROM estructura_organizacional.cargos_items_persona cip
    WHERE cip_estado NOT IN (0)
  )
  SELECT
    t.cit_codigo,
    t.cit_descripcion,
    t.car_codigo,
    t.ite_codigo,
    t.aun_codigo,
    t.cit_estado,
    au.aun_nombre,
    au.aun_sigla,
    CONCAT_WS(' - ', au.aun_sigla, au.aun_nombre) AS aun_concatenado,
    CONCAT_WS(' - ', au.aun_nombre, au.aun_sigla) AS aun_concatenado_invert,
    au.aun_numero,
    ( CASE WHEN (t.cit_estado = 42) THEN CONCAT( c.car_nombre, ' (', e.est_nombre,')' ) ELSE c.car_nombre END ) AS car_nombre,
    c.car_alias,
    tc.tca_nombre,
    i.ite_descripcion,
    i.ite_numero,
    CONCAT_WS(' - ', i.ite_numero, c.car_nombre) car_nombre_item,
    cip.cip_codigo,
    cip.cip_estado,
    cip.per_codigo,
    e.est_color,
    e.est_nombre AS cit_estado_descripcion
  FROM estructura_organizacional.cargos_items t
  LEFT JOIN parametricas.estados e ON e.est_codigo = t.cit_estado
  LEFT JOIN estructura_organizacional.areas_unidades au ON au.aun_codigo = t.aun_codigo
  LEFT JOIN estructura_organizacional.cargos c ON c.car_codigo = t.car_codigo
  LEFT JOIN parametricas.tipos_cargos tc ON tc.tca_codigo = c.tca_codigo
  LEFT JOIN estructura_organizacional.items i  ON i.ite_codigo = t.ite_codigo
  LEFT JOIN tmp_cargo_item_persona cip  ON cip.cit_codigo = t.cit_codigo
  WHERE TRUE
--  AND t.cit_codigo IN (56,416,452,63,564,208)
    AND t.cit_codigo IN (491,468,547,559,108)
  ORDER BY t.fecha_registro;
--OBTIENE LOS DETALLES DE F1 que se quedo historico con iapCodigo
SELECT
  		t.iap_codigo, t.iap_estado, t.iac_codigo , t.act_codigo, au.aun_sigla, t.tia_codigo, t.iap_fecha_aprobacion,
  		a2.act_numero, 
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
where	true
		and t.tia_codigo in (2)
--		and t.act_codigo in (1121)
--		and	t.act_codigo = 1448
--		and t.act_codigo = 1200
--		and t.act_codigo = 1181
--		and	t.act_codigo = 1156 --no da
--		and t.act_codigo in (933) 
ORDER BY t.fecha_registro DESC
;
		
		
		
		
		
		
		
		
		
		
		