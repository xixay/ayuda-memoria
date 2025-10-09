SELECT 	*
FROM 	estructura_poa.area_unidad_responsables aur 
WHERE 	TRUE 
		AND aur.aur_estado IN (1)
		AND aur.poa_codigo IN (4)
		AND aur.aun_codigo_rol IN (8)
		AND aur.rol_codigo IN (3)
;