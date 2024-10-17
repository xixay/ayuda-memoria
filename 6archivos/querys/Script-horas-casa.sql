SELECT 	*
FROM 	estructura_poa.actividades a 
WHERE 	TRUE 
--		AND a.act_codigo IN (2606)
		AND a.act_codigo IN (4787)
ORDER BY a.act_codigo DESC  
;
SELECT 	--*
		amh.amh_codigo, amh.amh_horas, amh.amh_estado,
		aa.act_codigo AS act_codigo_actividad, aa.act_numero AS act_numero_actividad, aa.act_descripcion AS act_descripcion_actividad,
		aa.act_horas_planificadas AS act_horas_planificadas_actividad,
		ad.act_codigo AS act_codigo_bolsa, ad.act_numero AS act_numero_bolsa, ad.act_descripcion AS act_descripcion_bolsa,
		ad.act_horas_planificadas AS act_horas_planificadas_bolsa,
		au.aun_sigla,
		(COALESCE(aa.act_horas_planificadas, 0) + COALESCE(amh.amh_horas, 0))::INT AS horas_disponibles_actividad,
        (COALESCE(ad.act_horas_planificadas, 0) - COALESCE(amh.amh_horas, 0))::INT AS horas_disponibles_bolsa
FROM 	estructura_poa.actividades_movimientos_horas amh
		LEFT JOIN estructura_poa.actividades aa ON amh.act_codigo_adicion = aa.act_codigo 
		LEFT JOIN estructura_poa.actividades ad ON amh.act_codigo_disminucion = ad.act_codigo
		LEFT JOIN estructura_organizacional.areas_unidades au ON aa.aun_codigo_ejecutora = au.aun_codigo 
;
SELECT 	*
FROM 	estructura_poa.actividades_movimientos_horas amh 
;
SELECT 	*
FROM 	parametricas.tipo_movimientos_horas tmh ;	

INSERT INTO estructura_poa.actividades_movimientos_horas
(amh_codigo, act_codigo_adicion, act_codigo_disminucion, amh_horas, tmh_codigo, amh_estado, usuario_registro)
VALUES(1, 4787, 2606, 1074, 1, 1, 0);

INSERT INTO estructura_poa.actividades_movimientos_horas
(amh_codigo, act_codigo_adicion, act_codigo_disminucion, amh_horas, tmh_codigo, amh_estado, usuario_registro)
VALUES(2, 4793, 2606, 1074, 1, 1, 0);









        WITH tmp_actividad AS (
          SELECT
                a.act_codigo_bolsa, SUM(a.act_horas_planificadas) AS suma_horas,
                COALESCE(SUM(inicio_auditoria.horas_auditorias), 0) AS horas_auditorias,
                COALESCE(SUM(inicio_evaluacion.horas_evaluaciones), 0) AS horas_evaluaciones,
                COALESCE(SUM(inicio_auditoria.horas_auditorias), 0) + COALESCE(SUM(inicio_evaluacion.horas_evaluaciones), 0) AS horas_comision
          FROM  estructura_poa.actividades a
                LEFT JOIN (
                  SELECT        iap.act_codigo, SUM(aci.aci_horas) AS horas_auditorias
                  FROM  ejecucion_actividades.inicio_actividad_poa iap
                        LEFT JOIN ejecucion_actividades.inicio_actividad_poa_asignaciones iapa ON iap.iap_codigo = iapa.iap_codigo
                        LEFT JOIN ejecucion_poa.asignaciones_cargos_item aci ON iapa.asi_codigo = aci.asi_codigo AND aci.aci_estado NOT IN (0,5,9)
                  WHERE TRUE
                        AND iap.iap_estado NOT IN (0,5,9)
                  GROUP BY iap.act_codigo
                  ORDER BY iap.act_codigo
                ) inicio_auditoria ON a.act_codigo = inicio_auditoria.act_codigo
                LEFT JOIN (
                  SELECT        iu.act_codigo, SUM(aci.aci_horas) AS horas_evaluaciones
                  FROM  ejecucion_informes.informes_uai iu
                        LEFT JOIN ejecucion_informes.inicio_evaluacion_informe iei ON iu.iua_codigo = iei.iua_codigo AND iei.iei_estado NOT IN (0,5,9)
                        LEFT JOIN ejecucion_informes.inicio_evaluacion_informe_asignaciones ieia ON iei.iei_codigo = ieia.iei_codigo
                        LEFT JOIN ejecucion_poa.asignaciones_cargos_item aci ON ieia.asi_codigo = aci.asi_codigo AND aci.aci_estado NOT IN (0,5,9)
                  WHERE TRUE
                        AND iu.iua_estado NOT IN (0,5,9)
                  GROUP BY iu.act_codigo
                  ORDER BY iu.act_codigo
                ) inicio_evaluacion ON a.act_codigo = inicio_evaluacion.act_codigo
          WHERE TRUE
                AND a.act_codigo_bolsa IN (2606)
                AND a.act_estado IN (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18)
          GROUP BY a.act_codigo_bolsa
        )
        SELECT
              t.act_codigo,
              t.act_numero,
              t.act_descripcion,
              t.act_horas_planificadas AS horas_iniciales,
              COALESCE(ta.suma_horas, 0)::INT AS suma_horas,
              (COALESCE(t.act_horas_planificadas, 0) - COALESCE(ta.suma_horas, 0))::INT AS horas_disponibles,
              (COALESCE(t.act_horas_planificadas, 0) - COALESCE(ta.horas_comision, 0))::INT AS horas_disponibles_comision,
              au.aun_sigla
        FROM    estructura_poa.actividades t
              LEFT JOIN estructura_organizacional.areas_unidades au ON t.aun_codigo_ejecutora = au.aun_codigo
              LEFT JOIN tmp_actividad ta on ta.act_codigo_bolsa = t.act_codigo
        WHERE   TRUE
              AND t.act_codigo IN (2606)
              AND t.act_estado IN (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18)
        ;























