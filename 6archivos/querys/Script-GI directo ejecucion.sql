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
--select 	a.act_codigo ,a.act_numero , a.act_estado, a.act_descripcion ,a.aun_codigo_ejecutora,
--		au.aun_nombre, au.aun_sigla  
from 	estructura_poa.actividades a 
		left join estructura_organizacional.areas_unidades au on a.aun_codigo_ejecutora = au.aun_codigo 
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
where 	true 
		and iap.iap_codigo in (304)
--where 	iap.act_codigo in (711)
order 	by iap.iap_codigo desc;
--limit 5;
--FLUJOS TABLAS SERVICES
select 	*
from 	control_estados.flujos_tablas ft
where 	true 
		and ft.tab_codigo in (64)
order by ft.fta_codigo asc;
--
--###  --- INICIO ACT POA - CAMBIO GLOBAL DE ESTADOS, POR ROL
	select iap.iap_codigo,iap.iac_codigo,iap.iap_observaciones ,iap.iap_estado  from ejecucion_actividades.inicio_actividad_poa iap where iap.iap_codigo in (17);
	select ia.iac_codigo,ia.iac_observaciones ,ia.iac_estado from ejecucion_actividades.inicios_actividades ia where ia.iac_codigo in (134); 
	select iaa.iaa_codigo ,iaa.iac_codigo ,iaa.iaa_estado  from ejecucion_actividades.inicios_actividades_adicional iaa where iaa.iac_codigo in (134);
	select iapa.iapa_codigo,iapa.asi_codigo, iapa.iap_codigo,iapa.iapa_estado from ejecucion_actividades.inicio_actividad_poa_asignaciones iapa where iapa.iap_codigo in (17); 
	select a.asi_codigo, a.asi_estado  from ejecucion_poa.asignaciones a where a.asi_codigo in (17);
	select aci.aci_codigo , aci.aci_estado  from ejecucion_poa.asignaciones_cargos_item aci where aci.asi_codigo in (17);
	-- obtiene los estados de cada uno
	select eiap.iap_codigo , eiap.eiap_estado from control_estados.estados_inicio_actividad_poa eiap where eiap.iap_codigo in (17) order by eiap.eiap_codigo desc;
	select eia.iac_codigo ,eia.eia_estado  from control_estados.estados_inicios_actividades eia where eia.iac_codigo in (134) order by eia.eia_codigo desc;
	select * from control_estados.estados_asignaciones ea  where ea.asi_codigo in (17) order by ea.asi_codigo desc;
	select * from control_estados.estados_asignaciones_cargos_item eaci  where eaci.aci_codigo in (51) order by eaci.eaci_codigo desc;
	select * from control_estados.estados_asignaciones_cargos_item eaci  where eaci.aci_codigo in (52) order by eaci.eaci_codigo desc;
	select * from control_estados.estados_asignaciones_cargos_item eaci  where eaci.aci_codigo in (53) order by eaci.eaci_codigo desc;
	select * from control_estados.estados_asignaciones_cargos_item eaci  where eaci.aci_codigo in (54) order by eaci.eaci_codigo desc;
	select * from control_estados.estados_asignaciones_cargos_item eaci  where eaci.aci_codigo in (55) order by eaci.eaci_codigo desc;
	select * from control_estados.estados_asignaciones_cargos_item eaci  where eaci.aci_codigo in (430) order by eaci.eaci_codigo desc;
--
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
