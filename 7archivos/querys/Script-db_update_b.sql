--ACTIVIDAD
select	a.act_codigo, a.act_numero, a.tipact_codigo,a.act_objeto,a.ttr_codigo,  --ACTIVIDAD
		ac.conaud_detalle, ac.conaud_codigo, ac.conaud_correlativo,--ACTIVIDADES CONTINUIDAD al que se le va ser continuidad
		ia.iac_codigo, ia.iac_codigo_control, ia.iac_codigo_control_vista,--INICIO ACTIVIDAD q se crea
		iap2.iap_codigo,iap.iap_codigo, ia2.iac_codigo,iap.iap_estado ,ia2.iac_estado,iap2.fecha_registro, --INICIO ACTIVIDAD POA no creado haun ???
		aa.aap_codigo, aa.aap_descripcion ,aa.act_codigo_apoyo
from	estructura_poa.actividades a
		left join estructura_poa.actividades_continuidad ac on a.act_codigo = ac.act_codigo
		left join ejecucion_actividades.inicios_actividades ia on ac.iac_codigo = ia.iac_codigo
		left join ejecucion_actividades.inicio_actividad_poa iap2 on ac.iac_codigo = iap2.iac_codigo
		left join ejecucion_actividades.inicio_actividad_poa iap on a.act_codigo = iap.act_codigo
		left join ejecucion_actividades.inicios_actividades ia2 on iap.iac_codigo = ia2.iac_codigo
		left join estructura_poa.actividades_apoyo aa on a.act_codigo = aa.act_codigo 
--where   iap.iap_codigo in (193)--act_codigo 246
order by iap.act_codigo desc
--limit 7
;
--poa
select * from estructura_poa.poas p where p.poa_estado !=2;
--_pobj =2
select * from estructura_poa.poas_objetivos po where po.poa_codigo =2 and po.pobj_estado !=2;
--obj_area_unidad
select 	*  
--select 	oau.oau_codigo ,oau.oau_estado ,po.pobj_codigo ,po.pobj_estado  
from 	estructura_poa.objetivos_area_unidad oau
		left join estructura_poa.poas_objetivos po on oau.pobj_codigo =oau.pobj_codigo 
where 	oau.oau_estado !=2 and po.poa_codigo in (2) and po.pobj_estado !=2;
----
select 	oau.oau_codigo ,oau.pobj_codigo ,oau.oau_estado  
from 	estructura_poa.objetivos_area_unidad oau 
where 	oau.oau_estado !=0;
--act
select * from estructura_poa.actividades a where a.act_estado !=2 and a.act_estado !=0;
--viatico
select * from estructura_poa.actividades_viaticos av where av.avi_estado !=2 and av.avi_estado !=0;
--######################################
--inicio act poa
select 	iap.iap_codigo ,iap.act_codigo ,iap.iap_estado 
from 	ejecucion_actividades.inicio_actividad_poa iap
where 	iap.act_codigo in (335) and iap.iap_estado in (22);
--inf uai
select  iu.iua_codigo ,iu.act_codigo , iu.iua_estado
from 	ejecucion_informes.informes_uai iu 
where 	iu.act_codigo in (437) and 
		iu.iua_estado in (22)
limit 1	;
--inicios_adminidstrativas
select  ia.iad_codigo ,ia.act_codigo , ia.iad_estado
from 	ejecucion_administrativas.inicios_administrativas ia  
where 	ia.act_codigo in (437) and 
		ia.iad_estado in (22);
