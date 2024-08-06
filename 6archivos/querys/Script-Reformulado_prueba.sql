--ACTIVIDADES
select 	a.act_codigo , a.act_ejecucion_conaud, a.act_codigo_anterior ,a.act_numero ,a.cac_codigo ,a.iac_codigo_apoyo, a.act_estado, a.act_descripcion , a.aun_codigo_ejecutora, a.tipact_codigo, a.fecha_registro, a.ttr_codigo, 
		ett.ett_codigo, ett.ett_nombre, 
		au.aun_nombre, au.aun_sigla, au.aun_estado,
		po.pobj_codigo ,po.pobj_nombre, po.pobj_estado,
		p.poa_codigo
--		oau.oau_codigo, oau.oau_descripcion ,oau.oau_estado 
from 	estructura_poa.actividades a
		left join parametricas.tipos_trabajos tt on a.ttr_codigo = tt.ttr_codigo
		left join parametricas.especificacion_tipos_trabajo ett on tt.ett_codigo = ett.ett_codigo 
		left join estructura_organizacional.areas_unidades au on a.aun_codigo_ejecutora = au.aun_codigo 
		left join estructura_poa.poas_objetivos po on a.pobj_codigo = po.pobj_codigo 
		left join estructura_poa.poas p on p.poa_codigo = po.poa_codigo
--		left join estructura_poa.objetivos_area_unidad oau on po.pobj_codigo = oau.pobj_codigo 
where	true 	
--		and a.act_numero = '510.1202.17.14.24'
--		and a.act_codigo in (14)
--		and a.act_codigo_anterior in (613,609,592,585,580,478,396,219,217,198)
--		and a.act_codigo_anterior in (396,219,217)
--		and au.aun_sigla like 'GDB-GAM'
--		and a.act_estado not in (2,7,9,0,13)
--		and a.act_estado not in (9)
		and a.act_estado in (47)
--		and a.iac_codigo_apoyo is not null
--		and a.tipact_codigo in (2)
--		and a.cac_codigo in (1)
--		and po.pobj_codigo in (1145)
		and p.poa_codigo in (3)
--		and a.act_ejecucion_conaud in (true)
--order by au.aun_estado asc;
order by a.act_estado desc;
--VIATICOS
select 	av.avi_codigo ,av.act_codigo, av.avi_estado, av.fecha_registro ,
		au.aun_sigla, a.pobj_codigo, p.poa_codigo  
from 	estructura_poa.actividades_viaticos av
		left join estructura_poa.actividades a on av.act_codigo = a.act_codigo
		left join estructura_poa.poas_objetivos po on a.pobj_codigo = po.pobj_codigo 
		left join estructura_poa.poas p on po.poa_codigo = p.poa_codigo 
		left join estructura_organizacional.areas_unidades au on a.aun_codigo_ejecutora = au.aun_codigo
where 	true 
		and av.avi_estado in (1)
		and p.poa_codigo in (3)
--		and av.act_codigo in (1663)
order by av.avi_estado desc;
--POAS
SELECT 	p.poa_codigo, p.poa_estado
FROM 	estructura_poa.poas p 
WHERE 	TRUE 
--		AND p.poa_estado IN (2)
		AND p.poa_codigo IN (3)
;
--POA OBJETIVOS
SELECT 	p.poa_codigo, p.poa_estado,
		po.pobj_codigo, po.pobj_estado 
FROM 	estructura_poa.poas p 
		LEFT JOIN	estructura_poa.poas_objetivos po ON p.poa_codigo = po.poa_codigo
WHERE	TRUE 
		AND p.poa_codigo IN (3)
		AND po.pobj_estado IN (8)
ORDER BY po.pobj_estado DESC
;
--OBJETIVOS AREA UNIDAD
SELECT 	oau.oau_codigo, oau.oau_estado, oau.pobj_codigo, oau.aun_codigo_ejecutora,
		po.pobj_codigo, po.pobj_estado,
		p.poa_codigo, p.poa_estado
FROM 	estructura_poa.poas p
		LEFT JOIN   estructura_poa.poas_objetivos po ON p.poa_codigo = po.poa_codigo
		LEFT JOIN	estructura_poa.objetivos_area_unidad oau ON po.pobj_codigo = oau.pobj_codigo
WHERE 	TRUE 
		AND p.poa_codigo IN (3)
		AND oau.oau_estado IN (8)
--ORDER BY oau.oau_estado DESC 
;





