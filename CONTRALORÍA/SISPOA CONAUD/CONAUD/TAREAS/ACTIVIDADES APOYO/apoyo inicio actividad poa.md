## Querys
```sql
SELECT 	*
FROM 	ejecucion_actividades.apoyo_inicio_actividad_poa aiap 
;

SELECT 	*
FROM 	ejecucion_actividades.inicio_actividad_poa iap
		LEFT JOIN ejecucion_actividades.inicios_actividades ia ON iap.iac_codigo = ia.iac_codigo 
WHERE 	TRUE
		AND iap.iap_codigo IN (933)
;--iac_codigo=685
SELECT 	*
FROM 	estructura_poa.actividades a
WHERE 	a.act_codigo IN (3167)
;

SELECT 	a.act_codigo,a.act_numero, au.aun_sigla, a.ttr_codigo , tt.ttr_codigo,  tt.ttr_descripcion, ett.ett_codigo,  ett.ett_nombre 
FROM 	estructura_poa.actividades a
		LEFT JOIN estructura_organizacional.areas_unidades au ON a.aun_codigo_ejecutora = au.aun_codigo 
		LEFT JOIN parametricas.tipos_trabajos tt ON tt.ttr_codigo = a.ttr_codigo
		LEFT JOIN parametricas.especificacion_tipos_trabajo ett ON ett.ett_codigo = tt.ett_codigo
WHERE 	TRUE
		AND tt.ttr_codigo = 79;
		
SELECT 	*
FROM 	ejecucion_actividades.apoyo_inicio_actividad_poa aiap 
;
```