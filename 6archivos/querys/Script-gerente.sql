--######## addAsignacionesCargosItem #######
--busca el cargo item persona
SELECT 	*
FROM 	estructura_organizacional.cargos_items_persona cip 
WHERE 	TRUE
		AND cip.cip_estado IN (2,42)
		AND cip.per_codigo IN (42)
;---------------------------------obtiene el cit_codigo=398
--busca el inicio actividad poa
SELECT 	*
FROM 	ejecucion_actividades.inicio_actividad_poa_asignaciones iapa
WHERE 	TRUE
		AND iapa.iap_codigo IN (499)
;---------------------------------obtiene el asi_codigo = 960
--busca los datos de esa asignacion
SELECT 	*
FROM 	ejecucion_poa.asignaciones a
WHERE 	TRUE
		AND a.asi_codigo IN (960)
		AND a.asi_estado IN (2)
;
--busca asignaciones cargos item
SELECT 	*
FROM 	ejecucion_poa.asignaciones_cargos_item aci
WHERE 	TRUE
		AND aci.asi_codigo IN (960)
		AND aci.cit_codigo IN (398)
		AND aci.aci_estado IN (2)
;---------------------------------obtiene el aci_codigo=2802

--########### addFormulariosObjetivos ############

SELECT 	*
FROM 	estructura_poa.formularios_objetivos fo
ORDER BY fo.fecha_registro DESC
;


--$$$$$$$$$$$$$$$$$$$$$$
      SELECT
        ia.iac_codigo_control AS codigo,
        ia.iac_codigo_control_vista AS codigo_vista,
        a.act_descripcion,
        e_iac.est_codigo AS iac_estado,
        e_iac.est_nombre AS iac_est_descripcion,
        e_iac.est_color AS iac_est_color,
        e_iap.est_codigo  AS iap_estado,
        e_iap.est_nombre AS iap_est_descripcion,
        e_iap.est_color AS iap_est_color,
        iap.tia_codigo,
        NULL AS est_color,
        TO_CHAR(a.fecha_registro, 'HH24:MI am dd/mm/yyyy') AS fecha_registro,
        NULL AS count_estado
      FROM ejecucion_actividades.inicios_actividades ia
        LEFT JOIN ejecucion_actividades.inicio_actividad_poa iap ON iap.iac_codigo = ia.iac_codigo
        LEFT JOIN parametricas.estados e_iap ON iap.iap_estado = e_iap.est_codigo
        LEFT JOIN parametricas.estados e_iac ON ia.iac_estado = e_iac.est_codigo
        LEFT JOIN estructura_poa.actividades a ON a.act_codigo = iap.act_codigo
        LEFT JOIN estructura_organizacional.areas_unidades au ON au.aun_codigo = a.aun_codigo_ejecutora
      WHERE TRUE
        AND a.aun_codigo_ejecutora IN (67)
        AND NOT iap.iap_estado IN (21)
      UNION ALL
      SELECT
        'Evaluacion' AS code,
        a.act_descripcion,
        NULL AS iac_codigo_control_vista,
        NULL AS iac_estado,
        NULL AS iac_est_descripcion,
        NULL AS iac_est_color,
        NULL AS iap_estado,
        NULL AS iap_est_descripcion,
        NULL AS iap_est_color,
        NULL AS tia_codigo,
        e.est_color,
        TO_CHAR(a.fecha_registro, 'HH24:MI am dd/mm/yyyy') AS fecha_registro,
        COUNT(a.act_codigo) AS total_actividades
      FROM ejecucion_informes.informes_uai iu
        LEFT JOIN estructura_poa.actividades a ON a.act_codigo = iu.act_codigo
        LEFT JOIN ejecucion_informes.inicio_evaluacion_informe iei ON iei.iua_codigo = iu.iua_codigo
        LEFT JOIN parametricas.estados e ON a.act_estado = e.est_codigo
        LEFT JOIN estructura_organizacional.areas_unidades au ON au.aun_codigo = a.aun_codigo_ejecutora
      WHERE TRUE
        AND a.aun_codigo_ejecutora IN (67)
        AND iei.iei_estado IN (2)
      GROUP BY
      a.act_descripcion,
      a.act_codigo,
      e.est_color
      HAVING COUNT(DISTINCT a.act_codigo) >0
;

SELECT	*
FROM 	estructura_poa.actividades_continuidad ac 
WHERE 	TRUE
--		AND ac.aco_codigo IN (398)
ORDER BY ac.aco_codigo DESC
;

SELECT 	*
FROM 	ejecucion_actividades.inicios_actividades ia
WHERE 	ia.iac_codigo IN (146)
;

SELECT 	*
FROM 	parametricas.empresas e
;

































