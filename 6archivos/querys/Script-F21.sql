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

SELECT 	a.act_codigo, a.cac_codigo, a.pobj_codigo
FROM 	estructura_poa.actividades a
WHERE 	a.pobj_codigo IN (1365,1366,1603,1604,1608,1654);


SELECT
      po.pobj_codigo, po.pobj_estado, pr.pro_numero, au.aun_numero, po.pobj_numero,
      (CASE WHEN po.aun_codigo_padre IS NOT NULL
      THEN CONCAT(pr.pro_numero, '.', au2.aun_numero, '.', po.pobj_numero)
      ELSE CONCAT(pr.pro_numero, '.', au.aun_numero, '.', po.pobj_numero)  END) AS pobj_codigo_sigla,
      po.pobj_nombre, po.pro_codigo
FROM    estructura_poa.poas_objetivos po
      LEFT JOIN pei.programas pr ON po.pro_codigo = pr.pro_codigo
      LEFT JOIN estructura_poa.objetivos_area_unidad oau ON po.pobj_codigo = oau.pobj_codigo AND oau.oau_estado NOT IN (0)
      LEFT JOIN estructura_organizacional.areas_unidades au ON oau.aun_codigo_ejecutora = au.aun_codigo
      LEFT JOIN estructura_organizacional.areas_unidades au2 ON po.aun_codigo_padre = au2.aun_codigo
      LEFT JOIN estructura_poa.actividades a ON po.pobj_codigo = a.pobj_codigo
WHERE   TRUE
      AND po.poa_codigo IN (3) -- POA-SELECCIONADO
      AND po.pobj_estado IN (2,8) -- ESTADOS
      AND oau.oau_estado IN (2,8) -- ESTADOS
      AND oau.aun_codigo_ejecutora IN (1) -- UNIDAD-EJECUTORA
      AND a.cac_codigo IN (2)
GROUP BY po.pobj_codigo, pr.pro_numero, po.pobj_numero, po.pobj_nombre, au.aun_numero, au2.aun_numero
;




































