SELECT 	a.act_codigo, a. act_estado, a.cac_codigo, a.act_horas_planificadas,
		au.aun_sigla
FROM 	estructura_poa.actividades a 
		LEFT JOIN estructura_organizacional.areas_unidades au ON a.aun_codigo_ejecutora = au.aun_codigo 
ORDER BY a.act_codigo DESC
;