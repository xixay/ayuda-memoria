SELECT 	*
FROM 	estructura_poa.actividades a 
WHERE 	TRUE 
		AND a.act_codigo IN (2840)
--		AND a.act_codigo IN (2839)
--		AND a.act_codigo IN (2838)
ORDER BY a.act_codigo DESC  
;
SELECT 	--*
		amh.amh_codigo, amh.act_codigo_adicion, amh.act_codigo_disminucion, amh.amh_horas,amh.amh_estado,
		tmh.tmh_descripcion,
		e.est_color,
        e.est_nombre AS amh_estado_descripcion
FROM 	estructura_poa.actividades_movimientos_horas amh
		LEFT JOIN parametricas.tipo_movimientos_horas tmh ON amh.tmh_codigo = tmh.tmh_codigo
		LEFT JOIN parametricas.estados e ON e.est_codigo = amh.amh_estado
;
SELECT 	*
FROM 	estructura_poa.actividades_movimientos_horas amh 
;
SELECT 	*
FROM 	parametricas.tipo_movimientos_horas tmh ;	

INSERT INTO estructura_poa.actividades_movimientos_horas
(amh_codigo, act_codigo_adicion, act_codigo_disminucion, amh_horas, tmh_codigo, amh_estado, usuario_registro)
VALUES(1, 4793, 2840, 100, 1, 1, 0);

SELECT 	*
FROM 	estructura_poa.actividades a 
ORDER BY a.act_codigo DESC;

--######################################################################################################
WITH tmp_actividad AS (
	SELECT
	    	a.act_codigo,
	    	COALESCE(SUM(inicio_auditoria.horas_auditorias), 0) AS horas_auditorias,
	    	COALESCE(SUM(inicio_evaluacion.horas_evaluaciones), 0) AS horas_evaluaciones,
	    	COALESCE(SUM(inicio_auditoria.horas_auditorias), 0) + COALESCE(SUM(inicio_evaluacion.horas_evaluaciones), 0) AS horas_comision
	FROM 	estructura_poa.actividades a
			LEFT JOIN (
			    SELECT 
			        	iap.act_codigo,
			        	SUM(aci.aci_horas) AS horas_auditorias
			    FROM 	ejecucion_actividades.inicio_actividad_poa iap
			    		LEFT JOIN ejecucion_actividades.inicio_actividad_poa_asignaciones iapa ON iap.iap_codigo = iapa.iap_codigo
			    		LEFT JOIN ejecucion_poa.asignaciones_cargos_item aci ON iapa.asi_codigo = aci.asi_codigo AND aci.aci_estado NOT IN (0, 5, 9)
			    WHERE 	iap.iap_estado NOT IN (0, 5, 9)
			    GROUP BY iap.act_codigo
			) inicio_auditoria ON a.act_codigo = inicio_auditoria.act_codigo
			LEFT JOIN (
				SELECT 
			    		iu.act_codigo, 
			            SUM(aci.aci_horas) AS horas_evaluaciones
			    FROM 	ejecucion_informes.informes_uai iu
			        	LEFT JOIN ejecucion_informes.inicio_evaluacion_informe iei ON iu.iua_codigo = iei.iua_codigo AND iei.iei_estado NOT IN (0, 5, 9)
			        	LEFT JOIN ejecucion_informes.inicio_evaluacion_informe_asignaciones ieia ON iei.iei_codigo = ieia.iei_codigo
			        	LEFT JOIN ejecucion_poa.asignaciones_cargos_item aci ON ieia.asi_codigo = aci.asi_codigo AND aci.aci_estado NOT IN (0, 5, 9)
			    WHERE 	iu.iua_estado NOT IN (0, 5, 9)
			    GROUP BY iu.act_codigo
			    ORDER BY iu.act_codigo
			    ) inicio_evaluacion ON a.act_codigo = inicio_evaluacion.act_codigo
	WHERE 	TRUE
			AND a.act_estado IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18)
	--		AND a.act_codigo IN (2840)
	--		AND a.act_codigo IN (2839)
			AND a.act_codigo IN (2838)
	GROUP BY a.act_codigo
)
SELECT
      	t.act_codigo,
      	t.act_numero,
      	t.cac_codigo,
      	t.act_estado,
      	t.act_descripcion,
      	(
      	CASE
			WHEN ((t.cac_codigo = 1 OR t.cac_codigo = 3) AND t.act_estado = 2) THEN 'F26'
			WHEN (t.cac_codigo = 2) THEN 'F21'
			ELSE '' END
		) AS tipo,
      	t.act_horas_planificadas AS horas_iniciales,
      	(COALESCE(ta.horas_comision, 0))::INT AS horas_comision,
      	au.aun_sigla
FROM	estructura_poa.actividades t
      	LEFT JOIN estructura_organizacional.areas_unidades au ON t.aun_codigo_ejecutora = au.aun_codigo
      	LEFT JOIN tmp_actividad ta on ta.act_codigo = t.act_codigo
WHERE	TRUE
		AND t.act_codigo IN (2838)
		AND t.act_estado IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18)
;
--&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
SELECT 
	    amh.amh_codigo,
	    amh.act_codigo_adicion,
	    amh.act_codigo_disminucion,
	    amh.amh_horas,
	    amh.amh_estado,
	    tmh.tmh_descripcion,
	    e.est_color,
	    e.est_nombre AS amh_estado_descripcion,
	    CASE 
	        WHEN amh.act_codigo_adicion = 2840 THEN 1
	        WHEN amh.act_codigo_disminucion = 2840 THEN 2
	        ELSE 0
	    END AS ubicacion_codigo
FROM 	estructura_poa.actividades_movimientos_horas amh
    	LEFT JOIN parametricas.tipo_movimientos_horas tmh ON amh.tmh_codigo = tmh.tmh_codigo
    	LEFT JOIN parametricas.estados e ON e.est_codigo = amh.amh_estado
WHERE 	amh.amh_estado IN (1)
;
--========================================
SELECT
DISTINCT
        fk_tco.table_schema, fk_tco.table_name
FROM information_schema.referential_constraints rco
        INNER JOIN information_schema.table_constraints fk_tco ON rco.constraint_name = fk_tco.constraint_name AND rco.constraint_schema = fk_tco.table_schema
INNER JOIN information_schema.table_constraints pk_tco ON rco.unique_constraint_name = pk_tco.constraint_name AND rco.unique_constraint_schema = pk_tco.table_schema
WHERE   TRUE
AND fk_tco.table_schema = 'control_estados'
        AND pk_tco.table_name IN ('actividades')
        AND pk_tco.table_schema IN ('estructura_poa')
ORDER BY fk_tco.table_name;

--&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
SELECT	*
FROM 	information_schema.referential_constraints rco
;













