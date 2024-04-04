--### INFORME RECOMENDACIONES
	select * from ejecucion_actividades.informe_recomendaciones ir where ir.ire_estado in (1) order by ir.fecha_registro desc
	select * from ejecucion_actividades.informe_recomendaciones_seguimientos irs where irs.irs_estado in (1) and irs.ire_codigo in (1) order by irs.fecha_registro desc 
	select * from parametricas.estados_informe_recomendaciones eir
	select *
    FROM	ejecucion_actividades.inicio_actividad_informe t
    WHERE	t.iac_codigo in (93)--inf_codigo=17
	select * from ejecucion_actividades.informes i where i.inf_codigo in (19)
	select * from ejecucion_actividades.recomendaciones_inicios_seguimientos ris where ris.iac_codigo in (93)
	-- tiene tabla migrada
	select * from ejecucion_actividades.inicios_actividades ia where ia.iac_codigo in (93)
	select * from ejecucion_actividades.inicio_actividad_informe iai where iai.iac_codigo in (93)--inf_codigo=19
	select * from ejecucion_actividades.inicio_actividad_poa iap where iap.act_codigo in (492)
	SELECT 
      t.ris_codigo,
      t.iac_codigo,
      t.ire_codigo,
      ia.iac_correlativo,
      ia.iac_codigo_control,
      ia.iac_objeto,
      ia.iac_objetivo,
      ia.iac_alcance,
      ia.iac_observaciones,
      ir.ire_descripcion,
      ir.inf_codigo,
      irs.irs_aceptacion,
      irs.irs_justificacion,
      irs.irs_fecha_inicio,
      irs.irs_fecha_fin,
      eir.eir_codigo,
      eir.eir_nombre,
      t.ris_estado,
      e.est_color, 
      e.est_nombre AS ris_estado_descripcion,
      TO_CHAR(t.fecha_registro, 'HH24:MI am dd/mm/yyyy') as fecha_registro  
    FROM ejecucion_actividades.recomendaciones_inicios_seguimientos t
    LEFT JOIN ejecucion_actividades.inicios_actividades ia ON ia.iac_codigo = t.iac_codigo
    LEFT JOIN ejecucion_actividades.informe_recomendaciones ir ON ir.ire_codigo = t.ire_codigo
    LEFT JOIN ejecucion_actividades.informe_recomendaciones_seguimientos irs ON irs.ire_codigo = ir.ire_codigo
    LEFT JOIN parametricas.estados_informe_recomendaciones eir ON eir.eir_codigo = irs.eir_codigo
    LEFT JOIN parametricas.estados e ON e.est_codigo = t.ris_estado
    where t.iac_codigo in (93)
;
--###  NICIO ACT POA - AMPLIACION JUSTIFICACION - CAMBIO GLOBAL DE ESTADOS, POR ROL
	select * from estructura_poa.actividades a where a.act_codigo in (968)
 	select * from parametricas.tipos_trabajos tt where tt.ttr_codigo in (12)
;
---### migrada existe
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
;
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
;
--### OBTENER DATOS EN BASE, YA NO MIGRADO
 	select *
    FROM	ejecucion_actividades.inicio_actividad_informe t
    WHERE	t.iac_codigo in (93)--inf_codigo=19
   	select *
    FROM	ejecucion_actividades.inicios_actividades t
    WHERE	t.iac_codigo in (93)--iac_codigo_control=GOEP19F23
 	select *
    FROM	ejecucion_actividades.inicio_actividad_poa t
    WHERE	t.iac_codigo in (93)--act_codigo=492
 	select a.act_descripcion 
 	from estructura_poa.actividades a 
 	where a.act_codigo in (492)--act_descripcion=GOBIERNO AUTÓNOMO DEPARTAMENTAL DE ORURO
 	select * 
 	from ejecucion_actividades.informes i 
 	where i.inf_codigo in (19)--inf_nombre
 	select *
 	from parametricas.tipos_trabajos tt 
 	where tt.ttr_codigo in (12)
 	select ie.eev_codigo  
 	from ejecucion_actividades.informes_estados ie  
 	where ie.inf_codigo in (19)--no hay nada
 	order by ie.fecha_registro desc
 	limit 1
 	select ee.eev_sigla 
 	from parametricas.estados_evolucion ee 
 	where ee.eev_codigo in (38)
 	SELECT * 
 	FROM ejecucion_actividades.informe_recomendaciones ir
 	where ir.inf_codigo in (19)
 	SELECT COUNT(*) as nrecom 
 	FROM ejecucion_actividades.informe_recomendaciones ir
 	where ir.ire_estado in (1) AND ir.inf_codigo in (19)
 	--#################
 	select t.inf_codigo, t.iac_codigo,ia.iac_fecha_inicio, ia.iac_fecha_fin, ia.iac_dias_habiles, ia.iac_dias_calendario, g.ges_anio, ia.iac_codigo_control, tt.ttr_sigla, tt.ttr_descripcion, ia.ttr_codigo , iap.act_codigo, a.act_numero , a.act_descripcion , i2.inf_codigo_control , i2.inf_nombre, ee.eev_sigla
    FROM	ejecucion_actividades.inicio_actividad_informe t
    left join ejecucion_actividades.inicios_actividades ia on ia.iac_codigo = t.iac_codigo
    left join parametricas.tipos_trabajos tt on tt.ttr_codigo = ia.ttr_codigo
    left join parametricas.gestiones g on g.ges_codigo = ia.ges_codigo
    left join ejecucion_actividades.inicio_actividad_poa iap on iap.iac_codigo = t.iac_codigo
    left join estructura_poa.actividades a  on a.act_codigo = iap.act_codigo
    left join ejecucion_actividades.informes i2 on i2.inf_codigo = t.inf_codigo
    left join ejecucion_actividades.informes_estados ie on ie.inf_codigo = t.inf_codigo
    left join parametricas.estados_evolucion ee on ee.eev_codigo = ie.eev_codigo
    WHERE	t.iac_codigo in (93)--iac_codigo=141
 	order by ie.fecha_registro desc
 	limit 1
	;
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
--###  
select *
from ejecucion_poa.asignaciones_cargos_item aci
where aci.asi_codigo = 32
	and aci.aci_estado != 0
--	and aci.aci_estado in (1,2)
;
--###
  	--"Gerencia Departamental de Auditoría en Gobiernos Municipales y Universidades - GDC-GAM1"
	select * from estructura_poa.area_unidad_responsables aur where aur.poa_codigo in (2) and aun_codigo_ejecutora in (19) order by fecha_registro desc
	--"Gerencia Departamental de Auditoría en Gobiernos Municipales y Universidades - GDC-GAM2"
	select * from estructura_poa.area_unidad_responsables aur where aur.poa_codigo in (2) and aun_codigo_ejecutora in (20) order by fecha_registro desc
	--Formulador
	select * from parametricas.roles r where r.rol_codigo in (1)
	where aur.poa_codigo in (2) and aun_codigo_ejecutora in (20) and aur.aun_codigo_rol in (20) order by fecha_registro desc--rol_codigo=(form,form ge)
	select * from estructura_poa.area_unidad_responsables aur where aur.aur_codigo in (402)--nuevo rol
	--Aprobador
	select * from parametricas.roles r where r.rol_codigo in (2)
	where aur.poa_codigo in (2) and aun_codigo_ejecutora in (20) and aur.aun_codigo_rol in (17) order by fecha_registro desc--rol_codigo=(aproba)
	select * from estructura_poa.area_unidad_responsables aur where aur.aur_codigo in (403)--nuevo rol
	--Supervisor
	select * from estructura_poa.area_unidad_responsables aur
	where aur.aur_estado in (1) and aur.poa_codigo in (2) and aur.rol_codigo in (3) and aur.aun_codigo_rol in (20)--no encontro
	select * from parametricas.roles r where r.rol_codigo in (3)
	select * from estructura_poa.area_unidad_responsables aur
	where aur.poa_codigo in (2) and aun_codigo_ejecutora in (20) and aur.aun_codigo_rol in (17) order by fecha_registro desc--rol_codigo=(aproba)
	select * from estructura_poa.area_unidad_responsables aur where aur.aur_codigo in (402)--nuevo rol
	
	select * from estructura_poa.area_unidad_responsables aur where aur.aur_codigo in (346)--nuevo rol
;












