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

--unidad a volver  a 48
SELECT 	*
FROM 	estructura_organizacional.areas_unidades au 
WHERE 	au.aun_codigo IN (41);

SELECT 	*
FROM 	estructura_organizacional.areas_unidades au 
WHERE 	au.aun_codigo IN (1);




 SELECT
              t.pobj_codigo,
              t.pobj_nombre,
              t.pobj_indicador,
              t.poa_codigo,
              p.poa_estado,
              p.poa_descripcion AS pobj_poa_descripcion,
              t.pro_codigo,
              pr.pro_numero,
              pr.pro_descripcion AS pobj_pro_descripcion,
              t.pobj_estado,
              e.est_color,
              e.est_nombre AS pobj_estado_descripcion,
              TO_CHAR(t.fecha_registro, 'HH24:MI am dd/mm/yyyy') as fecha_registro,
              --CONCAT(pr.pro_numero, '.', aes.aes_numero) AS poa_pobj_codigo,
              pr.pro_numero AS poa_pobj_codigo,
              t.tin_codigo,
              ti.tin_descripcion AS pobj_tin_descripcion,
              t.tacp_codigo,
              tacp.tacp_descripcion AS pobj_tacp_descripcion,
              CASE
                WHEN t.tacp_codigo = 3 THEN dacp.pobj_codigo_accion
                ELSE NULL
              END AS pobj_codigo_accion,
              CASE
                WHEN t.tacp_codigo = 3 THEN dacp.dac_codigo
                ELSE NULL
              END AS pobj_dac_codigo,
              t.cpr_codigo,
              cpr.cpr_numero,
              cpr.cpr_descripcion AS pobj_cpr_descripcion,
              t.aeg_codigo,
              aes.aes_numero,
              aes.aes_descripcion AS pobj_aes_descripcion,
              oau.oau_codigo,
              oau.aun_codigo_ejecutora,
              oau.aun_codigo_supervisora,
              ge.ges_codigo,
              ge.ges_anio,
              t.pobj_numero,
              t.aun_codigo_padre,
              aunp.aun_numero AS aun_numero_padre
        FROM	estructura_poa.poas_objetivos t
              LEFT JOIN parametricas.estados e ON e.est_codigo = t.pobj_estado
              LEFT JOIN estructura_poa.poas p ON p.poa_codigo = t.poa_codigo
              LEFT JOIN parametricas.gestiones ge ON ge.ges_codigo = p.ges_codigo
              LEFT JOIN pei.programas pr ON pr.pro_codigo = t.pro_codigo
              LEFT JOIN (
                SELECT	MAX(dacp.dac_codigo) as dac_codigo,
                    (SELECT tmp.pobj_codigo_accion
                    FROM estructura_poa.dependencia_accion_corto_plazo tmp
                    WHERE tmp.dac_codigo = MAX(dacp.dac_codigo)) as pobj_codigo_accion,
                    dacp.pobj_codigo_operacion
                FROM	estructura_poa.dependencia_accion_corto_plazo dacp
                GROUP BY dacp.pobj_codigo_operacion
              ) dacp ON t.pobj_codigo = dacp.pobj_codigo_operacion
              LEFT JOIN parametricas.tipo_indicador ti ON t.tin_codigo = ti.tin_codigo
              LEFT JOIN parametricas.tipo_accion_corto_plazo tacp ON t.tacp_codigo = tacp.tacp_codigo
              LEFT JOIN pei.categorias_programaticas cpr ON t.cpr_codigo = cpr.cpr_codigo
              LEFT JOIN pei.acciones_estrategicas_gestiones aeg ON t.aeg_codigo = aeg.aeg_codigo
              LEFT JOIN pei.acciones_estrategicas aes ON aeg.aes_codigo = aes.aes_codigo
              LEFT JOIN (
                SELECT	oau.pobj_codigo,
                        COALESCE((COALESCE(ARRAY_AGG(oau.oau_codigo ORDER BY oau.oau_codigo ASC), '{}'))[1], 0) AS oau_codigo,
                        COALESCE((COALESCE(ARRAY_AGG(oau.aun_codigo_ejecutora ORDER BY oau.oau_codigo ASC), '{}'))[1], 0) AS aun_codigo_ejecutora,
                        COALESCE((COALESCE(ARRAY_AGG(oau.aun_codigo_supervisora ORDER BY oau.oau_codigo ASC), '{}'))[1], 0) AS aun_codigo_supervisora
                FROM	estructura_poa.objetivos_area_unidad oau
                      LEFT JOIN estructura_poa.poas_objetivos po ON oau.pobj_codigo = po.pobj_codigo
                WHERE	oau.oau_estado NOT IN (0)
                      ${query.poa_codigo ? `AND po.poa_codigo IN ${query.poa_codigo}` : ''}
                GROUP BY oau.pobj_codigo
              ) oau ON t.pobj_codigo = oau.pobj_codigo
              LEFT JOIN estructura_organizacional.areas_unidades aunp ON t.aun_codigo_padre = aunp.aun_codigo
        WHERE	TRUE
              ${query.poa_codigo ? `AND t.poa_codigo IN :poa_codigo` : ''};



























