--
       SELECT
              t.pobj_codigo,
              t.pobj_nombre,
              t.pobj_indicador,
              t.poa_codigo,
              p.poa_descripcion AS pobj_poa_descripcion,
              t.pro_codigo,
              pr.pro_numero,
              pr.pro_descripcion AS pobj_pro_descripcion,
              t.pobj_estado,
              e.est_color,
              e.est_nombre AS pobj_estado_descripcion,
              TO_CHAR(t.fecha_registro, 'HH24:MI am dd/mm/yyyy') as fecha_registro,
              --CONCAT(pr.pro_numero, '.', aes.aes_numero) AS poa_pobj_codigo,
              pr.pro_numero AS poa_pobj_codigo,
              t.tin_codigo,
              ti.tin_descripcion AS pobj_tin_descripcion,
              t.tacp_codigo,
              tacp.tacp_descripcion AS pobj_tacp_descripcion,
              CASE
                WHEN t.tacp_codigo = 3 THEN dacp.pobj_codigo_accion
                ELSE NULL
              END AS pobj_codigo_accion,
              CASE
                WHEN t.tacp_codigo = 3 THEN dacp.dac_codigo
                ELSE NULL
              END AS pobj_dac_codigo,
              t.cpr_codigo,
              cpr.cpr_numero,
              cpr.cpr_descripcion AS pobj_cpr_descripcion,
              t.aeg_codigo,
              aes.aes_numero,
              aes.aes_descripcion AS pobj_aes_descripcion,
              oau.oau_codigo,
              oau.aun_codigo_ejecutora,
              oau.aun_codigo_supervisora,
              ge.ges_codigo,
              ge.ges_anio,
              t.pobj_numero
        FROM	estructura_poa.poas_objetivos t
              LEFT JOIN parametricas.estados e ON e.est_codigo = t.pobj_estado
              LEFT JOIN estructura_poa.poas p ON p.poa_codigo = t.poa_codigo
              LEFT JOIN parametricas.gestiones ge ON ge.ges_codigo = p.ges_codigo
              LEFT JOIN pei.programas pr ON pr.pro_codigo = t.pro_codigo
              LEFT JOIN (
                SELECT	MAX(dacp.dac_codigo) as dac_codigo,
                    (SELECT tmp.pobj_codigo_accion
                    FROM estructura_poa.dependencia_accion_corto_plazo tmp
                    WHERE tmp.dac_codigo = MAX(dacp.dac_codigo)) as pobj_codigo_accion,
                    dacp.pobj_codigo_operacion
                FROM	estructura_poa.dependencia_accion_corto_plazo dacp
                GROUP BY dacp.pobj_codigo_operacion
              ) dacp ON t.pobj_codigo = dacp.pobj_codigo_operacion
              LEFT JOIN parametricas.tipo_indicador ti ON t.tin_codigo = ti.tin_codigo
              LEFT JOIN parametricas.tipo_accion_corto_plazo tacp ON t.tacp_codigo = tacp.tacp_codigo
              LEFT JOIN pei.categorias_programaticas cpr ON t.cpr_codigo = cpr.cpr_codigo
              LEFT JOIN pei.acciones_estrategicas_gestiones aeg ON t.aeg_codigo = aeg.aeg_codigo
              LEFT JOIN pei.acciones_estrategicas aes ON aeg.aes_codigo = aes.aes_codigo
              LEFT JOIN (
                SELECT	oau.pobj_codigo,
                        COALESCE((COALESCE(ARRAY_AGG(oau.oau_codigo ORDER BY oau.oau_codigo ASC), '{}'))[1], 0) AS oau_codigo,
                        COALESCE((COALESCE(ARRAY_AGG(oau.aun_codigo_ejecutora ORDER BY oau.oau_codigo ASC), '{}'))[1], 0) AS aun_codigo_ejecutora,
                        COALESCE((COALESCE(ARRAY_AGG(oau.aun_codigo_supervisora ORDER BY oau.oau_codigo ASC), '{}'))[1], 0) AS aun_codigo_supervisora
                FROM	estructura_poa.objetivos_area_unidad oau
                      LEFT JOIN estructura_poa.poas_objetivos po ON oau.pobj_codigo = po.pobj_codigo
                WHERE	oau.oau_estado NOT IN (0)
                GROUP BY oau.pobj_codigo
              ) oau ON t.pobj_codigo = oau.pobj_codigo
        WHERE	TRUE
              AND t.pobj_codigo IN (727)
              order by t.fecha_registro desc, t.pobj_codigo DESC        ;
--
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
--poa
select * from estructura_poa.poas p where p.poa_estado !=2;
--_pobj =2
select * from estructura_poa.poas_objetivos po where po.poa_codigo =2 and po.pobj_estado !=2;
--obj_area_unidad
select 	oau.oau_codigo ,oau.oau_estado ,po.pobj_codigo ,po.pobj_estado  
from 	estructura_poa.objetivos_area_unidad oau
		left join estructura_poa.poas_objetivos po on oau.pobj_codigo =oau.pobj_codigo 
where 	oau.oau_estado !=2 and po.poa_codigo in (2);
--act
select * from estructura_poa.actividades a where a.act_estado !=2;
--viatico
select * from estructura_poa.actividades_viaticos av where av.avi_estado !=2;
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
