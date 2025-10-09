--UUUUUUUUUUUSAR
SELECT 	po.pobj_codigo,cpr.cpr_numero, po.pobj_nombre, po.pobj_indicador
FROM 	estructura_poa.poas_objetivos po
		LEFT JOIN pei.categorias_programaticas cpr ON po.cpr_codigo = cpr.cpr_codigo
WHERE   TRUE
		AND po.pobj_codigo IN (1365,1366,875)
--		AND a.aun_codigo_ejecutora IN (1)
;
--UUUUUUUUUUUSAR
SELECT 	a.act_numero ,a.act_cantidad, a.act_descripcion, a.act_horas_planificadas, a.ent_codigo, a.pobj_codigo, a. aun_codigo_ejecutora, 
		tt.ttr_descripcion,
		ett.ett_nombre 
FROM 	estructura_poa.poas_objetivos po
		LEFT JOIN estructura_poa.actividades a ON po.pobj_codigo = a.pobj_codigo
		LEFT JOIN estructura_organizacional.areas_unidades au ON a.aun_codigo_ejecutora = au.aun_codigo 
		LEFT JOIN parametricas.tipos_trabajos tt ON a.ttr_codigo = tt.ttr_codigo
		LEFT JOIN parametricas.especificacion_tipos_trabajo ett ON tt.ett_codigo = ett.ett_codigo 
WHERE   TRUE
		AND po.pobj_codigo IN (1365,1366,875)
--		AND a.aun_codigo_ejecutora IN (1)
;
--		AND po.pobj_estado = 1;
SELECT 	a.act_numero , a.act_descripcion, a.act_horas_planificadas, a.ent_codigo, a.pobj_codigo, a. aun_codigo_ejecutora, 
		tt.ttr_descripcion,
		ett.ett_nombre 
FROM 	estructura_poa.actividades a
		LEFT JOIN parametricas.tipos_trabajos tt ON a.ttr_codigo = tt.ttr_codigo
		LEFT JOIN parametricas.especificacion_tipos_trabajo ett ON tt.ett_codigo = ett.ett_codigo 
WHERE 	TRUE 
--		AND a.pobj_codigo IN (1365) AND a.aun_codigo_ejecutora IN (1);
--		AND a.pobj_codigo IN (1365);
		AND a.pobj_codigo IN (875)
		AND a.aun_codigo_ejecutora IN (57)		
;
SELECT 	a.aun_codigo_ejecutora, au.aun_nombre ,SUM(a.act_horas_planificadas) AS hora_total
FROM 	estructura_poa.actividades a
		LEFT JOIN estructura_organizacional.areas_unidades au ON a.aun_codigo_ejecutora = au.aun_codigo 
where 	TRUE 
		AND a.aun_codigo_ejecutora IN (1)
		AND a.pobj_codigo IN (1365)
GROUP BY a.aun_codigo_ejecutora , au.aun_nombre ;
