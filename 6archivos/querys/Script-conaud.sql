--###  --- ORGANIGRAMA - EL ORGANIGRAMA CON SUS ÁREAS UNIDADES
	select * from parametricas.lugares l
	select * from parametricas.tipos_lugares tl 
	select * from estructura_organizacional.organigramas o where o.org_codigo in (3)
	select * from estructura_organizacional.gestiones_organigramas go2 where go2.org_codigo in (3)
	select * from estructura_organizacional.areas_unidades au where au.org_codigo in (3) and au.aun_estado !=9
	;
--###  --- ORGANIGRAMA - GESTIONES ORGANIGRAMAS - AREAS UNIDADES -CARGOS ITEMS
	select * from estructura_organizacional.organigramas o where o.org_codigo in (10)	
	select * from estructura_organizacional.gestiones_organigramas go2 where go2.org_codigo in (3)
	select * from estructura_organizacional.areas_unidades au where au.aun_codigo in (1)
	select * from estructura_organizacional.cargos_items ci where ci.aun_codigo in (1)
	select * from estructura_organizacional.cargos c where c.car_codigo in (1)
	select * from estructura_organizacional.items i where i.ite_codigo in (1)
	;
--###  --- CARGOS ITEM MOVIMIENTOS - CARGOS QUE FUERON MOVIDOS A OTRAS AREAS UNIDADES
	select *from parametricas.tipos_movimientos tm 
	select * from estructura_organizacional.cargos_item_movimientos cim 
	;
--###  --- FECHAS LIBRES DE GESTIONES - FECHAS, Y FERIADOS PARA UNA GESTION
	select * from parametricas.gestiones g 
	select * from parametricas.fechas_libres_gestiones flg where flg.ges_codigo in (3)
	select *from parametricas.estados e
	;
--###  --- ORGANIGRAMA - BUSCA ORGANIGRAMA CONSOLIDADO, CON SUS CARGOS ITEMS
	--encontrar el organigrama
	select *  from estructura_organizacional.organigramas o 
	left join estructura_organizacional.gestiones_organigramas go2 on go2.org_codigo  = o.org_codigo  
	where go2.ges_codigo in (3) and o.org_estado in(2)--consolidado
	--buscar las areas unidades con ese org_codigo no eliminadas
	select * from estructura_organizacional.areas_unidades au where au.org_codigo in (1) and au.aun_estado !=9 order by au.aun_codigo 
	--buscar para una determinada area unidad sus cargos items
	select *
	from estructura_organizacional.cargos_items ci 
	left join estructura_organizacional.cargos c on c.car_codigo =ci.car_codigo 
	left join estructura_organizacional.items i on i.ite_codigo =ci.ite_codigo
	where ci.aun_codigo in (211)
	;
--###  --- PEI - M_UESTRA EL ARBOL DE PEI
	select *from estructura_organizacional.areas_unidades au 
	select *from pei.plan_estrategico_institucional pei where pei.pei_codigo =1
	select *from pei.dimensiones d where d.pei_codigo =1
	--dentro pei
	select *from pei.objetivos_estrategicos oe where oe.dim_codigo in (1,2,3,4)
	select *from pei.objetivos_estrategicos oe where oe.oes_codigo in (1,2,3,4,5)
	select *from pei.estrategias e where e.oes_codigo in (1,2,3,4,5)
	select *from pei.acciones_estrategicas ae where ae.est_codigo in (1,2,3,4,5,6)
	select *from pei.acciones_estrategicas_gestiones aeg where aeg.aes_codigo in (1,2,3,4,5,6)
	--areas
	select *from pei.objetivos_estrategicos_areas oea where oea.oes_codigo  in (1,2,3,4,5)
	select *from pei.estrategias_areas ea where ea.est_codigo in (1,2,3,4,5,6)
	select * from pei.acciones_estrategias_areas aea where aea.aes_codigo in (1,2,3,4,5,6)
	--areas unidades en organigrama 
	select * from estructura_organizacional.areas_unidades au where au.org_codigo in (1)
	;
--###  --- ORGANIGRAMA - MUESTRA LAS ACTIVIDADES PARA UNA ÁREA UNIDAD
	select * from estructura_organizacional.gestiones_organigramas go2 where go2.ges_codigo in (3)
	select * from estructura_organizacional.organigramas o where o.org_codigo in (2)
	select * from estructura_organizacional.areas_unidades au where au.org_codigo in (2) and au.aun_codigo in (33)
	--poa actividades
	select * from estructura_poa.actividades a where a.act_codigo in (1)
	select * from estructura_organizacional.areas_unidades au where au.aun_codigo in (25)
	;
--###  --- POAS - POAS OBJETIVOS, OBJETIVOS, ROL, ÁREA UNIDAD, FORMULARIOS, ACTIVIDADES Y VIATICOS, DENTRO DE UN POA
	select * from estructura_poa.area_unidad_responsables aur where aur.aun_codigo_ejecutora in (9)
	select * from estructura_poa.poas p where p.poa_codigo in (2)
	select * from estructura_poa.formularios f where f.for_codigo in (18,23,28)
	select * from estructura_poa.formularios_objetivos fo where fo.fob_codigo in (21,26,31)
	select * from estructura_poa.actividades a where a.act_codigo in (213,218,223)
	-- EL SERVICIO
	select * from parametricas.roles r where r.rol_codigo in(4)
	select * from estructura_poa.area_unidad_responsables aur where aur.rol_codigo in (4)
	select * from estructura_organizacional.areas_unidades au where au.aun_codigo in (50)
	select * from estructura_poa.poas p where p.ges_codigo in (4) and p.poa_estado in (2)
	select * from parametricas.gestiones g 
	;
--###  --- FECHAS LIBRES GESTIONES - QUERYS DE FECHAS
	-- obtiene los dias de un año
	select
		g.ges_anio,
		DATE_PART('doy',
		('31/12/' || g.ges_anio)::date) as dias_gestion
	from
		parametricas.gestiones g
	where
		g.ges_codigo in (3)
	-- cantidad de dias libres	
	select
		count(*) dias_libres_nac
	from
		parametricas.fechas_libres_gestiones flg
	where
		flg.ges_codigo in (3)
		and flg.lug_codigo = 10
	-- obtiene los dias libres por departamento
    select
		flg.lug_codigo,
		count(flg.lug_codigo) dias_libres_dep
	from
		parametricas.fechas_libres_gestiones flg
	where
		flg.ges_codigo in (3)
		and flg.lug_codigo in (7,8,9,1,2,6)
	group by
		flg.lug_codigo 
	-- obtiene todos los dias del año
	select
		generate_series(
	          ('01/01/' || g.ges_anio)::date,
		--comienzo
	          ('31/12/' || g.ges_anio)::date,
		--final
	          '1 day') as serie_fechas
	from
		parametricas.gestiones g
	where
		g.ges_codigo in (3)
;
--###  --- INICIO ACT POA - CAMBIO GLOBAL DE ESTADOS, POR ROL
	select iap.iap_codigo,iap.iac_codigo,iap.iap_observaciones ,iap.ges_codigo ,iap.iap_estado  from ejecucion_poa.inicio_actividad_poa iap where iap.iap_codigo in (13)
	select ia.iac_codigo,ia.iac_observaciones ,ia.iac_estado ,ia.ges_codigo  from ejecucion_poa.inicios_actividades ia where ia.iac_codigo in (11) 
	select iaa.iaa_codigo ,iaa.iac_codigo ,iaa.iaa_estado  from ejecucion_poa.inicios_actividades_adicional iaa where iaa.iac_codigo in (11)
	select *  from ejecucion_poa.inicio_actividad_poa_asignaciones iapa where iapa.iap_codigo in (13) 
	select *  from ejecucion_poa.asignaciones a where a.asi_codigo in (20)
	select * from ejecucion_poa.asignaciones_cargos_item aci where aci.asi_codigo in (20)
	-- obtiene los estados de cada uno
	select * from control_estados.estados_inicio_actividad_poa eiap where eiap.iap_codigo in (13) order by eiap.eiap_codigo desc
	select * from control_estados.estados_inicios_actividades eia where eia.iac_codigo in (11) order by eia.eia_codigo desc
	--select * from control_estados.estados_inicios_actividades_adicional eiaa where eiaa.iaa_codigo in (2) order by eiaa.eiaa_codigo desc
	select * from control_estados.estados_asignaciones ea  where ea.asi_codigo in (20) order by ea.asi_codigo desc
	select * from control_estados.estados_asignaciones_cargos_item eaci  where eaci.aci_codigo in (33) order by eaci.eaci_codigo desc
	select * from control_estados.estados_asignaciones_cargos_item eaci  where eaci.aci_codigo in (34) order by eaci.eaci_codigo desc
;
--###  --- INICIO ACT POA - AMPLIACION JUSTIFICACION
	select * from ejecucion_poa.inicio_actividad_poa iap where iap.iap_codigo in (13)
	select ia.iac_codigo,ia.iac_observaciones ,ia.iac_estado ,ia.ges_codigo  from ejecucion_poa.inicios_actividades ia where ia.iac_codigo in (11) 
	select iaa.iaa_codigo ,iaa.iac_codigo ,iaa.iaa_estado  from ejecucion_poa.inicios_actividades_adicional iaa where iaa.iac_codigo in (11)
	select *  from ejecucion_poa.inicio_actividad_poa_asignaciones iapa where iapa.iap_codigo in (13) 
	select *  from ejecucion_poa.asignaciones a where a.asi_codigo in (20)
	select * from ejecucion_poa.asignaciones_cargos_item aci where aci.asi_codigo in (20)
	-- obtiene los estados de cada uno
	select * from control_estados.estados_inicio_actividad_poa eiap where eiap.iap_codigo in (13) order by eiap.eiap_codigo desc
	select * from control_estados.estados_inicios_actividades eia where eia.iac_codigo in (11) order by eia.eia_codigo desc
	--select * from control_estados.estados_inicios_actividades_adicional eiaa where eiaa.iaa_codigo in (2) order by eiaa.eiaa_codigo desc
	select * from control_estados.estados_asignaciones ea  where ea.asi_codigo in (20) order by ea.asi_codigo desc
	select * from control_estados.estados_asignaciones_cargos_item eaci  where eaci.aci_codigo in (33) order by eaci.eaci_codigo desc
	select * from control_estados.estados_asignaciones_cargos_item eaci  where eaci.aci_codigo in (34) order by eaci.eaci_codigo desc
;
--###  --- INFORMES EMERGENTES Y RECOMENDACIONES- Y SUS INFORMES Y TIPOS DE TRABAJOS 
	select * from parametricas.tipos_trabajos tt
	select * from parametricas.especificacion_tipos_trabajo ett
	select * from ejecucion_poa.informes i where i.inf_codigo in (1,2,3,4,5,6,7,8,9,10,11)
	select * from ejecucion_poa.inicios_actividades ia where ia.iac_codigo in (3)
	select * from parametricas.informes_emergentes ie where ie.iem_codigo in (7)
	select * from ejecucion_poa.informe_recomendaciones ir 
;
--###  --- INICIO ACTIVIDAD POA - REFERENTE A SUS INFORMES Y INFORMES EMERGENTES; Y TIPOS DE TRABAJOS
	select * from ejecucion_poa.inicio_actividad_poa iap where iap.act_codigo in (543)
	select * from ejecucion_poa.informes_uai iu where iu.act_codigo in (543)
	select * from estructura_poa.actividades a where a.act_codigo in (543)
	select * from ejecucion_poa.informes_uai iu where iu.act_codigo in (543)
;
--###  --- FLUJOS ESTADOS EVOLUCION - Y SUS INFORMES, INF RECOMENDACIONES, INF EMERGENTES 
	select * from parametricas.flujos_estados_evolucion fee where fee.iem_codigo in (10)
	select * from parametricas.informes_emergentes ie where ie.iem_codigo in (10)
	select * from ejecucion_poa.informes i where i.inf_codigo in (25)
	select * from ejecucion_poa.informes_estados ie where ie.inf_codigo in (17)
	select * from ejecucion_poa.informe_recomendaciones ir where ir.inf_codigo in (17)
	select * from control_estados.estados_informes ei where ei.inf_codigo in (17)
;
--###  --- INICIO ACTIVIDAD POA ASIGNACIONES - SUS ASIGNACIONES, ASIG CARGOS ITEM - ACT - INICIOS ACT
	select * from ejecucion_poa.inicio_actividad_poa_asignaciones iapa
	select * from ejecucion_poa.asignaciones a
	select * from ejecucion_poa.asignaciones_cargos_item aci 
	select * from estructura_poa.actividades a where a.act_codigo in (222)
	select * from ejecucion_poa.inicios_actividades ia where ia.iac_codigo in (11)
;
--###  --- INFORMES - CAMBIO DE ESTADO A ANULACION Y SUSPENSIÓN
	--MENU INICIO ACTIDADES
	-- Inicios Actividades iac_codigo(1)
	select * from ejecucion_poa.inicios_actividades ia where ia.iac_codigo in (1)
	-- Informe
	select * from ejecucion_poa.informes i where i.iac_codigo in (1) order by i.inf_codigo desc--inf_codigo(6,5,4)
	--inf_codigo(6)
	select * from ejecucion_poa.informes_estados ie where ie.inf_codigo in (6)--ies_codigo(10,11,12,13,14,15)
	-- estados-tablas
	select * from control_estados.estados_informes ei where ei.inf_codigo in (6) order by ei.ein_codigo DESC
	select * from control_estados.estados_informes_estados eie  where eie.ies_codigo in (10) order by eie.eie_codigo desc--no hay
	select * from control_estados.estados_informes_estados eie  where eie.ies_codigo in (11) order by eie.eie_codigo desc--no hay
	select * from control_estados.estados_informes_estados eie  where eie.ies_codigo in (12) order by eie.eie_codigo desc--no hay
	select * from control_estados.estados_informes_estados eie  where eie.ies_codigo in (13) order by eie.eie_codigo desc--no hay
	select * from control_estados.estados_informes_estados eie  where eie.ies_codigo in (14) order by eie.eie_codigo desc--no hay
	select * from control_estados.estados_informes_estados eie  where eie.ies_codigo in (15) order by eie.eie_codigo desc--no hay
	--YHAMIL
	-- Inicios Actividades iac_codigo(3)
	select * from ejecucion_poa.inicios_actividades ia where ia.iac_codigo in (1)
	-- Informe
	select * from ejecucion_poa.informes i where i.iac_codigo in (3) order by i.inf_codigo desc--inf_codigo(18,17,4,3,2,1)
	--inf_codigo(4)
	select * from ejecucion_poa.informes_estados ie where ie.inf_codigo in (4)--ies_codigo(1,5,11,12,2)
	-- estados-tablas
	select * from control_estados.estados_informes ei where ei.inf_codigo in (4) order by ei.ein_codigo DESC
	select * from control_estados.estados_informes_estados eie  where eie.ies_codigo in (1) order by eie.eie_codigo desc
	select * from control_estados.estados_informes_estados eie  where eie.ies_codigo in (2) order by eie.eie_codigo desc
	select * from control_estados.estados_informes_estados eie  where eie.ies_codigo in (5) order by eie.eie_codigo desc
	select * from control_estados.estados_informes_estados eie  where eie.ies_codigo in (11) order by eie.eie_codigo desc
	select * from control_estados.estados_informes_estados eie  where eie.ies_codigo in (12) order by eie.eie_codigo desc
;
--###  --- USUARIOS - OBTENER EL GERENTE RESPONSABLE DE AUDITORÍA
	-- unidad ejecutora
	select * from estructura_organizacional.areas_unidades au where au.aun_codigo in(53)
	-- cargos items pertenecientes a esa unidad ejecutora
	select *from estructura_organizacional.cargos_items ci where ci.aun_codigo in (53)
	-- se usara el cargo item de susana
	select *from estructura_organizacional.cargos_items ci where ci.cit_codigo in (107)
	-- personas que pertenecen a ese cargo item
	select * from estructura_organizacional.cargos_items_persona cip2 where cip2.cit_codigo in (107)	
	select * from ejecucion_poa.asignaciones_cargos_item aci where aci.cit_codigo in (107)
;
--###  --- INFORMES - FLUJOS PARA INFORMES 
SELECT * FROM parametricas.estados e 
SELECT * FROM parametricas.tablas t 
SELECT * FROM control_estados.flujos_tablas ft where ft.tab_codigo in (68)
	-- 68	Informes
	-- 73	InformesEstados
INSERT INTO control_estados.flujos_tablas (fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro) VALUES(334, 68, '', 33, 14, 1, 0)
INSERT INTO control_estados.flujos_tablas (fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro) VALUES(335, 68, '', 33, 9, 1, 0)
INSERT INTO control_estados.flujos_tablas (fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro) VALUES(336, 68, '', 14, 2, 1, 0)
INSERT INTO control_estados.flujos_tablas (fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro) VALUES(337, 68, '', 14, 2, 1, 0)
INSERT INTO control_estados.flujos_tablas (fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro) VALUES(338, 68, '', 2, 35, 1, 0)
INSERT INTO control_estados.flujos_tablas (fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro) VALUES(339, 68, '', 35, 36, 1, 0)
INSERT INTO control_estados.flujos_tablas (fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro) VALUES(340, 68, '', 35, 40, 1, 0)
INSERT INTO control_estados.flujos_tablas (fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro) VALUES(341, 68, '', 36, 37, 1, 0)
INSERT INTO control_estados.flujos_tablas (fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro) VALUES(342, 68, '', 36, 40, 1, 0)
INSERT INTO control_estados.flujos_tablas (fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro) VALUES(343, 68, '', 37, 38, 1, 0)
INSERT INTO control_estados.flujos_tablas (fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro) VALUES(344, 68, '', 37, 40, 1, 0)
INSERT INTO control_estados.flujos_tablas (fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro) VALUES(345, 68, '', 38, 39, 1, 0)
INSERT INTO control_estados.flujos_tablas (fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro) VALUES(346, 68, '', 38, 40, 1, 0)
INSERT INTO control_estados.flujos_tablas (fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro) VALUES(347, 68, '', 40, 2, 1, 0)
INSERT INTO control_estados.flujos_tablas (fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro) VALUES(348, 68, '', 39, 2, 1, 0)
INSERT INTO control_estados.flujos_tablas (fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro) VALUES(349, 73, '', 21, 1, 1, 0)
INSERT INTO control_estados.flujos_tablas (fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro) VALUES(350, 73, '', 1, 33, 1, 0)
INSERT INTO control_estados.flujos_tablas (fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro) VALUES(351, 73, '', 33, 14, 1, 0)
INSERT INTO control_estados.flujos_tablas (fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro) VALUES(352, 73, '', 33, 9, 1, 0)
INSERT INTO control_estados.flujos_tablas (fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro) VALUES(353, 73, '', 14, 1, 1, 0)
INSERT INTO control_estados.flujos_tablas (fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro) VALUES(354, 73, '', 1, 21, 1, 0)
INSERT INTO control_estados.flujos_tablas (fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro) VALUES(355, 73, '', 21, 39, 1, 0)
INSERT INTO control_estados.flujos_tablas (fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro) VALUES(356, 73, '', 39, 1, 1, 0)
INSERT INTO control_estados.flujos_tablas (fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro) VALUES(357, 68, '', 2, 33, 1, 0)
;
--###  --- AREA UNIDAD RESPONSABLES
	select * from estructura_poa.poas p where p.ges_codigo in (2) and p.poa_estado in (2)
	select * from estructura_poa.area_unidad_responsables aur where aur.rol_codigo in (2,3,4,5) and aur.poa_codigo in (2) and aur.per_codigo in (461)
	select * from ejecucion_poa.asignaciones a 
	select * from estructura_organizacional.cargos_items_persona cip where cip.per_codigo in (461)--cit_codigo(305)
	select * from ejecucion_poa.asignaciones_cargos_item aci where aci.cit_codigo in (305)--asi_codigo(1,2,4,6)
	--primero
	select * from ejecucion_poa.inicio_actividad_poa_asignaciones iapa where iapa.asi_codigo in (1)--iap_codigo(1)
	--segundo
	select * from ejecucion_poa.inicio_actividad_poa_asignaciones iapa where iapa.asi_codigo in (2)--iap_codigo(2)
	--tercer
	select * from ejecucion_poa.inicio_actividad_poa_asignaciones iapa where iapa.asi_codigo in (4)--no tiene
	--cuarto
	select * from ejecucion_poa.inicio_actividad_poa_asignaciones iapa where iapa.asi_codigo in (6)--bloqueado
	select * from ejecucion_poa.inicio_evaluacion_informe_asignaciones ieia  where ieia.asi_codigo in (1)-- no hay
	select * from ejecucion_poa.inicio_evaluacion_informe_asignaciones ieia  where ieia.asi_codigo in (2)-- no hay
	select * from ejecucion_poa.inicio_evaluacion_informe_asignaciones ieia  where ieia.asi_codigo in (4)-- ieia_codigo(2)
	select * from ejecucion_poa.inicio_evaluacion_informe_asignaciones ieia  where ieia.asi_codigo in (6)-- bloqueado
;
--###  --- ASIGNACIONES CARGOS ITEM - AL ELIMINAR USUARIO VER SI TIENE HORAS USADAS
-- SEGURO SOCIAL UNIVERSITARIO DE LA PAZ
	select * from ejecucion_poa.asignaciones_cargos_item aci where aci.asi_codigo in (11)--aci_codigo(3,2,1), cit_codigo(379,274,305)
-- SANDRA QUIROGA SOLANO
	select * from ejecucion_poa.asignaciones_cargos_item aci where aci.aci_codigo in (3)
	select * from ejecucion_poa.asignaciones_horas_usadas ahu where ahu.aci_codigo in (3)--ahu_codigo(9,10,11,12,13,14) por ser 
	select * from ejecucion_poa.reposicion_cargos_item rci where rci.aci_codigo in (3)--no hay
-- CLAUDIA MARCELA VIOLETA PIZARRO
	select * from ejecucion_poa.asignaciones_cargos_item aci where aci.aci_codigo in (1)
	select * from ejecucion_poa.asignaciones_horas_usadas ahu where ahu.aci_codigo in (1)--ahu_codigo(15,16,17) por ser
	select * from ejecucion_poa.reposicion_cargos_item rci where rci.aci_codigo in (1)--no hay
-- JAVIER GONZALO GUILLEN GLOOR
	select * from ejecucion_poa.asignaciones_cargos_item aci where aci.aci_codigo in (2)
	select * from ejecucion_poa.asignaciones_horas_usadas ahu where ahu.aci_codigo in (2)--nada
	select * from ejecucion_poa.reposicion_cargos_item rci where rci.aci_codigo in (2)--no hay
-- Spr
	select * FROM ejecucion_poa.spr_sel_dias_cargo(--279 SANDRA,305 CLAUDIA, 274 JAVIER
		ARRAY[279,274,305]	--codigos de cargo item
	)
	--- INICIO ACT POA - CAMBIO GLOBAL DE ESTADOS, POR ROL
			--#Cambio Apliacion select iap.iap_codigo,iap.iac_codigo,iap.iap_observaciones ,iap.ges_codigo ,iap.iap_estado  from ejecucion_poa.inicio_actividad_poa iap where iap.iap_codigo in (1)
			select iap.iap_codigo,iap.iac_codigo,iap.iap_observaciones ,iap.ges_codigo ,iap.iap_estado  from ejecucion_poa.inicio_actividad_poa iap where iap.iap_codigo in (6)
			select ia.iac_codigo,ia.iac_observaciones ,ia.iac_estado ,ia.ges_codigo  from ejecucion_poa.inicios_actividades ia where ia.iac_codigo in (1) 
			select iaa.iaa_codigo ,iaa.iac_codigo ,iaa.iaa_estado  from ejecucion_poa.inicios_actividades_adicional iaa where iaa.iac_codigo in (1)
			--#Cambio Apliacion select *  from ejecucion_poa.inicio_actividad_poa_asignaciones iapa where iapa.iap_codigo in (1)
			select *  from ejecucion_poa.inicio_actividad_poa_asignaciones iapa where iapa.iap_codigo in (6)
			--#Cambio Apliacion select *  from ejecucion_poa.asignaciones a where a.asi_codigo in (1)
			--#Cambio Apliacion select * from ejecucion_poa.asignaciones_cargos_item aci where aci.asi_codigo in (1)
			select *  from ejecucion_poa.asignaciones a where a.asi_codigo in (11)
			select * from ejecucion_poa.asignaciones_cargos_item aci where aci.asi_codigo in (11)
			-- obtiene los estados de cada uno
			--#Antes Ampliacion select * from control_estados.estados_inicio_actividad_poa eiap where eiap.iap_codigo in (1) order by eiap.eiap_codigo desc
			select * from control_estados.estados_inicio_actividad_poa eiap where eiap.iap_codigo in (6) order by eiap.eiap_codigo desc
			select * from control_estados.estados_inicios_actividades eia where eia.iac_codigo in (1) order by eia.eia_codigo desc
			select * from control_estados.estados_inicios_actividades_adicional eiaa where eiaa.iaa_codigo in (1) order by eiaa.eiaa_codigo desc
			--#Antes Ampliacion select * from control_estados.estados_asignaciones ea  where ea.asi_codigo in (1) order by ea.eas_codigo desc
			select * from control_estados.estados_asignaciones ea  where ea.asi_codigo in (11) order by ea.asi_codigo desc
			select * from control_estados.estados_asignaciones_cargos_item eaci  where eaci.aci_codigo in (3) order by eaci.eaci_codigo desc
			select * from control_estados.estados_asignaciones_cargos_item eaci  where eaci.aci_codigo in (2) order by eaci.eaci_codigo desc
			select * from control_estados.estados_asignaciones_cargos_item eaci  where eaci.aci_codigo in (1) order by eaci.eaci_codigo desc
-- GOBIERNO AUTÓNOMO DEPARTAMENTAL DE LA PAZ
	select * from ejecucion_poa.asignaciones_cargos_item aci where aci.asi_codigo in (6)--aci_codigo(15,13,14), cit_codigo(421,305,279)
-- DIEGO ANICETO PALACIOS NAVA
	select * from ejecucion_poa.asignaciones_cargos_item aci where aci.aci_codigo in (15)
	select * from ejecucion_poa.asignaciones_horas_usadas ahu where ahu.aci_codigo in (15)--nada 
	select * from ejecucion_poa.reposicion_cargos_item rci where rci.aci_codigo in (15)--no hay
-- CLAUDIA MARCELA VIOLETA PIZARRO
	select * from ejecucion_poa.asignaciones_cargos_item aci where aci.aci_codigo in (13)
	select * from ejecucion_poa.asignaciones_horas_usadas ahu where ahu.aci_codigo in (13)--nada
	select * from ejecucion_poa.reposicion_cargos_item rci where rci.aci_codigo in (13)--no hay
-- SANDRA QUIROGA SOLANO
	select * from ejecucion_poa.asignaciones_cargos_item aci where aci.aci_codigo in (14)
	select * from ejecucion_poa.asignaciones_horas_usadas ahu where ahu.aci_codigo in (14)--nada
	select * from ejecucion_poa.reposicion_cargos_item rci where rci.aci_codigo in (14)--no hay
-- Spr
	select * FROM ejecucion_poa.spr_sel_dias_cargo(--421 DIEGO,305 CLAUDIA, 279 SANDRA
		ARRAY[421,305,279]	--codigos de cargo item
	)
-- DIRECCIÓN DEPARTAMENTAL DE EDUCACIÓN LA PAZ(DESPUES DE LA AMPLIACION)
	--#Cambio Ampliacion select * from ejecucion_poa.asignaciones_cargos_item aci where aci.asi_codigo in (2)--aci_codigo(6,4,5), cit_codigo(299,305,279)
	select * from ejecucion_poa.asignaciones_cargos_item aci where aci.asi_codigo in (12) order by aci.aci_codigo desc--aci_codigo(6,4,5), cit_codigo(299,305,279)
-- MERY GOMEZ CONDORI
	select * from ejecucion_poa.asignaciones_cargos_item aci where aci.aci_codigo in (6)
	select * from ejecucion_poa.asignaciones_horas_usadas ahu where ahu.aci_codigo in (6)--nada 
	select * from ejecucion_poa.reposicion_cargos_item rci where rci.aci_codigo in (6)--no hay
-- SANDRA QUIROGA SOLANO
	select * from ejecucion_poa.asignaciones_cargos_item aci where aci.aci_codigo in (5)
	select * from ejecucion_poa.asignaciones_horas_usadas ahu where ahu.aci_codigo in (5)--hay 4
	select * from ejecucion_poa.reposicion_cargos_item rci where rci.aci_codigo in (5)--antes no habia, ahora hay uno
-- CLAUDIA MARCELA VIOLETA PIZARRO
	select * from ejecucion_poa.asignaciones_cargos_item aci where aci.aci_codigo in (4)
	select * from ejecucion_poa.asignaciones_horas_usadas ahu where ahu.aci_codigo in (4)--hay 3
	select * from ejecucion_poa.reposicion_cargos_item rci where rci.aci_codigo in (4)--no hay
-- Spr
	select * FROM ejecucion_poa.spr_sel_dias_cargo(--299 MERY,305 CLAUDIA, 279 SANDRA
		ARRAY[299,305,279]	--codigos de cargo item
	)
--- INICIO ACT POA - CAMBIO GLOBAL DE ESTADOS, POR ROL
			--#Cambio Apliacion select * from control_estados.estados_inicio_actividad_poa eiap where eiap.iap_codigo in (2) order by eiap.eiap_codigo desc
			select iap.iap_codigo,iap.iac_codigo,iap.iap_observaciones ,iap.ges_codigo ,iap.iap_estado  from ejecucion_poa.inicio_actividad_poa iap where iap.iap_codigo in (7)
			select ia.iac_codigo,ia.iac_observaciones ,ia.iac_estado ,ia.ges_codigo  from ejecucion_poa.inicios_actividades ia where ia.iac_codigo in (2) 
			select iaa.iaa_codigo ,iaa.iac_codigo ,iaa.iaa_estado  from ejecucion_poa.inicios_actividades_adicional iaa where iaa.iac_codigo in (2)
			--#Antes Apliacion select *  from ejecucion_poa.inicio_actividad_poa_asignaciones iapa where iapa.iap_codigo in (2)
			select *  from ejecucion_poa.inicio_actividad_poa_asignaciones iapa where iapa.iap_codigo in (7)
			--#Antes Apliacion select *  from ejecucion_poa.asignaciones a where a.asi_codigo in (2)
			--#Antes Apliacion select * from ejecucion_poa.asignaciones_cargos_item aci where aci.asi_codigo in (2)
			select *  from ejecucion_poa.asignaciones a where a.asi_codigo in (12)
			select * from ejecucion_poa.asignaciones_cargos_item aci where aci.asi_codigo in (12)
			-- obtiene los estados de cada uno
			--#Antes Ampliacion select * from control_estados.estados_inicio_actividad_poa eiap where eiap.iap_codigo in (2) order by eiap.eiap_codigo desc
			select * from control_estados.estados_inicio_actividad_poa eiap where eiap.iap_codigo in (7) order by eiap.eiap_codigo desc
			select * from control_estados.estados_inicios_actividades eia where eia.iac_codigo in (2) order by eia.eia_codigo desc
			select * from control_estados.estados_inicios_actividades_adicional eiaa where eiaa.iaa_codigo in (2) order by eiaa.eiaa_codigo desc
			--#Antes Ampliacion select * from control_estados.estados_asignaciones ea  where ea.asi_codigo in (2) order by ea.asi_codigo desc
			select * from control_estados.estados_asignaciones ea  where ea.asi_codigo in (12) order by ea.asi_codigo desc
			select * from control_estados.estados_asignaciones_cargos_item eaci  where eaci.aci_codigo in (6) order by eaci.eaci_codigo desc
			select * from control_estados.estados_asignaciones_cargos_item eaci  where eaci.aci_codigo in (4) order by eaci.eaci_codigo desc
			select * from control_estados.estados_asignaciones_cargos_item eaci  where eaci.aci_codigo in (5) order by eaci.eaci_codigo desc
;
--###  --- CALCULO FECHAS(INICIO - ENTREGA DEL PROYECTO)
	SELECT '01/11/2023'::date + 29
	-- 1.- Obtiene el año(2023) y los días de la gestion
	SELECT
		g.ges_anio,
		DATE_PART('doy', ('31/12/'||g.ges_anio)::date)
	FROM parametricas.gestiones g
	WHERE g.ges_codigo = 1 -- output:_ges_anio=2023,_dias_gestion=365
	-- 2.-Obtiene los dias libres a nivel nacional
	SELECT
		count(*)
	FROM parametricas.fechas_libres_gestiones flg
	WHERE flg.ges_codigo = 1
	AND flg.flg_estado > 0
	AND flg.lug_codigo = 10 -- Para Nacional (BOLIVIA) _dias_libres_nac=7
	-- 3.-Obtiene los sabados y domingos
	WITH tmp_serie_fechas AS (
		-- Obtiene todos los dias del rango
		SELECT 
	        generate_series(
	        ('01/01/'||g.ges_anio)::date,--comienzo
	        ('31/12/'||g.ges_anio)::date,--final
	        '1 day') AS serie_fechas
		FROM parametricas.gestiones g 
		WHERE g.ges_codigo = 1
	)
	SELECT 
		count ((
			CASE WHEN EXTRACT(dow FROM tsf.serie_fechas) < 1 OR 
					  EXTRACT(dow FROM tsf.serie_fechas) > 5 
				 THEN tsf.serie_fechas
	        END)::date) 
	FROM tmp_serie_fechas tsf--_dias_sabado_domingo=105
	-- 4.-Obtiene los dias para trabajar a nivel nacional
	SELECT (_dias_gestion - _dias_sabado_domingo - _dias_libres_nac) INTO _subtotal_dias--_subtotal_dias=365-105-7=253
	-- ???
	SELECT
		l.lug_codigo::integer,
		l.lug_nombre::varchar,
		count(flg.lug_codigo)::integer AS dias_libres_dep,
		(252 - count(flg.lug_codigo)::integer) AS dias_laborales
	FROM parametricas.lugares l
	LEFT JOIN parametricas.fechas_libres_gestiones flg ON (flg.lug_codigo = l.lug_codigo
	AND flg.ges_codigo = 1
	AND flg.flg_estado > 0
	AND flg.lug_codigo = ANY (ARRAY[1,2,3,4,5]))
	GROUP BY l.lug_codigo, l.lug_nombre
;
--###  ---FECHAS
	WITH tmp_serie_fechas AS (
		SELECT 
	        generate_series(
	        ('01/01/'||g.ges_anio)::date,--comienzo
	        ('31/12/'||g.ges_anio + 1)::date,--FINAL adion de una gestion
	        '1 day') AS serie_fechas
		FROM parametricas.gestiones g 
		WHERE g.ges_codigo in $ges_codigo
	), tmp_fechas_libres AS ( -- Para Nacional (BOLIVIA) y algun departamento.
		SELECT 
			flg.flg_fecha 
		FROM parametricas.fechas_libres_gestiones flg
		WHERE flg.ges_codigo in $ges_codigo
		AND flg.flg_estado > 0
		AND flg.lug_codigo IN $lug_codigo 
	)	
	SELECT 
		to_char(tsf.serie_fechas, 'DD/MM/YYYY') fechas
	FROM tmp_serie_fechas AS tsf
	WHERE TRUE 
	AND EXTRACT(dow FROM tsf.serie_fechas) > 0 
	AND EXTRACT(dow FROM tsf.serie_fechas) < 6 
	AND tsf.serie_fechas NOT IN (SELECT * FROM tmp_fechas_libres)
	AND tsf.serie_fechas >= $fecha_inicio::date
	LIMIT $cantidad_dias
--CCCCCCCCCCCCCCCCCCCCCC
WITH tmp_dias_rango AS (
	SELECT ($fecha_fin::date - $fecha_inicio::date) + 1 AS dias_calendario
), tmp_fechas_libres AS (
	SELECT 
		count(*) AS dias_libres
	FROM parametricas.fechas_libres_gestiones flg
	WHERE flg.ges_codigo = $ges_codigo
	AND flg.flg_estado > 0
	AND flg.lug_codigo IN $lug_codigo
	AND flg.flg_fecha BETWEEN $fecha_inicio::date AND $fecha_fin::date
), tmp_serie_fechas AS (
	SELECT 
        generate_series(
        ('01/01/'||g.ges_anio)::date,--comienzo
        ('31/12/'||g.ges_anio)::date,--final
        '1 day') AS serie_fechas
	FROM parametricas.gestiones g 
	WHERE g.ges_codigo IN $ges_codigo
), tmp_sabados_domingos AS (
	SELECT count(
            (
                CASE WHEN EXTRACT(dow FROM tsf.serie_fechas) < 1 OR
                          EXTRACT(dow FROM tsf.serie_fechas) > 5 THEN tsf.serie_fechas
                END
            )::date
        ) AS dias_sabado_domingo
    FROM tmp_serie_fechas tsf
    WHERE tsf.serie_fechas BETWEEN $fecha_inicio::date AND $fecha_fin::date
)
SELECT 
	 tdr.dias_calendario, 
	 tdr.dias_calendario - tfl.dias_libres - tsd.dias_sabado_domingo AS dias_habiles
FROM tmp_dias_rango tdr, tmp_fechas_libres tfl, tmp_sabados_domingos tsd
;
--###  ---CONTINUOS
SELECT * FROM estructura_poa.actividades_continuidad ac
INNER JOIN estructura_poa.actividades a ON a.act_codigo = ac.act_codigo
WHERE a.aun_codigo_ejecutora = 39 and  ac.act_codigo in (666)
	--
	select * from ejecucion_poa.inicios_actividades ia where ia.iac_codigo in (77)
	select * from ejecucion_poa.inicio_actividad_poa p where p.iac_codigo in (77) 
	--
	SELECT
	    t.iac_codigo,
	    t.iac_correlativo,
	    t.iac_codigo_control,
	    t.iac_objeto,
	    t.iac_objetivo,
	    t.iac_alcance,
	    t.iac_observaciones,
	    TO_CHAR(t.iac_fecha_inicio, 'dd/mm/yyyy') AS iac_fecha_inicio,
	    t.ttr_codigo,
	    tt.ttr_sigla,
	    tt.ttr_descripcion,
	    t.iac_dias_habiles,
	    t.iac_dias_calendario,
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
	    TO_CHAR(t.fecha_registro, 'HH24:MI am dd/mm/yyyy') AS fecha_registro
	FROM
	    ejecucion_poa.inicios_actividades t
	    LEFT JOIN parametricas.estados e ON t.iac_estado = e.est_codigo
	    LEFT JOIN parametricas.gestiones g ON t.ges_codigo = g.ges_codigo
	    LEFT JOIN parametricas.tipos_trabajos tt ON t.ttr_codigo = tt.ttr_codigo
	WHERE
	    TRUE
	    AND t.iac_codigo IN (77)
	ORDER BY
	    t.fecha_registro DESC
;
--###  --- INICIO ACT POA - HISTORICOS
select * from ejecucion_poa.inicios_actividades ia where ia.iac_codigo in (3)	
select *  from ejecucion_poa.inicio_actividad_poa iap where iap.iac_codigo in (3)
;
--###  --- OBTIENE LAS PLANIFICACIONES EJECUCIONES TODAS
select * from ejecucion_administrativas.planificaciones_ejecuciones pe
where pe.iad_codigo in (3)
;
--###  --- OBTIENE LAS PLANIFICACIONES EJECUCIONES TODAS
select * from estructura_poa.actividades a 
where pe.iad_codigo in (3)
;
--###  --- OBTIENE LAS POAS
select * from estructura_poa.area_unidad_responsables aur 
where aur.poa_codigo 
;
--###  --- OBTIENE LAS PLANIFICACIONES EJECUCIONES POR MES
	select
	    SUM(t.pej_planificado) AS pej_planificado,
	    SUM(t.pej_ejecutado) AS pej_ejecutado,
	    t.mes_codigo,
	    m.mes_nombre,
	    m.mes_inicial
	FROM 
	    ejecucion_administrativas.planificaciones_ejecuciones t
	LEFT JOIN 
	    parametricas.estados e ON e.est_codigo = t.pej_estado
	LEFT JOIN 
	    parametricas.meses m ON m.mes_codigo = t.mes_codigo
	WHERE 
	    t.iad_codigo = 3
	GROUP BY 
	    t.mes_codigo, m.mes_nombre, m.mes_inicial
	ORDER BY 
	    m.mes_inicial
	;
--###  --- OBTENER INICIOS ADMINISTRATIVAS
	SELECT DISTINCT
        t.iad_codigo,
        t.act_codigo,
        a.act_numero,
        a.act_objeto,
        a.act_objetivo,
        aur.poa_codigo,
        a.aun_codigo_ejecutora,
        a.act_alcance,
        TO_CHAR(a.act_fecha_inicio, 'dd/mm/yyyy') as act_fecha_inicio,
        TO_CHAR(a.act_fecha_fin, 'dd/mm/yyyy') as act_fecha_fin,
        t.ges_codigo,
        g.ges_anio,
        t.iad_estado,
        e.est_color,
        e.est_nombre AS iad_estado_descripcion,
        TO_CHAR(t.fecha_registro, 'HH24:MI am dd/mm/yyyy') as fecha_registro
      FROM ejecucion_administrativas.inicios_administrativas t
      LEFT JOIN estructura_poa.actividades a ON a.act_codigo = t.act_codigo
      LEFT JOIN parametricas.gestiones g ON g.ges_codigo = t.ges_codigo
      LEFT JOIN parametricas.estados e ON e.est_codigo = t.iad_estado
      LEFT JOIN estructura_poa.area_unidad_responsables aur ON aur.aun_codigo_ejecutora = a.aun_codigo_ejecutora
      --WHERE true and a.aun_codigo_ejecutora  in (9)
      --WHERE true and t.ges_codigo in (2)
      --WHERE true and aur.poa_codigo in (2)
      WHERE true and a.aun_codigo_ejecutora  in (9) and t.ges_codigo in (2) and aur.poa_codigo in (2)
	  ;
      
     
     
	





