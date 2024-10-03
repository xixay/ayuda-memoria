--###################### ROLES #######################
--FORMULARIOS TODOS
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
          FROM  estructura_poa.area_unidad_responsables aur
                LEFT JOIN estructura_organizacional.areas_unidades au ON aur.aun_codigo_ejecutora = au.aun_codigo
          WHERE aur.aur_estado != 0 -- ESTADO ROL-RESPONSABLE
                AND au.aun_estado IN (2,8) -- ESTADO AREA-UNIDAD (CONSOLIDADO, APROBADO)
                AND aur.rol_codigo IN (1,2,3,4,8) -- ROL SELECCIONADO
                AND aur.poa_codigo IN (3) -- POA SELECCIONADO
                 -- PER_CODIGO SELECCIONADO
          GROUP BY au.aun_codigo, au.aun_nombre, au.aun_sigla, au.cau_codigo, au.aun_numero, au.aun_reporte_habilitado
          ORDER BY au.aun_sigla ASC, au.aun_nombre ASC
          ;
--SOLO UNO
SELECT 	*
FROM 	parametricas.estados e
;
--
SELECT 	DISTINCT au.aun_sigla
FROM 	estructura_poa.area_unidad_responsables aur
		LEFT JOIN estructura_organizacional.areas_unidades au ON aur.aun_codigo_ejecutora = au.aun_codigo 
WHERE 	aur.per_codigo IN (1914)
		AND aur.rol_codigo IN (1)
;

-- ESPECIFICACION TIPOO TRAB
SELECT 	*
FROM 	parametricas.especificacion_tipos_trabajo ett 
WHERE 	TRUE
--		AND ett_codigo IN (4)
;
--POAS OBJETIVOS
SELECT 	DISTINCT
		po.pobj_codigo,
		a.act_codigo, a.act_numero,
		au.aun_sigla 
FROM 	estructura_poa.poas_objetivos po
		LEFT JOIN estructura_poa.actividades a ON po.pobj_codigo = a.pobj_codigo 
		LEFT JOIN estructura_organizacional.areas_unidades au ON a.aun_codigo_ejecutora = au.aun_codigo 
WHERE 	TRUE
		AND po.tin_codigo IN (1)
		AND po.poa_codigo IN (3)
		AND a.act_estado NOT IN (0)
		AND a.cac_codigo IN (2)
;
--indi
SELECT 	*
FROM 	parametricas.tipo_indicador ti 
;
--niveles areas unidades
SELECT 	*
FROM 	parametricas.niveles_areas_unidades nau 
;
--activiad
SELECT 	*
FROM 	estructura_poa.actividades a
WHERE 	TRUE 
--		AND a.pobj_codigo IN (1365)
ORDER BY a.act_codigo DESC
;
-- INICIOS ACTIVIDADES
SELECT 	*
FROM 	ejecucion_actividades.inicios_actividades ia 
ORDER BY ia.iac_codigo DESC
;
--actividad continua
SELECT 	*
FROM 	estructura_poa.actividades_continuidad ac 
ORDER BY ac.aco_codigo DESC
;
--roles
SELECT 	*
FROM 	parametricas.roles
;



