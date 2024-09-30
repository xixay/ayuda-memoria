tengo este query en postgres:
SELECT 	DISTINCT 
		ia.iac_codigo,
    	ia.iac_codigo_control AS trabajo_codigo,
    	ac.conaud_detalle->>'entidad_descripcion' AS entidad_descripcion,
    	ia.iac_objeto AS auditoria_objeto,
    	ia.iac_objetivo AS auditoria_objetivo,
    	g.ges_anio AS actividad_gestion
FROM 	ejecucion_actividades.inicios_actividades ia
		LEFT JOIN estructura_poa.actividades_continuidad ac ON ia.iac_codigo = ac.iac_codigo
		LEFT JOIN parametricas.gestiones g ON ia.ges_codigo = g.ges_codigo 
WHERE 	ia.iac_estado NOT IN (0)
--		AND ia.iac_codigo_control LIKE '%Y24';
--		AND ia.iac_codigo_control LIKE '%Y22';
		AND ia.iac_codigo_control LIKE 'GCEP69Y22';

|iac_codigo|trabajo_codigo|entidad_descripcion                          |auditoria_objeto                                                                                                                                                                       |auditoria_objetivo                                                                                                                                                                                                                                                    |actividad_gestion|
|----------|--------------|---------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------|
|117       |GCEP69Y22     |DIRECCION DEPARTAMENTAL DE EDUCACION DE PANDO|Información y documentación sobre el Pago del Bono de Planta y de Producción al personal docente investigador y administrativo dependiente de la UMSS, que ejerció funciones en AGRUCO.|Emitir opinión independiente sobre el cumplimiento del ordenamiento jurídico administrativo relativo al pago de Bonos de Planta y de Producción al personal docente investigador y administrativo de la UMSS, que ejerció funciones en el Centro Universitario AGRUCO.|2.022            |
|117       |GCEP69Y22     |UNIVERSIDAD MAYOR DE SAN SIMON               |Información y documentación sobre el Pago del Bono de Planta y de Producción al personal docente investigador y administrativo dependiente de la UMSS, que ejerció funciones en AGRUCO.|Emitir opinión independiente sobre el cumplimiento del ordenamiento jurídico administrativo relativo al pago de Bonos de Planta y de Producción al personal docente investigador y administrativo de la UMSS, que ejerció funciones en el Centro Universitario AGRUCO.|2.022            |

pero de estos datos internamente, el primero su dato de entidad_descripcion esta mal, porque el ac.conaud_detalle->>'trabajo_codigo' , no coincide con el de ia.iac_codigo_control, pero el del segundo la entidad_descripcion, esta bien



