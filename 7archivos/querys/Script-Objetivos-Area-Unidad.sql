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
	--################################################################################################
	-- ACTIV
	select a.act_codigo, a.act_estado, a.pobj_codigo, a.cac_codigo, a.aun_codigo_ejecutora,a.act_justificacion from estructura_poa.actividades a where a.pobj_codigo in (109)
	select * from estructura_poa.actividades a where a.pobj_codigo in (109)
	--select * from estructura_poa.actividades a where a.pobj_codigo in (109)
	-- ACTI ESTAD
--	select * from control_estados.estados_actividades ea where ea.act_codigo in (1362) order by fecha_registro desc
	-- VIATICOS
	select * from estructura_poa.actividades_viaticos av where av.act_codigo in (19)
	-- POA OBJE
	select *  from estructura_poa.poas_objetivos po where po.pobj_codigo in (109)
	select po.pobj_codigo, po.poa_codigo, po.pobj_estado  from estructura_poa.poas_objetivos po where po.pobj_codigo in (109)
	select * from estructura_poa.poas_objetivos po where po.poa_codigo in (2)
	-- POA OBJ ESTADO
	select * from control_estados.estados_poas_objetivos epo where epo.pobj_codigo in (109) order by fecha_registro desc
	-- OBJE AREA UNIDAD
	--select *  from estructura_poa.objetivos_area_unidad oau where oau.pobj_codigo in (109)
	-- OBJETIVO AREA UNIDAD
	select oau.oau_codigo,oau.pobj_codigo,oau.oau_estado  from estructura_poa.objetivos_area_unidad oau where oau.pobj_codigo in (641)
	--POAS
	select * from estructura_poa.poas p2 where p2.poa_codigo in (2)
	--
	SELECT	t.tab_nombre, ft.est_codigo_origen, eo.est_nombre, ft.est_codigo_destino, ed.est_nombre
	FROM	control_estados.flujos_tablas ft
			LEFT JOIN parametricas.tablas t ON ft.tab_codigo = t.tab_codigo
			LEFT JOIN parametricas.estados eo ON ft.est_codigo_origen = eo.est_codigo
			LEFT JOIN parametricas.estados ed ON ft.est_codigo_destino = ed.est_codigo
	WHERE	ft.tab_codigo IN (SELECT t.tab_codigo FROM parametricas.tablas t WHERE t.tab_nombre IN (
				--'Poas', 
				--'PoasObjetivos'--,
				'Actividades'--, 
				--'ActividadesViaticos'
			))
	ORDER BY ft.tab_codigo ASC, ft.est_codigo_origen ASC, ft.est_codigo_destino asc
	
	--SELECT	po.poa_codigo,p.poa_estado ,po.pobj_codigo , po.pobj_estado, a.act_codigo ,a.cac_codigo,a.act_estado,a.aun_codigo_ejecutora 
	SELECT	po.pobj_codigo, po.pobj_nombre, po.pobj_numero ,p.poa_estado, a.act_codigo ,a.cac_codigo,a.act_estado,a.aun_codigo_ejecutora
	FROM	estructura_poa.poas p
			LEFT JOIN estructura_poa.poas_objetivos po on po.poa_codigo = p.poa_codigo
			LEFT JOIN estructura_poa.actividades a on a.pobj_codigo = po.pobj_codigo
	WHERE	a.aun_codigo_ejecutora IN (1) and p.poa_codigo  in (2)
	ORDER BY po.pobj_codigo DESC 
;


-- 1 --
select	po.pobj_codigo, po.pobj_nombre, po.pobj_numero,
		oau.aun_codigo_ejecutora, oau.aun_codigo_supervisora
from	estructura_poa.poas p
		left join estructura_poa.poas_objetivos po on p.poa_codigo = po.poa_codigo and po.pobj_estado in (2,8)
		left join estructura_poa.objetivos_area_unidad oau on po.pobj_codigo = oau.pobj_codigo and oau.oau_estado != 0
where	true
		and p.poa_codigo in (2)
		and oau.aun_codigo_ejecutora in (44)
--activi
select a.act_codigo,a.act_estado ,a.pobj_codigo,a.cac_codigo ,a.aun_codigo_ejecutora  
from 	estructura_poa.actividades a
where 	a.act_codigo in (1380,1396,1398,1399,1400,1401,1402,1403,1404,1406,1407,1376)--pobjcodigo=607,606,605,579,32,cac_codigo=2,aun_ejecutora=44
--viatico
select av2.avi_codigo,av2.act_codigo ,  av2.avi_estado
from 	estructura_poa.actividades_viaticos av2 
where 	av2.act_codigo in (1380,1396,1398,1399,1400,1401,1402,1403,1404,1406,1407,1376)
;
-- 2 --
select	*
from	estructura_poa.actividades a
where	true
		and a.act_estado != 0
		and a.pobj_codigo in (605)
		and a.aun_codigo_ejecutora in (44)
		and a.cac_codigo in (2)
--activi
select a.act_codigo,a.act_estado ,a.pobj_codigo,a.cac_codigo ,a.aun_codigo_ejecutora  
from 	estructura_poa.actividades a
where 	a.act_codigo in (1407,1406)--pobjcodigo=605,cac_codigo=2,aun_ejecutora=44

select *  
from 	estructura_poa.actividades a
where 	a.act_descripcion  in ('asdc')--pobjcodigo=605,cac_codigo=2,aun_ejecutora=44
select * from control_estados.estados_actividades ea where ea.act_codigo in (1380) order by fecha_registro desc
select 
--viatico
select av2.avi_codigo,av2.act_codigo ,  av2.avi_estado
from 	estructura_poa.actividades_viaticos av2 
where 	av2.act_codigo in (1407,1406)--avi_codigo=(298,299)
-- 3 --
--activi
select 	a.act_codigo,a.act_estado ,a.pobj_codigo,a.cac_codigo ,a.aun_codigo_ejecutora  ,a.fecha_modificacion
from	estructura_poa.actividades a
where 	a.act_codigo in (1323)--1405
order by	a.fecha_modificacion desc
--est activ
select 	*
from 	control_estados.estados_actividades ea 
where 	ea.act_codigo in (1323) --1405
order by 	fecha_registro desc
--viatico
select av2.avi_codigo,av2.act_codigo ,av2.avi_estado
from 	estructura_poa.actividades_viaticos av2 
where 	av2.act_codigo in (1323)--1405
--est viat
select 	*
from 	control_estados.estados_actividades_viaticos eav 
where 	eav.avi_codigo  in (294)--294 
order by	fecha_registro desc
------
SELECT
a.act_estado, av.avi_estado, COALESCE(COUNT(DISTINCT a.act_codigo), 0) AS cantidad_actividades,
COALESCE(COUNT(DISTINCT av.avi_codigo), 0) AS cantidad_viaticos
FROM estructura_poa.poas_objetivos po
LEFT JOIN estructura_poa.objetivos_area_unidad oau ON po.pobj_codigo = oau.pobj_codigo
LEFT JOIN estructura_poa.actividades a ON po.pobj_codigo = a.pobj_codigo AND a.act_estado IN (4,10,14,11,12,13,1,3,8,7,2,5)
LEFT JOIN estructura_poa.actividades_viaticos av ON a.act_codigo = av.act_codigo AND av.avi_estado IN (4,10,14,11,12,13,1,3,8,7,2,5)
WHERE TRUE
AND oau.oau_estado != 0
AND po.poa_codigo IN (2)
AND po.pobj_estado IN (2, 8)
AND oau.aun_codigo_ejecutora IN (57)
AND a.aun_codigo_ejecutora IN (57)
AND a.cac_codigo IN (2,4)
GROUP BY a.act_estado, av.avi_estado
ORDER BY
array_position( array[4,10,14,11,12,13,1,3,8,7,2,5], av.avi_estado),
array_position( array[4,10,14,11,12,13,1,3,8,7,2,5], a.act_estado);
SELECT	t.tab_nombre, ft.est_codigo_origen, eo.est_nombre, ft.est_codigo_destino, ed.est_nombre
        FROM	control_estados.flujos_tablas ft
            LEFT JOIN parametricas.tablas t ON ft.tab_codigo = t.tab_codigo
            LEFT JOIN parametricas.estados eo ON ft.est_codigo_origen = eo.est_codigo
            LEFT JOIN parametricas.estados ed ON ft.est_codigo_destino = ed.est_codigo
        WHERE	ft.tab_codigo IN (SELECT t.tab_codigo FROM parametricas.tablas t WHERE t.tab_nombre IN (
              'Actividades'--,
            ))
        ORDER BY ft.tab_codigo ASC, ft.est_codigo_origen ASC, ft.est_codigo_destino ASC

select * from estructura_poa.actividades a 