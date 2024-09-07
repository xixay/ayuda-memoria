SELECT 	a.act_codigo , a.act_estado , a.pobj_codigo 
FROM 	estructura_poa.actividades a
WHERE 	a.act_codigo IN (4742);

SELECT 	*
FROM 	control_estados.flujos_tablas ft 
WHERE 	ft.tab_codigo IN (1);

SELECT 	*
FROM 	parametricas.clasificacion_actividades ca ;

SELECT 	*
FROM 	estructura_poa.actividades a
WHERE 	a.cac_codigo IN (2)
;