--aCTIVIDAD
SELECT 	
		a.act_codigo, a.act_numero, a.act_estado 
FROM 	estructura_poa.actividades a
WHERE 	a.act_numero = '00.0001.3.1.24'
;
--
SELECT 	*
FROM 	parametricas.estados e ;
--ESTADO RETIRO
INSERT INTO parametricas.estados
(est_codigo, est_nombre, est_color, est_descripcion, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja)
VALUES(44, 'RETIRO APROBADO GI.', '#ea5545', 'Retiro Aprobado por Gestión Institucional.', 0, 0, 0, '2024-05-09 18:53:52.462', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000');
--FLUJO
SELECT	t.tab_nombre, ft.est_codigo_origen, eo.est_nombre, ft.est_codigo_destino, ed.est_nombre
FROM	control_estados.flujos_tablas ft
		LEFT JOIN parametricas.tablas t ON ft.tab_codigo = t.tab_codigo
		LEFT JOIN parametricas.estados eo ON ft.est_codigo_origen = eo.est_codigo
		LEFT JOIN parametricas.estados ed ON ft.est_codigo_destino = ed.est_codigo
WHERE	ft.tab_codigo IN (SELECT t.tab_codigo FROM parametricas.tablas t WHERE t.tab_nombre IN ('Actividades'))
ORDER BY ft.tab_codigo ASC, ft.est_codigo_origen ASC, ft.est_codigo_destino ASC
;
--FLUJOS TABLAS
SELECT 	*
FROM 	control_estados.flujos_tablas ft
ORDER BY ft.fta_codigo ASC
;
--ACTIVIDAD AGREGAR EL NUEVO FLUJO(13-44)
INSERT INTO control_estados.flujos_tablas
(fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja)
VALUES(371, 1, '', 13, 44, 1, 0, 0, 0, '2024-05-09 18:57:05.209', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000');
--ACTIVIDAD AGREGAR EL NUEVO FLUJO(44-14)
INSERT INTO control_estados.flujos_tablas
(fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja)
VALUES(372, 1, '', 44, 14, 1, 0, 0, 0, '2024-05-09 18:57:05.209', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000');
--ACTIVIDAD AGREGAR EL NUEVO FLUJO(44-14)
INSERT INTO control_estados.flujos_tablas
(fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja)
VALUES(373, 1, '', 44, 9, 1, 0, 0, 0, '2024-05-09 18:57:05.209', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000');





