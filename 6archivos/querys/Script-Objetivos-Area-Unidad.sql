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
	select * from estructura_poa.poas p where p.poa_codigo in (2)
	--poas-objetivos
	select *from estructura_poa.poas_objetivos po where po.poa_codigo in (1) 
	--obje area unidad
	select * from estructura_poa.objetivos_area_unidad oau where oau.pobj_codigo in (641)
	--formulario
	select * from estructura_poa.formularios f where f.for_codigo in (46)
	--for obj
	select * from estructura_poa.formularios_objetivos fo where fo.for_codigo in (46)
	select * from estructura_poa.formularios_objetivos fo where fo.fob_codigo in (486)
	select * from pei.programas p2 
	--act
	select * from estructura_poa.actividades a where a.act_numero in ('500.1302.54.1.24','500.1302.54.2.24')
	select * from estructura_poa.actividades a where a.fob_codigo in (486) and a.act_estado in (1,3,4)
	select * from parametricas.tablas t
	select * from control_estados.flujos_tablas ft where ft.tab_codigo in (33)
	select * from control_estados.flujos_tablas ft where ft.tab_codigo in (32)
	select * from control_estados.flujos_tablas ft where ft.tab_codigo in (1)
	select * from estructura_poa.actividades a where a.act_codigo in (1323)
	select * from control_estados.estados_actividades ea
	-- ACTIV
	select a.act_codigo, a.act_estado, a.pobj_codigo, a.cac_codigo, a.act_justificacion from estructura_poa.actividades a where a.pobj_codigo in (641)
	-- ACTI ESTAD
	select * from control_estados.estados_actividades ea where ea.act_codigo in (1362) order by fecha_registro desc
	select * from estructura_poa.actividades_viaticos av where av.act_codigo in (1359)
	-- POA OBJE
	select po.pobj_codigo, po.poa_codigo, po.pobj_estado  from estructura_poa.poas_objetivos po where po.pobj_codigo in (641)
	-- POA OBJ ESTADO
	select * from control_estados.estados_poas_objetivos epo where epo.pobj_codigo in (641) order by fecha_registro desc
	--
	-- ACTIV
	select a.act_codigo, a.act_estado, a.pobj_codigo, a.cac_codigo, a.act_justificacion from estructura_poa.actividades a where a.pobj_codigo in (109)
	--select * from estructura_poa.actividades a where a.pobj_codigo in (109)
	-- ACTI ESTAD
--	select * from control_estados.estados_actividades ea where ea.act_codigo in (1362) order by fecha_registro desc
	select av.avi_codigo, av.act_codigo ,av.avi_estado from estructura_poa.actividades_viaticos av where av.act_codigo in (19)
	-- POA OBJE
	select po.pobj_codigo, po.poa_codigo, po.pobj_estado  from estructura_poa.poas_objetivos po where po.pobj_codigo in (109)
	-- POA OBJ ESTADO
	select * from control_estados.estados_poas_objetivos epo where epo.pobj_codigo in (641) order by fecha_registro desc
	-- OBJETIVO AREA UNIDAD
	select oau.oau_codigo,oau.pobj_codigo,oau.oau_estado  from estructura_poa.objetivos_area_unidad oau where oau.pobj_codigo in (641)
	SELECT	t.tab_nombre, ft.est_codigo_origen, eo.est_nombre, ft.est_codigo_destino, ed.est_nombre
	FROM	control_estados.flujos_tablas ft
			LEFT JOIN parametricas.tablas t ON ft.tab_codigo = t.tab_codigo
			LEFT JOIN parametricas.estados eo ON ft.est_codigo_origen = eo.est_codigo
			LEFT JOIN parametricas.estados ed ON ft.est_codigo_destino = ed.est_codigo
	WHERE	ft.tab_codigo IN (SELECT t.tab_codigo FROM parametricas.tablas t WHERE t.tab_nombre IN (
				--'Poas', 'PoasObjetivos',
				'Actividades'--, 'ActividadesViaticos'
			))
	ORDER BY ft.tab_codigo ASC, ft.est_codigo_origen ASC, ft.est_codigo_destino ASC
	--
	SELECT	t.tab_nombre, ft.est_codigo_origen, eo.est_nombre, ft.est_codigo_destino, ed.est_nombre
	FROM	control_estados.flujos_tablas ft
			LEFT JOIN parametricas.tablas t ON ft.tab_codigo = t.tab_codigo
			LEFT JOIN parametricas.estados eo ON ft.est_codigo_origen = eo.est_codigo
			LEFT JOIN parametricas.estados ed ON ft.est_codigo_destino = ed.est_codigo
	WHERE	ft.tab_codigo IN (SELECT t.tab_codigo FROM parametricas.tablas t WHERE t.tab_nombre IN (
				--'Poas', 
				'PoasObjetivos'--,
				--'Actividades'--, 
				--'ActividadesViaticos'
			))
	ORDER BY ft.tab_codigo ASC, ft.est_codigo_origen ASC, ft.est_codigo_destino ASC
;







