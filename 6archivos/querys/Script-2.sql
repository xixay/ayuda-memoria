select * from estructura_poa.poas p where p.poa_codigo in (2)

select * from estructura_poa.poas_objetivos po where po.aeg_codigo in (926)
select po.pobj_codigo ,po.pobj_indicador ,po.pro_codigo , po. tin_codigo ,po.tacp_codigo ,po.cpr_codigo ,po.aeg_codigo  from estructura_poa.poas_objetivos po where po.aeg_codigo in (926)

select * from estructura_poa.objetivos_area_unidad oau where oau.pobj_codigo in (725)
select * from estructura_poa.objetivos_area_unidad oau where oau.pobj_codigo in (730)