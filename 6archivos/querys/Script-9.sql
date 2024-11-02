--
SELECT 	*
FROM 	parametricas.roles r 
;
--##################### FASE 0 ############################
SELECT 	--*
		aur.aur_codigo, aur.aur_estado, aur.per_codigo, aur.poa_codigo, p.ges_codigo, 
		aur.aun_codigo_ejecutora, au.aun_sigla AS aun_sigla_ejecutora, r.rol_nombre,
		aur.aun_codigo_rol, au2.aun_sigla AS aun_sigla_rol,
		r.rol_codigo, r.rol_estado,
		cr.cro_codigo , cr.cro_descripcion 
FROM 	estructura_poa.area_unidad_responsables aur
		LEFT JOIN estructura_organizacional.areas_unidades au ON aur.aun_codigo_ejecutora = au.aun_codigo
		LEFT JOIN estructura_organizacional.areas_unidades au2 ON aur.aun_codigo_rol = au2.aun_codigo
		LEFT JOIN estructura_poa.poas p ON aur.poa_codigo = p.poa_codigo
		LEFT JOIN parametricas.roles r ON aur.rol_codigo = r.rol_codigo 
		LEFT JOIN parametricas.clasificacion_rol cr ON aur.cro_codigo = cr.cro_codigo 
WHERE 	TRUE
		AND aur.aur_estado NOT IN (0,5,9)
		AND aur.per_codigo IN (42)
--		AND aur.aun_codigo_ejecutora IN (64)
		AND aur.rol_codigo IN (2,3,4,5,6)
		AND p.ges_codigo IN (2)
		AND p.poa_codigo IN (3)
ORDER BY au.aun_sigla ASC
;
--##################### FASE 1 ############################
SELECT 	DISTINCT 
		aur.per_codigo, r.rol_codigo 
FROM 	estructura_poa.area_unidad_responsables aur
		LEFT JOIN estructura_organizacional.areas_unidades au ON aur.aun_codigo_ejecutora = au.aun_codigo
		LEFT JOIN estructura_organizacional.areas_unidades au2 ON aur.aun_codigo_rol = au2.aun_codigo
		LEFT JOIN estructura_poa.poas p ON aur.poa_codigo = p.poa_codigo
		LEFT JOIN parametricas.roles r ON aur.rol_codigo = r.rol_codigo 
		LEFT JOIN parametricas.clasificacion_rol cr ON aur.cro_codigo = cr.cro_codigo 
WHERE 	TRUE
		AND aur.aur_estado NOT IN (0,5,9)
		AND aur.per_codigo IN (42)
--		AND aur.aun_codigo_ejecutora IN (64)
		AND aur.rol_codigo IN (2,3,4,5,6)
		AND p.ges_codigo IN (2)
		AND p.poa_codigo IN (3)
;
--##################### FASE 2a ############################
SELECT
    aur.per_codigo,
    MAX(CASE WHEN aur.rol_codigo = 2 THEN '1' ELSE '0' END) AS es_aprobador,
    MAX(CASE WHEN aur.rol_codigo = 3 THEN '1' ELSE '0' END) AS es_supervisor,
    MAX(CASE WHEN aur.rol_codigo = 4 THEN '1' ELSE '0' END) AS es_formulador_gerente,
    MAX(CASE WHEN aur.rol_codigo = 5 THEN '1' ELSE '0' END) AS es_comision,
    MAX(CASE WHEN aur.rol_codigo = 6 THEN '1' ELSE '0' END) AS es_responsable
FROM
    estructura_poa.area_unidad_responsables aur
    LEFT JOIN estructura_organizacional.areas_unidades au ON aur.aun_codigo_ejecutora = au.aun_codigo
    LEFT JOIN estructura_organizacional.areas_unidades au2 ON aur.aun_codigo_rol = au2.aun_codigo
    LEFT JOIN estructura_poa.poas p ON aur.poa_codigo = p.poa_codigo
    LEFT JOIN parametricas.roles r ON aur.rol_codigo = r.rol_codigo 
    LEFT JOIN parametricas.clasificacion_rol cr ON aur.cro_codigo = cr.cro_codigo 
WHERE
    aur.aur_estado NOT IN (0, 5, 9)
    AND aur.per_codigo = 42
    -- AND aur.aun_codigo_ejecutora IN (64)
    AND aur.rol_codigo IN (2, 3, 4, 5, 6)
    AND p.ges_codigo = 2
    AND p.poa_codigo = 3
GROUP BY
    aur.per_codigo;
--##################### FASE 2b #############################
WITH roles AS (
    SELECT DISTINCT 
        aur.per_codigo, aur.rol_codigo 
    FROM estructura_poa.area_unidad_responsables aur
        LEFT JOIN estructura_organizacional.areas_unidades au ON aur.aun_codigo_ejecutora = au.aun_codigo
        LEFT JOIN estructura_organizacional.areas_unidades au2 ON aur.aun_codigo_rol = au2.aun_codigo
        LEFT JOIN estructura_poa.poas p ON aur.poa_codigo = p.poa_codigo
        LEFT JOIN parametricas.roles r ON aur.rol_codigo = r.rol_codigo 
        LEFT JOIN parametricas.clasificacion_rol cr ON aur.cro_codigo = cr.cro_codigo 
    WHERE 
        aur.aur_estado NOT IN (0, 5, 9)
--        AND aur.per_codigo = 42
        -- AND aur.aun_codigo_ejecutora IN (64)
        AND aur.rol_codigo IN (2, 3, 4, 5, 6)
        AND p.ges_codigo = 2
        AND p.poa_codigo = 3
)
SELECT 
    per_codigo,
    MAX(CASE WHEN rol_codigo = 2 THEN '1' ELSE '0' END) AS es_aprobador,
    MAX(CASE WHEN rol_codigo = 3 THEN '1' ELSE '0' END) AS es_supervisor,
    MAX(CASE WHEN rol_codigo = 4 THEN '1' ELSE '0' END) AS es_formulador_gerente,
    MAX(CASE WHEN rol_codigo = 5 THEN '1' ELSE '0' END) AS es_comision,
    MAX(CASE WHEN rol_codigo = 6 THEN '1' ELSE '0' END) AS es_responsable
FROM 
    roles
GROUP BY 
    per_codigo;

--
SELECT 	*
FROM 	parametricas.roles r 
;
--###################################################3
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
              AND t.aun_codigo_ejecutora IN (64)
              AND t.rol_codigo IN (1,2,3,4,6,7,8)
        ORDER BY t.aur_codigo DESC, t.fecha_registro DESC
        ;
