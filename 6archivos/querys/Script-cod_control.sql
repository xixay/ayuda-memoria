--ACTIVIDAD
select	a.act_codigo, 
		--a.act_numero, 
		a.tipact_codigo,a.act_objeto,a.ttr_codigo,  --actividad
		ac.conaud_detalle, ac.conaud_codigo, ac.conaud_correlativo,--al que se le va ser continuidad
		ia.iac_codigo, ia.iac_codigo_control, ia.iac_codigo_control_vista,--inicio actividad q se crea
		iap2.iap_codigo,--
		iap.iap_codigo, ia2.iac_codigo,iap.iap_estado ,ia2.iac_estado, --inicio actividad no creado haun ???
		aa.aap_codigo, aa.aap_descripcion , aa.act_codigo ,aa.act_codigo_apoyo
from	estructura_poa.actividades a
		left join estructura_poa.actividades_continuidad ac on a.act_codigo = ac.act_codigo
		left join ejecucion_actividades.inicios_actividades ia on ac.iac_codigo = ia.iac_codigo
		left join ejecucion_actividades.inicio_actividad_poa iap2 on ac.iac_codigo = iap2.iac_codigo
		left join ejecucion_actividades.inicio_actividad_poa iap on a.act_codigo = iap.act_codigo
		left join ejecucion_actividades.inicios_actividades ia2 on iap.iac_codigo = ia2.iac_codigo
		left join estructura_poa.actividades_apoyo aa on a.act_codigo = aa.act_codigo 
order by a.act_codigo desc
limit 10
;
select * from estructura_poa.actividades a where a.act_codigo = 1385;
select * from estructura_poa.actividades_apoyo aa where aa.aap_codigo in (2);

select *
from ejecucion_actividades.inicios_actividades ia
--where ia.iac_codigo = 310
order by ia.iac_codigo desc
;


