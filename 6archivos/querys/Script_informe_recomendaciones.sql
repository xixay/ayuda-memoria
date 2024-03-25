--###  --- INFORME RECOMENDACIONES
	select *from ejecucion_actividades.informe_recomendaciones ir where ir.ire_estado in (1) order by ir.fecha_registro desc
	select *from ejecucion_actividades.informe_recomendaciones_seguimientos irs where irs.irs_estado in (1) order by irs.fecha_registro desc 
	select *from parametricas.estados_informe_recomendaciones eir
	select * from ejecucion_actividades.informes i where i.inf_codigo in (17)
	select * from ejecucion_actividades.recomendaciones_inicios_seguimientos
	;
--###  --- INICIO ACTIVIDAD
	select * from ejecucion_actividades.inicio_actividad_poa iap where iap.iap_codigo in (140) 
	;
--###  --- INICIO ACT POA - CAMBIO GLOBAL DE ESTADOS, POR ROL
	select iap.iap_codigo,iap.iac_codigo,iap.iap_observaciones ,iap.ges_codigo ,iap.iap_estado  from ejecucion_actividades.inicio_actividad_poa iap where iap.iap_codigo in (140)
	select ia.iac_codigo,ia.iac_observaciones ,ia.iac_estado ,ia.ges_codigo  from ejecucion_actividades.inicios_actividades ia where ia.iac_codigo in (245) 
	select iaa.iaa_codigo ,iaa.iac_codigo ,iaa.iaa_estado  from ejecucion_actividades.inicios_actividades_adicional iaa where iaa.iac_codigo in (245)
	select *  from ejecucion_actividades.inicio_actividad_poa_asignaciones iapa where iapa.iap_codigo in (140) 
	select *  from ejecucion_poa.asignaciones a where a.asi_codigo in (140)
	select * from ejecucion_poa.asignaciones_cargos_item aci where aci.asi_codigo in (140)
	-- obtiene los estados de cada uno
	select * from control_estados.estados_inicio_actividad_poa eiap where eiap.iap_codigo in (140) order by eiap.eiap_codigo desc
	select * from control_estados.estados_inicios_actividades eia where eia.iac_codigo in (245) order by eia.eia_codigo desc
	--select * from control_estados.estados_inicios_actividades_adicional eiaa where eiaa.iaa_codigo in (2) order by eiaa.eiaa_codigo desc
	select * from control_estados.estados_asignaciones ea  where ea.asi_codigo in (140) order by ea.asi_codigo desc
	select * from control_estados.estados_asignaciones_cargos_item eaci  where eaci.aci_codigo in (667) order by eaci.eaci_codigo desc
	select * from control_estados.estados_asignaciones_cargos_item eaci  where eaci.aci_codigo in (649) order by eaci.eaci_codigo desc
	select * from control_estados.estados_asignaciones_cargos_item eaci  where eaci.aci_codigo in (650) order by eaci.eaci_codigo desc
;
--###  --- INICIO ACT POA - AMPLIACION JUSTIFICACION
	select * from ejecucion_actividades.inicio_actividad_poa iap where iap.iap_codigo in (13)
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