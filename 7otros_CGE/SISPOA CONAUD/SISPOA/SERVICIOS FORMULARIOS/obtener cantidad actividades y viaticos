--##########################
SELECT
      a.act_estado, a.act_codigo_anterior, av.avi_estado, COALESCE(COUNT(DISTINCT a.act_codigo), 0) AS cantidad_actividades,
      COALESCE(COUNT(DISTINCT av.avi_codigo), 0) AS cantidad_viaticos
FROM	estructura_poa.poas_objetivos po
      LEFT JOIN estructura_poa.objetivos_area_unidad oau ON po.pobj_codigo = oau.pobj_codigo
      LEFT JOIN estructura_poa.actividades a ON po.pobj_codigo = a.pobj_codigo AND a.act_estado IN (4,10,14,11,12,13,45,1,3,8,7,17,2,5)
      LEFT JOIN estructura_poa.actividades_viaticos av ON a.act_codigo = av.act_codigo AND av.avi_estado IN (4,10,14,11,12,13,45,1,3,8,7,17,2,5)
WHERE	TRUE
      AND oau.oau_estado != 0
      AND po.poa_codigo IN (3)
      AND po.pobj_estado IN (2,8)
      AND oau.aun_codigo_ejecutora IN (27)
      AND a.aun_codigo_ejecutora IN (27)
      AND a.cac_codigo IN (1,3,4)
GROUP BY a.act_estado, av.avi_estado, a.act_codigo_anterior
ORDER BY
      array_position( array[4,10,14,11,12,13,45,1,3,8,7,17,2,5], av.avi_estado ),
      array_position( array[4,10,14,11,12,13,45,1,3,8,7,17,2,5], a.act_estado )
;
--Prueba Individual de SELECT y FROM:
SELECT a.act_estado, av.avi_estado
FROM estructura_poa.actividades a
LEFT JOIN estructura_poa.actividades_viaticos av ON a.act_codigo = av.act_codigo
WHERE a.act_estado IN (4,10,14,11,12,13,45,1,3,8,7,17,2,5);
--Agrega los LEFT JOIN y Filtros:
SELECT a.act_estado, av.avi_estado
FROM estructura_poa.poas_objetivos po
LEFT JOIN estructura_poa.objetivos_area_unidad oau ON po.pobj_codigo = oau.pobj_codigo
LEFT JOIN estructura_poa.actividades a ON po.pobj_codigo = a.pobj_codigo AND a.act_estado IN (4,10,14,11,12,13,45,1,3,8,7,17,2,5)
LEFT JOIN estructura_poa.actividades_viaticos av ON a.act_codigo = av.act_codigo AND av.avi_estado IN (4,10,14,11,12,13,45,1,3,8,7,17,2,5)
WHERE oau.oau_estado != 0 AND po.poa_codigo IN (3) AND po.pobj_estado IN (2,8);
--Aplica el GROUP BY y usa COUNT para ver la cantidad de actividades y viáticos:
SELECT
   a.act_estado,
   av.avi_estado,
   COALESCE(COUNT(DISTINCT a.act_codigo), 0) AS cantidad_actividades,
   COALESCE(COUNT(DISTINCT av.avi_codigo), 0) AS cantidad_viaticos
FROM estructura_poa.actividades a
LEFT JOIN estructura_poa.actividades_viaticos av ON a.act_codigo = av.act_codigo
WHERE a.act_estado IN (4,10,14,11,12,13,45,1,3,8,7,17,2,5)
GROUP BY a.act_estado, av.avi_estado;
--Finalmente, añade la ordenación con array_position:
SELECT
   a.act_estado,
   av.avi_estado,
   COALESCE(COUNT(DISTINCT a.act_codigo), 0) AS cantidad_actividades,
   COALESCE(COUNT(DISTINCT av.avi_codigo), 0) AS cantidad_viaticos
FROM estructura_poa.actividades a
LEFT JOIN estructura_poa.actividades_viaticos av ON a.act_codigo = av.act_codigo
WHERE a.act_estado IN (4,10,14,11,12,13,45,1,3,8,7,17,2,5)
GROUP BY a.act_estado, av.avi_estado
ORDER BY array_position(array[4,10,14,11,12,13,45,1,3,8,7,17,2,5], av.avi_estado),
         array_position(array[4,10,14,11,12,13,45,1,3,8,7,17,2,5], a.act_estado);


