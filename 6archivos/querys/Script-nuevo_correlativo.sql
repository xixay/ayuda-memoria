WITH actividades_anterior AS (
SELECT 	a.act_codigo, a.act_estado, a.act_correlativo,a.act_codigo_anterior, a2.act_correlativo 
FROM 	estructura_poa.actividades a
		LEFT JOIN estructura_poa.actividades a2 ON a.act_codigo_anterior = a2.act_codigo
WHERE 	a.act_correlativo != a2.act_correlativo
		AND a.act_codigo_anterior NOTNULL 
)
SELECT * FROM actividades_anterior;