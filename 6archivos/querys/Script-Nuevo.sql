SELECT 	*
FROM 	estructura_poa.actividades a
--WHERE 	a.act_codigo IN (2982)
ORDER BY a.act_codigo DESC
;

SELECT 	*
FROM 	estructura_poa.actividades_continuidad ac 
ORDER BY ac.aco_codigo DESC
;

SELECT 	*
FROM 	ejecucion_actividades.inicios_actividades ia
ORDER BY ia.iac_codigo DESC 
;

SELECT 	iap.iap_codigo ,iap.iap_estado ,iap.act_codigo,iap.iac_codigo,
		ia.iac_estado 
FROM 	ejecucion_actividades.inicio_actividad_poa iap 
		LEFT JOIN ejecucion_actividades.inicios_actividades ia ON iap.iac_codigo = ia.iac_codigo 
WHERE 	TRUE 
--		AND iap.act_codigo IN (4742)
		AND iap.iap_codigo IN (617)
--		AND ia.iac_codigo IN (637)
ORDER BY iap.iap_codigo DESC
;
SELECT 	*
FROM 	parametricas.estados e ;
SELECT 	*
FROM 	parametricas.tipos_inicios_actividades tia 
;

SELECT 	*
FROM 	control_estados.flujos_tablas ft
WHERE 	TRUE 
--		AND ft.tab_codigo IN (65)
ORDER BY ft.fta_codigo DESC
;


INSERT INTO control_estados.flujos_tablas (fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro) VALUES((select max(fta_codigo)+1 from control_estados.flujos_tablas), 65, '', 21, 21, 1, 0);


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
FROM    ejecucion_actividades.inicios_actividades t
      LEFT JOIN ejecucion_actividades.inicios_actividades_adicional iaa ON t.iac_codigo = iaa.iac_codigo
      LEFT JOIN parametricas.estados e ON t.iac_estado = e.est_codigo
      LEFT JOIN parametricas.gestiones g ON t.ges_codigo = g.ges_codigo
      LEFT JOIN parametricas.tipos_trabajos tt ON t.ttr_codigo = tt.ttr_codigo
WHERE   TRUE
      AND t.iac_codigo IN (637)
--      AND t.iac_estado IN (1, 22, 11)
ORDER BY t.fecha_registro DESC
;




