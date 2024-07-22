--
SELECT 	--a.*
		iap.iap_codigo, iap.iap_estado,
		ia.iac_codigo, ia.iac_estado
FROM 	ejecucion_actividades.inicio_actividad_poa iap
		LEFT JOIN estructura_poa.actividades a ON iap.act_codigo = a.act_codigo 
		LEFT JOIN ejecucion_actividades.inicios_actividades ia ON iap.iac_codigo = ia.iac_codigo 
WHERE 	iap.iap_codigo IN (574)
ORDER BY iap.iap_codigo DESC 
;

SELECT	t.iap_codigo, t.iap_estado, t.tia_codigo, tia.tia_nombre, t.fecha_registro,
        a.act_codigo, a.act_numero,
        au.aun_sigla, 
        ia.iac_codigo, ia.iac_codigo_control,
        tt.ett_codigo
FROM	ejecucion_actividades.inicio_actividad_poa t
		LEFT JOIN parametricas.tipos_inicios_actividades tia ON t.tia_codigo = tia.tia_codigo
        LEFT JOIN estructura_poa.actividades a on t.act_codigo = a.act_codigo
        LEFT JOIN estructura_organizacional.areas_unidades au ON a.aun_codigo_ejecutora = au.aun_codigo 
        LEFT JOIN ejecucion_actividades.inicios_actividades ia on t.iac_codigo = ia.iac_codigo
        LEFT JOIN parametricas.tipos_trabajos tt on ia.ttr_codigo = tt.ttr_codigo
        LEFT JOIN parametricas.especificacion_tipos_trabajo ett on tt.ett_codigo = ett.ett_codigo
WHERE	TRUE
--      AND t.iac_codigo IN (1)
--		AND t.tia_codigo IN (1)--F1
--		AND t.tia_codigo IN (2)--F1-A
--		AND t.tia_codigo IN (3)--F2
		AND t.tia_codigo IN (4)--F2-A
--		AND t.iap_estado IN (5)
        AND t.iap_estado NOT IN (0)
ORDER BY t.fecha_registro DESC
;







