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

