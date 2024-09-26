SELECT 	*
FROM 	estructura_poa.actividades a
ORDER BY a.act_codigo DESC
;

SELECT	*
FROM 	estructura_poa.actividades_continuidad ac 
WHERE 	TRUE
--		AND ac.aco_codigo IN (398)
ORDER BY ac.aco_codigo DESC
;

SELECT 	*
FROM 	ejecucion_actividades.inicios_actividades ia
WHERE 	TRUE
--		AND ia.iac_codigo IN (309)
--		AND ia.iac_alcance IS NULL
--		AND ia.iac_codigo_control LIKE 'K4GP'
ORDER BY ia.iac_codigo DESC
;

SELECT 	*
FROM 	ejecucion_actividades.actividad_migrada_conaud amc
ORDER BY amc.amc_codigo DESC
;

--############################################
        SELECT
              t.iac_codigo,
              t.iac_correlativo,
              t.iac_codigo_control,
              t.iac_codigo_control_vista,
              t.iac_objeto,
              t.iac_objetivo,
              COALESCE(t.iac_alcance, '') AS iac_alcance,
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
              AND t.iac_codigo IN (701)
        ORDER BY t.fecha_registro DESC
        ;

       
SELECT 	*
FROM 	estructura_organizacional.cargos_items_persona cip
ORDER BY cip.cip_codigo DESC
;

--
          WITH tmp_cargo_item_persona as ( -- Filtro de cargos items persona
            SELECT cip.cip_codigo, cip.cip_estado, cip.cit_codigo, cip.per_codigo
            FROM estructura_organizacional.cargos_items_persona cip
            --WHERE cip_estado NOT IN (0,5)
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
          FROM    estructura_organizacional.cargos_items t
                  LEFT JOIN parametricas.estados e ON e.est_codigo = t.cit_estado
                  LEFT JOIN estructura_organizacional.areas_unidades au ON au.aun_codigo = t.aun_codigo
                  LEFT JOIN estructura_organizacional.cargos c ON c.car_codigo = t.car_codigo
                  LEFT JOIN parametricas.tipos_cargos tc ON tc.tca_codigo = c.tca_codigo
                  LEFT JOIN estructura_organizacional.items i  ON i.ite_codigo = t.ite_codigo
                  LEFT JOIN tmp_cargo_item_persona cip  ON cip.cit_codigo = t.cit_codigo
          WHERE   TRUE
		          AND cip.cip_estado IN (2)
                  AND t.cit_codigo IN (134,125,144,152,153)
          ORDER BY t.fecha_registro;


