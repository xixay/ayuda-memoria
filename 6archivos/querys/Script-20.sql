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
