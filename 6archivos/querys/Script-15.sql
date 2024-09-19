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
		aur.rol_codigo,
		r.rol_nombre,
		cr.cro_descripcion 
FROM 	estructura_poa.area_unidad_responsables aur
		LEFT JOIN estructura_organizacional.areas_unidades au ON aur.aun_codigo_ejecutora = au.aun_codigo
		LEFT JOIN parametricas.roles r ON aur.rol_codigo = r.rol_codigo
		LEFT JOIN parametricas.clasificacion_rol cr ON cr.cro_codigo = aur.cro_codigo 
WHERE 	TRUE
		AND aur.aur_estado NOT IN (0,5)
--		AND aur.per_codigo IN (234)--486424 LUIS FERNANDO SAAVEDRA MORATO   
		AND aur.per_codigo IN (7)--2573781  ERIKA CAROLINA CARDENAS SALAS
--		AND aur.per_codigo IN (2096)--2468864	NORA HERMINIA MAMANI CABRERA
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
      au.aun_codigo AS aun_codigo_ejecutora,
      cau.cau_codigo,
      cau.cau_nombre,
      CONCAT_WS(' - ', au.aun_nombre, au.aun_sigla) AS aun_nombre,
      COALESCE(MAX(aur.n_formulador), 0) AS n_formulador,
      COALESCE(MAX(aur.n_aprobador), 0) AS n_aprobador,
      COALESCE(MAX(aur.n_supervisor), 0) AS n_supervisor,
      COALESCE(MAX(aur.n_comision), 0) AS n_comision,
      COALESCE(MAX(aur.n_formulador_gerencial), 0) AS n_formulador_gerencial,
      COALESCE(MAX(aur.n_oficial_administrativo), 0) AS n_oficial_administrativo,
      COALESCE(MAX(aur.n_gerente_consolidador), 0) AS n_gerente_consolidador,
      CASE WHEN cau.cau_codigo = 2 THEN COALESCE(MAX(aur.n_responsable), 0) ELSE null END AS n_responsable
FROM    estructura_poa.poas p
      LEFT JOIN estructura_organizacional.gestiones_organigramas gor ON p.ges_codigo = gor.ges_codigo
      LEFT JOIN estructura_organizacional.areas_unidades au ON gor.org_codigo = au.org_codigo AND au.aun_estado IN (2,8)
      LEFT JOIN parametricas.clasificaciones_areas_unidades cau ON au.cau_codigo = cau.cau_codigo
      LEFT JOIN (
        SELECT  aur.aun_codigo_ejecutora,
            SUM(CASE WHEN aur.rol_codigo = 1 THEN 1 ELSE 0 END) AS n_formulador,
            SUM(CASE WHEN aur.rol_codigo = 2 THEN 1 ELSE 0 END) AS n_aprobador,
            SUM(CASE WHEN aur.rol_codigo = 3 THEN 1 ELSE 0 END) AS n_supervisor,
            SUM(CASE WHEN aur.rol_codigo = 4 THEN 1 ELSE 0 END) AS n_formulador_gerencial,
            SUM(CASE WHEN aur.rol_codigo = 5 THEN 1 ELSE 0 END) AS n_comision,
            SUM(CASE WHEN aur.rol_codigo = 6 THEN 1 ELSE 0 END) AS n_responsable,
            SUM(CASE WHEN aur.rol_codigo = 7 THEN 1 ELSE 0 END) AS n_oficial_administrativo,
            SUM(CASE WHEN aur.rol_codigo = 8 THEN 1 ELSE 0 END) AS n_gerente_consolidador
        FROM    estructura_poa.area_unidad_responsables aur
        WHERE   TRUE
            AND aur.aur_estado != 0
            AND aur.poa_codigo IN (3)
        GROUP BY aur.aun_codigo_ejecutora
        ORDER BY aur.aun_codigo_ejecutora ASC
      ) aur ON au.aun_codigo = aur.aun_codigo_ejecutora
WHERE   TRUE
      AND p.poa_estado != 0
      AND au.aun_estado IN (2,8)
      AND p.poa_codigo IN (3)
GROUP BY au.aun_codigo, au.aun_nombre, au.aun_sigla, cau.cau_nombre, cau.cau_codigo
ORDER BY au.aun_codigo ASC
;


--#######################################################################
WITH roles AS (
    SELECT
        t.per_codigo,
        SUM(CASE WHEN t.rol_codigo IN (1, 7, 8) THEN 1 ELSE 0 END) AS roles_sispoa,
        SUM(CASE WHEN t.rol_codigo IN (4, 5, 6) THEN 1 ELSE 0 END) AS roles_conaud,
        SUM(CASE WHEN t.rol_codigo IN (2, 3) THEN 1 ELSE 0 END) AS roles_compartidos
    FROM estructura_poa.area_unidad_responsables t
    WHERE t.aur_estado NOT IN (0, 5)
    GROUP BY t.per_codigo
)
SELECT
    t.aur_codigo,
    t.aur_notificacion,
    t.poa_codigo,
    po.poa_descripcion,
    au.cau_codigo,
    t.aun_codigo_ejecutora,
    CONCAT_WS(' - ', au.aun_nombre, au.aun_sigla) AS aun_nombre,
    t.aun_codigo_rol,
    CONCAT_WS(' - ', au_rol.aun_nombre, au_rol.aun_sigla) AS aun_nombre_rol,
    t.rol_codigo,
    ro.rol_nombre,
    t.per_codigo,
    t.cro_codigo,
    cr.cro_descripcion,
    -- Bandera de eliminación de SISPOA
    CASE
        WHEN r.roles_sispoa = 1 AND r.roles_compartidos = 0 THEN 1
        WHEN r.roles_sispoa = 1 AND r.roles_compartidos = 1 THEN 0
        ELSE 0
    END AS flag_eliminar_sispoa,
    -- Bandera de eliminación de CONAUD
    CASE
        WHEN r.roles_conaud = 1 AND r.roles_compartidos = 0 THEN 1
        WHEN r.roles_conaud = 1 AND r.roles_compartidos = 1 THEN 0
        ELSE 0
    END AS flag_eliminar_conaud,
    -- Bandera de eliminación en ambos sistemas
    CASE
        WHEN r.roles_sispoa = 0 AND r.roles_conaud = 1 AND r.roles_compartidos = 1 THEN 1
        WHEN r.roles_conaud = 1 AND r.roles_compartidos = 1 THEN 1
        ELSE 0
    END AS flag_eliminar_ambos,
    t.usuario_registro AS usuario,
    t.aur_estado,
    e.est_color,
    e.est_nombre AS aur_estado_descripcion
FROM estructura_poa.area_unidad_responsables t
LEFT JOIN parametricas.estados e ON e.est_codigo = t.aur_estado
LEFT JOIN estructura_poa.poas po ON po.poa_codigo = t.poa_codigo
LEFT JOIN estructura_organizacional.areas_unidades au ON au.aun_codigo = t.aun_codigo_ejecutora
LEFT JOIN estructura_organizacional.areas_unidades au_rol ON au_rol.aun_codigo = t.aun_codigo_rol
LEFT JOIN parametricas.roles ro ON ro.rol_codigo = t.rol_codigo
LEFT JOIN parametricas.clasificacion_rol cr ON cr.cro_codigo = t.cro_codigo
LEFT JOIN roles r ON r.per_codigo = t.per_codigo
WHERE t.aur_estado IN (1, 2)
  AND t.poa_codigo IN (3)
  AND t.aun_codigo_ejecutora IN (1)
  AND t.rol_codigo IN (1, 2, 3, 4, 5, 6, 7, 8)
ORDER BY t.aur_codigo DESC, t.fecha_registro DESC;




--#######################################################################


--&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
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
              -- Subconsulta para contar los roles restantes
              (SELECT COUNT(*)
              FROM estructura_poa.area_unidad_responsables aur
              WHERE aur.per_codigo = t.per_codigo
                AND aur.aur_estado NOT IN (0, 5)
              ) AS cantidad_roles_restantes, -- Nombre del campo para la cantidad de roles restantes
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
              AND t.aun_codigo_ejecutora IN (1)
              AND t.rol_codigo IN (1,2,3,4,6,7,8)
              AND t.per_codigo IN (2096)
        ORDER BY t.aur_codigo DESC, t.fecha_registro DESC
        ;



--&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

SELECT 	*
FROM 	ejecucion_informes.informes_uai;


