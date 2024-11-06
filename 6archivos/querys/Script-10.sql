SELECT 	a.act_codigo,a.act_estado  
FROM 	estructura_poa.actividades a 
WHERE 	TRUE
		AND a.pobj_codigo IN (779)
		AND a.aun_codigo_ejecutora IN (4)
		AND a.cac_codigo IN (2)
;
--
SELECT 	*
FROM 	estructura_poa.actividades_movimientos_horas amh 
WHERE 	amh.act_codigo_adicion IN (4835)
;
--##########################################################
        SELECT
              po.pobj_codigo,
              --COALESCE(SUM(a.act_horas_planificadas), 0) AS total_horas_planificadas,
              COALESCE(SUM(a.horas_total), 0) AS total_horas_planificadas
        FROM    estructura_poa.poas_objetivos po
              LEFT JOIN (
                SELECT  act.*, act.act_horas_planificadas - COALESCE(SUM(actbolsa.act_horas_planificadas), 0) AS horas_total
                FROM  estructura_poa.actividades act
                      LEFT JOIN estructura_poa.actividades actbolsa ON act.act_codigo = actbolsa.act_codigo_bolsa
                                                                        AND actbolsa.act_estado NOT IN (0, 9, 46, 47)
                WHERE   TRUE
                GROUP BY act.act_codigo
              ) a ON po.pobj_codigo = a.pobj_codigo
        WHERE   TRUE
              AND po.pobj_codigo IN (779)
              AND a.aun_codigo_ejecutora IN (4)
              AND a.act_estado NOT IN (0, 5, 9, 47)
        GROUP BY po.pobj_codigo
;
--&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&6
        WITH
        tmp_adicion AS (
          SELECT
                amh.act_codigo_adicion AS act_codigo,
                COALESCE(SUM(amh.amh_horas), 0) AS horas_adicion
          FROM  estructura_poa.actividades_movimientos_horas amh
          WHERE TRUE
                AND amh.amh_estado NOT IN (0,5,9)
                AND amh.tmh_codigo NOT IN (1) -- NO SUMA CUANDO ES F21
          GROUP BY amh.act_codigo_adicion
        ),
        tmp_disminucion AS (
          SELECT
                amh.act_codigo_disminucion AS act_codigo,
                COALESCE(SUM(amh.amh_horas), 0) AS horas_disminucion
          FROM  estructura_poa.actividades_movimientos_horas amh
          WHERE TRUE
                AND amh.amh_estado NOT IN (0,5,9)
                AND amh.amh_codigo NOT IN (9) -- CASO EDICIÓN DE HORAS, NO TOMAR EN CUENTA
          GROUP BY amh.act_codigo_disminucion
        )
        SELECT
              t.act_codigo,
              t.act_numero,
              t.aun_codigo_ejecutora,
              au.aun_sigla,
              t.act_horas_planificadas AS horas_planificadas,
              (t.act_horas_planificadas + (COALESCE(tmp_adicion.horas_adicion, 0) - COALESCE(tmp_disminucion.horas_disminucion, 0)))::INT AS horas_calculo_movimiento
        FROM    estructura_poa.actividades t
              LEFT JOIN estructura_organizacional.areas_unidades au ON t.aun_codigo_ejecutora = au.aun_codigo
              LEFT JOIN tmp_adicion ON t.act_codigo = tmp_adicion.act_codigo
              LEFT JOIN tmp_disminucion ON t.act_codigo = tmp_disminucion.act_codigo
        WHERE   TRUE
              AND t.act_codigo IN (1797)
        ORDER BY t.act_codigo
        ;
