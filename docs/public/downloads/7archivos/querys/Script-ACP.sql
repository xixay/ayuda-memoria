SELECT 	
	oau.oau_codigo,oau_descripcion,oau.aun_codigo_ejecutora, oau.oau_estado,
	au.aun_sigla, 
	po.pobj_codigo, po.pobj_estado
FROM 	estructura_poa.objetivos_area_unidad oau
	LEFT JOIN estructura_organizacional.areas_unidades au ON oau.aun_codigo_ejecutora = au.aun_codigo 
	LEFT JOIN estructura_poa.poas_objetivos po ON oau.pobj_codigo = po.pobj_codigo
WHERE 	TRUE
	AND oau.pobj_codigo IN (1067)
ORDER BY oau.oau_codigo DESC
;
SELECT 	*
FROM 	estructura_poa.actividades a 
WHERE 	TRUE
ORDER BY a.act_codigo DESC
;

SELECT  iap.iap_codigo,
        ia.iac_codigo, ia.iac_codigo_control_vista AS iac_codigo_control,
        a.act_codigo, a.act_numero,
        iap.per_codigo_gerente, iap.per_codigo_responsable,
        CONCAT_WS('.', 
            split_part(a.act_numero, '.', 1),
            split_part(a.act_numero, '.', 2),
            split_part(a.act_numero, '.', 3)
        ) AS cod_areas,
        split_part(a.act_numero, '.', 4) AS cod_correlativo,
        split_part(a.act_numero, '.', 5) AS cod_gestion,
        a.ent_descripcion AS entidad_nombre,
        a.act_denuncia,
        ia.iac_objeto,
        ia.iac_objetivo,
        ia.iac_alcance,
        TO_CHAR(ia.iac_fecha_inicio, 'dd/mm/yyyy') AS iac_fecha_inicio,
        ia.iac_dias_habiles,
        ia.iac_dias_calendario,
        TO_CHAR(ia.iac_mes_inicio, 'MM/YYYY') AS mes_inicio,  -- Formato MM/YYYY
        TO_CHAR(ia.iac_fecha_borrador, 'dd/mm/yyyy') AS iac_fecha_borrador,
        TO_CHAR(ia.iac_fecha_emision, 'dd/mm/yyyy') AS iac_fecha_emision,
        TO_CHAR(ia.iac_mes_fin, 'MM/YYYY') AS mes_fin,  -- Formato MM/YYYY
        g.ges_anio,
        tt.ttr_sigla,
        (
        	CASE
	        	WHEN (a.tipact_codigo = 2 ) THEN 1
	        	ELSE 0 END
        ) AS bandera_continuidad,
        tt.ttr_descripcion, 
        iap.iap_justificacion_ampliacion,
        iap.iap_observaciones,
        ia.iac_observaciones, 
        iap.iap_estado
FROM    ejecucion_actividades.inicio_actividad_poa iap
        LEFT JOIN ejecucion_actividades.inicios_actividades ia ON iap.iac_codigo = ia.iac_codigo
        LEFT JOIN estructura_poa.actividades a ON iap.act_codigo = a.act_codigo
        LEFT JOIN parametricas.gestiones g ON ia.ges_codigo = g.ges_codigo
        LEFT JOIN parametricas.tipos_trabajos tt ON a.ttr_codigo = tt.ttr_codigo 
WHERE   TRUE
        AND iap.iap_codigo IN (262);
