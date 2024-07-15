--UAI EVALUACION
SELECT	
      	iu.iua_codigo, iu.iua_estado, iu.iua_cite,
      	ie.iev_codigo, ie.iev_estado, ie.iev_nombre 
FROM	ejecucion_informes.informes_uai iu
		LEFT JOIN ejecucion_informes.informes_evaluaciones ie ON iu.iua_codigo = ie.iua_codigo 
WHERE 	TRUE
--      	AND iu.iua_estado IN (22)
      	AND iu.act_codigo IN (1512)
;
--UAI NORMAL
SELECT		
      	iu.iua_codigo, iu.iua_estado, iu.iua_cite,
      	iei.iei_codigo, iei.iei_estado, iei.tia_codigo,
      	tia.tia_nombre,
		ieia.ieia_codigo, ieia.ieia_estado,
		a.asi_codigo, a.asi_estado,
		aci.aci_codigo, aci.aci_estado, aci.cit_codigo 
FROM	ejecucion_informes.informes_uai iu
		LEFT JOIN ejecucion_informes.inicio_evaluacion_informe iei ON iu.iua_codigo = iei.iua_codigo
		LEFT JOIN parametricas.tipos_inicios_actividades tia ON iei.tia_codigo = tia.tia_codigo
		LEFT JOIN ejecucion_informes.inicio_evaluacion_informe_asignaciones ieia ON iei.iei_codigo = ieia.ieia_codigo
		LEFT JOIN ejecucion_poa.asignaciones a ON ieia.asi_codigo = a.asi_codigo
		LEFT JOIN ejecucion_poa.asignaciones_cargos_item aci ON a.asi_codigo = aci.asi_codigo 
WHERE 	TRUE
--      	AND iu.iua_codigo IN (796)
--      	AND iu.iua_codigo IN (797)
      	AND iu.act_codigo IN (1525)
;
--UAI REINGRESO
SELECT 	iur.*
--		iu.iua_codigo, iu.iua_estado, iu.iua_cite
FROM 	ejecucion_informes.informes_uai iu
		LEFT JOIN	ejecucion_informes.informes_uai_reingreso iur ON iu.iua_codigo = iur.iua_codigo 
WHERE 	TRUE 
		AND iu.iua_codigo IN (796)
;
--ACTIVIDADES
SELECT 	*
FROM 	estructura_poa.actividades a 
ORDER BY a.act_codigo DESC ;

INSERT INTO parametricas.tipos_trabajos
(ttr_codigo, ttr_sigla, ttr_descripcion, ttr_bandera_entidad_cge, ett_codigo, ttr_estado, usuario_registro, ttr_inicial)
VALUES(79, 'SCAT', 'EVALUACIÓN SCAT', true, 5, 1, 1914, 'S');

INSERT INTO parametricas.clasificacion_tipos_trabajos
(ctt_codigo, ctt_descripcion, ttr_codigo, cau_codigo, ctt_estado, usuario_registro)
VALUES((SELECT MAX(ctt_codigo) + 1 FROM parametricas.clasificacion_tipos_trabajos), '', 79, 1, 1, 0);
--
        SELECT
              COALESCE(iap.act_codigo, evc.act_codigo) AS act_codigo,
              iap.iap_codigo, iap.iap_estado,
              iap.iac_codigo, iap.iac_estado,
              iap.inf_estados,
              evc.evaluaciones
        FROM
              (
                SELECT
                      iap.act_codigo,
                      iap.iap_codigo, iap.iap_estado,
                      ia.iac_codigo, ia.iac_estado,
                      ARRAY_AGG(DISTINCT COALESCE(inf.inf_estado, 0)) AS inf_estados
                FROM	ejecucion_actividades.inicio_actividad_poa iap
                      LEFT JOIN parametricas.estados es1 ON iap.iap_estado = es1.est_codigo
                      LEFT JOIN ejecucion_actividades.inicios_actividades ia ON iap.iac_codigo = ia.iac_codigo
                      LEFT JOIN ejecucion_actividades.informes inf ON ia.iac_codigo = inf.iac_codigo
                WHERE	TRUE
                      AND iap.act_codigo IN (1525)
                GROUP BY
                      iap.act_codigo,
                      ia.iac_codigo, ia.iac_estado,
                      iap.iap_codigo, iap.iap_estado
              ) iap
              FULL JOIN (
                SELECT
                      iu.act_codigo,
                      JSON_AGG(
                        JSON_BUILD_OBJECT(
                          'iua_codigo', iu.iua_codigo,
                          'iua_estado', iu.iua_estado,
                          'iei_codigo', iei.iei_codigo,
                          'iei_estado', iei.iei_estado
                        )
                      ) AS evaluaciones
                FROM	ejecucion_informes.informes_uai iu
                      LEFT JOIN ejecucion_informes.inicio_evaluacion_informe iei ON iu.iua_codigo = iei.iua_codigo
                WHERE	TRUE
                      AND iu.act_codigo IN (1525)
                GROUP BY iu.act_codigo
              ) evc
              ON iap.act_codigo = evc.act_codigo
        ORDER BY COALESCE(iap.act_codigo, evc.act_codigo)
        ;
       
--
        WITH tmp_iap AS (
          SELECT
                iap.act_codigo,
                JSON_BUILD_OBJECT(
                  'asi_codigo', aci.asi_codigo,
                  'aci_codigo', aci.aci_codigo,
                  'tia_codigo', iap.tia_codigo,
                  'iap_estado', iap.iap_estado,
                  'iac_estado', ia.iac_estado,
                  'iac_codigo_control', ia.iac_codigo_control,
                  'iac_codigo_control_vista', ia.iac_codigo_control_vista
                ) AS json_data
          FROM	ejecucion_poa.asignaciones_cargos_item aci
                INNER JOIN ejecucion_actividades.inicio_actividad_poa_asignaciones iapa ON aci.asi_codigo = iapa.asi_codigo AND iapa.iapa_estado != 0
                LEFT JOIN ejecucion_actividades.inicio_actividad_poa iap ON iapa.iap_codigo = iap.iap_codigo
                LEFT JOIN ejecucion_actividades.inicios_actividades ia ON iap.iac_codigo = ia.iac_codigo
          WHERE	TRUE
	          	--AND aci.asi_codigo IN (1269,1270,1271,1272,1273)
      --          AND aci.cit_codigo IN (155)
                AND aci.cit_codigo IN (208)
                --AND aci.aci_estado IN (2)
        ), tmp_iei AS (
          SELECT
                iu.act_codigo,
                JSON_BUILD_OBJECT(
                  'cantidad_actividades', COALESCE(COUNT(*), 0)
                ) AS json_data
          FROM	ejecucion_poa.asignaciones_cargos_item aci
                LEFT JOIN ejecucion_poa.asignaciones a ON a.asi_codigo = aci.asi_codigo
                LEFT JOIN ejecucion_informes.inicio_evaluacion_informe_asignaciones ieia ON ieia.asi_codigo = a.asi_codigo
                LEFT JOIN ejecucion_informes.inicio_evaluacion_informe iei ON iei.iei_codigo = ieia.iei_codigo
                LEFT JOIN ejecucion_informes.informes_uai iu ON iu.iua_codigo = iei.iua_codigo
          WHERE	TRUE
          		AND iu.act_codigo IN (1525)
                --AND aci.cit_codigo IN (155)
          		--AND aci.cit_codigo IN (208)
                --AND aci.aci_estado IN (2)
                AND iu.act_codigo IS NOT NULL
          GROUP BY iu.act_codigo
        )
        SELECT	*
        FROM	tmp_iap
              UNION ALL
        SELECT	*
        FROM	tmp_iei
        ;
       
SELECT 	aci.*
FROM	ejecucion_poa.asignaciones_cargos_item aci
		LEFT JOIN ejecucion_poa.asignaciones a ON a.asi_codigo = aci.asi_codigo
		LEFT JOIN ejecucion_informes.inicio_evaluacion_informe_asignaciones ieia ON ieia.asi_codigo = a.asi_codigo
		LEFT JOIN ejecucion_informes.inicio_evaluacion_informe iei ON iei.iei_codigo = ieia.iei_codigo
		LEFT JOIN ejecucion_informes.informes_uai iu ON iu.iua_codigo = iei.iua_codigo
WHERE	TRUE
		AND aci.cit_codigo IN (155);    
        
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
