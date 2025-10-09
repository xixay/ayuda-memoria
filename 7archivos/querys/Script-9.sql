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
		and a.act_estado not in (2,7,9,0,13)
--		and a.act_estado not in (9)
--		and a.iac_codigo_apoyo is not null
--		and a.tipact_codigo in (2)
--		and a.cac_codigo in (1)
--		and po.pobj_codigo in (1145)
--		and p.poa_codigo in (3)
--		and a.act_ejecucion_conaud in (true)
--order by au.aun_estado asc;
order by a.act_codigo desc;
--
SELECT 	a.act_codigo, a.act_numero, a.act_estado, a.ent_codigo, CAST(a.act_horas_planificadas AS INTEGER) AS act_horas_planificadas,
		e.est_nombre, 
		au.aun_nombre, au.aun_sigla, au.aun_estado, 
		po.pobj_codigo, po.pobj_numero ,po.pobj_nombre,
		tt.ttr_descripcion,
		ett.ett_nombre, a.act_objeto
FROM 	estructura_poa.actividades a
		LEFT JOIN parametricas.estados e ON a.act_estado = e.est_codigo 
		LEFT JOIN estructura_poa.poas_objetivos po ON a.pobj_codigo = po.pobj_codigo
		LEFT JOIN pei.categorias_programaticas cpr ON po.cpr_codigo = cpr.cpr_codigo
		LEFT JOIN estructura_organizacional.areas_unidades au ON a.aun_codigo_ejecutora = au.aun_codigo
		LEFT JOIN parametricas.tipos_trabajos tt ON a.ttr_codigo = tt.ttr_codigo
		LEFT JOIN parametricas.especificacion_tipos_trabajo ett ON tt.ett_codigo = ett.ett_codigo
WHERE   TRUE 
		AND a.act_estado NOT IN (2,9,0,47)
		AND po.pobj_estado NOT IN (0)
;


SELECT 	po.pobj_codigo, po.pobj_estado, po.pobj_numero,
		oau.oau_codigo, oau.oau_estado, oau.aun_codigo_ejecutora,
		a.act_codigo, a.act_estado, a.act_numero, a.aun_codigo_ejecutora 
FROM 	estructura_poa.poas_objetivos po 
		LEFT JOIN estructura_poa.objetivos_area_unidad oau ON po.pobj_codigo = oau.pobj_codigo
		LEFT JOIN estructura_poa.actividades a ON po.pobj_codigo = a.pobj_codigo 
WHERE 	po.pobj_codigo IN (401)
;


