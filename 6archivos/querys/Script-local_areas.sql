--POAS OBJ PARA LA FAMILIA AREAS
SELECT 	--po.pobj_codigo ,po.pobj_estado
		po.pobj_codigo, po.pobj_nombre, po.pobj_estado, oau.oau_codigo,oau.oau_descripcion, oau.oau_estado, oau.aun_codigo_ejecutora 
FROM 	estructura_poa.objetivos_area_unidad oau
		LEFT JOIN estructura_poa.poas_objetivos po ON oau.pobj_codigo = po.pobj_codigo 
WHERE 	TRUE 
--		AND po.pobj_estado IN (8)
		AND po.poa_codigo IN (4)
		AND po.pobj_estado NOT IN (0)
		AND oau.aun_codigo_ejecutora IN (9.65,66)
ORDER BY oau.aun_codigo_ejecutora ASC 
;
--ROL NUEVO
SELECT 	*
FROM 	parametricas.roles r ;
INSERT INTO parametricas.roles
(rol_codigo, rol_nombre, rol_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja)
VALUES(8, 'GERENTE CONSOLIDADOR', 1, 0, 0, 0, '2024-08-27 15:38:21.677', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000');
--ESTADOS
SELECT 	*
FROM 	parametricas.estados e ;

SELECT 	*
FROM 	estructura_organizacional.areas_unidades au 
WHERE 	au.aun_sigla LIKE 'GNAF'
;
--VALIDADOR
SELECT 	
		au.aun_sigla,
		oau.oau_codigo, oau.oau_estado,oau.aun_codigo_ejecutora,
		oau.pobj_codigo, po.pobj_estado, po.poa_codigo,
		a.act_codigo ,a.act_estado,
		av.avi_codigo ,av.avi_estado 
FROM 	estructura_poa.objetivos_area_unidad oau
		LEFT JOIN estructura_organizacional.areas_unidades au ON oau.aun_codigo_ejecutora = au.aun_codigo 
		LEFT JOIN estructura_poa.poas_objetivos po ON oau.pobj_codigo = po.pobj_codigo
		LEFT JOIN estructura_poa.actividades a ON po.pobj_codigo = a.pobj_codigo
		LEFT JOIN estructura_poa.actividades_viaticos av ON a.act_codigo = av.act_codigo 
WHERE 	TRUE
		AND oau.oau_estado NOT IN (0)
		AND po.poa_codigo IN (4)
		AND oau.aun_codigo_ejecutora IN (14,17,18,19,20)
		AND a.act_estado NOT IN (0,5,9)
ORDER BY oau.aun_codigo_ejecutora ASC 
;
WITH todos AS (
	SELECT 	
			a.cac_codigo,au.aun_sigla,
			oau.oau_codigo, oau.oau_estado,oau.aun_codigo_ejecutora,
			oau.pobj_codigo, po.pobj_estado, po.poa_codigo,
			a.act_codigo ,a.act_estado,
			av.avi_codigo ,av.avi_estado 
	FROM 	estructura_poa.poas_objetivos po
	        LEFT JOIN pei.programas pr ON po.pro_codigo = pr.pro_codigo
	        LEFT JOIN estructura_poa.objetivos_area_unidad oau ON po.pobj_codigo = oau.pobj_codigo AND oau.oau_estado NOT IN (0)
	        LEFT JOIN estructura_organizacional.areas_unidades au ON oau.aun_codigo_ejecutora = au.aun_codigo
	        LEFT JOIN estructura_organizacional.areas_unidades au2 ON po.aun_codigo_padre = au2.aun_codigo
			LEFT JOIN estructura_poa.actividades a ON po.pobj_codigo = a.pobj_codigo
			LEFT JOIN estructura_poa.actividades_viaticos av ON a.act_codigo = av.act_codigo 
	WHERE 	TRUE
			AND po.poa_codigo IN (4)
			AND po.pobj_estado IN (2,8)
	        AND oau.oau_estado IN (2,8)
			--AND oau.aun_codigo_ejecutora IN (14,17,18,19,20)
			--AND oau.aun_codigo_ejecutora IN (9.65,66)
			AND oau.aun_codigo_ejecutora IN (66)
			AND a.act_estado NOT IN (0,5,9)
	ORDER BY oau.aun_codigo_ejecutora ASC 
)
SELECT 	*	FROM todos;

--ESTADO
SELECT 	*
FROM 	parametricas.estados e ;

select 	*
from 	control_estados.flujos_tablas ft
where 	true 
--		and ft.tab_codigo in (41)--poa_obj
--		and ft.tab_codigo in (39)--obj_area
		and ft.tab_codigo in (1)--act
--		and ft.tab_codigo in (2)--via
;

SELECT 	*
FROM 	control_estados.flujos_tablas ft 
		LEFT JOIN parametricas.tablas t ON t.tab_codigo = ft.ft.tab_codigo ;
--------- ESTADO NUEVO
INSERT INTO parametricas.estados (est_codigo, est_nombre, est_color, est_descripcion, usuario_registro) VALUES(48, 'CONSOLIDADO GERENTE', '#69e0b7', '', 0);
--------- FLUJOS ADICIONADOS
INSERT INTO control_estados.flujos_tablas (fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro) VALUES((select max(fta_codigo)+1 from control_estados.flujos_tablas), 1, '', 7, 48, 1, 0);
INSERT INTO control_estados.flujos_tablas (fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro) VALUES((select max(fta_codigo)+1 from control_estados.flujos_tablas), 1, '', 48, 17, 1, 0);
INSERT INTO control_estados.flujos_tablas (fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro) VALUES((select max(fta_codigo)+1 from control_estados.flujos_tablas), 2, '', 7, 48, 1, 0);
INSERT INTO control_estados.flujos_tablas (fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro) VALUES((select max(fta_codigo)+1 from control_estados.flujos_tablas), 2, '', 48, 17, 1, 0);



--POA OBJ AREA PADRE
SELECT 	po.poa_codigo ,po.pobj_codigo ,po.pobj_nombre ,po.pobj_estado,
		oau.oau_codigo ,oau.oau_descripcion ,oau.aun_codigo_ejecutora ,oau.aun_codigo_supervisora ,oau.oau_estado 
FROM 	estructura_poa.poas_objetivos po 
		LEFT JOIN estructura_poa.objetivos_area_unidad oau ON po.pobj_codigo = oau.pobj_codigo 
WHERE 	po.pobj_codigo IN (1937,1756,1752,1731,1728,1726,1668)
;

--ACT PADRE
SELECT 	a.pobj_codigo, a.act_codigo,a.act_numero ,a.act_descripcion ,a.act_estado 
FROM 	estructura_poa.actividades a 
WHERE 	a.pobj_codigo IN (1937,1756,1752,1731,1728,1726,1668)
;
--VIAT PADRE
SELECT 	av.act_codigo,av.avi_codigo, av.avi_estado 
FROM 	estructura_poa.actividades_viaticos av
WHERE 	av.act_codigo IN (3556,3557,3558,3559,3560,3561,3555,3554)
;


--------- ESTADO NUEVO
INSERT INTO parametricas.estados (est_codigo, est_nombre, est_color, est_descripcion, usuario_registro) VALUES(48, 'CONSOLIDADO GERENTE', '#69e0b7', '', 0);
--------- FLUJOS ADICIONADOS
INSERT INTO control_estados.flujos_tablas (fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro) VALUES((select max(fta_codigo)+1 from control_estados.flujos_tablas), 1, '', 7, 48, 1, 0);
INSERT INTO control_estados.flujos_tablas (fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro) VALUES((select max(fta_codigo)+1 from control_estados.flujos_tablas), 1, '', 48, 17, 1, 0);
INSERT INTO control_estados.flujos_tablas (fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro) VALUES((select max(fta_codigo)+1 from control_estados.flujos_tablas), 2, '', 7, 48, 1, 0);
INSERT INTO control_estados.flujos_tablas (fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro) VALUES((select max(fta_codigo)+1 from control_estados.flujos_tablas), 2, '', 48, 17, 1, 0);



--
WITH tmp_area_unidad AS (
        SELECT
          au.aun_codigo,
          o.org_codigo,
          go2.ges_codigo,
          CONCAT_WS(' - ', au.aun_nombre, au.aun_sigla) AS aun_concatenado_invert
        FROM estructura_organizacional.areas_unidades au
        INNER JOIN estructura_organizacional.organigramas o ON o.org_codigo = au.org_codigo
        INNER JOIN estructura_organizacional.gestiones_organigramas go2 ON go2.org_codigo = o.org_codigo
        INNER JOIN parametricas.gestiones g on go2.ges_codigo = g.ges_codigo 
        INNER JOIN estructura_poa.poas p on p.ges_codigo = g.ges_codigo
        WHERE TRUE
        AND au.aun_estado not in (0,9,5)
        AND go2.gor_estado > 0
        AND p.poa_codigo IN (4)
      ),
      tmp_dependientes_area AS (---los q son hijos
      SELECT
        DISTINCT
          aud.aun_codigo_padre,
          aud.aun_codigo_hijo,
          tau_padre.aun_concatenado_invert,
          tau_hijo.aun_concatenado_invert AS aun_concatenado_invert_hijo,
          tau_padre.org_codigo
        FROM estructura_organizacional.areas_unidades_dependencias aud
        INNER JOIN tmp_area_unidad tau_padre ON tau_padre.aun_codigo = aud.aun_codigo_padre
        INNER JOIN tmp_area_unidad tau_hijo ON tau_hijo.aun_codigo = aud.aun_codigo_hijo
        WHERE aud.aud_estado > 0 and aud.aud_estado <> 9         
      )
      ,
      tmp_area_unidad_top_padre AS ( -- Areas/Uniades que no tienen padre pero tienen hijos
        SELECT
          tau.aun_codigo
        FROM tmp_area_unidad tau
        WHERE tau.aun_codigo NOT IN (SELECT tda.aun_codigo_hijo FROM tmp_dependientes_area tda)
        AND tau.aun_codigo IN (SELECT tda.aun_codigo_padre FROM tmp_dependientes_area tda)
      ),
      tmp_area_unidad_sueltos AS (
      SELECT DISTINCT 
            aud.aun_codigo_padre,
            aud.aun_codigo_hijo ,
            tau_padre.aun_concatenado_invert,
            tau_padre.org_codigo
          FROM estructura_organizacional.areas_unidades_dependencias aud 
          INNER JOIN tmp_area_unidad tau_padre ON tau_padre.aun_codigo = aud.aun_codigo_hijo
          INNER JOIN tmp_area_unidad_top_padre top ON aud.aun_codigo_padre = top.aun_codigo
          LEFT JOIN tmp_dependientes_area tpa ON tpa.aun_codigo_padre = aud.aun_codigo_hijo --los que NO son padres y son hijo de aun codigo 1 
          WHERE aud.aud_estado IN (1,2,3,4,5,8)
          AND tpa.aun_codigo_padre IS null
      )
      ----SI AUN CODIGO ES 1
        SELECT DISTINCT 0 as aun_codigo_padre, aun_codigo_padre AS aun_codigo,
        aun_concatenado_invert
        FROM tmp_dependientes_area
        where aun_codigo_padre in (1);
       
 --
WITH tmp_area_unidad AS (
        SELECT
          au.aun_codigo,
          o.org_codigo,
          go2.ges_codigo,
          CONCAT_WS(' - ', au.aun_nombre, au.aun_sigla) AS aun_concatenado_invert
        FROM estructura_organizacional.areas_unidades au
        INNER JOIN estructura_organizacional.organigramas o ON o.org_codigo = au.org_codigo
        INNER JOIN estructura_organizacional.gestiones_organigramas go2 ON go2.org_codigo = o.org_codigo
        INNER JOIN parametricas.gestiones g on go2.ges_codigo = g.ges_codigo 
        INNER JOIN estructura_poa.poas p on p.ges_codigo = g.ges_codigo
        WHERE TRUE
        AND au.aun_estado not in (0,9,5)
        AND go2.gor_estado > 0
        AND p.poa_codigo IN (4)
      ),
      tmp_dependientes_area AS (---los q son hijos
      SELECT
        DISTINCT
          aud.aun_codigo_padre,
          aud.aun_codigo_hijo,
          tau_padre.aun_concatenado_invert,
          tau_hijo.aun_concatenado_invert AS aun_concatenado_invert_hijo,
          tau_padre.org_codigo
        FROM estructura_organizacional.areas_unidades_dependencias aud
        INNER JOIN tmp_area_unidad tau_padre ON tau_padre.aun_codigo = aud.aun_codigo_padre
        INNER JOIN tmp_area_unidad tau_hijo ON tau_hijo.aun_codigo = aud.aun_codigo_hijo
        WHERE aud.aud_estado > 0 and aud.aud_estado <> 9         
      )
      ,
      tmp_area_unidad_top_padre AS ( -- Areas/Uniades que no tienen padre pero tienen hijos
        SELECT
          tau.aun_codigo
        FROM tmp_area_unidad tau
        WHERE tau.aun_codigo NOT IN (SELECT tda.aun_codigo_hijo FROM tmp_dependientes_area tda)
        AND tau.aun_codigo IN (SELECT tda.aun_codigo_padre FROM tmp_dependientes_area tda)
      ),
      tmp_area_unidad_sueltos AS (
      SELECT DISTINCT 
            aud.aun_codigo_padre,
            aud.aun_codigo_hijo ,
            tau_padre.aun_concatenado_invert,
            tau_padre.org_codigo
          FROM estructura_organizacional.areas_unidades_dependencias aud 
          INNER JOIN tmp_area_unidad tau_padre ON tau_padre.aun_codigo = aud.aun_codigo_hijo
          INNER JOIN tmp_area_unidad_top_padre top ON aud.aun_codigo_padre = top.aun_codigo
          LEFT JOIN tmp_dependientes_area tpa ON tpa.aun_codigo_padre = aud.aun_codigo_hijo --los que NO son padres y son hijo de aun codigo 1 
          WHERE aud.aud_estado IN (1,2,3,4,5,8)
          AND tpa.aun_codigo_padre IS null
      )    
      -----SI AUN CODIGO ES <> 1
      	SELECT DISTINCT aun_codigo_padre AS aun_codigo_padre, aun_codigo_hijo aun_codigo,
	    aun_concatenado_invert_hijo as aun_codigo_descripcion
	    FROM tmp_dependientes_area
	    WHERE case when aun_codigo_padre not in (1) then aun_codigo_padre IN (17) else false end	    	    
	    union all 
	    SELECT DISTINCT  0 AS aun_codigo_padre , aun_codigo,
	    aun_concatenado_invert as aun_codigo_descripcion
	    FROM tmp_area_unidad
	    WHERE case when aun_codigo not in (1) then aun_codigo IN (17) else false end	
	    ORDER BY aun_codigo asc;
--validador    
   
   WITH areas_dependientes AS (
    SELECT
          au.aun_sigla,po.poa_codigo,
          oau.oau_codigo, oau.oau_estado,
          oau.pobj_codigo, po.pobj_estado,
          a.act_codigo, a.act_estado,
          av.avi_codigo, av.avi_estado
    FROM 	estructura_poa.objetivos_area_unidad oau
          LEFT JOIN estructura_organizacional.areas_unidades au ON oau.aun_codigo_ejecutora = au.aun_codigo
          LEFT JOIN estructura_poa.poas_objetivos po ON oau.pobj_codigo = po.pobj_codigo
          LEFT JOIN estructura_poa.actividades a ON po.pobj_codigo = a.pobj_codigo
          LEFT JOIN estructura_poa.actividades_viaticos av ON a.act_codigo = av.act_codigo
    WHERE
          TRUE
          AND oau.oau_estado NOT IN (0,9,5)
          AND po.poa_codigo IN (4)
          AND oau.aun_codigo_ejecutora IN (14,17,18,19,20)
  ),
  estados AS (
    SELECT DISTINCT ad.oau_estado, ad.pobj_estado, ad.act_estado, ad.avi_estado
    FROM areas_dependientes ad
  )
  SELECT
    COUNT(*) AS contador,
    SUM(CASE WHEN act_estado IN (7,0,9,5,47) OR act_estado IS NULL THEN 1 ELSE 0 END) AS act_estado_count,
    SUM(CASE WHEN avi_estado IN (7,0,9,5,47) OR avi_estado IS NULL THEN 1 ELSE 0 END) AS avi_estado_count,
    CASE WHEN
    COUNT(*) = SUM(CASE WHEN act_estado IN (7,0,9,5,47) OR act_estado IS NULL THEN 1 ELSE 0 END)
    AND COUNT(*) = SUM(CASE WHEN avi_estado IN (7,0,9,5,47) OR avi_estado IS NULL THEN 1 ELSE 0 END)
    THEN TRUE ELSE FALSE END AS validador
  FROM estados;
   
--   contador=17
--   act_estado_count=6
--   avi_estado_count=10
--   validaador=false
 SELECT	*
 FROM 	estructura_organizacional.areas_unidades au 
 WHERE 	au.aun_sigla LIKE 'DC'
 ;

      SELECT 
        t.fta_codigo, 
		    t.est_codigo_origen,
		    eo.est_nombre AS est_codigo_origen_descripcion,
		    t.est_codigo_destino,
		    ed.est_nombre AS est_codigo_destino_descripcion,
        t.fta_estado,
		    t.tab_codigo,
        e.est_color, 
        e.est_nombre AS fta_estado_descripcion 
      FROM control_estados.flujos_tablas t
        LEFT JOIN parametricas.estados e ON e.est_codigo = t.fta_estado
        LEFT JOIN parametricas.tablas tab ON tab.tab_codigo = t.tab_codigo
        LEFT JOIN parametricas.estados eo ON eo.est_codigo = t.est_codigo_origen
        LEFT JOIN parametricas.estados ed ON ed.est_codigo = t.est_codigo_destino
      WHERE TRUE
        AND tab.tab_nombre IN ('Actividades')
       	;
       
SELECT 	*
FROM 	estructura_poa.area_unidad_responsables aur ;
