-- GENERAL
select 	*  
from 	ejecucion_actividades.inicio_actividad_poa iap
left join 
		ejecucion_actividades.inicios_actividades ia on iap.iac_codigo = ia.iac_codigo; 
-- iap_codigo = 227 iap_estado = 17 DEBERIA MOSTRAR 3 FIRMAS
select 	iap.iap_codigo ,iap.iap_estado ,
		ia.iac_codigo ,ia.iac_estado  
from 	ejecucion_actividades.inicio_actividad_poa iap
left join 
		ejecucion_actividades.inicios_actividades ia on iap.iac_codigo = ia.iac_codigo 
where 	iap.iap_codigo in (227);

select 	ia.iac_codigo ,ia.iac_estado 
from 	ejecucion_actividades.inicios_actividades ia 
where 	ia.iac_codigo in (323);
-- iap_codigo = 1 iap_estado = 2 DEBERIA MOSTRAR 1 FIRMA
select 	iap.iap_codigo ,iap.iap_estado ,
		ia.iac_codigo ,ia.iac_estado  
from 	ejecucion_actividades.inicio_actividad_poa iap
left join 
		ejecucion_actividades.inicios_actividades ia on iap.iac_codigo = ia.iac_codigo 
where 	iap.iap_codigo in (1);

select 	ia.iac_codigo ,ia.iac_estado 
from 	ejecucion_actividades.inicios_actividades ia 
where 	ia.iac_codigo in (119);