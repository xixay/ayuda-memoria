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
--select 	*
--select 	a.act_codigo ,a.act_numero ,a.act_descripcion ,a.act_fecha_inicio ,a.act_fecha_fin ,a.act_objeto ,a.ttr_codigo ,a.tipact_codigo,a.cac_codigo 
select 	a.act_codigo ,a.act_numero , a.act_estado, p.poa_codigo, a.cac_codigo  , a.aun_codigo_ejecutora, a.tipact_codigo, a.fecha_registro,
		au.aun_nombre, au.aun_sigla  
from 	estructura_poa.actividades a 
		left join estructura_organizacional.areas_unidades au on a.aun_codigo_ejecutora = au.aun_codigo
		left join estructura_poa.poas_objetivos po on a.pobj_codigo = po.pobj_codigo
		left join estructura_poa.poas p on po.poa_codigo = p.poa_codigo
where	true 	
--		and a.act_numero = '500.1102.100.1.24'
		and au.aun_sigla like 'GPA-GA3'
--		and a.act_codigo in (1121)
--		and a.act_estado not in (2,9,0,13,7)
--		and a.tipact_codigo in (2)
		and p.poa_codigo in (3)
order by au.aun_codigo desc;
--
SELECT
      au.aun_codigo AS aun_codigo_ejecutora, au.aun_nombre, au.aun_sigla, au.cau_codigo, au.aun_numero,
      CONCAT(au.aun_nombre, ' - ', au.aun_sigla) AS nom_ejecutora,
      COALESCE(
        ARRAY_AGG(
          DISTINCT aur.rol_codigo ORDER BY aur.rol_codigo ASC
        ) FILTER (WHERE aur.per_codigo = 590),
        '{}'
      ) AS roles,
      COUNT(DISTINCT aur.rol_codigo) AS cantidad_roles
FROM	estructura_poa.area_unidad_responsables aur
      LEFT JOIN estructura_organizacional.areas_unidades au ON aur.aun_codigo_ejecutora = au.aun_codigo
WHERE	aur.aur_estado != 0 -- ESTADO ROL-RESPONSABLE
      AND au.aun_estado IN (2) -- ESTADO AREA-UNIDAD (CONSOLIDADO)
      AND aur.rol_codigo IN (1,2,3,4) -- ROL SELECCIONADO
      AND aur.poa_codigo IN (2) -- POA SELECCIONADO
      AND aur.per_codigo = 590 -- PER_CODIGO SELECCIONADO
GROUP BY au.aun_codigo, au.aun_nombre, au.aun_sigla, au.cau_codigo, au.aun_numero
ORDER BY au.aun_sigla ASC, au.aun_nombre ASC
;
--
SELECT
    po.pobj_codigo, po.pobj_estado, pr.pro_numero, au.aun_numero, po.pobj_numero,
    CONCAT(pr.pro_numero, '.', au.aun_numero, '.', po.pobj_numero) AS pobj_codigo_sigla,
    po.pobj_nombre
FROM	estructura_poa.poas_objetivos po
      LEFT JOIN pei.programas pr ON po.pro_codigo = pr.pro_codigo
      LEFT JOIN (
        SELECT	oau.pobj_codigo, COALESCE((COALESCE(ARRAY_AGG(oau.aun_codigo_ejecutora ORDER BY oau.oau_codigo ASC), '{}'))[1], 0) AS aun_codigo_ejecutora_principal
        FROM	estructura_poa.objetivos_area_unidad oau
              	LEFT JOIN estructura_poa.poas_objetivos po ON oau.pobj_codigo = po.pobj_codigo
        WHERE	oau.oau_estado NOT IN (0)
              AND po.poa_codigo in (2) -- POA SELECCIONADO
        GROUP BY oau.pobj_codigo
      ) temporal ON po.pobj_codigo = temporal.pobj_codigo
      LEFT JOIN estructura_organizacional.areas_unidades au ON temporal.aun_codigo_ejecutora_principal = au.aun_codigo
      LEFT JOIN estructura_poa.objetivos_area_unidad oau ON po.pobj_codigo = oau.pobj_codigo AND oau.oau_estado NOT IN (0)
WHERE	TRUE
      AND po.poa_codigo IN (2) -- POA SELECCIONADO
      AND po.pobj_estado IN (2,8) -- ESTADOS
      AND oau.aun_codigo_ejecutora IN (77) -- ESTADOS
GROUP BY po.pobj_codigo, pr.pro_numero, po.pobj_numero, po.pobj_nombre, au.aun_numero
;
--
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
	select iap.iap_codigo,iap.iac_codigo,iap.iap_observaciones ,iap.iap_estado, iap.iap_fecha_aprobacion  from ejecucion_actividades.inicio_actividad_poa iap where iap.iap_codigo in (425);
	select ia.iac_codigo,ia.iac_observaciones ,ia.iac_estado from ejecucion_actividades.inicios_actividades ia where ia.iac_codigo in (69); 
	select iaa.iaa_codigo ,iaa.iac_codigo ,iaa.iaa_estado  from ejecucion_actividades.inicios_actividades_adicional iaa where iaa.iac_codigo in (69);
	select iapa.iapa_codigo,iapa.asi_codigo, iapa.iap_codigo,iapa.iapa_estado from ejecucion_actividades.inicio_actividad_poa_asignaciones iapa where iapa.iap_codigo in (414); 
	select a.asi_codigo, a.asi_estado  from ejecucion_poa.asignaciones a where a.asi_codigo in (698);
	select aci.aci_codigo , aci.aci_estado  from ejecucion_poa.asignaciones_cargos_item aci where aci.asi_codigo in (698);
	-- obtiene los estados de cada uno
	select eiap.iap_codigo , eiap.eiap_estado from control_estados.estados_inicio_actividad_poa eiap where eiap.iap_codigo in (197) order by eiap.eiap_codigo desc;
	select eia.iac_codigo ,eia.eia_estado  from control_estados.estados_inicios_actividades eia where eia.iac_codigo in (297) order by eia.eia_codigo desc;
	select * from control_estados.estados_asignaciones ea  where ea.asi_codigo in (206) order by ea.asi_codigo desc;
	select * from control_estados.estados_asignaciones_cargos_item eaci  where eaci.aci_codigo in (51) order by eaci.eaci_codigo desc;
	select * from control_estados.estados_asignaciones_cargos_item eaci  where eaci.aci_codigo in (52) order by eaci.eaci_codigo desc;
	select * from control_estados.estados_asignaciones_cargos_item eaci  where eaci.aci_codigo in (53) order by eaci.eaci_codigo desc;
	select * from control_estados.estados_asignaciones_cargos_item eaci  where eaci.aci_codigo in (54) order by eaci.eaci_codigo desc;
	select * from control_estados.estados_asignaciones_cargos_item eaci  where eaci.aci_codigo in (55) order by eaci.eaci_codigo desc;
	select * from control_estados.estados_asignaciones_cargos_item eaci  where eaci.aci_codigo in (430) order by eaci.eaci_codigo desc;
--
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
		and t.tia_codigo in (3)
--		and t.act_codigo in (1121)
--		and	t.act_codigo = 1448
--		and t.act_codigo = 1200
--		and t.act_codigo = 1181
--		and	t.act_codigo = 1156 --no da
--		and t.act_codigo in (933) 
ORDER BY t.fecha_registro DESC
;
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