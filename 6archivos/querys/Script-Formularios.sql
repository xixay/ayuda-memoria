--Obtiene area_unidad_responsables
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
--Prueba el JOIN básico:
SELECT au.aun_codigo, au.aun_nombre
FROM estructura_poa.area_unidad_responsables aur
LEFT JOIN estructura_organizacional.areas_unidades au ON aur.aun_codigo_ejecutora = au.aun_codigo;

--Agrega las condiciones WHERE:
SELECT au.aun_codigo, au.aun_nombre
FROM estructura_poa.area_unidad_responsables aur
LEFT JOIN estructura_organizacional.areas_unidades au ON aur.aun_codigo_ejecutora = au.aun_codigo
WHERE aur.aur_estado != 0 AND au.aun_estado IN (2);

--Agrega GROUP BY y ORDER BY:
SELECT au.aun_codigo, au.aun_nombre
FROM estructura_poa.area_unidad_responsables aur
LEFT JOIN estructura_organizacional.areas_unidades au ON aur.aun_codigo_ejecutora = au.aun_codigo
WHERE aur.aur_estado != 0 AND au.aun_estado IN (2)
GROUP BY au.aun_codigo, au.aun_nombre
ORDER BY au.aun_nombre ASC;

--Agrega ARRAY_AGG:
SELECT
    ARRAY_AGG(aur.rol_codigo) AS roles
FROM estructura_poa.area_unidad_responsables aur
WHERE aur.aun_codigo_ejecutora = 1;
--Aplica DISTINCT y ORDER BY:
SELECT
    ARRAY_AGG(DISTINCT aur.rol_codigo ORDER BY aur.rol_codigo ASC) AS roles
FROM estructura_poa.area_unidad_responsables aur
WHERE aur.aun_codigo_ejecutora = 1;
--Añade ARRAY_AGG, FILTER, y COALESCE para manejar los roles:
SELECT
    au.aun_codigo,
    au.aun_nombre,
    COALESCE(
        ARRAY_AGG(DISTINCT aur.rol_codigo ORDER BY aur.rol_codigo ASC) FILTER (WHERE aur.per_codigo = 1914),
        '{}'
    ) AS roles
FROM estructura_poa.area_unidad_responsables aur
LEFT JOIN estructura_organizacional.areas_unidades au ON aur.aun_codigo_ejecutora = au.aun_codigo
WHERE aur.aur_estado != 0 AND au.aun_estado IN (2)
GROUP BY au.aun_codigo, au.aun_nombre;





