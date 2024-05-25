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
-- OBJETIVO AREA UNIDAD
select	*
from 	estructura_poa.objetivos_area_unidad oau  
order by	oau.oau_codigo desc 
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
--		and a.act_estado not in (2,9,0)
order by a.act_codigo desc; 
--limit 16;
--INICIOS ACTIVIDADES
select	*
FROM 	ejecucion_actividades.inicios_actividades t
--where 	t.iac_codigo_control in ('EHEN26Y00')
--where 	t.iac_codigo in (407)
--where 	t.iac_estado in (22)
order by t.iac_codigo desc ;
--INICIO ACTIVIDAD POA
select 	*
from 	ejecucion_actividades.inicio_actividad_poa iap
--where 	iap.iap_codigo in (276)
--where 	iap.act_codigo in (711)
order 	by iap.iap_codigo desc;
--limit 5;
--ACTIVIDADES CONTINUIDAD
select 	*
from 	estructura_poa.actividades_continuidad ac
--where 	ac.iac_codigo in (397)
order by ac.aco_codigo desc
limit 5;
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
SELECT
              t.iac_codigo,
              t.iac_correlativo,
              t.iac_codigo_control,
              t.iac_codigo_control_vista,
              t.iac_objeto,
              t.iac_objetivo,
              t.iac_alcance,
              t.iac_migrado,
              t.iac_observaciones,
              TO_CHAR(t.iac_fecha_inicio, 'dd/mm/yyyy') AS iac_fecha_inicio,
              t.ttr_codigo, tt.ttr_sigla, tt.ttr_descripcion,
              t.iac_dias_habiles,
              t.iac_dias_calendario,
              TO_CHAR(t.iac_fecha_fin, 'dd/mm/yyyy') AS iac_fecha_fin,
              t.ttr_codigo,
              TO_CHAR(t.iac_mes_inicio, 'dd/mm/yyyy') AS iac_mes_inicio,
              TO_CHAR(t.iac_mes_fin, 'dd/mm/yyyy') AS iac_mes_fin,
              TO_CHAR(t.iac_mes_inicio, 'mm/yyyy') AS mes_inicio,
              TO_CHAR(t.iac_mes_fin, 'mm/yyyy') AS mes_fin,
              TO_CHAR(t.iac_fecha_borrador, 'dd/mm/yyyy') AS iac_fecha_borrador,
              TO_CHAR(t.iac_fecha_emision, 'dd/mm/yyyy') AS iac_fecha_emision,
              t.ges_codigo,
              g.ges_anio,
              t.iac_estado,
              e.est_color,
              e.est_nombre AS iac_estado_descripcion,
              TO_CHAR(t.iac_fecha_inicio_historico, 'dd/mm/yyyy') AS iac_fecha_inicio_historico,
              TO_CHAR(t.fecha_registro, 'HH24:MI am dd/mm/yyyy') AS fecha_registro
        FROM	ejecucion_actividades.inicios_actividades t
              LEFT JOIN parametricas.estados e ON t.iac_estado = e.est_codigo
              LEFT JOIN parametricas.gestiones g ON t.ges_codigo = g.ges_codigo
              LEFT JOIN parametricas.tipos_trabajos tt ON t.ttr_codigo = tt.ttr_codigo
        WHERE	TRUE
              AND t.iac_estado IN (22)
              AND t.iac_codigo_control like '%ESEN19A99%'
        ORDER BY t.fecha_registro DESC;

















