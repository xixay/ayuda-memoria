--###  --- INFORME RECOMENDACIONES
	select *from ejecucion_actividades.informe_recomendaciones ir where ir.ire_estado in (1) order by ir.fecha_registro desc
	select *from ejecucion_actividades.informe_recomendaciones_seguimientos irs where irs.irs_estado in (1) order by irs.fecha_registro desc 
	select *from parametricas.estados_informe_recomendaciones eir
	select * from ejecucion_actividades.informes i where i.inf_codigo in (17)
	select * from ejecucion_actividades.recomendaciones_inicios_seguimientos
	;