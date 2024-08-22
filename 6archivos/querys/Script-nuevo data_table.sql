SELECT 	*
FROM 	estructura_poa.poas_objetivos po 
WHERE 	po.pobj_codigo = 1662
ORDER BY po.pobj_codigo DESC 
;

SELECT 	*
FROM 	estructura_poa.objetivos_area_unidad oau
WHERE 	oau.pobj_codigo = 1662
ORDER BY oau.pobj_codigo DESC 
;

SELECT 	*
FROM 	parametricas.gestiones g 
;

SELECT 	*
FROM 	estructura_poa.poas p
WHERE	p.ges_codigo IN (2)
		AND p.poa_estado IN (2)
		AND p.poa_ejecucion_conaud = TRUE
;
        SELECT
              au.aun_codigo AS aun_codigo_ejecutora, au.aun_nombre, au.aun_sigla, au.cau_codigo, au.aun_numero,
              CONCAT(au.aun_nombre, ' - ', au.aun_sigla) AS nom_ejecutora,
              au.aun_reporte_habilitado,
              COALESCE(
                ARRAY_AGG(
                  DISTINCT aur.rol_codigo ORDER BY aur.rol_codigo ASC
                ) FILTER (WHERE aur.per_codigo = 1914),
                '{}'
              ) AS roles,
              COUNT(DISTINCT aur.rol_codigo) AS cantidad_roles
        FROM	estructura_poa.area_unidad_responsables aur
              LEFT JOIN estructura_organizacional.areas_unidades au ON aur.aun_codigo_ejecutora = au.aun_codigo
        WHERE	aur.aur_estado != 0 -- ESTADO ROL-RESPONSABLE
              AND au.aun_estado IN (2) -- ESTADO AREA-UNIDAD (CONSOLIDADO)
              AND aur.rol_codigo IN (1,2,3,4) -- ROL SELECCIONADO
              AND aur.poa_codigo IN (3) -- POA SELECCIONADO
        GROUP BY au.aun_codigo, au.aun_nombre, au.aun_sigla, au.cau_codigo, au.aun_numero, au.aun_reporte_habilitado
        ORDER BY au.aun_sigla ASC, au.aun_nombre ASC
        ;

SELECT 	*
FROM 	parametricas.gestiones g 
		INNER JOIN parametricas.estados e ON g.ges_estado = e.est_codigo
WHERE 	g.ges_ejecucion = TRUE 
  		AND e.est_codigo IN (1, 2)
ORDER BY g.ges_codigo ASC;

SELECT 	*
FROM 	parametricas.especificacion_tipos_trabajo ett ;

SELECT 	ia.iac_codigo ,ia.iac_estado, ia.iac_codigo_control ,
		iap.act_codigo ,
		a.act_numero ,a.aun_codigo_ejecutora ,
		au.aun_sigla ,
		tt.ttr_codigo ,tt.ttr_descripcion ,ett.ett_codigo ,ett.ett_nombre 
FROM 	ejecucion_actividades.inicios_actividades ia
		LEFT JOIN ejecucion_actividades.inicio_actividad_poa iap ON ia.iac_codigo = iap.iac_codigo 
		LEFT JOIN estructura_poa.actividades a ON iap.act_codigo = a.act_codigo 
		LEFT JOIN estructura_organizacional.areas_unidades au ON a.aun_codigo_ejecutora = au.aun_codigo 
		LEFT JOIN parametricas.tipos_trabajos tt ON ia.ttr_codigo = tt.ttr_codigo
		LEFT JOIN parametricas.especificacion_tipos_trabajo ett ON tt.ett_codigo = ett.ett_codigo 
--WHERE 	ett.ett_codigo IN (5)
;