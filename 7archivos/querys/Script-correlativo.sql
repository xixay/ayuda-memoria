--TIPO DE F
SELECT	t.iap_codigo, t.iap_estado, t.tia_codigo, tia.tia_nombre, t.fecha_registro,
        a.act_codigo, a.act_numero,
        au.aun_sigla, 
        ia.iac_codigo, ia.iac_codigo_control,
        tt.ett_codigo
FROM	ejecucion_actividades.inicio_actividad_poa t
		LEFT JOIN parametricas.tipos_inicios_actividades tia ON t.tia_codigo = tia.tia_codigo
        LEFT JOIN estructura_poa.actividades a on t.act_codigo = a.act_codigo
        LEFT JOIN estructura_organizacional.areas_unidades au ON a.aun_codigo_ejecutora = au.aun_codigo 
        LEFT JOIN ejecucion_actividades.inicios_actividades ia on t.iac_codigo = ia.iac_codigo
        LEFT JOIN parametricas.tipos_trabajos tt on ia.ttr_codigo = tt.ttr_codigo
        LEFT JOIN parametricas.especificacion_tipos_trabajo ett on tt.ett_codigo = ett.ett_codigo
WHERE	TRUE
--      AND t.iac_codigo IN (1)
--		AND t.tia_codigo IN (1)--F1
--		AND t.tia_codigo IN (2)--F1-A
		AND t.tia_codigo IN (3)--F2
--		AND t.tia_codigo IN (4)--F2-A
--		AND t.iap_estado IN (5)
        AND t.iap_estado NOT IN (0)
ORDER BY t.fecha_registro DESC
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
		and a.act_numero = '510.1202.17.14.24'
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
--
SELECT	--*
		a.act_codigo,
		iap.iap_codigo, iap.iap_estado,iap.tia_codigo, 
		ia.iac_codigo, ia.iac_estado,ia.iac_objeto, ia.iac_correlativo, ia.iac_codigo_control, ia.iac_codigo_control_vista, 
		iapa.iapa_codigo,
		asi.asi_codigo,
		aci.aci_codigo
FROM	estructura_poa.actividades a
		LEFT JOIN ejecucion_actividades.inicio_actividad_poa iap ON a.act_codigo = iap.act_codigo
		LEFT JOIN estructura_poa.area_unidad_responsables aur ON a.aun_codigo_ejecutora = aur.aun_codigo_ejecutora
		LEFT JOIN ejecucion_actividades.inicios_actividades ia ON iap.iac_codigo = ia.iac_codigo
		LEFT JOIN ejecucion_actividades.inicio_actividad_poa_asignaciones iapa ON iap.iap_codigo = iapa.iap_codigo
		LEFT JOIN ejecucion_poa.asignaciones asi ON iapa.asi_codigo = asi.asi_codigo
		LEFT JOIN ejecucion_poa.asignaciones_cargos_item aci ON asi.asi_codigo = aci.asi_codigo
WHERE	TRUE
--		AND a.act_codigo IN (1515)
--		AND ia.iac_codigo = 568
--		AND ia.iac_codigo = 570
--		AND ia.iac_codigo = 571
--		AND ia.iac_codigo = 573
--		AND ia.iac_codigo = 575
--		AND ia.iac_codigo = 576
		AND ia.iac_codigo = 578
ORDER BY a.act_codigo DESC 
;
--
SELECT 	*
FROM 	ejecucion_actividades.inicios_actividades ia 
WHERE  	TRUE 
--		AND ia.iac_codigo IN (568)
--		AND ia.iac_codigo IN (570)
--		AND ia.iac_codigo IN (571)
--		AND ia.iac_codigo IN (573)
--		AND ia.iac_codigo IN (575)
--		AND ia.iac_codigo IN (576)
--		AND ia.iac_codigo IN (578)
--		AND ia.iac_codigo IN (579)
		AND ia.iac_codigo IN (580)
;
--INICIO ACTIVIDAD INFORME
SELECT 	*
FROM 	ejecucion_actividades.inicio_actividad_informe iai 
WHERE 	iai.iac_codigo IN (576)
;
--ETEP46J23R1PL241
--24=año
--1=correlativo seguimiento
--ET/EP46/J23/R1(PL24/1)

--EBEN14J00C1
--EB/EN14/J00/C1
--PRUEBA
SELECT COALESCE(COUNT(iai.inf_codigo), 0) codigo
FROM ejecucion_actividades.inicio_actividad_informe iai
--WHERE inf_codigo  = 239 and iai.iai_estado != 0;
WHERE inf_codigo  = 244 and iai.iai_estado != 0;
--
SELECT *
FROM ejecucion_actividades.inicio_actividad_informe iai
WHERE inf_codigo  = 239 and iai.iai_estado != 0;
--WHERE inf_codigo  = 244 and iai.iai_estado != 0;
--
SELECT 	*
FROM 	ejecucion_actividades.inicios_actividades ia 
WHERE 	TRUE 
;

