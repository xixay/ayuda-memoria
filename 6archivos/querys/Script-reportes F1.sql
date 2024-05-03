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
--especificacion tipos de trabajo
select 	*
from 	parametricas.especificacion_tipos_trabajo ett;
--
select	*
from 	parametricas.tipos_trabajos tt 
		left join parametricas.especificacion_tipos_trabajo ett on tt.ett_codigo =ett.ett_codigo;
--
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
--tipos inicios actividades
select 	*
from 	parametricas.tipos_inicios_actividades tia ;
--especificacion tipos de trabajo
select 	*
from 	parametricas.especificacion_tipos_trabajo ett;
--tipo actividad
select 	*
from 	parametricas.tipos_actividades ta ;
--apoyada
select 	iap.iap_codigo,
		iap.iac_codigo,
		iap.act_codigo
from 	ejecucion_actividades.inicio_actividad_poa iap 
where 	true and
		iap.act_codigo in (select	aa.act_codigo_ejecucion
							from 	estructura_poa.actividades_apoyo aa 
							where 	true
									and aa.aap_estado in (1)
									and aa.act_codigo in (1404)
						  );
--inicios actividades
select	*
from 	ejecucion_actividades.inicios_actividades ia
--where 	ia.iac_codigo in (367)
order	by	ia.iac_codigo desc;
--actividad
select 	*
from 	estructura_poa.actividades a
--where 	a.act_codigo in (1405)
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
order by	i.inf_codigo desc
limit 5;
--informe recomendaciones
select 	*
from 	ejecucion_actividades.informe_recomendaciones ir
order by	ir.ire_codigo desc
limit 5;
--informe recomendaciones seguimientos
select 	*
from 	ejecucion_actividades.informe_recomendaciones_seguimientos irs
order by	irs.irs_codigo desc 
limit 5;
--recomendaciones inicios seguimientos
select 	*
from 	ejecucion_actividades.recomendaciones_inicios_seguimientos ris 
order by	ris.ris_codigo desc 
limit 5;
--
SELECT	i.inf_codigo, i.inf_correlativo,
		ir.ire_descripcion
FROM	ejecucion_actividades.informes i
		LEFT JOIN ejecucion_actividades.informe_recomendaciones ir ON i.inf_codigo = ir.inf_codigo AND ir.ire_estado != 0
WHERE	TRUE
		AND i.inf_codigo IN (52)
;  
--
SELECT	i.inf_codigo, i.inf_correlativo,
		ir.ire_descripcion, ris.*
FROM	ejecucion_actividades.informes i
		LEFT JOIN ejecucion_actividades.informe_recomendaciones ir ON i.inf_codigo = ir.inf_codigo AND ir.ire_estado != 0
		LEFT JOIN ejecucion_actividades.recomendaciones_inicios_seguimientos ris ON ir.ire_codigo = ris.ire_codigo
WHERE	TRUE
		AND i.inf_codigo IN (52)
--		AND ris.iac_codigo IN (402)
		AND ris.iac_codigo IN (392)
;     		
     
--inicio actividad poa
select 	*
from 	ejecucion_actividades.inicio_actividad_poa iap
--where 	iap.iap_codigo in (401)
order 	by iap.iap_codigo desc
limit 10;


--juntos
SELECT	*
FROM	ejecucion_actividades.inicios_actividades ia
WHERE	ia.iac_codigo IN (SELECT a.iac_codigo_apoyo FROM estructura_poa.actividades a WHERE a.act_codigo IN (1404))
;
--juntos 2
SELECT	iap.iap_codigo,
		ia.*,
		a.act_codigo
FROM	ejecucion_actividades.inicio_actividad_poa iap
		left join estructura_poa.actividades a on iap.act_codigo = a.act_codigo
		left join ejecucion_actividades.inicios_actividades ia on a.iac_codigo_apoyo = ia.iac_codigo
where 	a.act_codigo in (1404)
;

SELECT	ia.iac_codigo, ia.iac_migrado,
		iap.iap_codigo
FROM	ejecucion_actividades.inicios_actividades ia
		LEFT JOIN ejecucion_actividades.inicio_actividad_poa iap ON ia.iac_codigo = iap.iac_codigo AND iap.iap_estado NOT IN (0, 5)
WHERE	ia.iac_codigo IN (SELECT a.iac_codigo_apoyo FROM estructura_poa.actividades a WHERE a.act_codigo IN (1404))
;
    		
   