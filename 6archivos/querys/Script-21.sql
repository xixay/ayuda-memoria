SELECT 
		t.hog_codigo,
		t.hog_descripcion,
		t.hog_horas,
		t.ges_codigo,
		g.ges_anio,
		g.ges_estado, 
        t.hog_estado, 
        e.est_color, 
        e.est_nombre AS hge_estado_descripcion,
        TO_CHAR(t.fecha_registro, 'dd/mm/yyyy') AS fecha_registro,
        TO_CHAR(t.fecha_modificacion, 'dd/mm/yyyy') AS fecha_modificacion
FROM 	parametricas.horas_gestiones t
		LEFT JOIN parametricas.gestiones g ON t.ges_codigo = g.ges_codigo 
  		LEFT JOIN parametricas.estados e ON e.est_codigo = t.hog_estado
WHERE 	TRUE
--		AND t.hog_codigo IN (1)
--		AND t.hog_estado IN (1)
--		AND g.ges_codigo IN (1)
ORDER BY t.hog_codigo DESC
;

SELECT 	*
FROM 	parametricas.horas_gestiones hg 
;