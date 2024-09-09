SELECT 	a.act_codigo , a.act_estado , a.pobj_codigo 
FROM 	estructura_poa.actividades a
WHERE 	a.act_codigo IN (4742);

SELECT 	--*
		ft.fta_codigo, ft.tab_codigo,ft.est_codigo_origen,ft.est_codigo_destino 
FROM 	control_estados.flujos_tablas ft 
WHERE 	ft.tab_codigo IN (1);

SELECT 	*
FROM 	parametricas.clasificacion_actividades ca ;

SELECT 	*
FROM 	estructura_poa.actividades a
WHERE 	a.cac_codigo IN (2)
;
----------- ADD COLUMN estructura_poa.poas -----------
ALTER TABLE estructura_poa.poas
ADD COLUMN poa_actualizado_conaud BOOLEAN DEFAULT FALSE;
COMMENT ON COLUMN estructura_poa.poas.poa_actualizado_conaud IS 'Valor para verificar si el registro de POA, fue actualizado o enviado a ejecución en sistema CONAUD';

COMMENT ON COLUMN estructura_poa.poas.poa_ejecucion_conaud IS 'Valor para especificar el registro de POA, que se encuentra en ejecución en el sistema CONAUD';

INSERT INTO control_estados.flujos_tablas (fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro) VALUES((select max(fta_codigo)+1 from control_estados.flujos_tablas), 2, '', 13, 45, 1, 0);
INSERT INTO control_estados.flujos_tablas (fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro) VALUES((select max(fta_codigo)+1 from control_estados.flujos_tablas), 2, '', 45, 14, 1, 0);
INSERT INTO control_estados.flujos_tablas (fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro) VALUES((select max(fta_codigo)+1 from control_estados.flujos_tablas), 2, '', 45, 9, 1, 0);