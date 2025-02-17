--############ UAI #########################

--INFORMES UAI
SELECT 	iu.act_codigo, iu.* 
FROM 	ejecucion_informes.informes_uai iu;
--INFORMES UAI REINGRESO
select 	*
from 	ejecucion_informes.informes_uai_reingreso iur;
--INFORME EVALUACIONES
select 	*
from 	ejecucion_informes.informes_evaluaciones ie;
--INFORME EVALUACIONES ESTADOS
select 	*
from 	ejecucion_informes.informes_evaluaciones_estados iee;
--INICIO EVALUACION INFORME
select 	*
from 	ejecucion_informes.inicio_evaluacion_informe iei;
--INICIO EVALUACION INFORME ASIGNACIONES
select 	*
from 	ejecucion_informes.inicio_evaluacion_informe_asignaciones ieia ;
--INICIOS ADMINISTRATIVAS
SELECT 	ia.act_codigo, ia.* 
FROM 	ejecucion_administrativas.inicios_administrativas ia;
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

--###### ACTIVIDADES ##################

--POAS
select 	po.poa_codigo , po.pobj_codigo, po.pobj_estado, 
		a.act_codigo, a.act_codigo_anterior , a.act_estado 
from 	estructura_poa.poas p
		left join estructura_poa.poas_objetivos po on p.poa_codigo = po.poa_codigo
		left join estructura_poa.actividades a on po.pobj_codigo = a.pobj_codigo 
where 	true
		and p.poa_codigo in (3)
order by p.poa_codigo desc;
--POA OBJETIVOS
select	*
from 	estructura_poa.poas_objetivos po 
where 	true 
--		and po.pobj_estado not in (2,9,0,13)
--		and po.pobj_estado in (0)
--		and po.pobj_codigo in (1181)
--		and po.poa_codigo in (3)
--		and po.pobj_numero in (62)
order by	po.pobj_codigo desc;
--VIATICOS
select 	av.avi_codigo ,av.act_codigo, av.avi_estado, av.fecha_registro ,
		au.aun_sigla, a.pobj_codigo, p.poa_codigo  
from 	estructura_poa.actividades_viaticos av
		left join estructura_poa.actividades a on av.act_codigo = a.act_codigo
		left join estructura_poa.poas_objetivos po on a.pobj_codigo = po.pobj_codigo 
		left join estructura_poa.poas p on po.poa_codigo = p.poa_codigo 
		left join estructura_organizacional.areas_unidades au on a.aun_codigo_ejecutora = au.aun_codigo
where 	true 
--		and av.avi_estado in (1)
		and p.poa_codigo in (2)
--		and av.act_codigo in (1663)
order by av.avi_codigo desc; 
--ACTIVIDADES
--select 	*
--select 	a.act_codigo , a.act_codigo_anterior ,a.act_ejecucion_conaud,a.act_numero ,a.cac_codigo ,a.iac_codigo_apoyo, a.act_estado, a.act_descripcion , a.aun_codigo_ejecutora, a.tipact_codigo, a.fecha_registro, 
select 	a.act_codigo , a.act_codigo_anterior ,a.act_numero ,a.cac_codigo ,a.iac_codigo_apoyo, a.act_estado, a.act_descripcion , a.aun_codigo_ejecutora, a.tipact_codigo, a.fecha_registro, 
		au.aun_nombre, au.aun_sigla, au.aun_estado,
		po.pobj_codigo ,po.pobj_nombre, po.pobj_estado,
		p.poa_codigo 
from 	estructura_poa.actividades a 
		left join estructura_organizacional.areas_unidades au on a.aun_codigo_ejecutora = au.aun_codigo 
		left join estructura_poa.poas_objetivos po on a.pobj_codigo = po.pobj_codigo 
		left join estructura_poa.poas p on p.poa_codigo = po.poa_codigo 
where	true 	
--		and a.act_numero = '530.0022.15.1.24'
		and a.act_codigo in (613,609,592,585,580,478,396,219,217,198)
--		and au.aun_sigla like 'GPA-GA3'
--		and a.act_estado not in (2,7,9,0,13)
--		and a.act_estado not in (9)
--		and a.iac_codigo_apoyo is not null
--		and a.tipact_codigo in (2)
--		and a.cac_codigo in (2)
--		and po.pobj_codigo in (1279)
--		and po.pobj_codigo in (842)
		and p.poa_codigo in (2)
--		and a.act_ejecucion_conaud in (true)
--		and au.aun_sigla = 'GDB-GAM'
--order by au.aun_codigo desc;
order by a.act_codigo desc;
--
SELECT iap.act_codigo, iap.* FROM ejecucion_actividades.inicio_actividad_poa iap where iap.act_codigo in (124);
SELECT iu.act_codigo, iu.* FROM ejecucion_informes.informes_uai iu where iu.act_codigo in (124);
SELECT ia.act_codigo, ia.* FROM ejecucion_administrativas.inicios_administrativas ia where ia.act_codigo in (124);
--HORAS ASIGNADAS INFORMES UAI
with horasUAI as (
select 	iu.act_codigo,
		aci.aci_horas 
from 	ejecucion_informes.informes_uai iu
		left join estructura_poa.actividades a on iu.act_codigo = a.act_codigo
		left join ejecucion_informes.inicio_evaluacion_informe iei on iu.iua_codigo = iei.iua_codigo
		left join ejecucion_informes.inicio_evaluacion_informe_asignaciones ieia on iei.iei_codigo = ieia.iei_codigo 
		left join ejecucion_poa.asignaciones_cargos_item aci on ieia.asi_codigo = aci.asi_codigo 
where 	true 
		and iu.act_codigo in (1305)
)
--select 	* from horasUAI
SELECT act_codigo, SUM(aci_horas) AS suma_total
FROM horasUAI
--where rs.id_usuario =1
GROUP BY act_codigo;
--HORAS ASIGNADAS INICIO ACTIVIDAD POA
with horasIAP as (
select 	iap.act_codigo, 
		aci.aci_horas 
from 	ejecucion_actividades.inicio_actividad_poa iap 
		left join estructura_poa.actividades a on iap.act_codigo = a.act_codigo
		left join ejecucion_actividades.inicio_actividad_poa_asignaciones iapa on iap.iap_codigo = iapa.iapa_codigo 
		left join ejecucion_poa.asignaciones_cargos_item aci on iapa.asi_codigo = aci.asi_codigo
where 	true 
		and iap.act_codigo in (124)
)
--select 	* from horasIAP;
SELECT act_codigo, SUM(aci_horas) AS suma_total
FROM horasIAP
--where rs.id_usuario =1
GROUP BY act_codigo;
select 	*
from 	ejecucion_actividades.inicio_actividad_poa iap 
		left join estructura_poa.actividades a on iap.act_codigo = a.act_codigo 
where 	true 
		and iap.act_codigo in (1391) and a.act_estado in (2);
--
select 	ia.act_codigo, a.act_horas_planificadas 
from 	ejecucion_administrativas.inicios_administrativas ia 
		left join estructura_poa.actividades a on ia.act_codigo = a.act_codigo 
where 	true 
		and ia.act_codigo in (1391) and a.act_estado in (2);
--
with buscaIAP as (
select 	a.*
from 	ejecucion_informes.informes_uai iu
		left join estructura_poa.actividades a on iu.act_codigo = a.act_codigo 
where 	true 
		and iu.act_codigo in (1391) and a.act_estado in (2)
)
select * from buscaIAP
--
--###  INICIO ACT POA - AMPLIACION JUSTIFICACION - CAMBIO GLOBAL DE ESTADOS, POR ROL
	select iap.iap_codigo,iap.iac_codigo,iap.iap_observaciones ,iap.ges_codigo ,iap.iap_estado  from ejecucion_actividades.inicio_actividad_poa iap where iap.iap_codigo in (147)
	select ia.iac_codigo,ia.iac_observaciones ,ia.iac_estado ,ia.ges_codigo  from ejecucion_actividades.inicios_actividades ia where ia.iac_codigo in (93) 
	select iaa.iaa_codigo ,iaa.iac_codigo ,iaa.iaa_estado  from ejecucion_actividades.inicios_actividades_adicional iaa where iaa.iac_codigo in (93)
	select *  from ejecucion_actividades.inicio_actividad_poa_asignaciones iapa where iapa.iap_codigo in (147) 
	select *  from ejecucion_poa.asignaciones a where a.asi_codigo in (149)
	select * from ejecucion_poa.asignaciones_cargos_item aci where aci.asi_codigo in (149)
	-- obtiene los estados de cada uno
	select * from control_estados.estados_inicio_actividad_poa eiap where eiap.iap_codigo in (147) order by eiap.eiap_codigo desc
	select * from control_estados.estados_inicios_actividades eia where eia.iac_codigo in (93) order by eia.eia_codigo desc
	--select * from control_estados.estados_inicios_actividades_adicional eiaa where eiaa.iaa_codigo in (2) order by eiaa.eiaa_codigo desc
	select * from control_estados.estados_asignaciones ea  where ea.asi_codigo in (149) order by ea.asi_codigo desc
	select * from control_estados.estados_asignaciones_cargos_item eaci  where eaci.aci_codigo in (667) order by eaci.eaci_codigo desc
	select * from control_estados.estados_asignaciones_cargos_item eaci  where eaci.aci_codigo in (649) order by eaci.eaci_codigo desc
	select * from control_estados.estados_asignaciones_cargos_item eaci  where eaci.aci_codigo in (650) order by eaci.eaci_codigo desc
;
--
--AGREGAR COLUMNA A ACTIVIDADES
ALTER TABLE estructura_poa.actividades
ADD COLUMN act_ejecucion_conaud BOOLEAN DEFAULT FALSE;
--AGREGAR COLUMNA A AREAS UNIDADES
ALTER TABLE estructura_organizacional.areas_unidades 
ADD COLUMN aun_reporte_habilitado BOOLEAN DEFAULT FALSE;	
--BUSCA SI TIENE REFORMULADOS
with gestion as (
    select p.ges_codigo 
    from estructura_poa.poas p
    where p.poa_codigo in (2)
)
select p1.poa_codigo 
from estructura_poa.poas p1 
join gestion g on p1.ges_codigo = g.ges_codigo;
--AREA UNIDAD RESPONSABLES
select 	aur.aur_codigo , aur.per_codigo, aur.rol_codigo, aur.aur_estado ,p.poa_codigo, aur.fecha_registro ,
		g.ges_anio 
from 	estructura_poa.area_unidad_responsables aur
		left join estructura_poa.poas p on aur.poa_codigo = p.poa_codigo 
		left join parametricas.gestiones g on p.ges_codigo = g.ges_codigo 
where 	true
--		and aur.aur_estado in (1)
--		and aur.poa_codigo in (3)
--		and aur.per_codigo in (1914)
order by aur.aur_codigo desc;
--CAMBIA LOS ROLES EN TODAS LAS AREAS EJECUTORAS
UPDATE estructura_poa.area_unidad_responsables
SET per_codigo = 1914
WHERE rol_codigo IN (1, 2, 3);
--OBJETIVO AREA UNIDAD
select 	oau.oau_codigo , oau.oau_estado, oau.pobj_codigo, oau.fecha_registro, 
		au.aun_sigla,
		p.poa_codigo 
from 	estructura_poa.objetivos_area_unidad oau
		left join estructura_organizacional.areas_unidades au on oau.aun_codigo_ejecutora = au.aun_codigo 
		left join estructura_poa.poas_objetivos po on oau.pobj_codigo = po.pobj_codigo 
		left join estructura_poa.poas p on po.poa_codigo = p.poa_codigo 
where 	true
--		and oau.oau_estado in (1)
		and p.poa_codigo in (3)
order by oau.oau_codigo desc;
--FLUJO ESTADO
select 	*
from 	control_estados.flujos_tablas ft
where 	true 
		and ft.tab_codigo in (39)
;

--########## INICIOS ACTIVIDADES ################

--INICIOS ACTIVIDADES
select	*
FROM 	ejecucion_actividades.inicios_actividades t
--where 	t.iac_codigo_control in ('EHEN26Y00')
where 	t.iac_codigo in (207)
--where 	t.iac_estado in (22)
order by t.iac_codigo desc ;
--INICIO ACTIVIDAD POA
select 	*
from 	ejecucion_actividades.inicio_actividad_poa iap
		left join ejecucion_actividades.inicios_actividades ia on iap.iac_codigo =ia.iac_codigo 
where 	true 
		and iap.iap_codigo in (516)
--where 	iap.act_codigo in (711)
--limit 5;
order 	by iap.iap_codigo desc;
--BUSCA EL ESPECIFICACION TIPO TRABAJO ACTIVIDAD
select 	tt.ett_codigo 
from 	ejecucion_actividades.inicios_actividades ia
		left join ejecucion_actividades.inicio_actividad_poa iap on ia.iac_codigo  = iap.iac_codigo 
		left join estructura_poa.actividades a on iap.act_codigo = a.act_codigo
		left join parametricas.tipos_trabajos tt on a.ttr_codigo = tt.ttr_codigo 
where 	ia.iac_codigo_control = 'K3IP15Y19';	
--FLUJOS TABLAS SERVICES
select 	*
from 	control_estados.flujos_tablas ft
where 	true 
		and ft.tab_codigo in (1)
order by ft.fta_codigo asc;
--ACTIVIDADES CONTINUIDAD
select 	*
from 	estructura_poa.actividades_continuidad ac
--where 	ac.iac_codigo in (397)
order by ac.aco_codigo desc;
--ACTIVIDADES HORAS PLANIFICADAS
select 	*
from 	estructura_poa.actividades_horas_planificadas ahp 
--where 	ac.iac_codigo in (397)
order by ahp.ahp_codigo desc
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
--AREA UNIDAD RESPONSABLES
select 	*
--select 	aur.aur_codigo , aur.aur_estado ,p.poa_codigo, aur.fecha_registro ,
--		g.ges_anio 
from 	estructura_poa.area_unidad_responsables aur
		left join estructura_poa.poas p on aur.poa_codigo = p.poa_codigo 
		left join parametricas.gestiones g on p.ges_codigo = g.ges_codigo 
where 	true
--		and aur.aur_estado in (1)
--		and aur.poa_codigo in (2)
--		and aur.per_codigo in (1914)
order by aur.aur_codigo desc;
--OBTIENE LOS DETALLES DE F1 que se quedo historico con iapCodigo
SELECT
  		t.iap_codigo, t.iap_estado, t.iac_codigo , t.act_codigo, t.tia_codigo, t.iap_fecha_aprobacion,
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
where	true
--		and t.tia_codigo in (3)
--		and t.act_codigo in (1121)
--		and	t.act_codigo = 1448
--		and t.act_codigo = 1200
--		and t.act_codigo = 1181
--		and	t.act_codigo = 1156 --no da
--		and t.act_codigo in (933) 
ORDER BY t.fecha_registro DESC
;