SELECT 	*
FROM 	ejecucion_actividades.informes_resumen_ejecutivo ire
		LEFT JOIN ejecucion_actividades.resumen_ejecutivo_resultados rer ON ire.rei_codigo = rer.rei_codigo 
;