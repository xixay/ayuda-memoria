--ADMINISTRACION ACP
SELECT 	*
--		oau.oau_codigo,oau_descripcion,oau.aun_codigo_ejecutora, oau.oau_estado,
--		au.aun_sigla, 
--		po.pobj_codigo, po.pobj_estado
FROM 	estructura_poa.objetivos_area_unidad oau
		LEFT JOIN estructura_organizacional.areas_unidades au ON oau.aun_codigo_ejecutora = au.aun_codigo 
		LEFT JOIN estructura_poa.poas_objetivos po ON oau.pobj_codigo = po.pobj_codigo
WHERE 	TRUE
--		AND oau.pobj_codigo IN (1067)
ORDER BY oau.oau_codigo DESC
;

--HISTORIAL
SELECT 	*
FROM 	control_estados.estados_objetivos_area_unidad eoau
WHERE 	TRUE
		AND eoau.oau_codigo IN (2675)
--		AND eoau.eoau_estado IN (1)
ORDER BY eoau.eoau_codigo DESC
;
--ACTIVIDAD
SELECT 	
		a.act_codigo, a.act_numero, a.act_estado, a.act_descripcion,
		au1.aun_sigla AS aun_sigla_ejecutora,
		au2.aun_sigla AS aun_sigla_supervisora
FROM 	estructura_poa.actividades a
		LEFT JOIN estructura_organizacional.areas_unidades au1 ON a.aun_codigo_ejecutora = au1.aun_codigo
		LEFT JOIN estructura_organizacional.areas_unidades au2 ON a.aun_codigo_supervisora = au2.aun_codigo 
ORDER BY a.act_codigo DESC
;








