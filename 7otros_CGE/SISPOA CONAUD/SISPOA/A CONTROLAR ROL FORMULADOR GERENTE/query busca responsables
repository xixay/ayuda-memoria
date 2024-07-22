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
              --AND t.aur_codigo IN (3448)
              --AND t.aur_estado IN (1)
        	  AND t.aur_estado IN (1)
		      AND t.poa_codigo IN (2)
		      AND t.aun_codigo_ejecutora IN (67)
		      AND t.aun_codigo_rol IN (67)
        ORDER BY t.aur_codigo DESC, t.fecha_registro desc
        ;
