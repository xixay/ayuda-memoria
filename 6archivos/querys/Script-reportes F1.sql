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

select 	*
from 	ejecucion_actividades.inicios_actividades ia 
where 	ia.iac_codigo in (285);

--select 	ia.iac_codigo, ia.iac_codigo_control,ia.iac_alcance,ia.ges_codigo 
--select 	ia.iac_codigo, ia.iac_codigo_control, ia.iac_fecha_inicio, ia.ges_codigo 
select 	*
from 	ejecucion_actividades.inicios_actividades ia 
where 	ia.iac_codigo_control = 'KLAP41A00'
--where 	ia.iac_migrado = true
order by ia.iac_codigo desc;
--AÑO
select 	*
from 	parametricas.gestiones g
where 	g.ges_anio  in (2023);
--ACTIVIDADES act_codigo = 284
select 	*
from	estructura_poa.actividades a
where 	a.aun_codigo_ejecutora in (59);
--TIPOS DE TRABAJO
select	*
from 	parametricas.tipos_trabajos tt ;
---
SELECT a.*, ia.iac_codigo 
FROM estructura_poa.actividades a
LEFT JOIN ejecucion_actividades.inicios_actividades ia on a.iac_codigo_apoyo = ia.iac_codigo
order by a.act_codigo desc;
----
select
	t.iac_codigo,
	t.iac_codigo_control,
	CONCAT_WS(' | ',
	ge2.ges_anio,
	t.iac_codigo_control,
	t.iac_objetivo) as iac_concatenado
from ejecucion_actividades.inicios_actividades t
left join parametricas.estados e on
	e.est_codigo = t.iac_estado
left join parametricas.gestiones ge2 on
	ge2.ges_codigo = t.ges_codigo
where
	t.iac_codigo in (304)
order by
	t.iac_codigo desc;

