SELECT
      iac.*,
      iap.iap_codigo,
      iap.act_codigo,
      iap.iap_estado
FROM	(
        SELECT  iac.*, ges.ges_anio
        FROM	ejecucion_actividades.inicios_actividades iac
              LEFT JOIN parametricas.gestiones ges ON iac.ges_codigo = ges.ges_codigo
        WHERE	TRUE
              and iac.iac_estado IN (22)
      ) iac
      INNER JOIN
      (
        SELECT	*
        FROM  ejecucion_actividades.inicio_actividad_poa iap
        WHERE TRUE
              AND iap.iap_estado IN (2)
      ) iap
      ON iac.iac_codigo = iap.iac_codigo
WHERE	true
order by iac_codigo desc
;
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
select 	a.act_codigo ,a.act_estado,
		av.avi_codigo ,av.avi_estado 
from 	estructura_poa.actividades a
		left join estructura_poa.actividades_viaticos av on a.act_codigo = av.act_codigo 
where 	a.act_estado =2;
select * from estructura_poa.actividades_viaticos av where av.avi_estado !=2;


