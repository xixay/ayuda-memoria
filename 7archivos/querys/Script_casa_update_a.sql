--### ACCIONES A CORTO PLAZO
  	--area Unidad ejecutora
	select * from estructura_organizacional.areas_unidades au where au.aun_codigo in (22)--aun_numero=1401
	--area Unidad supervisora
	select * from estructura_organizacional.areas_unidades au where au.aun_codigo in (3)--aun_numero=0002
	--poa objetivo
	select * from estructura_poa.poas_objetivos po where po.pobj_codigo in (726)--pobj_numero=245
	--puede haber VARIOS objetivos area unidad por poa_objetivos
	select * from estructura_poa.objetivos_area_unidad oau where oau.pobj_codigo in (726)
	--actividades areas ejecutoras
	select * from estructura_poa.actividades_areas_ejecutoras aae 
	select * from pei.programas p where p.pro_codigo in (3)--pro_numero 520
	select * from estructura_organizacional.autoridades_funcionales af where af.aun_codigo_supervisado in (22)--aun_codigo_supervisor=3
	select * from estructura_poa.dependencia_accion_corto_plazo dacp where dacp.pobj_codigo_accion in (1)
	select * from estructura_poa.dependencia_accion_corto_plazo dacp where dacp.pobj_codigo_operacion in (1)
;
--### CAMBIOS ESTADOS
  	--poa
	select * from estructura_poa.poas p where p.poa_codigo in (1)
	--poas-objetivos
	select *from estructura_poa.poas_objetivos po where po.poa_codigo in (1) 
	--obje area unidad
	select * from estructura_poa.objetivos_area_unidad oau where oau.pobj_codigo in (641)
	--act
	select * from estructura_poa.actividades a where a.pobj_codigo in (641) and a.act_estado in (1,3,4)
	--formulario
	select * from estructura_poa.formularios f where f.for_codigo in (46)
	--for obj
	select * from estructura_poa.formularios_objetivos fo where fo.for_codigo in (46)
	select * from estructura_poa.formularios_objetivos fo where fo.fob_codigo in (486)

	select * from parametricas.tablas t
	select * from control_estados.flujos_tablas ft where ft.tab_codigo in (33)
	select * from control_estados.flujos_tablas ft where ft.tab_codigo in (32)
	select * from control_estados.flujos_tablas ft where ft.tab_codigo in (1)
;













