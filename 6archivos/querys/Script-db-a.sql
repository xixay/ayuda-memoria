--TIPOS DE INICIOS DE ACTIVIDADES
select 	*
from 	parametricas.tipos_inicios_actividades tia ;
--TIPOS DE TRABAJO
select	*
from 	parametricas.tipos_trabajos tt ;
--ESPECIFICACION TIPOS DE TRABAJO
select 	*
from 	parametricas.especificacion_tipos_trabajo ett;
--TIPO DE ACTIVIDAD
select 	*
from 	parametricas.tipos_actividades ta ;
-- POA
select 	*  
from 	estructura_poa.poas p 
order by p.poa_codigo desc
limit 5;
-- POA OBJETIVOS
select	*
from 	estructura_poa.poas_objetivos po 
order by	po.pobj_codigo desc 
limit 5;
-- VIATICOS
select 	*
from 	estructura_poa.actividades_viaticos av 
order by av.avi_codigo desc 
limit 10;
-- ACTIVIDADES
select 	*
--select 	a.act_codigo ,a.act_numero ,a.act_descripcion ,a.act_fecha_inicio ,a.act_fecha_fin ,a.act_objeto ,a.ttr_codigo ,a.tipact_codigo,a.cac_codigo 
from 	estructura_poa.actividades a 
where	true 	
--		and a.act_numero = '00.1601.110.2.24'
--		and a.act_codigo in (1121)
order by a.act_codigo desc 
limit 16;
--ACTIVIDADES CONTINUIDAD
select 	*
from 	estructura_poa.actividades_continuidad ac
--where 	ac.iac_codigo in (397)
order by ac.aco_codigo desc
limit 7;
--INICIOS ACTIVIDADES
select	*
FROM 	ejecucion_actividades.inicios_actividades t
--where 	t.iac_codigo_control in ('K1PP03F15')
--where 	t.iac_codigo in (407)
--where 	t.iac_estado in (22)
order by t.iac_codigo desc ;
--INICIO ACTIVIDAD POA
select 	*
from 	ejecucion_actividades.inicio_actividad_poa iap
where 	true 
--		and iap.iap_codigo in (141)--act_codigo=933
--		and iap.iap_codigo in (240)--act_codigo=1121
--		and iap.iap_codigo in (283)
--		and iap.iap_codigo in (385)
		and iap.iap_codigo in (223)
--		and iap.act_codigo in (711) 
--		and iap.tia_codigo in (2)
--		and iap.act_codigo in (1156)
order 	by iap.iap_codigo desc;
--limit 5;
--OBTIENE EL F1 y el F1A
SELECT
		a.act_codigo, a.act_numero, a.act_estado, a.aun_codigo_ejecutora,
		iap.iap_codigo, iap.tia_codigo, iap.iap_estado,
		ia.iac_codigo, ia.iac_codigo_control,
		iapa.asi_codigo, asi.*
FROM	estructura_poa.actividades a
		LEFT JOIN ejecucion_actividades.inicio_actividad_poa iap ON a.act_codigo = iap.act_codigo
		LEFT JOIN ejecucion_actividades.inicios_actividades ia ON iap.iac_codigo = ia.iac_codigo
		LEFT JOIN ejecucion_actividades.inicio_actividad_poa_asignaciones iapa ON iap.iap_codigo = iapa.iap_codigo
		LEFT JOIN ejecucion_poa.asignaciones asi ON iapa.asi_codigo = asi.asi_codigo
WHERE	true
--		and iap.tia_codigo = 3 and a.act_estado = 2		
		and a.act_codigo = 1448
--		and a.act_codigo = 1317
--		and a.act_codigo = 1200
--		and a.act_codigo = 1181
--		and a.act_codigo = 1156
--		and	a.act_codigo = 1450
--F2
--WHERE	a.act_codigo = 1021
;
--OBTIENE LOS DETALLES DE F1 que se quedo historico
SELECT
		a.act_codigo, a.act_numero, a.aun_codigo_ejecutora,
		iap.iap_codigo, iap.tia_codigo, iap.iap_estado,
		ia.iac_codigo, ia.iac_codigo_control,
		iapa.asi_codigo,
		aci.*
FROM	estructura_poa.actividades a
		LEFT JOIN ejecucion_actividades.inicio_actividad_poa iap ON a.act_codigo = iap.act_codigo AND iap.iap_estado != 5
		LEFT JOIN ejecucion_actividades.inicios_actividades ia ON iap.iac_codigo = ia.iac_codigo
		LEFT JOIN ejecucion_actividades.inicio_actividad_poa_asignaciones iapa ON iap.iap_codigo = iapa.iap_codigo
		LEFT JOIN ejecucion_poa.asignaciones asi ON iapa.asi_codigo = asi.asi_codigo
		LEFT JOIN ejecucion_poa.asignaciones_cargos_item aci ON asi.asi_codigo = aci.asi_codigo
WHERE	a.act_codigo = 1317
--WHERE	a.act_codigo = 1448
--WHERE	a.act_codigo = 1200
--WHERE	a.act_codigo = 1181
--WHERE	a.act_codigo = 1156
;
--OBTIENE LOS DETALLES DE F1 que se quedo historico con iapCodigo
SELECT
  		t.iap_codigo, t.iap_estado, t.iac_codigo , t.act_codigo, t.tia_codigo,
  		a2.act_codigo, a2.act_numero, a2.aun_codigo_ejecutora,
  		ett.ett_codigo,
  		iapa.asi_codigo,
  		a.asi_codigo, a.asi_estado,
	  (
	    CASE
	        WHEN (tt.ett_codigo = 0 and t.tia_codigo = 1) THEN 'REPORTE F1'
	        WHEN (tt.ett_codigo = 0 and t.tia_codigo = 2) THEN 'REPORTE F1-A'
	        WHEN (tt.ett_codigo = 1 and t.tia_codigo = 1) THEN 'REPORTE F1'
	        WHEN (tt.ett_codigo = 1 and t.tia_codigo = 2) THEN 'REPORTE F1-A'
	       	WHEN (tt.ett_codigo = 2 and t.tia_codigo = 1) THEN 'REPORTE F1'
	        WHEN (tt.ett_codigo = 2 and t.tia_codigo = 2) THEN 'REPORTE F1-A'
	       	WHEN (tt.ett_codigo = 3 and t.tia_codigo = 3) THEN 'REPORTE F2'
	        WHEN (tt.ett_codigo = 3 and t.tia_codigo = 4) THEN 'REPORTE F2-A'
	       	WHEN (tt.ett_codigo = 4 and t.tia_codigo = 1) THEN 'REPORTE F1'
	        WHEN (tt.ett_codigo = 4 and t.tia_codigo = 2) THEN 'REPORTE F1-A'
	       	WHEN (tt.ett_codigo = 5 and t.tia_codigo = 1) THEN 'REPORTE F1'
	        WHEN (tt.ett_codigo = 5 and t.tia_codigo = 2) THEN 'REPORTE F1-A'
	        ELSE '' END
	  ) AS nombre_reporte,
	  (
	    CASE
	        WHEN (tt.ett_codigo = 0 and t.tia_codigo = 1) THEN 1
	        WHEN (tt.ett_codigo = 0 and t.tia_codigo = 2) THEN 2
	        WHEN (tt.ett_codigo = 1 and t.tia_codigo = 1) THEN 1
	        WHEN (tt.ett_codigo = 1 and t.tia_codigo = 2) THEN 2
	       	WHEN (tt.ett_codigo = 2 and t.tia_codigo = 1) THEN 1
	        WHEN (tt.ett_codigo = 2 and t.tia_codigo = 2) THEN 2
	       	WHEN (tt.ett_codigo = 3 and t.tia_codigo = 3) THEN 3
	        WHEN (tt.ett_codigo = 3 and t.tia_codigo = 4) THEN 4
	       	WHEN (tt.ett_codigo = 4 and t.tia_codigo = 1) THEN 1
	        WHEN (tt.ett_codigo = 4 and t.tia_codigo = 2) THEN 2
	       	WHEN (tt.ett_codigo = 5 and t.tia_codigo = 1) THEN 1
	        WHEN (tt.ett_codigo = 5 and t.tia_codigo = 2) THEN 2
	        ELSE 0 END
	  ) AS tipo_reporte
FROM ejecucion_actividades.inicio_actividad_poa t
		LEFT JOIN ejecucion_actividades.inicios_actividades ia on t.iac_codigo = ia.iac_codigo
		LEFT JOIN parametricas.tipos_trabajos tt on ia.ttr_codigo = tt.ttr_codigo
		LEFT JOIN parametricas.especificacion_tipos_trabajo ett on tt.ett_codigo = ett.ett_codigo
		LEFT JOIN estructura_poa.actividades a2 on t.act_codigo = a2.act_codigo
		LEFT JOIN ejecucion_actividades.inicio_actividad_poa_asignaciones iapa on t.iap_codigo = iapa.iap_codigo
		LEFT JOIN ejecucion_poa.asignaciones a on iapa.asi_codigo = a.asi_codigo
where	TRUE
--		and t.act_codigo in (1121)
--		and	t.act_codigo = 1448
--		and t.act_codigo = 1200
--		and t.act_codigo = 1181
--		and	t.act_codigo = 1156 --no da
--		and t.act_codigo in (933)
--		and t.tia_codigo in (4)
--		and t.tia_codigo in (3)
--		and t.tia_codigo in (2)
		and t.tia_codigo in (1)
--		and t.iap_codigo in (386)
--		and t.iap_codigo in (89)
ORDER BY t.fecha_registro DESC
;
select 	t.iap_codigo , t.iac_codigo , t.act_codigo , t.tia_codigo,
		tt.ttr_codigo,tt.ttr_descripcion,
		ett.ett_codigo, ett.ett_nombre  
from 	ejecucion_actividades.inicio_actividad_poa t
		left join ejecucion_actividades.inicios_actividades ia on t.iac_codigo = ia.iac_codigo
		left join parametricas.tipos_trabajos tt on ia.ttr_codigo = tt.ttr_codigo
		left join parametricas.especificacion_tipos_trabajo ett on tt.ett_codigo = ett.ett_codigo 
where 	t.act_codigo in (1317)
;
--ASIGNACIONES
select 	*
from 	ejecucion_poa.asignaciones a
where 	a.asi_estado in (5)
order by a.asi_codigo desc;
--ASIGNACIONES CARGOS ITEMS
select 	*
from 	ejecucion_poa.asignaciones_cargos_item aci 
--where 	aci.asi_codigo in (xxx)
order by aci.aci_codigo desc
limit 5;
--ASIGNACIONES HORAS USADAS
select 	*
from 	ejecucion_poa.asignaciones_horas_usadas ahu
--ACTIVIDAD MIGRADA CONAUD
select 	*
from 	ejecucion_actividades.actividad_migrada_conaud amc 
order by amc.amc_codigo desc;
--NRO RECOMENDACIONES POR IAP_CODIGO
SELECT	iap.iap_codigo, ia.iac_codigo, iai.inf_codigo, ir.ire_codigo
FROM	ejecucion_actividades.inicio_actividad_poa iap
		LEFT JOIN ejecucion_actividades.inicios_actividades ia ON iap.iac_codigo = ia.iac_codigo
		LEFT JOIN ejecucion_actividades.inicio_actividad_informe iai ON ia.iac_codigo = iai.iac_codigo
		LEFT JOIN ejecucion_actividades.informe_recomendaciones ir ON iai.inf_codigo = ir.inf_codigo
WHERE	TRUE
		AND ir.ire_estado NOT IN (0)
		AND iap.iap_codigo IN (285)
;
--INFORMES EMERGENTES
select 	*
from 	parametricas.informes_emergentes ie
where 	ie.iem_descripcion = 'Evaluacion de Confiabilidad de Estados Financieros'
;
--INFORMES
select 	*
from 	ejecucion_actividades.informes i 
--where 	i.iac_codigo in (403)
where 	i.inf_codigo in (78)
order by	i.inf_codigo desc;
--INICIO ACTIVIDAD INFORME
select 	*
from 	ejecucion_actividades.inicio_actividad_informe iai
order 	by	iai.iai_codigo desc;
--INFORME RECOMENDACIONES
select 	*
from 	ejecucion_actividades.informe_recomendaciones ir
where 	ir.inf_codigo in (78)
order by	ir.ire_codigo desc
limit 5;
--FLUJOS ESTADOS EVOLUCION
select 	*
from 	parametricas.flujos_estados_evolucion fee 
where 	fee.iem_codigo = 16;
--INFORME RECOMENDACIONES SEGUIMIENTOS
select 	*
from 	ejecucion_actividades.informe_recomendaciones_seguimientos irs
order by	irs.irs_codigo desc 
limit 5;
--RECOMENDACIONES INICIOS SEGUIMIENTOS
select 	*
from 	ejecucion_actividades.recomendaciones_inicios_seguimientos ris 
order by	ris.ris_codigo desc 
limit 5;
-- Nro RECOMENDACIONES INICIOS SEGUIMIENTO
  SELECT
        i.inf_codigo, i.inf_correlativo,
        ir.ire_descripcion, ris.*
  FROM ejecucion_actividades.informes i
        LEFT JOIN ejecucion_actividades.informe_recomendaciones ir ON i.inf_codigo = ir.inf_codigo AND ir.ire_estado != 0
        LEFT JOIN ejecucion_actividades.recomendaciones_inicios_seguimientos ris ON ir.ire_codigo = ris.ire_codigo
  WHERE i.inf_codigo IN (65) AND ris.iac_codigo IN (415) AND ris.ris_estado IN (1)
;
--
SELECT  iac.*, ges.ges_anio
FROM	ejecucion_actividades.inicios_actividades iac
		LEFT JOIN parametricas.gestiones ges ON iac.ges_codigo = ges.ges_codigo
WHERE	true
		--and iac.iac_estado IN (22)
		and iac.iac_codigo_control IN ('EHEN26Y00');
	
--
select
		t.iac_codigo,
		t.iac_codigo_control,
		CONCAT_WS(' | ', ge2.ges_anio, t.iac_codigo_control, t.iac_objetivo) as iac_concatenado
from	ejecucion_actividades.inicios_actividades t
		left join parametricas.estados e on e.est_codigo = t.iac_estado
		left join parametricas.gestiones ge2 on ge2.ges_codigo = t.ges_codigo
where	true
  		and t.iac_codigo in (432)
order by t.iac_codigo desc;

--
select 	t.act_codigo ,t.act_numero,
		p.poa_codigo ,p.ges_codigo,
		g.ges_anio 
from 	estructura_poa.actividades t 
		left join estructura_poa.poas_objetivos po on t.pobj_codigo = po.pobj_codigo 
		left join estructura_poa.poas p on po.poa_codigo = p.poa_codigo
		left join parametricas.gestiones g on p.ges_codigo = g.ges_codigo
where	true
		and g.ges_anio in (2024)
order by t.act_codigo desc
limit 1
;
--
SELECT
		a.act_codigo, a.act_numero, po.poa_codigo,
		g.*
FROM	estructura_poa.actividades a
		LEFT JOIN estructura_poa.poas_objetivos po ON a.pobj_codigo = po.pobj_codigo
		LEFT JOIN estructura_poa.poas p ON po.poa_codigo = p.poa_codigo
		LEFT JOIN parametricas.gestiones g ON p.ges_codigo = g.ges_codigo
WHERE	a.act_codigo = 711
;
--
select 	t.aci_codigo,
		a.asi_codigo,
		iapa.iap_codigo,
		iap.act_codigo,
		a2.tipact_codigo
from 	ejecucion_poa.asignaciones_cargos_item t
		left join ejecucion_poa.asignaciones a on t.asi_codigo  = a.asi_codigo
		left join ejecucion_actividades.inicio_actividad_poa_asignaciones iapa on iapa.asi_codigo = a.asi_codigo
		left join ejecucion_actividades.inicio_actividad_poa iap on iapa.iap_codigo = iap.iap_codigo
		left join estructura_poa.actividades a2 on iap.act_codigo = a2.act_codigo 
where 	t.aci_codigo in (1603);
--
        SELECT
              t.iapa_codigo,
              t.asi_codigo,
              asi.asi_descripcion,
              t.iap_codigo,
              iap.iap_descripcion,
              iap.iac_codigo,
              t.iapa_estado,
              e.est_color,
              e.est_nombre AS iapa_estado_descripcion,
              TO_CHAR(t.fecha_registro, 'HH24:MI am dd/mm/yyyy') as fecha_registro
        FROM	ejecucion_actividades.inicio_actividad_poa_asignaciones t
              LEFT JOIN parametricas.estados e ON e.est_codigo = t.iapa_estado
              LEFT JOIN ejecucion_poa.asignaciones asi ON t.asi_codigo = asi.asi_codigo
              LEFT JOIN ejecucion_actividades.inicio_actividad_poa iap ON t.iap_codigo = iap.iap_codigo
        WHERE	TRUE
              AND t.iapa_estado IN (1)
			  and t.iap_codigo IN ((341))
        ORDER BY t.fecha_registro DESC
        ;
       --
               SELECT
          t.aci_codigo,
          t.aci_horas,
          t.aci_descripcion,
          t.cit_codigo,
          t.asi_codigo,
          t.aci_estado,
          t.aci_responsable,
          e.est_color,
          e.est_nombre AS aci_estado_descripcion,
          TO_CHAR(t.fecha_registro, 'HH24:MI am dd/mm/yyyy') as fecha_registro
        FROM ejecucion_poa.asignaciones_cargos_item t
        LEFT JOIN parametricas.estados e ON e.est_codigo = t.aci_estado
        WHERE TRUE
        AND t.asi_codigo IN (489)
		AND t.aci_estado IN (1,2,5,21)
        ORDER BY t.fecha_registro desc
        ;

















