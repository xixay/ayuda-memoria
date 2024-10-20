--AREA UNIDAD RESPONSABLES
select 	*
from 	estructura_poa.area_unidad_responsables aur
where 	true 
		and aur.rol_codigo in (1,2,3);
--CAMBIAR TODAS LAS AREAS
UPDATE 	estructura_poa.area_unidad_responsables aur
SET 	aur.per_codigo = 1914
WHERE 	aur.rol_codigo IN (1, 2, 3);

--TIPOS DE INICIOS DE ACTIVIDADES
select 	*
from 	parametricas.tipos_inicios_actividades tia ;
--TIPOS DE TRABAJO
select	*
from 	parametricas.tipos_trabajos tt ;
--ESPECIFICACION TIPOS DE TRABAJO
select 	*
from 	parametricas.especificacion_tipos_trabajo ett;
--TIPO DE ACTIVIDAD
select 	*
from 	parametricas.tipos_actividades ta ;
-- POA
select 	*  
from 	estructura_poa.poas p 
order by p.poa_codigo desc
limit 5;
-- POA OBJETIVOS
select	*
from 	estructura_poa.poas_objetivos po
where 	true 
		and po.pobj_codigo in (1)
order by	po.pobj_codigo desc 
limit 5;
-- OBJETIVO AREA UNIDAD
select	*
from 	estructura_poa.objetivos_area_unidad oau  
order by	oau.oau_codigo desc 
limit 5;
-- VIATICOS
select 	av.avi_codigo ,av.act_codigo, av.avi_estado, av.fecha_registro ,
		au.aun_sigla, a.pobj_codigo, p.poa_codigo  
from 	estructura_poa.actividades_viaticos av
		left join estructura_poa.actividades a on av.act_codigo = a.act_codigo
		left join estructura_poa.poas_objetivos po on a.pobj_codigo = po.pobj_codigo 
		left join estructura_poa.poas p on po.poa_codigo = p.poa_codigo 
		left join estructura_organizacional.areas_unidades au on a.aun_codigo_ejecutora = au.aun_codigo
where 	true 
--		and av.avi_estado in (1)
		and p.poa_codigo in (3)
order by av.avi_codigo desc; 
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
--		and a.act_numero = '00.1601.110.2.24'
--		and a.act_codigo in (1121)
--		and au.aun_sigla like 'GPA-GA3'
--		and a.act_estado not in (2,9,0,13)
--		and a.act_estado in (9)
--		and a.iac_codigo_apoyo is not null
--		and a.tipact_codigo in (2)
--		and a.cac_codigo in (3)
--		and po.pobj_codigo in (1497)
		and p.poa_codigo in (3)
order by au.aun_codigo desc;
--order by a.act_codigo desc;
--FLUJO ESTADO
select 	*
from 	control_estados.flujos_tablas ft
where 	ft.tab_codigo in (41);
--$$$$$$$$$$$$$$$
SELECT
    po.pobj_codigo, po.pobj_estado, pr.pro_numero, au.aun_numero, po.pobj_numero,
    CONCAT(pr.pro_numero, '.', au.aun_numero, '.', po.pobj_numero) AS pobj_codigo_sigla,
    po.pobj_nombre
FROM	estructura_poa.poas_objetivos po
      LEFT JOIN pei.programas pr ON po.pro_codigo = pr.pro_codigo
      LEFT JOIN (
        SELECT	oau.pobj_codigo, COALESCE((COALESCE(ARRAY_AGG(oau.aun_codigo_ejecutora ORDER BY oau.oau_codigo ASC), '{}'))[1], 0) AS aun_codigo_ejecutora_principal
        FROM	estructura_poa.objetivos_area_unidad oau
              LEFT JOIN estructura_poa.poas_objetivos po ON oau.pobj_codigo = po.pobj_codigo
        WHERE	oau.oau_estado NOT IN (0)
              AND po.poa_codigo IN (3) -- POA SELECCIONADO
        GROUP BY oau.pobj_codigo
      ) temporal ON po.pobj_codigo = temporal.pobj_codigo
      LEFT JOIN estructura_organizacional.areas_unidades au ON temporal.aun_codigo_ejecutora_principal = au.aun_codigo
      LEFT JOIN estructura_poa.objetivos_area_unidad oau ON po.pobj_codigo = oau.pobj_codigo AND oau.oau_estado NOT IN (0)
WHERE	TRUE
      AND po.poa_codigo IN (3) -- POA SELECCIONADO
      AND po.pobj_estado IN (2,8) -- ESTADOS
      AND oau.aun_codigo_ejecutora IN (77) -- ESTADOS
    GROUP BY po.pobj_codigo, pr.pro_numero, po.pobj_numero, po.pobj_nombre, au.aun_numero
    ;
--$$$$$$$$$$$$$$$
--#################
        SELECT
          t.act_codigo,
          t.act_descripcion,
          t.act_cantidad,
          TO_CHAR(t.act_fecha_inicio, 'dd/mm/yyyy') as act_fecha_inicio,
          TO_CHAR(t.act_fecha_fin, 'dd/mm/yyyy') as act_fecha_fin,
          t.act_objeto,
          t.act_objetivo,
          t.act_alcance,
          t.act_horas_planificadas,
          t.act_estado,
          t.act_no_planificado,
          t.act_codigo_anterior,
          t.act_codigo_bolsa,
          fo.for_codigo,
          ge.ges_codigo,
          pobj.pobj_numero,
          aune.aun_numero,
          aune.aun_estado,
          pr.pro_numero,
          t.act_correlativo,
          ge.ges_anio,
          t.act_numero,
          CONCAT_WS(' - ', t.act_numero, t.act_descripcion)AS act_num_desc,
          e.est_color,
          e.est_nombre AS act_estado_descripcion,
          t.ttr_codigo,
          tt.ttr_sigla,
          tt.ttr_inicial,
          tt.ett_codigo,
          ett.ett_nombre,
          t.ume_codigo,
          um.ume_descripcion,
          t.ent_codigo,
          t.fob_codigo,
          t.tipact_codigo,
          ta.tipact_descripcion AS act_tipact_descripcion,
          t.cac_codigo,
          t.sec_codigo,
          se.sec_descripcion,
          ca.cac_descripcion AS act_cac_descripcion,
          t.aun_codigo_supervisora,
          auns.aun_sigla AS aun_sigla_supervisora,
          auns.aun_inicial AS aun_inicial_supervisora,
          CONCAT_WS(' - ', auns.aun_nombre, auns.aun_sigla)AS aun_nombre_supervisora,
          t.aun_codigo_ejecutora,
          t.aun_codigo_ejecutora AS aun_codigo_ejecutora_actividad,
          t.pobj_codigo,
          aune.aun_sigla AS aun_sigla_ejecutora,
          aune.aun_inicial AS aun_inicial_ejecutora,
          aune.lug_codigo,
          CONCAT_WS(' - ', aune.aun_nombre, aune.aun_sigla)AS aun_nombre_ejecutora,
          COALESCE(aa.act_codigo_apoyo, 0) AS act_codigo_apoyo,
          COALESCE(aa.act_codigo_ejecucion, 0) AS act_codigo_ejecucion,
          t.act_justificacion,
          t.iac_codigo_apoyo,
          CONCAT_WS(' | ', ge2.ges_anio, ia.iac_codigo_control, ia.iac_objetivo) AS iac_concatenado,
          ia.iac_codigo_control,
          actv.avi_estado,
          TO_CHAR(t.fecha_registro, 'HH24:MI am dd/mm/yyyy') as fecha_registro,
          t.act_denuncia,
          pobj.poa_codigo,
          aune.cau_codigo
        FROM estructura_poa.actividades t
          LEFT JOIN parametricas.estados e ON e.est_codigo = t.act_estado
          LEFT JOIN parametricas.tipos_trabajos tt ON tt.ttr_codigo = t.ttr_codigo
          LEFT JOIN parametricas.unidades_medidas um ON um.ume_codigo = t.ume_codigo
          LEFT JOIN estructura_poa.actividades_viaticos actv ON actv.avi_codigo = t.act_codigo
          LEFT JOIN estructura_poa.formularios_objetivos fob ON fob.fob_codigo = t.fob_codigo
          LEFT JOIN estructura_poa.formularios fo ON fo.for_codigo = fob.for_codigo
          LEFT JOIN estructura_poa.poas po ON po.poa_codigo = fo.poa_codigo
          LEFT JOIN parametricas.gestiones ge ON ge.ges_codigo = po.ges_codigo
          LEFT JOIN parametricas.tipos_actividades ta ON ta.tipact_codigo = t.tipact_codigo
          LEFT JOIN parametricas.clasificacion_actividades ca ON ca.cac_codigo = t.cac_codigo
          LEFT JOIN parametricas.sector se ON se.sec_codigo = t.sec_codigo
          LEFT JOIN estructura_poa.actividades_apoyo aa ON t.act_codigo = aa.act_codigo AND aa.aap_estado = 1
          LEFT JOIN estructura_organizacional.areas_unidades aune ON t.aun_codigo_ejecutora = aune.aun_codigo
          LEFT JOIN estructura_organizacional.areas_unidades auns ON t.aun_codigo_supervisora = auns.aun_codigo
          LEFT JOIN parametricas.especificacion_tipos_trabajo ett ON tt.ett_codigo = ett.ett_codigo
          LEFT JOIN estructura_poa.poas_objetivos pobj ON pobj.pobj_codigo = t.pobj_codigo
          LEFT JOIN pei.programas pr ON pobj.pro_codigo = pr.pro_codigo
          LEFT JOIN ejecucion_actividades.inicios_actividades ia ON t.iac_codigo_apoyo = ia.iac_codigo
          LEFT JOIN parametricas.gestiones ge2 ON ge2.ges_codigo = ia.ges_codigo
        WHERE TRUE
          AND t.act_estado IN (1,3,8,7,2)
          AND t.pobj_codigo IN (1497)
          AND t.cac_codigo IN (1)
          ${query.sec_codigo ? `AND t.sec_codigo IN ${query.sec_codigo}` : ''}
          ${query.for_codigo ? `AND fo.for_codigo IN ${query.for_codigo}` : ''}
          ${query.aun_codigo_ejecutora ? `AND t.aun_codigo_ejecutora IN ${query.aun_codigo_ejecutora}` : ''} -- PARA FILTRO DE AREA UNIDAD EJECUTORA VIA ACTIVIDAD
          ${query.aun_estado ? `AND aune.aun_estado IN ${query.aun_estado}` : ''} -- PARA FILTRO DE AREA UNIDAD EJECUTORA QUE NO ESTE EN ESTADO 9
          ${query.aun_codigo_supervisora ? `AND t.aun_codigo_supervisora IN ${query.aun_codigo_supervisora}` : ''}
          ${query.ett_codigo ? `AND tt.ett_codigo IN ${query.ett_codigo}` : ''}
        ORDER BY t.act_codigo DESC
        ${query.generic_limit ? query.generic_limit : ''};
      `;
--##############
SELECT	*
FROM	estructura_poa.actividades act
WHERE	TRUE
    AND act.act_estado IN (4,10,14,11,12,13,1,3,8,7,2,5);
    --AND act.cac_codigo IN (1);
    --${queryAddConditionAreaUnidadRolPersonaForActividades || ''};
--##############
--######## formula
select 	*
from 	estructura_poa.formularios f 
order by f.for_codigo desc;
--######## formula obj
select 	*
from 	estructura_poa.formularios_objetivos fo  
order by fo.fob_codigo desc;
--########
--order by a.act_codigo desc;
--INICIOS ACTIVIDADES
select	*
FROM 	ejecucion_actividades.inicios_actividades t
--where 	t.iac_codigo_control in ('EHEN26Y00')
--where 	t.iac_codigo in (407)
--where 	t.iac_estado in (22)
order by t.iac_codigo desc ;
--INICIO ACTIVIDAD POA
select 	*
from 	ejecucion_actividades.inicio_actividad_poa iap
--where 	iap.iap_codigo in (276)
--where 	iap.act_codigo in (711)
order 	by iap.iap_codigo desc;
--limit 5;
--ACTIVIDADES CONTINUIDAD
select 	*
from 	estructura_poa.actividades_continuidad ac
--where 	ac.iac_codigo in (397)
order by ac.aco_codigo desc
limit 5;
--ACTIVIDAD MIGRADA CONAUD
select 	*
from 	ejecucion_actividades.actividad_migrada_conaud amc 
order by amc.amc_codigo desc;
--NRO RECOMENDACIONES POR IAP_CODIGO
SELECT	iap.iap_codigo, ia.iac_codigo, iai.inf_codigo, ir.ire_codigo
FROM	ejecucion_actividades.inicio_actividad_poa iap
		LEFT JOIN ejecucion_actividades.inicios_actividades ia ON iap.iac_codigo = ia.iac_codigo
		LEFT JOIN ejecucion_actividades.inicio_actividad_informe iai ON ia.iac_codigo = iai.iac_codigo
		LEFT JOIN ejecucion_actividades.informe_recomendaciones ir ON iai.inf_codigo = ir.inf_codigo
WHERE	TRUE
		AND ir.ire_estado NOT IN (0)
		AND iap.iap_codigo IN (285)
;
--INFORMES EMERGENTES
select 	*
from 	parametricas.informes_emergentes ie
where 	ie.iem_descripcion = 'Evaluacion de Confiabilidad de Estados Financieros'
;
--INFORMES
select 	*
from 	ejecucion_actividades.informes i 
--where 	i.iac_codigo in (403)
where 	i.inf_codigo in (78)
order by	i.inf_codigo desc;
--INICIO ACTIVIDAD INFORME
select 	*
from 	ejecucion_actividades.inicio_actividad_informe iai
order 	by	iai.iai_codigo desc;
--INFORME RECOMENDACIONES
select 	*
from 	ejecucion_actividades.informe_recomendaciones ir
where 	ir.inf_codigo in (78)
order by	ir.ire_codigo desc
limit 5;
--FLUJOS ESTADOS EVOLUCION
select 	*
from 	parametricas.flujos_estados_evolucion fee 
where 	fee.iem_codigo = 16;
--INFORME RECOMENDACIONES SEGUIMIENTOS
select 	*
from 	ejecucion_actividades.informe_recomendaciones_seguimientos irs
order by	irs.irs_codigo desc 
limit 5;
--RECOMENDACIONES INICIOS SEGUIMIENTOS
select 	*
from 	ejecucion_actividades.recomendaciones_inicios_seguimientos ris 
order by	ris.ris_codigo desc 
limit 5;
-- Nro RECOMENDACIONES INICIOS SEGUIMIENTO
  SELECT
        i.inf_codigo, i.inf_correlativo,
        ir.ire_descripcion, ris.*
  FROM ejecucion_actividades.informes i
        LEFT JOIN ejecucion_actividades.informe_recomendaciones ir ON i.inf_codigo = ir.inf_codigo AND ir.ire_estado != 0
        LEFT JOIN ejecucion_actividades.recomendaciones_inicios_seguimientos ris ON ir.ire_codigo = ris.ire_codigo
  WHERE i.inf_codigo IN (65) AND ris.iac_codigo IN (415) AND ris.ris_estado IN (1)
;
--
SELECT  iac.*, ges.ges_anio
FROM	ejecucion_actividades.inicios_actividades iac
		LEFT JOIN parametricas.gestiones ges ON iac.ges_codigo = ges.ges_codigo
WHERE	true
		--and iac.iac_estado IN (22)
		and iac.iac_codigo_control IN ('EHEN26Y00');
	
--
select
		t.iac_codigo,
		t.iac_codigo_control,
		CONCAT_WS(' | ', ge2.ges_anio, t.iac_codigo_control, t.iac_objetivo) as iac_concatenado
from	ejecucion_actividades.inicios_actividades t
		left join parametricas.estados e on e.est_codigo = t.iac_estado
		left join parametricas.gestiones ge2 on ge2.ges_codigo = t.ges_codigo
where	true
  		and t.iac_codigo in (432)
order by t.iac_codigo desc;

--
SELECT
              t.iac_codigo,
              t.iac_correlativo,
              t.iac_codigo_control,
              t.iac_codigo_control_vista,
              t.iac_objeto,
              t.iac_objetivo,
              t.iac_alcance,
              t.iac_migrado,
              t.iac_observaciones,
              TO_CHAR(t.iac_fecha_inicio, 'dd/mm/yyyy') AS iac_fecha_inicio,
              t.ttr_codigo, tt.ttr_sigla, tt.ttr_descripcion,
              t.iac_dias_habiles,
              t.iac_dias_calendario,
              TO_CHAR(t.iac_fecha_fin, 'dd/mm/yyyy') AS iac_fecha_fin,
              t.ttr_codigo,
              TO_CHAR(t.iac_mes_inicio, 'dd/mm/yyyy') AS iac_mes_inicio,
              TO_CHAR(t.iac_mes_fin, 'dd/mm/yyyy') AS iac_mes_fin,
              TO_CHAR(t.iac_mes_inicio, 'mm/yyyy') AS mes_inicio,
              TO_CHAR(t.iac_mes_fin, 'mm/yyyy') AS mes_fin,
              TO_CHAR(t.iac_fecha_borrador, 'dd/mm/yyyy') AS iac_fecha_borrador,
              TO_CHAR(t.iac_fecha_emision, 'dd/mm/yyyy') AS iac_fecha_emision,
              t.ges_codigo,
              g.ges_anio,
              t.iac_estado,
              e.est_color,
              e.est_nombre AS iac_estado_descripcion,
              TO_CHAR(t.iac_fecha_inicio_historico, 'dd/mm/yyyy') AS iac_fecha_inicio_historico,
              TO_CHAR(t.fecha_registro, 'HH24:MI am dd/mm/yyyy') AS fecha_registro
        FROM	ejecucion_actividades.inicios_actividades t
              LEFT JOIN parametricas.estados e ON t.iac_estado = e.est_codigo
              LEFT JOIN parametricas.gestiones g ON t.ges_codigo = g.ges_codigo
              LEFT JOIN parametricas.tipos_trabajos tt ON t.ttr_codigo = tt.ttr_codigo
        WHERE	TRUE
              AND t.iac_estado IN (22)
              AND t.iac_codigo_control like '%ESEN19A99%'
        ORDER BY t.fecha_registro DESC;
--
         SELECT
          t.act_codigo,
          t.act_descripcion,
          t.act_cantidad,
          TO_CHAR(t.act_fecha_inicio, 'dd/mm/yyyy') as act_fecha_inicio,
          TO_CHAR(t.act_fecha_fin, 'dd/mm/yyyy') as act_fecha_fin,
          t.act_objeto,
          t.act_objetivo,
          t.act_alcance,
          t.act_horas_planificadas,
          t.act_estado,
          t.act_no_planificado,
          t.act_codigo_anterior,
          t.act_codigo_bolsa,
          fo.for_codigo,
          ge.ges_codigo,
          pobj.pobj_numero,
          aune.aun_numero,
          pr.pro_numero,
          t.act_correlativo,
          ge.ges_anio,
          t.act_numero,
          CONCAT_WS(' - ', t.act_numero, t.act_descripcion)AS act_num_desc,
          e.est_color,
          e.est_nombre AS act_estado_descripcion,
          t.ttr_codigo,
          tt.ttr_sigla,
          tt.ttr_inicial,
          tt.ett_codigo,
          ett.ett_nombre,
          t.ume_codigo,
          um.ume_descripcion,
          t.ent_codigo,
          t.fob_codigo,
          t.tipact_codigo,
          ta.tipact_descripcion AS act_tipact_descripcion,
          t.cac_codigo,
          t.sec_codigo,
          se.sec_descripcion,
          ca.cac_descripcion AS act_cac_descripcion,
          t.aun_codigo_supervisora,
          auns.aun_sigla AS aun_sigla_supervisora,
          auns.aun_inicial AS aun_inicial_supervisora,
          CONCAT_WS(' - ', auns.aun_nombre, auns.aun_sigla)AS aun_nombre_supervisora,
          t.aun_codigo_ejecutora,
          t.aun_codigo_ejecutora AS aun_codigo_ejecutora_actividad,
          t.pobj_codigo,
          aune.aun_sigla AS aun_sigla_ejecutora,
          aune.aun_inicial AS aun_inicial_ejecutora,
          aune.lug_codigo,
          CONCAT_WS(' - ', aune.aun_nombre, aune.aun_sigla)AS aun_nombre_ejecutora,
          COALESCE(aa.act_codigo_apoyo, 0) AS act_codigo_apoyo,
          COALESCE(aa.act_codigo_ejecucion, 0) AS act_codigo_ejecucion,
          t.act_justificacion,
          t.iac_codigo_apoyo,
          CONCAT_WS(' | ', ge2.ges_anio, ia.iac_codigo_control, ia.iac_objetivo) AS iac_concatenado,
          ia.iac_codigo_control,
          actv.avi_estado,
          TO_CHAR(t.fecha_registro, 'HH24:MI am dd/mm/yyyy') as fecha_registro,
          t.act_denuncia,
          pobj.poa_codigo,
          aune.cau_codigo
        FROM estructura_poa.actividades t
          LEFT JOIN parametricas.estados e ON e.est_codigo = t.act_estado
          LEFT JOIN parametricas.tipos_trabajos tt ON tt.ttr_codigo = t.ttr_codigo
          LEFT JOIN parametricas.unidades_medidas um ON um.ume_codigo = t.ume_codigo
          LEFT JOIN estructura_poa.actividades_viaticos actv ON actv.avi_codigo = t.act_codigo
          LEFT JOIN estructura_poa.formularios_objetivos fob ON fob.fob_codigo = t.fob_codigo
          LEFT JOIN estructura_poa.formularios fo ON fo.for_codigo = fob.for_codigo
          LEFT JOIN estructura_poa.poas po ON po.poa_codigo = fo.poa_codigo
          LEFT JOIN parametricas.gestiones ge ON ge.ges_codigo = po.ges_codigo
          LEFT JOIN parametricas.tipos_actividades ta ON ta.tipact_codigo = t.tipact_codigo
          LEFT JOIN parametricas.clasificacion_actividades ca ON ca.cac_codigo = t.cac_codigo
          LEFT JOIN parametricas.sector se ON se.sec_codigo = t.sec_codigo
          LEFT JOIN estructura_poa.actividades_apoyo aa ON t.act_codigo = aa.act_codigo AND aa.aap_estado = 1
          LEFT JOIN estructura_organizacional.areas_unidades aune ON t.aun_codigo_ejecutora = aune.aun_codigo
          LEFT JOIN estructura_organizacional.areas_unidades auns ON t.aun_codigo_supervisora = auns.aun_codigo
          LEFT JOIN parametricas.especificacion_tipos_trabajo ett ON tt.ett_codigo = ett.ett_codigo
          LEFT JOIN estructura_poa.poas_objetivos pobj ON pobj.pobj_codigo = t.pobj_codigo
          LEFT JOIN pei.programas pr ON pobj.pro_codigo = pr.pro_codigo
          LEFT JOIN ejecucion_actividades.inicios_actividades ia ON t.iac_codigo_apoyo = ia.iac_codigo
          LEFT JOIN parametricas.gestiones ge2 ON ge2.ges_codigo = ia.ges_codigo
        WHERE TRUE
          AND t.act_estado IN (2)
          AND t.pobj_codigo IN (676)
          AND t.cac_codigo IN (2)
        ORDER BY t.act_codigo desc;