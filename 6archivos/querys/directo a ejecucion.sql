--TIPOS DE TRABAJO
select	*
from 	parametricas.tipos_trabajos tt ;
--ESPECIFICACION TIPOS DE TRABAJO
select 	*
from 	parametricas.especificacion_tipos_trabajo ett;
-- ACTIVIDADES
--select 	*
--select 	a.act_codigo ,a.act_numero ,a.act_descripcion ,a.act_fecha_inicio ,a.act_fecha_fin ,a.act_objeto ,a.ttr_codigo ,a.tipact_codigo,a.cac_codigo 
select 	a.act_codigo ,a.act_numero ,a.cac_codigo ,a.iac_codigo_apoyo, a.act_estado, a.act_descripcion , a.aun_codigo_ejecutora, a.tipact_codigo, a.fecha_registro, 
		au.aun_nombre, au.aun_sigla, au.aun_estado,
		po.pobj_codigo ,po.pobj_nombre, po.pobj_estado,
		p.poa_codigo 
from 	estructura_poa.actividades a 
		left join estructura_organizacional.areas_unidades au on a.aun_codigo_ejecutora = au.aun_codigo 
		left join estructura_poa.poas_objetivos po on a.pobj_codigo = po.pobj_codigo 
		left join estructura_poa.poas p on p.poa_codigo = po.poa_codigo 
where	true 	
--		and a.act_numero = '530.0022.15.1.24'
--		and a.act_codigo in (1121)
--		and au.aun_sigla like 'GPA-GA3'
--		and a.act_estado not in (2,9,0,13)
--		and a.act_estado in (1)
--		and a.iac_codigo_apoyo is not null
--		and a.tipact_codigo in (2)
--		and a.cac_codigo in (2)
--		and po.pobj_codigo in (1181)
		and p.poa_codigo in (2)
order by au.aun_codigo desc;
--FLUJOS TABLAS SERVICES
select 	*
from 	control_estados.flujos_tablas ft
where 	true 
		and ft.tab_codigo in (64)
order by ft.fta_codigo asc;
--INFORMES UAI
--select 	tt.*
select 	iu.iua_codigo, iu.iua_estado, iu.iua_correlativo, iu.iua_codigo_control, iu.ent_codigo,iu.ttr_codigo,
		ie.iev_codigo, ie.iev_estado,
		a.act_codigo, a.act_numero,
		au.aun_nombre, au.aun_sigla,
		tt.ttr_codigo, tt.ttr_sigla,
		ett.ett_codigo, ett.ett_nombre
from 	ejecucion_informes.informes_uai iu
		left join ejecucion_informes.informes_evaluaciones ie on iu.iua_codigo = ie.iua_codigo 
		left join parametricas.tipos_trabajos tt on iu.ttr_codigo = tt.ttr_codigo
		left join parametricas.especificacion_tipos_trabajo ett on ett.ett_codigo = tt.ett_codigo 
		left join estructura_poa.actividades a on iu.act_codigo = a.act_codigo
		left join estructura_organizacional.areas_unidades au on a.aun_codigo_ejecutora = au.aun_codigo 
where 	true
		and au.aun_sigla = 'GDT-GAM1'
--		and iu.iua_codigo in (1)
order by iu.iua_codigo desc;
--INFORMES EVALUACIONES
select 	*
from 	ejecucion_informes.informes_evaluaciones ie
where 	true 
		and ie.iev_codigo in (1)
order by ie.iev_codigo desc;




























