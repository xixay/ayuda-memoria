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

SELECT 	aur.aur_codigo ,aur.aur_estado 
FROM 	estructura_poa.area_unidad_responsables aur
WHERE 	aur.poa_codigo IN (2);

WITH poa_tres AS (
	SELECT po.poa_codigo, a.act_codigo, A.act_numero,  a.act_estado, a.aun_codigo_ejecutora, pob.pro_codigo, a.act_codigo_anterior 
	FROM estructura_poa.actividades a 
	LEFT JOIN estructura_poa.poas_objetivos pob ON a.pobj_codigo = pob.pobj_codigo
	LEFT JOIN estructura_poa.poas po ON pob.poa_codigo = po.poa_codigo
	WHERE true
--	AND a.act_estado NOT IN (0,5,9, 47)
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
LEFT JOIN ejecucion_actividades.inicio_actividad_poa iap ON iap.act_codigo = poa_tres.act_codigo--poa_tres.act_codigo_anterior
WHERE iap.iap_estado NOT IN (0,5,9, 47)
UNION
SELECT DISTINCT  poa_tres.act_codigo_anterior, uai.act_codigo 
FROM poa_tres
LEFT JOIN ejecucion_informes.informes_uai uai ON uai.act_codigo = poa_tres.act_codigo--poa_tres.act_codigo_anterior
WHERE uai.iua_estado NOT IN (0,5,9,47)
UNION
SELECT poa_tres.act_codigo_anterior, ia.act_codigo 
FROM poa_tres
LEFT JOIN ejecucion_administrativas.inicios_administrativas ia ON ia.act_codigo = poa_tres.act_codigo--poa_tres.act_codigo_anterior
WHERE IA.iad_estado NOT IN (0,5,9,47)
)
--SELECT * FROM conaud WHERE act_codigo IS NOT null
SELECT p3.act_numero,p3.act_codigo, p3.act_codigo_anterior, p3.act_estado,  p2.act_codigo act_codigo_for , p2.act_estado estado_for,
po2.pobj_codigo, po2.pobj_estado, aa.aun_codigo_ejecutora ,  conaud.act_codigo AS conaud
FROM poa_tres p3
LEFT JOIN poa_dos p2 ON p3.act_codigo_anterior = p2.act_codigo
-----
LEFT JOIN conaud ON conaud.act_codigo = p3.act_codigo-- p3.act_codigo_anterior
LEFT JOIN estructura_poa.actividades aa ON aa.act_codigo = p3.act_codigo
LEFT JOIN estructura_poa.poas_objetivos po2 ON po2.pobj_codigo = aa.pobj_codigo 
WHERE conaud.act_codigo IS NOT NULL
ORDER BY 3 ASC
LIMIT 112
;

SELECT 	a.act_numero,a.act_codigo,a.act_estado,a.pobj_codigo
FROM 	estructura_poa.actividades a
WHERE	a.act_codigo IN (4,5,6,7,8,9,11,14,15,16,17,21,22,23,24,25,26,27,28,29,30,31,34,36,37,38,39,40,42,44,45,47,48,49,50,51,52,55,56,57,58,59,60,61,62,64,65,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,89,90,93,96,97
,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,119,120,121,122,123,124,125,126,128,129,130,131,132,133,134,136,137,141,142,145,148,151,153,155,157,158,159,165,166,167,169,171,173,176,177,178,179,180,181,182,186,187,188,189,190,191,193,195,197,199,200,201,202,207,208,211,212,214,215,216,218,220,225,227,231,234,
235,236,237,238,239,240,241,242,244,
246,251,252,254,260,261,263,264,266,268,270,271,273,274,276,278,281,282,287,288,291,294,298,299,300,302,303,308,309,312,317,319,320,322,324,330,335,336,338,340,345,347,348,350)
;















