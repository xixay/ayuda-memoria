SELECT 	*
FROM 	estructura_poa.poas_objetivos po 
WHERE 	po.pobj_codigo = 1662
ORDER BY po.pobj_codigo DESC 
;

SELECT 	*
FROM 	estructura_poa.objetivos_area_unidad oau
WHERE 	oau.pobj_codigo = 1662
ORDER BY oau.pobj_codigo DESC 
;

SELECT 	*
FROM 	parametricas.gestiones g 
;