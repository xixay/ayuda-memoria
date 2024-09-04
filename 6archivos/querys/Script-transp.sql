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
  WHERE	TRUE 
  		AND aur.aur_estado != 0 -- ESTADO ROL-RESPONSABLE
        AND au.aun_estado IN (2,8) -- ESTADO AREA-UNIDAD (CONSOLIDADO, APROBADO)
        AND aur.rol_codigo IN (1,2,3,4,8) -- ROL SELECCIONADO
        AND aur.poa_codigo IN (4) -- POA SELECCIONADO
  GROUP BY au.aun_codigo, au.aun_nombre, au.aun_sigla, au.cau_codigo, au.aun_numero, au.aun_reporte_habilitado
  ORDER BY au.aun_sigla ASC, au.aun_nombre ASC
  ;
--
  SELECT
        au.aun_codigo AS aun_codigo_ejecutora, au.aun_nombre, au.aun_sigla, au.cau_codigo, au.aun_numero, CONCAT(au.aun_nombre, ' - ', au.aun_sigla) AS nom_ejecutora,
        COALESCE(oau.pobj_estado, '{}') AS pobj_estado,
        COALESCE(oau.oau_estado, '{}') AS oau_estado,
        COALESCE(roles.es_formulador, 0) AS es_formulador,
        COALESCE(roles.es_aprobador, 0) AS es_aprobador,
        COALESCE(roles.es_supervisor, 0) AS es_supervisor,
        COALESCE(roles.es_formulador_gerente, 0) AS es_formulador_gerente,
        COALESCE(roles.es_comision, 0) AS es_comision,
        COALESCE(roles.es_responsable, 0) AS es_responsable,
        (CASE WHEN of_administrativo.aun_codigo_supervisado IS NOT NULL THEN 1 ELSE 0 END) AS es_oficial_administrativo
  FROM	estructura_organizacional.areas_unidades au
        -- ESTADOS (POAS-OBJETIVOS, OBJETIVOS-AREA-UNIDAD)
        LEFT JOIN (
          SELECT
                oau.aun_codigo_ejecutora,
                ARRAY_AGG(DISTINCT po.pobj_estado) AS pobj_estado,
                ARRAY_AGG(DISTINCT oau.oau_estado) AS oau_estado
          FROM	estructura_poa.poas_objetivos po
                LEFT JOIN estructura_poa.objetivos_area_unidad oau ON po.pobj_codigo = oau.pobj_codigo
          WHERE	TRUE
                AND po.poa_codigo IN (4)
          GROUP BY oau.aun_codigo_ejecutora
          ORDER BY oau.aun_codigo_ejecutora ASC
        ) oau ON au.aun_codigo = oau.aun_codigo_ejecutora
        -- ROLES (AREA-UNIDAD-RESPONSABLES)
        LEFT JOIN (
          SELECT
                aur.aun_codigo_ejecutora,
                (CASE WHEN COUNT(aur.rol_codigo) FILTER (WHERE aur.rol_codigo = 1) > 0 THEN 1 ELSE 0 END) AS es_formulador,
                (CASE WHEN COUNT(aur.rol_codigo) FILTER (WHERE aur.rol_codigo = 2) > 0 THEN 1 ELSE 0 END) AS es_aprobador,
                (CASE WHEN COUNT(aur.rol_codigo) FILTER (WHERE aur.rol_codigo = 3) > 0 THEN 1 ELSE 0 END) AS es_supervisor,
                (CASE WHEN COUNT(aur.rol_codigo) FILTER (WHERE aur.rol_codigo = 4) > 0 THEN 1 ELSE 0 END) AS es_formulador_gerente,
                (CASE WHEN COUNT(aur.rol_codigo) FILTER (WHERE aur.rol_codigo = 5) > 0 THEN 1 ELSE 0 END) AS es_comision,
                (CASE WHEN COUNT(aur.rol_codigo) FILTER (WHERE aur.rol_codigo = 6) > 0 THEN 1 ELSE 0 END) AS es_responsable
          FROM	estructura_poa.area_unidad_responsables aur
          WHERE	TRUE
                AND aur.aur_estado IN (1,2)
                AND aur.poa_codigo IN (4)
                AND aur.per_codigo IN (1914)
          GROUP BY aur.aun_codigo_ejecutora
        ) roles ON au.aun_codigo = roles.aun_codigo_ejecutora
        -- ROL (AREA-UNIDAD-RESPONSABLES ESPECIFICO[OFICIAL-ADMINISTRATIVO])
        LEFT JOIN (
          SELECT	af.aun_codigo_supervisado
          FROM	estructura_organizacional.autoridades_funcionales af
          WHERE	TRUE
                AND af.afu_estado IN (1,2,8)
                AND af.aun_codigo_supervisor IN (
                  SELECT	aur.aun_codigo_ejecutora
                  FROM	estructura_poa.area_unidad_responsables aur
                  WHERE	TRUE
                      AND aur.aur_estado IN (1,2)
                      AND aur.rol_codigo IN (7) -- ROL OFICIAL-ADMINISTRATIVO
                      AND aur.poa_codigo IN (4)
                      AND aur.per_codigo IN (1914)
                )
          ORDER BY af.aun_codigo_supervisado ASC
        ) of_administrativo ON au.aun_codigo = of_administrativo.aun_codigo_supervisado
  WHERE	TRUE
        AND au.aun_estado IN (2, 8)
        AND au.org_codigo IN (
              SELECT COALESCE(gor.org_codigo, 0) AS org_codigo
              FROM estructura_poa.poas p LEFT JOIN estructura_organizacional.gestiones_organigramas gor ON p.ges_codigo = gor.ges_codigo
              WHERE p.poa_codigo IN (4)
            )
  ORDER BY au.aun_codigo ASC
  ;
--
  --
SELECT 	*
FROM 	estructura_poa.area_unidad_responsables aur 
WHERE 	TRUE
		AND aur.poa_codigo IN (4)
ORDER BY aur.aun_codigo_ejecutora DESC;
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
        AND t.fta_estado IN (1)
 --       AND t.est_codigo_destino IN (17)       
 --       AND tab.tab_nombre IN ('Actividades');
   ;     
       
SELECT 	t.oau_codigo , t.pobj_codigo , t.aun_codigo_ejecutora ,t.oau_estado,po.pobj_nombre, po.pobj_estado 
FROM 	estructura_poa.objetivos_area_unidad t
		LEFT JOIN estructura_poa.poas_objetivos po ON t.pobj_codigo = po.pobj_codigo
WHERE 	TRUE 
		AND t.pobj_codigo IN (1202, 1197)
		AND t.oau_estado IN (0,1,2,3,4,5,8,15)
ORDER BY t.fecha_registro DESC 
;


SELECT 	*
FROM 	estructura_organizacional.areas_unidades au ;
WITH poa_tres AS (
	SELECT po.poa_codigo, a.act_codigo, A.act_numero,  a.act_estado, a.aun_codigo_ejecutora, pob.pro_codigo, a.act_codigo_anterior 
	FROM estructura_poa.actividades a 
	LEFT JOIN estructura_poa.poas_objetivos pob ON a.pobj_codigo = pob.pobj_codigo
	LEFT JOIN estructura_poa.poas po ON pob.poa_codigo = po.poa_codigo
	WHERE TRUE
	--AND a.act_estado NOT IN (0,5,9, 47)
	--AND a.act_codigo_anterior IS NOT NULL
	AND po.poa_codigo IN (3)
	ORDER BY pob.pro_codigo
),
poa_dos AS
(
	SELECT po.poa_codigo, a.act_codigo, A.act_numero,  a.act_estado, a.aun_codigo_ejecutora, pob.pro_codigo , pob.pobj_codigo 
	FROM estructura_poa.actividades a 
	LEFT JOIN estructura_poa.poas_objetivos pob ON a.pobj_codigo = pob.pobj_codigo
	LEFT JOIN estructura_poa.poas po ON pob.poa_codigo = po.poa_codigo
	--WHERE a.act_estado NOT IN (0,5,9, 47)
	AND po.poa_codigo IN (2)
	ORDER BY pob.pro_codigo
),
conaud AS (
SELECT poa_tres.act_codigo_anterior, iap.act_codigo AS act_codigo
FROM poa_tres
LEFT JOIN ejecucion_actividades.inicio_actividad_poa iap ON iap.act_codigo = poa_tres.act_codigo_anterior
WHERE iap.iap_estado NOT IN (0,5,9, 47)
UNION
SELECT DISTINCT  poa_tres.act_codigo_anterior, uai.act_codigo 
FROM poa_tres
LEFT JOIN ejecucion_informes.informes_uai uai ON uai.act_codigo = poa_tres.act_codigo_anterior
WHERE uai.iua_estado NOT IN (0,5,9,47)
UNION
SELECT poa_tres.act_codigo_anterior, ia.act_codigo 
FROM poa_tres
LEFT JOIN ejecucion_administrativas.inicios_administrativas ia ON ia.act_codigo = poa_tres.act_codigo_anterior
WHERE IA.iad_estado NOT IN (0,5,9,47)
)
--SELECT * FROM conaud WHERE act_codigo IS NOT null
SELECT p3.act_numero,p3.act_codigo, p3.act_codigo_anterior, p3.act_estado,  p2.act_codigo act_codigo_for , p2.act_estado estado_for,
po2.pobj_codigo, po2.pobj_estado, aa.aun_codigo_ejecutora ,au.aun_sigla,  conaud.act_codigo AS conaud
FROM poa_tres p3
LEFT JOIN poa_dos p2 ON p3.act_codigo_anterior = p2.act_codigo
-----
LEFT JOIN conaud ON conaud.act_codigo = p3.act_codigo_anterior
LEFT JOIN estructura_poa.actividades aa ON aa.act_codigo = p3.act_codigo
LEFT JOIN estructura_poa.poas_objetivos po2 ON po2.pobj_codigo = aa.pobj_codigo
LEFT JOIN estructura_organizacional.areas_unidades au ON aa.aun_codigo_ejecutora = au.aun_codigo 
WHERE conaud.act_codigo IS NOT NULL
	  AND aa.aun_codigo_ejecutora IN (14)
ORDER BY 3 ASC;



SELECT 	*
FROM 	estructura_poa.poas p 
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
FROM 	control_estados.flujos_tablas t
    	LEFT JOIN parametricas.estados e ON e.est_codigo = t.fta_estado
    	LEFT JOIN parametricas.tablas tab ON tab.tab_codigo = t.tab_codigo
    	LEFT JOIN parametricas.estados eo ON eo.est_codigo = t.est_codigo_origen
    	LEFT JOIN parametricas.estados ed ON ed.est_codigo = t.est_codigo_destino
WHERE TRUE
      --AND t.fta_estado IN (1)
	  --AND t.est_codigo_destino IN (5)       
	    AND tab.tab_nombre IN ('Actividades')
;
--POA
SELECT 	p.poa_codigo, p.poa_estado,p.tpo_codigo, tf.tpo_nombre ,p.poa_ejecucion_conaud,p.poa_actualizado_conaud 
FROM 	estructura_poa.poas p
		LEFT JOIN parametricas.tipos_formulaciones tf ON p.tpo_codigo = tf.tpo_codigo
--WHERE 	p.poa_codigo NOT IN (1)
ORDER 	BY p.poa_codigo DESC
;	
--GESTIONES
SELECT 	*
FROM 	parametricas.gestiones g ;

--
----------- ADD COLUMN estructura_poa.poas -----------
ALTER TABLE estructura_poa.poas
ADD COLUMN poa_actualizado_conaud BOOLEAN DEFAULT FALSE;
COMMENT ON COLUMN estructura_poa.poas.poa_actualizado_conaud IS 'Valor para verificar si el registro de POA, fue actualizado o enviado a ejecución en sistema CONAUD';

COMMENT ON COLUMN estructura_poa.poas.poa_ejecucion_conaud IS 'Valor para especificar el registro de POA, que se encuentra en ejecución en el sistema CONAUD';
