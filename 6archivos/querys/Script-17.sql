SELECT 	*
FROM 	estructura_poa.poas_objetivos po 
WHERE 	TRUE
		AND po.poa_codigo IN (3)
		AND po.pobj_nombre LIKE 'Emitir 6 informes analíticos de los Planes Anuales de Auditoría elaborados por las UAI de Entidades Públicas del Nivel Departamental en la Gerencia Departamental del Beni en la gestión 2024.'
;


SELECT 	*
FROM 	estructura_poa.area_unidad_responsables aur 
WHERE 	TRUE
		AND aur.per_codigo IN (79)
;
--
          SELECT
                au.aun_codigo AS aun_codigo_ejecutora, au.aun_nombre, au.aun_sigla--,
                --CONCAT(au.aun_nombre, ' - ', au.aun_sigla) AS nom_ejecutora
          FROM  estructura_poa.area_unidad_responsables aur
                LEFT JOIN estructura_organizacional.areas_unidades au ON aur.aun_codigo_ejecutora = au.aun_codigo
          WHERE aur.aur_estado != 0 -- ESTADO ROL-RESPONSABLE
                AND au.aun_estado IN (2,8) -- ESTADO AREA-UNIDAD (CONSOLIDADO, APROBADO)
                AND aur.rol_codigo IN (1,2,3,4,8) -- ROL SELECCIONADO
                AND aur.poa_codigo IN (3) -- POA SELECCIONADO
                AND aur.per_codigo = 79 -- PER_CODIGO SELECCIONADO
               -- AND au.aun_codigo IN (79,46)
          GROUP BY au.aun_codigo, au.aun_nombre, au.aun_sigla, au.cau_codigo, au.aun_numero, au.aun_reporte_habilitado
          ORDER BY au.aun_sigla ASC, au.aun_nombre ASC
          ;
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
SELECT 	au.aun_codigo ,au.aun_sigla, au.aun_estado 
FROM 	estructura_organizacional.areas_unidades au 
WHERE 	TRUE
		AND au.aun_codigo IN (4,13,17,21,26,31,36,41,44,47)--padre
		--AND au.aun_codigo IN (4,13,63,18,23,28,31,33,38,40,43,46,79,49)--hijos
;
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
WITH agrupado AS (
    SELECT
        -- Extraemos la parte de la sigla antes del guion (o toda la cadena si no hay guion)
        COALESCE(NULLIF(SPLIT_PART(au.aun_sigla, '-', 1), ''), au.aun_sigla) AS sigla_base,
        STRING_AGG(DISTINCT au.aun_codigo::TEXT, ',') AS aun_codigo_agrupado -- Eliminamos duplicados
    FROM estructura_poa.area_unidad_responsables aur
         LEFT JOIN estructura_organizacional.areas_unidades au 
         ON aur.aun_codigo_ejecutora = au.aun_codigo
    WHERE aur.aur_estado != 0 -- ESTADO ROL-RESPONSABLE
          AND au.aun_estado IN (2, 8) -- ESTADO AREA-UNIDAD (CONSOLIDADO, APROBADO)
          AND aur.rol_codigo IN (1, 2, 3, 4, 8) -- ROL SELECCIONADO
          AND aur.poa_codigo IN (3) -- POA SELECCIONADO
          AND aur.per_codigo = 79 -- PER_CODIGO SELECCIONADO
    GROUP BY COALESCE(NULLIF(SPLIT_PART(au.aun_sigla, '-', 1), ''), au.aun_sigla) -- Agrupamos por la unidad principal
)
SELECT 
    sigla_base AS aun_sigla,
    '(' || aun_codigo_agrupado || ')' AS aun_codigo
FROM agrupado
ORDER BY sigla_base;
--##################################################################################################3
SELECT 	
		aud.aun_codigo_padre, aud.aun_codigo_hijo ,
		au.aun_codigo, CONCAT('(', au.aun_numero, ') ', au.aun_nombre, ' - ', au.aun_sigla) AS aun_concatenado_invert
FROM 	estructura_organizacional.areas_unidades_dependencias aud
		LEFT JOIN estructura_organizacional.areas_unidades au ON aud.aun_codigo_padre = au.aun_codigo 
WHERE 	TRUE
		AND aud.aud_estado IN (1)
		AND aud.aun_codigo_padre IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12,13, 17, 21, 26, 31, 36, 41, 44, 47, 57,58, 68, 81)
;





