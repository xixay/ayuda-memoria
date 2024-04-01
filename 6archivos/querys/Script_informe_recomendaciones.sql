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
    select * from estructura_poa.actividades a where a.act_codigo in (860)
    select * from ejecucion_actividades.inicios_actividades ia 
	 SELECT
	          t.iai_codigo,
	          t.iai_descripcion,
	          t.inf_codigo,
	          inf.inf_nombre,
	          t.iac_codigo,
	          ia.iac_codigo_control,
	          t.iai_estado,
	          e.est_color,
	          e.est_nombre AS iai_estado_descripcion,
	          TO_CHAR(t.fecha_registro, 'HH24:MI am dd/mm/yyyy') as fecha_registro
	    FROM	ejecucion_actividades.inicio_actividad_informe t
	          LEFT JOIN parametricas.estados e ON e.est_codigo = t.iai_estado
	          LEFT JOIN ejecucion_actividades.informes inf ON t.inf_codigo = inf.inf_codigo
	          LEFT JOIN ejecucion_actividades.inicios_actividades ia ON t.iac_codigo = ia.iac_codigo
	    WHERE	t.inf_codigo in (17)
	    ORDER BY t.fecha_registro desc
	    --###############
	 	select t.iac_codigo
	    FROM	ejecucion_actividades.inicio_actividad_informe t
	    WHERE	t.inf_codigo in (17)--iac_codigo=249
	    
	   	select t.iac_codigo_control	
	    FROM	ejecucion_actividades.inicios_actividades t
	    WHERE	t.iac_codigo in (249)
	    
	 	select *
	    FROM	ejecucion_actividades.inicio_actividad_poa t
	    WHERE	t.iac_codigo in (249)--ac_codigo=864
	    
	 	select a.act_descripcion 
	 	from estructura_poa.actividades a 
	 	where a.act_codigo in (864)--act_descripcion=GOBIERNO AUTÓNOMO DEPARTAMENTAL DE ORURO
	 	
	 	select * 
	 	from ejecucion_actividades.informes i 
	 	where i.inf_codigo in (17)--inf_nombre
	 	
	 	select *
	 	from parametricas.tipos_trabajos tt 
	 	where tt.ttr_codigo in (12)
	 	
	 	--#################
	 	select t.inf_codigo, t.iac_codigo, ia.iac_codigo_control,tt.ttr_descripcion, ia.ttr_codigo ,iap.act_codigo, a.act_descripcion , i2.inf_nombre
	    FROM	ejecucion_actividades.inicio_actividad_informe t
	    left join ejecucion_actividades.inicios_actividades ia on ia.iac_codigo = t.iac_codigo
	    left join parametricas.tipos_trabajos tt on tt.ttr_codigo = ia.ttr_codigo 
	    left join ejecucion_actividades.inicio_actividad_poa iap on iap.iac_codigo = t.iac_codigo
	    left join estructura_poa.actividades a  on a.act_codigo = iap.act_codigo
	    left join ejecucion_actividades.informes i2 on i2.inf_codigo = t.inf_codigo
	    WHERE	t.inf_codigo in (17)--iac_codigo=249

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






