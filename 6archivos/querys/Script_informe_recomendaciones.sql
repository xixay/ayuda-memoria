--###  --- INFORME RECOMENDACIONES
	select * from ejecucion_actividades.informe_recomendaciones ir where ir.ire_estado in (1) order by ir.fecha_registro desc
	select * from ejecucion_actividades.informe_recomendaciones_seguimientos irs where irs.irs_estado in (1) order by irs.fecha_registro desc 
	select * from parametricas.estados_informe_recomendaciones eir
	select * from ejecucion_actividades.informes i where i.inf_codigo in (17)
	select * from ejecucion_actividades.recomendaciones_inicios_seguimientos ris
	-- tiene tabla migrada
	select * from ejecucion_actividades.inicios_actividades ia where ia.iac_codigo in (141)
	select * from ejecucion_actividades.inicio_actividad_informe iai where iai.iac_codigo in (141)--inf_codigo=4
	select * from ejecucion_actividades.inicio_actividad_poa iap where iap.act_codigo in (860)
	--- migrada existe
		--- obt inf codigo//res.- 4
		SELECT iai.inf_codigo
  		FROM ejecucion_actividades.inicio_actividad_informe iai
      	WHERE iai.iac_codigo IN (141)
        --- infomes//res.- 140
      	SELECT i.iac_codigo
        FROM ejecucion_actividades.informes i
        WHERE inf_codigo IN (4)
    	--- comb//res.- 140
      	SELECT i.iac_codigo
        FROM ejecucion_actividades.informes i
        WHERE inf_codigo IN (
          SELECT iai.inf_codigo
          FROM ejecucion_actividades.inicio_actividad_informe iai
          WHERE iai.iac_codigo IN (141)
        )
	select * from ejecucion_actividades.actividad_migrada_conaud amc where amc.iac_codigo in (140)
	-- no tiene tabla migrada
	select * from ejecucion_actividades.inicios_actividades ia where ia.iac_codigo in (249)
	select * from ejecucion_actividades.inicio_actividad_informe iai where iai.iac_codigo in (249)--inf_codigo=17
	select * from ejecucion_actividades.actividad_migrada_conaud amc where amc.iac_codigo in (245)
	--- migrada no existe
		--- obt inf codigo//res.- 17
		SELECT iai.inf_codigo
  		FROM ejecucion_actividades.inicio_actividad_informe iai
      	WHERE iai.iac_codigo IN (249)
        --- infomes//res.- 245
      	SELECT i.iac_codigo
        FROM ejecucion_actividades.informes i
        WHERE inf_codigo IN (17)
    	--- comb//res.- 140
      	SELECT i.iac_codigo
        FROM ejecucion_actividades.informes i
        WHERE inf_codigo IN (
          SELECT iai.inf_codigo
          FROM ejecucion_actividades.inicio_actividad_informe iai
          WHERE iai.iac_codigo IN (249)
        )
	;
--###  --- INICIO ACT POA - AMPLIACION JUSTIFICACION - CAMBIO GLOBAL DE ESTADOS, POR ROL
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






