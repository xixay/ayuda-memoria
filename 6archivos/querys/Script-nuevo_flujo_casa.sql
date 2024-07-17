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
      	iei.iei_codigo, iei.iei_estado, iei.tia_codigo,iei.iei_observaciones, 
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
      	AND iu.iua_codigo IN (829,830,831,832,843)--SCAT
--      	AND iu.iua_codigo IN (833,834,835,836,837)--FIRMAS
--      	AND iu.iua_codigo IN (838,839,840,841,842)--UAIS
--      	AND iu.iua_codigo IN (838)
--      	AND iu.act_codigo IN (1525)
;
--ACTIVIDADES
SELECT 	*
FROM 	estructura_poa.actividades a 
ORDER BY a.act_codigo DESC ;
SELECT	t.tab_nombre, ft.est_codigo_origen, eo.est_nombre, ft.est_codigo_destino, ed.est_nombre
FROM	control_estados.flujos_tablas ft
		LEFT JOIN parametricas.tablas t ON ft.tab_codigo = t.tab_codigo
		LEFT JOIN parametricas.estados eo ON ft.est_codigo_origen = eo.est_codigo
		LEFT JOIN parametricas.estados ed ON ft.est_codigo_destino = ed.est_codigo
--WHERE	ft.tab_codigo IN (SELECT t.tab_codigo FROM parametricas.tablas t WHERE t.tab_nombre IN ('InformesUai'))
WHERE	ft.tab_codigo IN (SELECT t.tab_codigo FROM parametricas.tablas t WHERE t.tab_nombre IN ('InicioEvaluacionInforme'))
ORDER BY ft.tab_codigo ASC, ft.est_codigo_origen ASC, ft.est_codigo_destino ASC
;
--EMPRESA
SELECT 	*
FROM 	parametricas.empresas e ;
--UAI REINGRESO
SELECT 	iur.*
--		iu.iua_codigo, iu.iua_estado, iu.iua_cite
FROM 	ejecucion_informes.informes_uai iu
		LEFT JOIN	ejecucion_informes.informes_uai_reingreso iur ON iu.iua_codigo = iur.iua_codigo 
WHERE 	TRUE 
		AND iu.iua_codigo IN (796)
;

--INSERTA TIPO SCAT
INSERT INTO parametricas.tipos_trabajos
(ttr_codigo, ttr_sigla, ttr_descripcion, ttr_bandera_entidad_cge, ett_codigo, ttr_estado, usuario_registro, ttr_inicial)
VALUES(79, 'SCAT', 'EVALUACIÓN SCAT', true, 5, 1, 1914, 'S');

INSERT INTO parametricas.clasificacion_tipos_trabajos
(ctt_codigo, ctt_descripcion, ttr_codigo, cau_codigo, ctt_estado, usuario_registro)
VALUES((SELECT MAX(ctt_codigo) + 1 FROM parametricas.clasificacion_tipos_trabajos), '', 79, 1, 1, 0);