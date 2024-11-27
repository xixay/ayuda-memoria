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
                 -- CASO EDICIÓN DE HORAS, NO TOMAR EN CUENTA
          GROUP BY amh.act_codigo_disminucion
        )
        SELECT
              t.act_codigo,
              t.act_estado,
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
              AND t.act_codigo IN (4839)
              AND t.act_estado IN (2)
        ORDER BY t.act_codigo
        ;
