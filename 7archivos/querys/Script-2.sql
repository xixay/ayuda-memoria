--gestiones
select 	*
from 	parametricas.gestiones g
where 	g.ges_codigo in (25);
--tipos inicios actividades
select 	*
from 	parametricas.tipos_inicios_actividades tia ;
--tipo de trabajo
select 	*
from 	parametricas.tipos_trabajos tt
;
--especificacion tipos de trabajo
select 	*
from 	parametricas.especificacion_tipos_trabajo ett;

--inicios actividades
select	*
from 	ejecucion_actividades.inicios_actividades ia
--where 	ia.iac_codigo in (367)
order	by	ia.iac_codigo desc
limit 5;
--actividad
select 	*
from 	estructura_poa.actividades a
--where 	a.act_codigo in (1446)
order 	by	a.act_codigo desc
limit 5;
--act continuidad
select 	*
from 	estructura_poa.actividades_continuidad ac
order by ac.aco_codigo desc
limit 5;
--informes
select 	*
from 	ejecucion_actividades.informes i 
order 	by	i.inf_codigo desc
limit 1;
--informe recomendaciones
select 	*
from 	ejecucion_actividades.informe_recomendaciones ir  
order 	by	ir.ire_codigo desc
limit 2;
--informe recomendaciones seguimientos
select 	*
from 	ejecucion_actividades.informe_recomendaciones_seguimientos irs  
order 	by	irs.irs_codigo desc
limit 2;
--recomendaciones inicios seguimientos
select 	*
from 	ejecucion_actividades.recomendaciones_inicios_seguimientos ris  
order 	by	ris.ris_codigo desc
limit 2;
--informes uai
select 	*
from 	ejecucion_informes.informes_uai iu
order	by iu.iua_codigo desc 
limit 	1;
--informe evaluaciones
select 	*
from 	ejecucion_informes.informes_evaluaciones ie;
--inicio actividad poa
select 	*
from 	ejecucion_actividades.inicio_actividad_poa iap
--where 	iap.iap_codigo in (269)
order 	by iap.iap_codigo desc
limit 1;


