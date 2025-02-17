--############ UAI #########################

--INFORMES UAI(act_codigo,ent_codigo,ttr_codigo,ges_codigo)
SELECT 	iu.act_codigo, iu.* 
FROM 	ejecucion_informes.informes_uai iu;
--INFORMES UAI REINGRESO(iua_codigo)
select 	*
from 	ejecucion_informes.informes_uai_reingreso iur;
--INFORME EVALUACIONES(iua_codigo)
select 	*
from 	ejecucion_informes.informes_evaluaciones ie;
--INFORME EVALUACIONES ESTADOS(iev_codigo,eev_codigo)
select 	*
from 	ejecucion_informes.informes_evaluaciones_estados iee;
--INICIO EVALUACION INFORME(iua_codigo,per_codigo_gerente,per_codigo_responsable,tia_codigo,ges_codigo)
select 	*
from 	ejecucion_informes.inicio_evaluacion_informe iei;
--INICIO EVALUACION INFORME ASIGNACIONES(asi_codigo,iei_codigo)
select 	*
from 	ejecucion_informes.inicio_evaluacion_informe_asignaciones ieia ;
--INICIOS ADMINISTRATIVAS(act_codigo,ges_codigo,)
SELECT 	ia.act_codigo, ia.* 
FROM 	ejecucion_administrativas.inicios_administrativas ia;
--TIPOS DE INICIOS DE ACTIVIDADES
select 	*
from 	parametricas.tipos_inicios_actividades tia ;
--TIPOS DE TRABAJO(ett_codigo)
select	*
from 	parametricas.tipos_trabajos tt ;
--ESPECIFICACION TIPOS DE TRABAJO
select 	*
from 	parametricas.especificacion_tipos_trabajo ett;
--TIPO DE ACTIVIDAD(tipact_codigo)
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
		and po.pobj_codigo in (401)
--		and po.pobj_numero in (62)
order by	po.pobj_codigo desc;
--######################
SELECT
      po.pobj_codigo, po.pobj_estado, pr.pro_numero, au.aun_numero, po.pobj_numero,
      CONCAT(pr.pro_numero, '.', au.aun_numero, '.', po.pobj_numero) AS pobj_codigo_sigla,
      po.pobj_nombre, po.pro_codigo
FROM	estructura_poa.poas_objetivos po
      LEFT JOIN pei.programas pr ON po.pro_codigo = pr.pro_codigo
      LEFT JOIN (
        SELECT	oau.pobj_codigo, COALESCE((COALESCE(ARRAY_AGG(oau.aun_codigo_ejecutora ORDER BY oau.oau_codigo ASC), '{}'))[1], 0) AS aun_codigo_ejecutora_principal
        FROM	estructura_poa.objetivos_area_unidad oau
              LEFT JOIN estructura_poa.poas_objetivos po ON oau.pobj_codigo = po.pobj_codigo
        WHERE	oau.oau_estado NOT IN (0)
              AND po.poa_codigo IN (3) -- POA SELECCIONADO
        GROUP BY oau.pobj_codigo
      ) temporal ON po.pobj_codigo = temporal.pobj_codigo
      LEFT JOIN estructura_organizacional.areas_unidades au ON temporal.aun_codigo_ejecutora_principal = au.aun_codigo
      LEFT JOIN estructura_poa.objetivos_area_unidad oau ON po.pobj_codigo = oau.pobj_codigo AND oau.oau_estado NOT IN (0)
WHERE	TRUE
      AND po.poa_codigo IN (3) -- POA SELECCIONADO
      AND oau.aun_codigo_ejecutora IN (76) -- ESTADOS
GROUP BY po.pobj_codigo, pr.pro_numero, po.pobj_numero, po.pobj_nombre, au.aun_numero
;
--######################
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
select 	*
from 	estructura_poa.actividades a
where 	a.aun_codigo_ejecutora in (28) --and a.act_ejecucion_conaud in (true)
order by a.act_codigo desc;
select * from estructura_poa.actividades a where a.act_numero like '510.1503.24.1.24';
select a.act_codigo, a.act_ejecucion_conaud, a.act_numero, iap.iap_codigo,iap.act_codigo, a.aun_codigo_ejecutora ,a.pobj_codigo,iap.iap_estado,iu.iua_codigo, iu.iua_estado 
from estructura_poa.actividades a
	left join ejecucion_actividades.inicio_actividad_poa iap on a.act_codigo = iap.act_codigo
	left join ejecucion_informes.informes_uai iu on a.act_codigo = iu.act_codigo 
where a.pobj_codigo in (275) and a.aun_codigo_ejecutora in (64) and a.act_estado not in (0)
;

--ACTIVIDADES
select 	a.act_codigo , a.act_ejecucion_conaud, a.act_codigo_anterior ,a.act_numero ,a.cac_codigo ,a.iac_codigo_apoyo, a.act_estado, a.act_descripcion , a.aun_codigo_ejecutora, a.tipact_codigo, a.fecha_registro, a.ttr_codigo, 
		ett.ett_codigo, ett.ett_nombre, 
		au.aun_nombre, au.aun_sigla, au.aun_estado,
		po.pobj_codigo ,po.pobj_nombre, po.pobj_estado,
		p.poa_codigo
--		oau.oau_codigo, oau.oau_descripcion ,oau.oau_estado 
from 	estructura_poa.actividades a
		left join parametricas.tipos_trabajos tt on a.ttr_codigo = tt.ttr_codigo
		left join parametricas.especificacion_tipos_trabajo ett on tt.ett_codigo = ett.ett_codigo 
		left join estructura_organizacional.areas_unidades au on a.aun_codigo_ejecutora = au.aun_codigo 
		left join estructura_poa.poas_objetivos po on a.pobj_codigo = po.pobj_codigo 
		left join estructura_poa.poas p on p.poa_codigo = po.poa_codigo
--		left join estructura_poa.objetivos_area_unidad oau on po.pobj_codigo = oau.pobj_codigo 
where	true 	
--		and a.act_numero = '510.1202.17.14.24'
--		and a.act_codigo in (14)
--		and a.act_codigo_anterior in (613,609,592,585,580,478,396,219,217,198)
--		and a.act_codigo_anterior in (396,219,217)
--		and au.aun_sigla like 'GDB-GAM'
--		and a.act_estado not in (2,7,9,0,13)
--		and a.act_estado not in (9)
--		and a.iac_codigo_apoyo is not null
--		and a.tipact_codigo in (2)
--		and a.cac_codigo in (1)
--		and po.pobj_codigo in (1145)
--		and p.poa_codigo in (3)
--		and a.act_ejecucion_conaud in (true)
--order by au.aun_estado asc;
order by a.act_codigo desc;
--REPORTE EXCEL ACTIVIDADES
WITH order_values AS (
--    SELECT unnest(array[63, 64, 67]) AS aun_codigo_ejecutora, generate_series(1, array_length(array[63, 64, 67], 1)) AS orden
    SELECT unnest(array[10]) AS aun_codigo_ejecutora, generate_series(1, array_length(array[10], 1)) AS orden
),
numered_activities AS (
    SELECT a.act_codigo, a.act_estado, a.act_numero, au.aun_sigla, a.ent_codigo, a.act_objetivo, a.ttr_codigo, tt.ttr_descripcion, tt.ett_codigo, ett.ett_nombre, a.caa_codigo, caa.caa_nombre, ov.orden,
           row_number() OVER (ORDER BY ov.orden) AS numero_dato
    FROM estructura_poa.actividades a
    LEFT JOIN estructura_poa.poas_objetivos po ON a.pobj_codigo = po.pobj_codigo 
    LEFT JOIN estructura_poa.poas p ON po.poa_codigo = p.poa_codigo 
    LEFT JOIN estructura_organizacional.areas_unidades au ON a.aun_codigo_ejecutora = au.aun_codigo
    LEFT JOIN parametricas.tipos_trabajos tt ON a.ttr_codigo = tt.ttr_codigo
    LEFT JOIN parametricas.especificacion_tipos_trabajo ett ON tt.ett_codigo = ett.ett_codigo
    LEFT JOIN parametricas.clasificacion_auditoria_actividad caa ON a.caa_codigo = caa.caa_codigo
    JOIN order_values ov ON a.aun_codigo_ejecutora = ov.aun_codigo_ejecutora
    WHERE true 
      AND a.aun_codigo_ejecutora IN (10)
      AND a.act_estado NOT IN (0, 9)
      AND p.poa_codigo IN (2)
)
SELECT * FROM numered_activities
ORDER BY orden;
--
SELECT 	a.act_codigo, a.act_estado, a.act_numero, au.aun_sigla, a.ent_codigo, a.act_objetivo, a.ttr_codigo, tt.ttr_descripcion, tt.ett_codigo, ett.ett_nombre, a.caa_codigo, caa.caa_nombre
FROM 	estructura_poa.actividades a
		LEFT JOIN estructura_poa.poas_objetivos po ON a.pobj_codigo = po.pobj_codigo 
		LEFT JOIN estructura_poa.poas p ON po.poa_codigo = p.poa_codigo 
		LEFT JOIN estructura_organizacional.areas_unidades au ON a.aun_codigo_ejecutora = au.aun_codigo
		LEFT JOIN parametricas.tipos_trabajos tt ON a.ttr_codigo = tt.ttr_codigo
		LEFT JOIN parametricas.especificacion_tipos_trabajo ett ON tt.ett_codigo = ett.ett_codigo
		LEFT JOIN parametricas.clasificacion_auditoria_actividad caa ON a.caa_codigo = caa.caa_codigo
WHERE 	true 
--      AND a.aun_codigo_ejecutora IN (72)
  		AND a.act_codigo in (14)
  		AND a.act_estado NOT IN (0, 9)
  		AND p.poa_codigo IN (2);
--BUSQUEDA EN IAP
select 	iap.iap_codigo, iap.iap_estado, iap.act_codigo, a.act_estado	
from 	ejecucion_actividades.inicio_actividad_poa iap
		left join estructura_poa.actividades a on iap.act_codigo = a.act_codigo 
where 	true 
		and a.act_codigo in (133) and iap.iap_estado in (2);
--BUSQUEDA EN UAI
select 	iu.iua_codigo, iu.iua_estado,
		a.act_codigo, a.act_estado 
from 	ejecucion_informes.informes_uai iu
		left join estructura_poa.actividades a on iu.act_codigo = a.act_codigo
where 	true 
		and a.act_codigo in (437) and iu.iua_estado in (22);
--BUSQUEDA EN ADMINISTRATIVAS
with resultAdm as (
select 	ia.iad_codigo, ia.iad_estado, a.act_codigo, a.act_estado, pe.pej_ejecutado, pe.pej_estado 
from 	ejecucion_administrativas.inicios_administrativas ia
		left join estructura_poa.actividades a on ia.act_codigo = a.act_codigo
		left join ejecucion_administrativas.planificaciones_ejecuciones pe on ia.iad_codigo = pe.iad_codigo 
where 	true 
		and a.act_codigo in (14) and ia.iad_estado in (22)
--		and a.act_codigo in (417) and ia.iad_estado in (22)
)	
select * from resultAdm;
select 	act_codigo, SUM(pej_ejecutado) as suma
from resultAdm
group by	act_codigo;
---
--BUSQUEDA DE NOMBRE
select 	aud.aud_codigo, aud.aun_codigo_padre,au.aun_sigla,au.aun_nombre, aud.aun_codigo_hijo,aud.aud_estado
from 	estructura_organizacional.areas_unidades_dependencias aud
		left join estructura_organizacional.areas_unidades au on aud.aun_codigo_padre = au.aun_codigo
where 	true
--		and aud.aun_codigo_padre in (13)
--		and aud.aun_codigo_padre in (8)
		and aud.aun_codigo_hijo in (10)
;




	

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
--BUSCA IAP CON HORAS
select 	ia.act_codigo, a.act_horas_planificadas 
from 	ejecucion_administrativas.inicios_administrativas ia 
		left join estructura_poa.actividades a on ia.act_codigo = a.act_codigo 
where 	true 
		and ia.act_codigo in (1391) and a.act_estado in (2);
--BUSCA UAI CON HORAS
with buscaIAP as (
select 	a.*
from 	ejecucion_informes.informes_uai iu
		left join estructura_poa.actividades a on iu.act_codigo = a.act_codigo 
where 	true 
		and iu.act_codigo in (1391) and a.act_estado in (2)
)
select * from buscaIAP;
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
--AGREGAR COLUMNA A ACTIVIDADES
ALTER TABLE estructura_poa.actividades
ADD COLUMN act_ejecucion_conaud BOOLEAN DEFAULT FALSE;
--AGREGAR FLUJO PARA CAMBIO DE CONSOLIDADO, donde el antiguo cambia a HISTORICO
INSERT INTO control_estados.flujos_tablas
(fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja)
VALUES((select max(fta_codigo)+1 from control_estados.flujos_tablas), 51, '', 1, 5, 1, 2022, 0, 0, now(), '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000');
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
		and ft.tab_codigo in (51)
;
--
SELECT	a.*
FROM	estructura_poa.actividades a
		LEFT JOIN estructura_poa.poas_objetivos po ON a.pobj_codigo = po.pobj_codigo
		LEFT JOIN estructura_poa.poas p ON po.poa_codigo = p.poa_codigo
WHERE	TRUE
		AND p.poa_codigo IN (2)
		AND a.act_estado NOT IN (0, 5)
ORDER BY a.act_codigo ASC
;
--########## INICIOS ACTIVIDADES ################
--###############
SELECT	a.act_codigo, a.act_numero, a.ttr_codigo, 
		po.pobj_nombre, 
		iap.iap_codigo, iap.iap_estado,
		ia.iac_codigo, iap.iap_estado,
		iapa.iapa_codigo, iapa.iapa_estado,
		asi.asi_codigo, asi.asi_estado,
		aci.aci_codigo, aci.aci_estado 
FROM	estructura_poa.actividades a
		left join estructura_poa.poas_objetivos po on a.pobj_codigo = po.pobj_codigo 
		LEFT JOIN ejecucion_actividades.inicio_actividad_poa iap ON a.act_codigo = iap.act_codigo
		LEFT JOIN ejecucion_actividades.inicios_actividades ia ON iap.iac_codigo = ia.iac_codigo
		LEFT JOIN ejecucion_actividades.inicio_actividad_poa_asignaciones iapa ON iap.iap_codigo = iapa.iap_codigo
		LEFT JOIN ejecucion_poa.asignaciones asi ON iapa.asi_codigo = asi.asi_codigo
		LEFT JOIN ejecucion_poa.asignaciones_cargos_item aci ON asi.asi_codigo = aci.asi_codigo
WHERE	true 
--		and iap.iap_codigo = 154
		and iap.act_codigo in (1501)
;
--###############
--INICIOS ACTIVIDADES
select	*
FROM 	ejecucion_actividades.inicios_actividades t
--where 	t.iac_codigo_control in ('EHEN26Y00')
--where 	t.iac_codigo in (207)
--where 	t.iac_estado in (22)
order by t.iac_codigo desc ;
--INICIO ACTIVIDAD POA
select 	*
from 	ejecucion_actividades.inicio_actividad_poa iap
		left join ejecucion_actividades.inicios_actividades ia on iap.iac_codigo =ia.iac_codigo 
where 	true 
		and iap.iac_codigo in (511)
--where 	iap.act_codigo in (711)
--limit 5;
order 	by iap.iap_codigo desc;
--
select 	ia.iac_codigo, ia.iac_codigo_control, ia.iac_estado 
from ejecucion_actividades.inicios_actividades ia 
where 	true
		and ia.iac_codigo_control = 'IXDP16J23';
;
--
select 	*
from 	estructura_poa.actividades_continuidad ac;
--ACTIVIDADES CONTINUIDAD
select 	*
from 	estructura_poa.actividades_continuidad ac
where 	ac.iac_codigo in (511)
order by ac.aco_codigo desc;
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
--########################################################################################################
WITH poa_tres AS (
	SELECT po.poa_codigo, a.act_codigo, A.act_numero,  a.act_estado, a.aun_codigo_ejecutora, pob.pro_codigo, a.act_codigo_anterior 
	FROM estructura_poa.actividades a 
	LEFT JOIN estructura_poa.poas_objetivos pob ON a.pobj_codigo = pob.pobj_codigo
	LEFT JOIN estructura_poa.poas po ON pob.poa_codigo = po.poa_codigo
	WHERE TRUE
	--AND a.act_estado NOT IN (0,5,9, 47)
	--AND a.act_codigo_anterior IS NOT NULL
	AND po.poa_codigo IN (3)
	ORDER BY pob.pro_codigo
),
poa_dos AS
(
	SELECT po.poa_codigo, a.act_codigo, A.act_numero,  a.act_estado, a.aun_codigo_ejecutora, pob.pro_codigo , pob.pobj_codigo 
	FROM estructura_poa.actividades a 
	LEFT JOIN estructura_poa.poas_objetivos pob ON a.pobj_codigo = pob.pobj_codigo
	LEFT JOIN estructura_poa.poas po ON pob.poa_codigo = po.poa_codigo
	--WHERE a.act_estado NOT IN (0,5,9, 47)
	AND po.poa_codigo IN (2)
	ORDER BY pob.pro_codigo
),
conaud AS (
SELECT poa_tres.act_codigo_anterior, iap.act_codigo AS act_codigo
FROM poa_tres
LEFT JOIN ejecucion_actividades.inicio_actividad_poa iap ON iap.act_codigo = poa_tres.act_codigo_anterior
WHERE iap.iap_estado NOT IN (0,5,9, 47)
UNION
SELECT DISTINCT  poa_tres.act_codigo_anterior, uai.act_codigo 
FROM poa_tres
LEFT JOIN ejecucion_informes.informes_uai uai ON uai.act_codigo = poa_tres.act_codigo_anterior
WHERE uai.iua_estado NOT IN (0,5,9,47)
UNION
SELECT poa_tres.act_codigo_anterior, ia.act_codigo 
FROM poa_tres
LEFT JOIN ejecucion_administrativas.inicios_administrativas ia ON ia.act_codigo = poa_tres.act_codigo_anterior
WHERE IA.iad_estado NOT IN (0,5,9,47)
)
--SELECT * FROM conaud WHERE act_codigo IS NOT null
SELECT aa.act_numero act_numero_poa3, aa.act_correlativo act_correlativo_poa3,
p3.act_codigo act_codigo_poa3,p3.act_codigo_anterior act_codigo_anterior_poa3,
p3.act_estado,  aa2.act_numero act_numero_for, aa2.act_correlativo act_correlativo_for,
p2.act_codigo act_codigo_for , aa2.act_codigo_anterior  ,p2.act_estado estado_for,
po2.pobj_codigo, po2.pobj_estado, aa.aun_codigo_ejecutora ,  conaud.act_codigo AS conaud
FROM poa_tres p3
LEFT JOIN poa_dos p2 ON p3.act_codigo_anterior = p2.act_codigo
-----
LEFT JOIN conaud ON conaud.act_codigo = p3.act_codigo_anterior
LEFT JOIN estructura_poa.actividades aa ON aa.act_codigo = p3.act_codigo
LEFT JOIN estructura_poa.poas_objetivos po2 ON po2.pobj_codigo = aa.pobj_codigo 
LEFT JOIN estructura_poa.actividades aa2 ON aa2.act_codigo = p2.act_codigo
WHERE conaud.act_codigo IS NOT NULL
--AND aa.aun_codigo_ejecutora IN (65)
--AND aa.act_numero != aa2.act_numero
ORDER BY 3 ASC;
--%%%%%%%%%%%%%%%%%%%%%%% EXCEL %%%%%%%%%%%%%%%%%%%%%%%
WITH poa_tres AS (
	SELECT po.poa_codigo, a.act_codigo, A.act_numero,  a.act_estado, a.aun_codigo_ejecutora, pob.pro_codigo, a.act_codigo_anterior 
	FROM estructura_poa.actividades a 
	LEFT JOIN estructura_poa.poas_objetivos pob ON a.pobj_codigo = pob.pobj_codigo
	LEFT JOIN estructura_poa.poas po ON pob.poa_codigo = po.poa_codigo
	WHERE TRUE
	--AND a.act_estado NOT IN (0,5,9, 47)
	--AND a.act_codigo_anterior IS NOT NULL
	AND po.poa_codigo IN (3)
	ORDER BY pob.pro_codigo
),
poa_dos AS
(
	SELECT po.poa_codigo, a.act_codigo, A.act_numero,  a.act_estado, a.aun_codigo_ejecutora, pob.pro_codigo , pob.pobj_codigo 
	FROM estructura_poa.actividades a 
	LEFT JOIN estructura_poa.poas_objetivos pob ON a.pobj_codigo = pob.pobj_codigo
	LEFT JOIN estructura_poa.poas po ON pob.poa_codigo = po.poa_codigo
	--WHERE a.act_estado NOT IN (0,5,9, 47)
	AND po.poa_codigo IN (2)
	ORDER BY pob.pro_codigo
),
conaud AS (
SELECT poa_tres.act_codigo_anterior, iap.act_codigo AS act_codigo
FROM poa_tres
LEFT JOIN ejecucion_actividades.inicio_actividad_poa iap ON iap.act_codigo = poa_tres.act_codigo_anterior
WHERE iap.iap_estado NOT IN (0,5,9, 47)
UNION
SELECT DISTINCT  poa_tres.act_codigo_anterior, uai.act_codigo 
FROM poa_tres
LEFT JOIN ejecucion_informes.informes_uai uai ON uai.act_codigo = poa_tres.act_codigo_anterior
WHERE uai.iua_estado NOT IN (0,5,9,47)
UNION
SELECT poa_tres.act_codigo_anterior, ia.act_codigo 
FROM poa_tres
LEFT JOIN ejecucion_administrativas.inicios_administrativas ia ON ia.act_codigo = poa_tres.act_codigo_anterior
WHERE IA.iad_estado NOT IN (0,5,9,47)
)
--SELECT * FROM conaud WHERE act_codigo IS NOT null
SELECT aa.act_numero act_numero_poa3, aa.act_correlativo act_correlativo_poa3,
p3.act_codigo act_codigo_poa3,p3.act_codigo_anterior act_codigo_anterior_poa3,
aa2.act_numero act_numero_for, aa2.act_correlativo act_correlativo_for,
p2.act_codigo act_codigo_for ,conaud.act_codigo AS conaud
FROM poa_tres p3
LEFT JOIN poa_dos p2 ON p3.act_codigo_anterior = p2.act_codigo
-----
LEFT JOIN conaud ON conaud.act_codigo = p3.act_codigo_anterior
LEFT JOIN estructura_poa.actividades aa ON aa.act_codigo = p3.act_codigo
LEFT JOIN estructura_poa.poas_objetivos po2 ON po2.pobj_codigo = aa.pobj_codigo 
LEFT JOIN estructura_poa.actividades aa2 ON aa2.act_codigo = p2.act_codigo
WHERE conaud.act_codigo IS NOT NULL
--AND aa.aun_codigo_ejecutora IN (65)
--AND aa.act_numero != aa2.act_numero
AND aa.act_correlativo != aa2.act_correlativo 
ORDER BY 3 ASC;

SELECT 	a.act_numero, a.act_correlativo, a.act_codigo, a.act_codigo_anterior 
FROM 	estructura_poa.actividades a
--WHERE 	
;
SELECT	DISTINCT 
		au.aun_sigla,a.act_numero, a.act_codigo, a.act_codigo_anterior,a.act_correlativo, a.act_estado,
		av.avi_codigo ,av.avi_estado, 
		p.poa_codigo, p.poa_estado,
		po.pobj_nombre ,po.fecha_modificacion ,po.pobj_codigo ,po.pobj_estado,
		oau.oau_codigo ,oau.oau_estado
FROM 	estructura_poa.poas p
		LEFT JOIN estructura_poa.poas_objetivos po ON p.poa_codigo = po.poa_codigo
		LEFT JOIN estructura_poa.objetivos_area_unidad oau ON po.pobj_codigo = oau.pobj_codigo
		LEFT JOIN estructura_poa.actividades a ON po.pobj_codigo = a.pobj_codigo
		LEFT JOIN estructura_organizacional.areas_unidades au ON a.aun_codigo_ejecutora = au.aun_codigo 
		LEFT JOIN estructura_poa.actividades_viaticos av ON a.act_codigo = av.act_codigo 
WHERE 	TRUE 
		AND p.poa_codigo IN (3)
		AND a.act_estado IN (0)
		AND oau.oau_estado NOT IN (0)
--		AND oau.oau_estado IN (0)
		AND av.avi_codigo NOTNULL 
--		AND a.act_codigo NOTNULL 
--		AND a.act_estado IN (0)
ORDER BY au.aun_sigla DESC
;

SELECT	DISTINCT 
		au.aun_sigla,a.act_numero, a.act_codigo, a.act_codigo_anterior,a.act_correlativo, a.act_estado,
		av.avi_codigo ,av.avi_estado, 
		p.poa_codigo, p.poa_estado,
		po.pobj_nombre ,po.fecha_modificacion ,po.pobj_codigo ,po.pobj_estado,
		oau.oau_codigo ,oau.oau_estado
FROM 	estructura_poa.poas p
		LEFT JOIN estructura_poa.poas_objetivos po ON p.poa_codigo = po.poa_codigo
		LEFT JOIN estructura_poa.objetivos_area_unidad oau ON po.pobj_codigo = oau.pobj_codigo
		LEFT JOIN estructura_poa.actividades a ON po.pobj_codigo = a.pobj_codigo
		LEFT JOIN estructura_organizacional.areas_unidades au ON a.aun_codigo_ejecutora = au.aun_codigo 
		LEFT JOIN estructura_poa.actividades_viaticos av ON a.act_codigo = av.act_codigo 
WHERE 	TRUE 
		AND p.poa_codigo IN (2)
		AND a.act_estado NOT IN (17)
--		AND a.act_codigo_anterior IN (785)
		AND a.act_codigo NOTNULL 
--		AND av.avi_estado NOTNULL
		AND oau.oau_estado NOT IN (0)
--		AND oau.oau_estado IN (0)
ORDER BY au.aun_sigla DESC
;