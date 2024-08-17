SELECT 	DISTINCT 
		ia.iac_codigo,
    	ia.iac_codigo_control AS trabajo_codigo,
    	ia.iac_objeto AS auditoria_objeto,
    	ia.iac_objetivo AS auditoria_objetivo,
    	g.ges_anio AS actividad_gestion
FROM 	ejecucion_actividades.inicios_actividades ia
		LEFT JOIN estructura_poa.actividades_continuidad ac ON ia.iac_codigo = ac.iac_codigo
		LEFT JOIN parametricas.gestiones g ON ia.ges_codigo = g.ges_codigo 
WHERE 	ia.iac_estado NOT IN (0)
		AND ia.iac_codigo_control LIKE '%Y24';
--		AND ia.iac_codigo_control LIKE '%Y22';
--		AND ia.iac_codigo_control LIKE 'GCEP69Y22';
--		AND ia.iac_codigo_control LIKE '%J23';
	

	
SELECT DISTINCT 
    ac.conaud_detalle->>'entidad_descripcion' AS entidad_descripcion
FROM 
    ejecucion_actividades.inicios_actividades ia
    LEFT JOIN estructura_poa.actividades_continuidad ac ON ia.iac_codigo = ac.iac_codigo
WHERE 
    ia.iac_codigo_control LIKE 'GCEP69Y22'
    AND ac.conaud_detalle->>'trabajo_codigo' = ia.iac_codigo_control;


SELECT 	ac.aco_codigo , ac.aco_estado , ac.conaud_codigo , ac.conaud_correlativo, ac.conaud_detalle, ac.act_codigo , ac.iac_codigo ,
		ia.iac_codigo_control 
FROM 	estructura_poa.actividades_continuidad ac
		LEFT JOIN ejecucion_actividades.inicios_actividades ia ON ac.iac_codigo = ia.iac_codigo
WHERE 	TRUE 
		AND ia.iac_estado NOT IN (0)
		AND ac.iac_codigo IN (117)
--		AND ia.iac_codigo_control LIKE '%Y22'
--		AND ia.iac_codigo_control LIKE '%J23'
ORDER BY ac.aco_codigo DESC 
;


SELECT	DISTINCT 
		ia.iac_codigo,
    	ac.conaud_detalle->>'entidad_descripcion' AS entidad_descripcion
FROM 	ejecucion_actividades.inicios_actividades ia
		LEFT JOIN estructura_poa.actividades_continuidad ac ON ia.iac_codigo = ac.iac_codigo
WHERE 	ia.iac_estado NOT IN (0)
--		AND ia.iac_codigo_control LIKE 'GCEP69Y22';
		AND ia.iac_codigo IN (631);
	
SELECT 	ac.aco_codigo , ac.conaud_codigo , ac.conaud_correlativo, ac.conaud_detalle,ac.iac_codigo 
FROM 	estructura_poa.actividades_continuidad ac
WHERE 	ac.aco_codigo IN (320)
ORDER BY ac.aco_codigo DESC
;

SELECT 	*--ia.iac_codigo , ia.iac_correlativo , ia.iac_codigo_control 
FROM 	ejecucion_actividades.inicios_actividades ia
WHERE 	TRUE 
--		AND ia.iac_codigo_control LIKE 'P5FP41Y22'
		AND ia.iac_codigo IN  (631)
ORDER BY ia.iac_codigo DESC
;

SELECT 	*
FROM 	estructura_poa.actividades a 
ORDER BY a.act_codigo DESC ;

SELECT 	*
FROM 	ejecucion_poa.asignaciones_cargos_item aci
WHERE 	aci.aci_codigo IN (38);


        SELECT
              t.iac_codigo,
              t.iac_correlativo,
              t.iac_codigo_control,
              t.iac_codigo_control_vista,
              t.iac_objeto,
              t.iac_objetivo,
              t.iac_alcance,
              t.iac_migrado,
              t.iac_observaciones,
              TO_CHAR(t.iac_fecha_inicio, 'dd/mm/yyyy') AS iac_fecha_inicio,
              t.ttr_codigo, tt.ttr_sigla, tt.ttr_descripcion,
              t.iac_dias_habiles,
              t.iac_dias_calendario,
              TO_CHAR(t.iac_fecha_fin, 'dd/mm/yyyy') AS iac_fecha_fin,
              t.ttr_codigo,
              TO_CHAR(t.iac_mes_inicio, 'dd/mm/yyyy') AS iac_mes_inicio,
              TO_CHAR(t.iac_mes_fin, 'dd/mm/yyyy') AS iac_mes_fin,
              TO_CHAR(t.iac_mes_inicio, 'mm/yyyy') AS mes_inicio,
              TO_CHAR(t.iac_mes_fin, 'mm/yyyy') AS mes_fin,
              TO_CHAR(t.iac_fecha_borrador, 'dd/mm/yyyy') AS iac_fecha_borrador,
              TO_CHAR(t.iac_fecha_emision, 'dd/mm/yyyy') AS iac_fecha_emision,
              t.ges_codigo,
              g.ges_anio,
              t.iac_estado,
              e.est_color,
              e.est_nombre AS iac_estado_descripcion,
              TO_CHAR(t.iac_fecha_inicio_historico, 'dd/mm/yyyy') AS iac_fecha_inicio_historico,
              TO_CHAR(t.fecha_registro, 'HH24:MI am dd/mm/yyyy') AS fecha_registro,
              COALESCE(iaa.iaa_codigo, 0) iaa_codigo,
              t.iac_recomendacion_seguir,
              t.usuario_registro,
              t.usuario_modificacion,
              TO_CHAR(t.fecha_modificacion, 'HH24:MI am dd/mm/yyyy') AS fecha_modificacion
        FROM	ejecucion_actividades.inicios_actividades t
              LEFT JOIN ejecucion_actividades.inicios_actividades_adicional iaa ON t.iac_codigo = iaa.iac_codigo
              LEFT JOIN parametricas.estados e ON t.iac_estado = e.est_codigo
              LEFT JOIN parametricas.gestiones g ON t.ges_codigo = g.ges_codigo
              LEFT JOIN parametricas.tipos_trabajos tt ON t.ttr_codigo = tt.ttr_codigo
        WHERE	TRUE
              AND t.iac_codigo IN (631)
        ORDER BY t.fecha_registro DESC
        ;



