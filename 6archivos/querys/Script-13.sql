SELECT 	*
FROM	ejecucion_actividades.informes i
WHERE 	TRUE
		AND i.inf_codigo IN (380)
;

SELECT 	*
FROM 	ejecucion_actividades.inicio_actividad_poa iap 
WHERE 	TRUE
		AND iap.iac_codigo IN (685)
;--act_codigo = 3167

SELECT 	
		t.ain_codigo,
		t.ain_observacion,
		t.act_codigo,
		a.act_numero,
		CONCAT(a.act_numero, ' - ', a.act_descripcion) AS actividad,
		a.act_estado,
		au.aun_sigla,
		CONCAT(au.aun_sigla, ' - ', au.aun_nombre) AS aun_nombre_completo,
		p.poa_codigo,
		p.ges_codigo, 
		t.inf_codigo,
		i.inf_correlativo,
		i.inf_codigo_control,
		i.inf_nombre,
		CONCAT('(',i.inf_codigo_control,')', ' - (', ia.iac_codigo_control, ') - ',i.inf_nombre) AS informe,
		i.inf_estado,
		ia.iac_codigo,
		ia.iac_estado,
		ia.iac_codigo_control_vista, 
		t.ain_estado,
		t.usuario_registro,
		t.usuario_modificacion,
		TO_CHAR(t.fecha_registro, 'dd/mm/yyyy') AS fecha_registro,
		TO_CHAR(t.fecha_modificacion, 'dd/mm/yyyy') AS fecha_modificacion
FROM 	ejecucion_actividades.actividades_informes t
		LEFT JOIN estructura_poa.actividades a ON t.act_codigo = a.act_codigo
		LEFT JOIN estructura_organizacional.areas_unidades au ON a.aun_codigo_ejecutora = au.aun_codigo
		LEFT JOIN estructura_poa.poas_objetivos po ON a.pobj_codigo = po.pobj_codigo 
		LEFT JOIN estructura_poa.poas p ON po.poa_codigo = p.poa_codigo 
		LEFT JOIN ejecucion_actividades.informes i ON t.inf_codigo = i.inf_codigo
		LEFT JOIN ejecucion_actividades.inicios_actividades ia ON i.iac_codigo = ia.iac_codigo 
		LEFT JOIN parametricas.estados e ON t.ain_estado = e.est_codigo
WHERE 	TRUE
		AND t.ain_estado IN (1)
--		AND t.act_codigo IN (3167)
;
--######### INICIOS ACTIVIDADES ##############
SELECT 	*
FROM 	ejecucion_actividades.inicios_actividades ia
WHERE 	TRUE
--		AND ia.iac_codigo IN (685)
ORDER BY ia.iac_codigo DESC
;
--########## INICIO ACTIVIDAD POA ################
SELECT 	*
FROM 	ejecucion_actividades.inicio_actividad_poa iap
WHERE 	TRUE
--		AND iap.iac_codigo IN (685)
--		AND iap.act_codigo IN (3167)
		AND iap.iac_codigo IN (140)--(138,140,155,160,166,203,207,309,314,309,358)
ORDER BY iap.iap_codigo DESC
;--act_codigo=3167
--########### ACTIVIDADES #############
SELECT 	a.act_codigo, a.act_numero, a.act_estado, a.aun_codigo_ejecutora
FROM 	estructura_poa.actividades a
WHERE 	a.act_codigo IN (3167)
;
--########### INFORMES #############
SELECT 	*
FROM 	ejecucion_actividades.informes inf
WHERE 	TRUE
		AND inf.iac_codigo IN (685)
;
--######### INFORMES JOIN##############
SELECT 	i.inf_codigo, i.inf_estado, i.inf_codigo_control, i.inf_nombre, i.inf_estado,
		ia.iac_codigo, ia.iac_codigo_control_vista, ia.iac_estado
FROM 	ejecucion_actividades.informes i
		LEFT JOIN ejecucion_actividades.inicios_actividades ia ON i.iac_codigo = ia.iac_codigo 
WHERE 	TRUE
--		AND i.inf_estado IN (1)
		AND i.inf_codigo IN (380)
ORDER BY i.inf_codigo DESC
;--iac_codigo = 685
-- ########## ACTIVIDADES INFORMES ###############
SELECT 	*
FROM 	ejecucion_actividades.actividades_informes ai
WHERE 	TRUE
--		AND ai.ain_codigo =:ain_codigo
;
--&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
SELECT 
	inf.inf_codigo,
	inf.inf_estado,
	CONCAT(ia.iac_codigo_control, ' - ', inf.inf_nombre, ' - ','(',inf.inf_codigo_control,')') AS informe,
	inf.iac_codigo,
	ia.iac_estado,
	ia.iac_codigo_control_vista
FROM ejecucion_actividades.informes inf
    LEFT JOIN ejecucion_actividades.inicio_actividad_poa iap ON inf.iac_codigo = iap.iac_codigo
    LEFT JOIN ejecucion_actividades.inicios_actividades ia ON inf.iac_codigo = ia.iac_codigo
WHERE TRUE
    AND inf.inf_estado NOT IN (0,9)
    AND (
        CASE 
            -- Si existe el act_codigo en inicio_actividad_poa, lo usa para filtrar
            WHEN EXISTS (
                SELECT 1
                FROM ejecucion_actividades.inicio_actividad_poa iap_sub
                WHERE iap_sub.act_codigo = :act_codigo
            )
            THEN iap.act_codigo = :act_codigo
            -- Si no existe en inicio_actividad_poa, filtra solo por ges_codigo de inicios_actividades
            ELSE iap.iac_codigo IS NULL AND ia.ges_codigo = :ges_codigo
        END
    )
ORDER BY inf.inf_codigo ASC;
--&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
SELECT 
	inf.inf_codigo,
	inf.inf_estado,
	CONCAT('(',inf.inf_codigo_control,')', ' - (', ia.iac_codigo_control, ') - ',inf.inf_nombre) AS informe,
	inf.iac_codigo,
	ia.iac_estado,
	ia.iac_codigo_control_vista
FROM ejecucion_actividades.informes inf
    LEFT JOIN ejecucion_actividades.inicio_actividad_poa iap ON inf.iac_codigo = iap.iac_codigo
    LEFT JOIN ejecucion_actividades.inicios_actividades ia ON inf.iac_codigo = ia.iac_codigo
WHERE TRUE
    AND inf.inf_estado NOT IN (0,9)
    AND (
        -- Si existe el act_codigo en inicio_actividad_poa, filtra por act_codigo
        CASE 
            WHEN EXISTS (
                SELECT 1
                FROM ejecucion_actividades.inicio_actividad_poa iap_sub
                WHERE iap_sub.act_codigo = :act_codigo
            )
            THEN iap.act_codigo = :act_codigo
            -- Si no existe, no se aplica ninguna condición adicional
            ELSE TRUE
        END
    )
ORDER BY inf.inf_codigo ASC;

SELECT 	*
FROM 	ejecucion_actividades.informes i;
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$44444444
SELECT 	
		t.act_codigo,
		MAX(a.aun_codigo_ejecutora) AS aun_codigo_ejecutora,
		CONCAT(MAX(a.act_numero), ' - ', MAX(a.act_descripcion)) AS actividad,
		MAX(a.act_estado) AS act_estado,
		CONCAT(MAX(au.aun_sigla), ' - ', MAX(au.aun_nombre)) AS aun_nombre_completo, 
		-- Agregar solo los inf_codigo como un array de enteros
		array_agg(i.inf_codigo) AS informes,
		MAX(t.ain_estado) AS ain_estado,
		MAX(t.usuario_registro) AS usuario_registro,
		MAX(t.usuario_modificacion) AS usuario_modificacion,
		MAX(e.est_nombre) AS ain_estado_descripcion
FROM 	ejecucion_actividades.actividades_informes t
		LEFT JOIN estructura_poa.actividades a ON t.act_codigo = a.act_codigo
		LEFT JOIN estructura_organizacional.areas_unidades au ON a.aun_codigo_ejecutora = au.aun_codigo
		LEFT JOIN ejecucion_actividades.informes i ON t.inf_codigo = i.inf_codigo
		LEFT JOIN parametricas.estados e ON t.ain_estado = e.est_codigo
WHERE 	TRUE
		AND t.ain_estado NOT IN (0,9)
		--AND t.act_codigo IN (3167)
GROUP BY 
		t.act_codigo
ORDER BY t.act_codigo ASC;
--===========================================================
WITH 
-- Esta tabla con el act_codigo indicado busca su existencia en inicio_actividad_poa
act_codigo_existe AS (
    SELECT 1
    FROM ejecucion_actividades.inicio_actividad_poa iap_sub
    WHERE iap_sub.act_codigo = :act_codigo
),
-- Datos de informes y su información relacionada
informes AS (
    SELECT 
        inf.inf_codigo,
        inf.inf_estado,
        CONCAT('(', inf.inf_codigo_control, ')', ' - (', ia.iac_codigo_control, ') - ', inf.inf_nombre) AS informe,
        inf.iac_codigo,
        ia.iac_estado,
        ia.iac_codigo_control_vista,
        iap.act_codigo AS act_codigo_encontrado
    FROM 
        ejecucion_actividades.informes inf
        LEFT JOIN ejecucion_actividades.inicio_actividad_poa iap ON inf.iac_codigo = iap.iac_codigo
        LEFT JOIN ejecucion_actividades.inicios_actividades ia ON inf.iac_codigo = ia.iac_codigo
    WHERE 
        inf.inf_estado NOT IN (0, 9)
)
-- Consulta final con la lógica condicional
SELECT 
    inf.inf_codigo,
    inf.inf_estado,
    inf.informe,
    inf.iac_codigo,
    inf.iac_estado,
    inf.iac_codigo_control_vista
FROM 
    informes inf
WHERE 
    (
        -- Verifica si el act_codigo existe en inicio_actividad_poa
        EXISTS (SELECT 1 FROM act_codigo_existe)
        AND inf.act_codigo_encontrado = :act_codigo
    ) 
    OR 
    (
        -- Si act_codigo no existe en inicio_actividad_poa, se devuelven todos los informes
        NOT EXISTS (SELECT 1 FROM act_codigo_existe)
    );
--act_codigo=3152
-------------------------------------------------------------------------------------------
WITH 
-- Verificar si el act_codigo existe en inicio_actividad_poa
act_codigo_existe AS (
    SELECT 	1	
    FROM 	ejecucion_actividades.inicio_actividad_poa iap_sub
    WHERE 	iap_sub.act_codigo = :act_codigo
),
-- Verificar si existen informes asociados al act_codigo
informes_asociados AS (
    SELECT 	1
    FROM 	ejecucion_actividades.informes inf_sub
    		LEFT JOIN ejecucion_actividades.inicio_actividad_poa iap ON inf_sub.iac_codigo = iap.iac_codigo
    WHERE 	iap.act_codigo = :act_codigo
),
-- Datos de informes y su información relacionada
informes AS (
	SELECT 
        	inf.inf_codigo,
        	inf.inf_estado,
	        CONCAT('(', inf.inf_codigo_control, ')', ' - (', ia.iac_codigo_control, ') - ', inf.inf_nombre) AS informe,
	        inf.iac_codigo,
	        ia.iac_estado,
	        e.est_nombre AS inf_est_descripcion,
	        ia.iac_codigo_control_vista,
	        iap.act_codigo AS act_codigo_encontrado
	FROM 	ejecucion_actividades.informes inf
        	LEFT JOIN ejecucion_actividades.inicio_actividad_poa iap ON inf.iac_codigo = iap.iac_codigo
        	LEFT JOIN ejecucion_actividades.inicios_actividades ia ON inf.iac_codigo = ia.iac_codigo
        	LEFT JOIN parametricas.estados e ON inf.inf_estado = e.est_codigo
    WHERE 	inf.inf_estado NOT IN (0, 9)
)
-- Consulta final con la lógica completa
SELECT 
		inf.inf_codigo,
    	inf.inf_estado,
    	inf.informe,
    	inf.iac_codigo,
    	inf.iac_estado,
    	inf.iac_codigo_control_vista
FROM 	informes inf
WHERE 	(
	        -- Si act_codigo existe pero no tiene informes asociados, devolver todos los informes
	        EXISTS (SELECT 1 FROM act_codigo_existe) 
	        AND NOT EXISTS (SELECT 1 FROM informes_asociados)
    	)
    	OR 
	    (
	        -- Si hay informes asociados al act_codigo, solo devolver esos
	        EXISTS (SELECT 1 FROM informes_asociados) 
	        AND inf.act_codigo_encontrado = :act_codigo
	    )
	    OR 
	    (
	        -- Si act_codigo no existe en inicio_actividad_poa, devolver todos los informes
	        NOT EXISTS (SELECT 1 FROM act_codigo_existe)
	    );--3152

----------------------------------------------------------------------------------------
--
SELECT 	*
FROM 	estructura_poa.actividades a
WHERE 	a.act_codigo = :act_codigo
;
--
SELECT 	*
FROM 	ejecucion_actividades.inicio_actividad_poa iap
WHERE 	iap.act_codigo IN (3152)
;

SELECT 	*
FROM 	ejecucion_actividades.informes i
--WHERE 	i.iac_codigo IN (690)
;
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
SELECT 	
		t.act_codigo,
		MAX(a.act_numero) AS act_numero,
		MAX(CONCAT(a.act_numero, ' - ', a.act_descripcion)) AS actividad,
		MAX(a.act_estado) AS act_estado,
		MAX(au.aun_sigla) AS aun_sigla,
		MAX(CONCAT(au.aun_sigla, ' - ', au.aun_nombre)) AS aun_nombre_completo,
		MAX(p.poa_codigo) AS poa_codigo,
		MAX(p.ges_codigo) AS ges_codigo, 
		-- Agregar todos los informes como un array JSON
		json_agg(
			json_build_object(
				'inf_codigo', i.inf_codigo,
				'inf_correlativo', i.inf_correlativo,
				'inf_codigo_control', i.inf_codigo_control,
				'inf_nombre', i.inf_nombre,
				'informe', CONCAT('(', i.inf_codigo_control, ') - (', ia.iac_codigo_control, ') - ', i.inf_nombre, ' (', e1.est_nombre,')'),
				'inf_estado', i.inf_estado,
				'iac_codigo', ia.iac_codigo,
				'iac_estado', ia.iac_estado,
				'iac_codigo_control_vista', ia.iac_codigo_control_vista
			)
		) AS informes,
		MAX(t.ain_estado) AS ain_estado,
		MAX(e.est_nombre) AS ain_estado_descripcion,
		MAX(t.usuario_registro) AS usuario_registro,
		MAX(t.usuario_modificacion) AS usuario_modificacion
FROM 	ejecucion_actividades.actividades_informes t
		LEFT JOIN estructura_poa.actividades a ON t.act_codigo = a.act_codigo
		LEFT JOIN estructura_organizacional.areas_unidades au ON a.aun_codigo_ejecutora = au.aun_codigo
		LEFT JOIN estructura_poa.poas_objetivos po ON a.pobj_codigo = po.pobj_codigo 
		LEFT JOIN estructura_poa.poas p ON po.poa_codigo = p.poa_codigo 
		LEFT JOIN ejecucion_actividades.informes i ON t.inf_codigo = i.inf_codigo
		LEFT JOIN ejecucion_actividades.inicios_actividades ia ON i.iac_codigo = ia.iac_codigo 
		LEFT JOIN parametricas.estados e ON t.ain_estado = e.est_codigo
		LEFT JOIN parametricas.estados e1 ON i.inf_estado = e1.est_codigo
WHERE 	TRUE
		AND t.act_codigo IN (3167)
GROUP BY t.act_codigo
ORDER BY t.act_codigo ASC;
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 WITH
        -- Verificar si el act_codigo existe en inicio_actividad_poa
        act_codigo_existe AS (
            SELECT
                  1
            FROM        ejecucion_actividades.inicio_actividad_poa iap_sub
            WHERE iap_sub.act_codigo IN (1562)
        ),
        -- Verificar si existen informes asociados al act_codigo
        informes_asociados AS (
            SELECT
                  1
            FROM        ejecucion_actividades.informes inf_sub
                  LEFT JOIN ejecucion_actividades.inicio_actividad_poa iap ON inf_sub.iac_codigo = iap.iac_codigo
            WHERE iap.act_codigo IN (1562)
        ),
        -- Datos de informes y su información relacionada
        informes AS (
          SELECT
                inf.inf_codigo,
                inf.inf_estado,
                CONCAT('(', inf.inf_codigo_control, ')', ' - (', ia.iac_codigo_control, ') - ', inf.inf_nombre, ' (', e.est_nombre,')') AS informe,
                inf.iac_codigo,
                ia.iac_estado,
                ia.iac_codigo_control_vista,
                iap.act_codigo AS act_codigo_encontrado
          FROM  ejecucion_actividades.informes inf
                LEFT JOIN ejecucion_actividades.inicio_actividad_poa iap ON inf.iac_codigo = iap.iac_codigo
                LEFT JOIN ejecucion_actividades.inicios_actividades ia ON inf.iac_codigo = ia.iac_codigo
                LEFT JOIN parametricas.estados e ON inf.inf_estado = e.est_codigo
          WHERE inf.inf_estado NOT IN (0, 9)
        )
        -- Consulta final con la lógica completa
        SELECT
              inf.inf_codigo,
              inf.inf_estado,
              inf.informe,
              inf.iac_codigo,
              inf.iac_estado,
              inf.iac_codigo_control_vista
        FROM    informes inf
        WHERE (
                -- Si act_codigo existe pero no tiene informes asociados, devolver todos los informes
                EXISTS (SELECT 1 FROM act_codigo_existe)
                AND NOT EXISTS (SELECT 1 FROM informes_asociados)
              )
              OR
              (
                -- Si hay informes asociados al act_codigo, solo devolver esos
                EXISTS (SELECT 1 FROM informes_asociados)
                AND inf.act_codigo_encontrado IN (1562)
              )
              OR
              (
                -- Si act_codigo no existe en inicio_actividad_poa, devolver todos los informes
                NOT EXISTS (SELECT 1 FROM act_codigo_existe)
              );
