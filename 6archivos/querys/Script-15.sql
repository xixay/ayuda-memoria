--####  1  - 3  ####
SELECT
      po.pobj_codigo, po.pobj_estado, pr.pro_numero, au.aun_numero, po.pobj_numero,
      (CASE WHEN po.aun_codigo_padre IS NOT NULL
      THEN CONCAT(pr.pro_numero, '.', au2.aun_numero, '.', po.pobj_numero)
      ELSE CONCAT(pr.pro_numero, '.', au.aun_numero, '.', po.pobj_numero)  END) AS poa_pobj_oau_act_codigo,
      po.pobj_nombre, po.pro_codigo, po.pobj_indicador
FROM    estructura_poa.poas_objetivos po
      LEFT JOIN pei.programas pr ON po.pro_codigo = pr.pro_codigo
      LEFT JOIN estructura_poa.objetivos_area_unidad oau ON po.pobj_codigo = oau.pobj_codigo AND oau.oau_estado NOT IN (0)
      LEFT JOIN estructura_organizacional.areas_unidades au ON oau.aun_codigo_ejecutora = au.aun_codigo
      LEFT JOIN estructura_organizacional.areas_unidades au2 ON po.aun_codigo_padre = au2.aun_codigo
      LEFT JOIN estructura_poa.actividades a ON po.pobj_codigo = a.pobj_codigo
WHERE   TRUE
      AND po.poa_codigo IN (3) -- POA-SELECCIONADO
       -- POA-SELECCIONADO
      AND po.pobj_estado IN (2,8) -- ESTADOS
      AND oau.oau_estado IN (2,8) -- ESTADOS
      AND oau.aun_codigo_ejecutora IN (1) -- UNIDAD-EJECUTORA
      AND a.cac_codigo IN (1,3) -- CLASIFICACION-ACTIVIDADES
GROUP BY po.pobj_codigo, pr.pro_numero, po.pobj_numero, po.pobj_nombre, au.aun_numero, au2.aun_numero
;
--####  2  #####
SELECT
      po.pobj_codigo, po.pobj_estado, pr.pro_numero, au.aun_numero, po.pobj_numero,
      (CASE WHEN po.aun_codigo_padre IS NOT NULL
      THEN CONCAT(pr.pro_numero, '.', au2.aun_numero, '.', po.pobj_numero)
      ELSE CONCAT(pr.pro_numero, '.', au.aun_numero, '.', po.pobj_numero)  END) AS poa_pobj_oau_act_codigo,
      po.pobj_nombre, po.pro_codigo, po.pobj_indicador
FROM    estructura_poa.poas_objetivos po
      LEFT JOIN pei.programas pr ON po.pro_codigo = pr.pro_codigo
      LEFT JOIN estructura_poa.objetivos_area_unidad oau ON po.pobj_codigo = oau.pobj_codigo AND oau.oau_estado NOT IN (0)
      LEFT JOIN estructura_organizacional.areas_unidades au ON oau.aun_codigo_ejecutora = au.aun_codigo
      LEFT JOIN estructura_organizacional.areas_unidades au2 ON po.aun_codigo_padre = au2.aun_codigo
      LEFT JOIN estructura_poa.actividades a ON po.pobj_codigo = a.pobj_codigo
WHERE   TRUE
      AND po.poa_codigo IN (3) -- POA-SELECCIONADO
       -- POA-SELECCIONADO
      AND po.pobj_estado IN (2,8) -- ESTADOS
      AND oau.oau_estado IN (2,8) -- ESTADOS
      AND oau.aun_codigo_ejecutora IN (1) -- UNIDAD-EJECUTORA
      AND a.cac_codigo IN (2) -- CLASIFICACION-ACTIVIDADES
GROUP BY po.pobj_codigo, pr.pro_numero, po.pobj_numero, po.pobj_nombre, au.aun_numero, au2.aun_numero
;

SELECT 	*
FROM 	estructura_organizacional.areas_unidades au 
WHERE 	au.aun_codigo IN (19)
;

SELECT 	
		COALESCE(
        	ARRAY_AGG(
            	DISTINCT aur.rol_codigo ORDER BY aur.rol_codigo ASC
            ) FILTER (WHERE aur.per_codigo = 1914),
            '{}'
        ) AS roles,
        COUNT(DISTINCT aur.rol_codigo) AS cantidad_roles
FROM 	estructura_poa.area_unidad_responsables aur
WHERE 	TRUE
		AND aur.aur_estado IN (1)
		AND aur.rol_codigo IN (1,2,3,4,8)
		AND aur.poa_codigo IN (3)
		AND aur.aun_codigo_ejecutora IN (1)
		AND aur.per_codigo IN (1914)
;
SELECT 	au.aun_sigla, 
		aur.aur_codigo, 
		aur.aur_estado, 
		aur.per_codigo,
		aur.poa_codigo,
		aur.aun_codigo_ejecutora,
		aur.rol_codigo
FROM 	estructura_poa.area_unidad_responsables aur
		LEFT JOIN estructura_organizacional.areas_unidades au ON aur.aun_codigo_ejecutora = au.aun_codigo 
WHERE 	TRUE
		AND aur.aur_estado NOT IN (0,5)
		AND aur.per_codigo IN (234)
;


        SELECT
              t.aur_codigo,
              t.aur_notificacion,
              t.poa_codigo,
              po.poa_descripcion,
              au.cau_codigo,
              t.aun_codigo_ejecutora,
              -- au.aun_nombre,
              CONCAT_WS(' - ', au.aun_nombre, au.aun_sigla) AS aun_nombre,
              t.aun_codigo_rol,
              -- au_rol.aun_nombre AS aun_nombre_rol,
              CONCAT_WS(' - ', au_rol.aun_nombre, au_rol.aun_sigla) AS aun_nombre_rol,
              t.rol_codigo,
              ro.rol_nombre,
              t.per_codigo,
              t.cro_codigo,
              cr.cro_descripcion,
              t.usuario_registro AS usuario,
              t.aur_estado,
              e.est_color,
              e.est_nombre AS aur_estado_descripcion
        FROM  estructura_poa.area_unidad_responsables t
              LEFT JOIN parametricas.estados e ON e.est_codigo = t.aur_estado
              LEFT JOIN estructura_poa.poas po ON po.poa_codigo = t.poa_codigo
              LEFT JOIN estructura_organizacional.areas_unidades au ON au.aun_codigo = t.aun_codigo_ejecutora
              LEFT JOIN estructura_organizacional.areas_unidades au_rol ON au_rol.aun_codigo = t.aun_codigo_rol
              LEFT JOIN parametricas.roles ro ON ro.rol_codigo = t.rol_codigo
              LEFT JOIN parametricas.clasificacion_rol cr ON cr.cro_codigo = t.cro_codigo
        WHERE TRUE
              AND t.aur_estado IN (1,2)
              AND t.poa_codigo IN (3)
              AND t.aun_codigo_ejecutora IN (53)
              AND t.rol_codigo IN (1,2,3,4,6,7,8)
        ORDER BY t.aur_codigo DESC, t.fecha_registro DESC;

SELECT
    t.aur_codigo,
    t.aur_notificacion,
    t.poa_codigo,
    po.poa_descripcion,
    au.cau_codigo,
    t.aun_codigo_ejecutora,
    -- au.aun_nombre,
    CONCAT_WS(' - ', au.aun_nombre, au.aun_sigla) AS aun_nombre,
    t.aun_codigo_rol,
    -- au_rol.aun_nombre AS aun_nombre_rol,
    CONCAT_WS(' - ', au_rol.aun_nombre, au_rol.aun_sigla) AS aun_nombre_rol,
    t.rol_codigo,
    ro.rol_nombre,
    t.per_codigo,
    t.cro_codigo,
    cr.cro_descripcion,
    t.usuario_registro AS usuario,
    t.aur_estado,
    e.est_color,
    e.est_nombre AS aur_estado_descripcion,
    -- Subconsulta para contar los roles restantes
    (SELECT COUNT(*)
     FROM estructura_poa.area_unidad_responsables aur
     WHERE aur.per_codigo = t.per_codigo
       AND aur.aur_estado NOT IN (0, 5)
       AND aur.poa_codigo = t.poa_codigo
       AND aur.aun_codigo_ejecutora = t.aun_codigo_ejecutora
    ) AS cantidad_roles_restantes -- Nombre del campo para la cantidad de roles restantes
FROM  estructura_poa.area_unidad_responsables t
    LEFT JOIN parametricas.estados e ON e.est_codigo = t.aur_estado
    LEFT JOIN estructura_poa.poas po ON po.poa_codigo = t.poa_codigo
    LEFT JOIN estructura_organizacional.areas_unidades au ON au.aun_codigo = t.aun_codigo_ejecutora
    LEFT JOIN estructura_organizacional.areas_unidades au_rol ON au_rol.aun_codigo = t.aun_codigo_rol
    LEFT JOIN parametricas.roles ro ON ro.rol_codigo = t.rol_codigo
    LEFT JOIN parametricas.clasificacion_rol cr ON cr.cro_codigo = t.cro_codigo
WHERE TRUE
    AND t.aur_estado IN (1, 2)
    AND t.poa_codigo IN (3)
    AND t.aun_codigo_ejecutora IN (53)
    AND t.rol_codigo IN (1, 2, 3, 4, 6, 7, 8)
ORDER BY t.aur_codigo DESC, t.fecha_registro DESC;


