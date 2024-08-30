SELECT 	*
FROM 	parametricas.gestiones g ;

SELECT 	*
FROM 	estructura_poa.poas p
WHERE 	TRUE 
		AND p.ges_codigo IN (2)
		--AND p.poa_ejecucion_conaud = TRUE 
		--AND p.poa_estado IN (2)
ORDER BY p.poa_codigo DESC 
;


SELECT p.poa_ejecucion_conaud, COUNT(*)
FROM estructura_poa.poas p
WHERE p.ges_codigo IN (3)
  AND p.poa_estado IN (2)
GROUP BY p.poa_ejecucion_conaud;
--ESTADO ACTIVIDAD
SELECT 	*
FROM 	control_estados.flujos_tablas ft
WHERE 	TRUE 
		AND ft.tab_codigo IN (1)
--		AND ft.tab_codigo IN (2)
		AND ft.est_codigo_destino IN (4)
;
--TODOS FLUJOS
SELECT 	*
FROM 	control_estados.flujos_tablas ft 
ORDER BY ft.fta_codigo DESC 
;

--INSERTA FLUJO DE ESTADO ACTIVIDAD
INSERT INTO control_estados.flujos_tablas
(fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja)
VALUES(384, 1, '', 48, 4, 1, 0, 0, 0, '2024-08-29 09:51:40.955', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000');

INSERT INTO control_estados.flujos_tablas
(fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja)
VALUES(385, 1, '', 17, 4, 1, 0, 0, 0, '2024-08-29 09:51:40.955', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000');

--INSERTA FLUJO DE ESTADO VIATICO
INSERT INTO control_estados.flujos_tablas
(fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja)
VALUES(386, 2, '', 48, 4, 1, 0, 0, 0, '2024-08-29 09:51:40.955', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000');

INSERT INTO control_estados.flujos_tablas
(fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja)
VALUES(387, 2, '', 17, 4, 1, 0, 0, 0, '2024-08-29 09:51:40.955', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000');
