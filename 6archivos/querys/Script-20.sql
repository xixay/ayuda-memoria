SELECT
		t.lug_codigo,
        t.lug_nombre,
        t.tlu_codigo,
        t.lug_estado,
        e.est_color,
        tlug.tlu_nombre,
        CONCAT (tlug.tlu_nombre,' - ',t.lug_nombre) AS ref_lugar_detallado,
        e.est_nombre AS lug_estado_descripcion,
        TO_CHAR(t.fecha_registro, 'HH24:MI am dd/mm/yyyy') as fecha_registro
FROM 	parametricas.lugares t
      	LEFT JOIN parametricas.estados e ON e.est_codigo = t.lug_estado
      	LEFT JOIN parametricas.tipos_lugares tlug ON tlug.tlu_codigo = t.tlu_codigo
WHERE 	TRUE
		AND t.lug_codigo IN (9,8,7,6,5,4,3,2,1)
ORDER BY 
    CASE 
        WHEN t.lug_codigo = 2 THEN 0
        ELSE 1 
    END, 
    t.lug_codigo DESC
;
        SELECT
              t.lug_codigo,
              t.lug_nombre,
              t.tlu_codigo,
              t.lug_estado,
              e.est_color,
              tlug.tlu_nombre,
              CONCAT (tlug.tlu_nombre,' - ',t.lug_nombre) AS ref_lugar_detallado,
              e.est_nombre AS lug_estado_descripcion,
              TO_CHAR(t.fecha_registro, 'HH24:MI am dd/mm/yyyy') as fecha_registro
        FROM  parametricas.lugares t
              LEFT JOIN parametricas.estados e ON e.est_codigo = t.lug_estado
              LEFT JOIN parametricas.tipos_lugares tlug ON tlug.tlu_codigo = t.tlu_codigo
        WHERE TRUE
        ORDER BY
          CASE
              WHEN t.lug_codigo = 2 THEN 0
              ELSE 1
          END,
          t.lug_codigo DESC;

