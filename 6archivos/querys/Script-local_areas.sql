--
SELECT 	
		aud.aud_codigo, aud.aud_estado,
		au.aun_codigo AS aun_codigo_padre, au.aun_sigla AS aun_sigla_padre, au.aun_estado AS aun_estado_padre,
		au2.aun_codigo AS aun_codigo_hijos, au2.aun_sigla AS aun_sigla_hijo, au2.aun_estado AS aun_estado_hijo
FROM 	estructura_organizacional.areas_unidades_dependencias aud
		LEFT JOIN estructura_organizacional.areas_unidades au ON aud.aun_codigo_padre = au.aun_codigo 
		LEFT JOIN estructura_organizacional.areas_unidades au2 ON aud.aun_codigo_hijo = au2.aun_codigo 
WHERE 	TRUE 
		AND aud.aun_codigo_padre IN (17);
;

--CERO
WITH unidades AS (
	SELECT 	
		aud.aud_codigo, aud.aud_estado,
		au.aun_codigo AS aun_codigo_padre, au.aun_sigla AS aun_sigla_padre, au.aun_estado AS aun_estado_padre,
		au2.aun_codigo AS aun_codigo_hijos, au2.aun_sigla AS aun_sigla_hijo, au2.aun_estado AS aun_estado_hijo
	FROM 	estructura_organizacional.areas_unidades_dependencias aud
			LEFT JOIN estructura_organizacional.areas_unidades au ON aud.aun_codigo_padre = au.aun_codigo 
			LEFT JOIN estructura_organizacional.areas_unidades au2 ON aud.aun_codigo_hijo = au2.aun_codigo 
	WHERE 	TRUE 
			AND aud.aun_codigo_padre IN (17)   
	UNION 
	SELECT  0 aud_codigo,  0 aud_estado,
		 0 aun_codigo_padre, '' AS aun_sigla_padre, 0 AS aun_estado_padre,
		aud.aun_codigo_padre AS aun_codigo_hijos, '' AS aun_sigla_hijo, 0 AS aun_estado_hijo
	fROM estructura_organizacional.areas_unidades_dependencias aud 
	WHERE aun_codigo_padre IN (17)
	---condideracion especial para DC aun_codigo = 1
)
SELECT u.aun_codigo_hijos, oau.oau_codigo, oau.pobj_codigo, po.pobj_codigo, po.pobj_nombre  FROM unidades u 
LEFT JOIN estructura_poa.objetivos_area_unidad oau ON u.aun_codigo_hijos = oau.aun_codigo_ejecutora --AND estado validos 7
LEFT JOIN estructura_poa.poas_objetivos po ON po.pobj_codigo = oau.pobj_codigo;
----preguntar si se condiderar estado de POA
----preguntar si se condiderar estado de POA
SELECT 	po.pobj_codigo, po.pobj_nombre, po.pobj_estado, oau.oau_codigo,oau.oau_descripcion, oau.oau_estado 
FROM 	estructura_poa.objetivos_area_unidad oau
		LEFT JOIN estructura_poa.poas_objetivos po ON oau.pobj_codigo = po.pobj_codigo 
WHERE 	TRUE 
--		AND po.pobj_estado IN (8)
		AND po.pobj_estado NOT IN (0)
		AND oau.aun_codigo_ejecutora IN (14,17,18,19,20)
;
SELECT 	*
FROM 	estructura_poa.actividades a 
WHERE 	a.pobj_codigo IN (1712);
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
        WHERE TRUE
        AND au.aun_estado not in (0,9)
        AND go2.gor_estado > 0
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
        WHERE TRUE
        AND au.aun_estado not in (0,9)
        AND go2.gor_estado > 0
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
