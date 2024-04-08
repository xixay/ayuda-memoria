--### ACCIONES A CORTO PLAZO
  	--area Unidad ejecutora
	select * from estructura_organizacional.areas_unidades au where au.aun_codigo in (63)--aun_numero=1201
	--area Unidad supervisora
	select * from estructura_organizacional.areas_unidades au where au.aun_codigo in (4)--aun_numero=0003
	--poa objetivo
	select * from estructura_poa.poas_objetivos po where po.pobj_codigo in (726)--pobj_numero=245
	--puede haber VARIOS objetivos area unidad por poa_objetivos
	select * from estructura_poa.objetivos_area_unidad oau where oau.pobj_codigo in (726)
	--actividades areas ejecutoras
	select * from estructura_poa.actividades_areas_ejecutoras aae 
	select * from pei.programas p where p.pro_codigo in (3)--pro_numero 520
	select * from estructura_organizacional.autoridades_funcionales af where af.aun_codigo_supervisado in (45)--aun_codigo_supervisor=3
	select * from estructura_poa.dependencia_accion_corto_plazo dacp where dacp.pobj_codigo_accion in (1)
	select * from estructura_poa.dependencia_accion_corto_plazo dacp where dacp.pobj_codigo_operacion in (1)
;