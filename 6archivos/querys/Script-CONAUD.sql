SELECT DISTINCT 
    ia.iac_codigo,
    ia.iac_codigo_control AS trabajo_codigo,
    ac.iac_codigo, 
    ac.conaud_correlativo,
    ac.conaud_detalle::text  -- Convertir JSON a texto
FROM 
    ejecucion_actividades.inicios_actividades ia
    LEFT JOIN estructura_poa.actividades_continuidad ac ON ia.iac_codigo = ac.iac_codigo
WHERE 
    ia.iac_codigo_control LIKE '%Y22';
   
SELECT DISTINCT 
    ia.iac_codigo,
    ia.iac_estado,
    -- Extraer correlativo_codigo del JSON si existe, de lo contrario usar el valor por defecto
    COALESCE(ac.conaud_detalle->>'correlativo_codigo', ia.iac_correlativo::text) AS correlativo_codigo, 
    -- Extraer trabajo_codigo del JSON si existe, de lo contrario usar el valor por defecto
    COALESCE(ac.conaud_detalle->>'trabajo_codigo', ia.iac_codigo_control) AS trabajo_codigo,
    -- Extraer actividad_codigo del JSON si existe, o NULL si no existe
    ac.conaud_detalle->>'actividad_codigo' AS actividad_codigo,
    -- Extraer entidad_descripcion del JSON si existe, de lo contrario usar un valor por defecto o NULL
    ac.conaud_detalle->>'entidad_descripcion' AS entidad_descripcion,
    ac.iac_codigo, 
    ac.conaud_correlativo
FROM 
    ejecucion_actividades.inicios_actividades ia
    LEFT JOIN estructura_poa.actividades_continuidad ac ON ia.iac_codigo = ac.iac_codigo
WHERE
	ia.iac_estado NOT IN (0)
    AND ia.iac_codigo_control LIKE '%Y22';




SELECT 	*
FROM 	ejecucion_actividades.inicios_actividades ia 
;

SELECT 	*
FROM 	estructura_poa.actividades_continuidad ac ;









