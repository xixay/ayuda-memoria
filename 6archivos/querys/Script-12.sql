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