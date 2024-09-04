SELECT 	*
FROM 	estructura_poa.area_unidad_responsables aur
WHERE 	aur.poa_codigo IN (3)
		AND aur_estado NOT IN (0)
ORDER BY aur.aun_codigo_ejecutora ASC
;

--actualizar foto
UPDATE 	estructura_poa.area_unidad_responsables
SET 	per_codigo = 1914
WHERE 	poa_codigo = 3
;

--
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
		AND aa.act_estado NOT IN (17)
	  --AND aa.aun_codigo_ejecutora IN (14)
ORDER BY 3 ASC;

SELECT 	p.poa_codigo, p.poa_estado,p.tpo_codigo, tf.tpo_nombre ,p.poa_ejecucion_conaud,p.poa_actualizado_conaud 
FROM 	estructura_poa.poas p
		LEFT JOIN parametricas.tipos_formulaciones tf ON p.tpo_codigo = tf.tpo_codigo
--WHERE 	p.poa_codigo NOT IN (1)
ORDER 	BY p.poa_codigo DESC
;		
SELECT 	*
FROM 	estructura_poa.poas p ;
       
SELECT	
		p.poa_codigo ,p.poa_estado,
		po.pobj_codigo , po.pobj_estado,
		oau.oau_codigo ,oau.oau_estado ,
		aur.aur_codigo ,aur.aur_estado ,
		a.act_codigo ,a.act_estado ,
		av.avi_codigo ,av.avi_estado 
FROM 	estructura_poa.poas p 
		LEFT JOIN estructura_poa.poas_objetivos po ON p.poa_codigo = po.poa_codigo 
		LEFT JOIN estructura_poa.objetivos_area_unidad oau ON po.pobj_codigo = oau.pobj_codigo 
		LEFT JOIN estructura_poa.area_unidad_responsables aur ON p.poa_codigo = aur.poa_codigo 
		LEFT JOIN estructura_poa.actividades a ON po.pobj_codigo = a.pobj_codigo
		LEFT JOIN estructura_poa.actividades_viaticos av ON a.act_codigo = av.act_codigo 
WHERE 	TRUE 
		AND p.poa_codigo IN (2)
;

SELECT 	*
FROM 	control_estados.flujos_tablas t
WHERE 	t.tab_codigo IN (51);


















