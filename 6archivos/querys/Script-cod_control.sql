-- POA
SELECT 	* 
FROM 	estructura_poa.poas p 
WHERE 	p.poa_codigo in (2)
-- POOAS OBJ
SELECT 	* 
FROM 	estructura_poa.poas_objetivos po 
WHERE 	po.pobj_codigo in (727)
select po.pobj_codigo ,po.pobj_indicador ,po.pro_codigo , po. tin_codigo ,po.tacp_codigo ,po.cpr_codigo ,po.aeg_codigo  from estructura_poa.poas_objetivos po where po.aeg_codigo in (926)
-- ACTIVIDADES
SELECT 	a.act_codigo, a.act_codigo_bolsa 
FROM 	estructura_poa.actividades a  
WHERE 	a.pobj_codigo in (727) AND a.act_estado in (2) 
select * from estructura_poa.actividades a 
|act_codigo|act_codigo_bolsa|
|----------|----------------|
|1.361     |525             |
|1.362     |526             |
|1.363     |525             |
--POAS OBJETIVOS SERVICES
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
      AND t.pobj_codigo IN :pobj_codigo
order by t.fecha_registro desc, t.pobj_codigo desc

select * from parametricas.tipos_actividades ta      

select * from ejecucion_actividades.inicio_actividad_poa iap where iap.iap_codigo in (189)       
--
SELECT act_codigo, act_numero, act_descripcion,act_objeto, ttr_codigo, tipact_codigo, cac_codigo, act_estado
FROM estructura_poa.actividades
WHERE act_codigo=1376
select iap2.iap_codigo, iap2.act_codigo, iap2.iac_codigo,iap2.iap_estado from ejecucion_actividades.inicio_actividad_poa iap2 where iap2.iac_codigo in (294)
select ia.iac_codigo,ia.iac_estado, ia.iac_codigo_control,ia.iac_objeto,ia.iac_migrado,ia.iac_codigo_control_vista ,ia.fecha_registro,ia.fecha_modificacion from ejecucion_actividades.inicios_actividades ia where ia.iac_codigo in (294)
select iap2.iap_codigo, iap2.act_codigo, iap2.iac_codigo,iap2.iap_estado from ejecucion_actividades.inicio_actividad_poa iap2 where iap2.iac_codigo in (298)
select ia.iac_codigo,ia.iac_estado, ia.iac_codigo_control,ia.iac_objeto,ia.iac_migrado,ia.iac_codigo_control_vista ,ia.fecha_registro,ia.fecha_modificacion from ejecucion_actividades.inicios_actividades ia where ia.iac_codigo in (298)

select ia.iac_codigo,ia.iac_estado, ia.iac_codigo_control,ia.iac_objeto,ia.iac_migrado,ia.iac_codigo_control_vista ,ia.fecha_registro,ia.fecha_modificacion from ejecucion_actividades.inicios_actividades ia where ia.iac_codigo_control in ('S6AP')

--
select	a.act_codigo, a.act_numero, a.tipact_codigo,a.act_objeto,a.ttr_codigo,  --actividad
		ac.conaud_detalle, ac.conaud_codigo, ac.conaud_correlativo,--al que se le va ser continuidad
		ia.iac_codigo, ia.iac_codigo_control, ia.iac_codigo_control_vista,--inicio actividad q se crea
		iap2.iap_codigo,--
		iap.iap_codigo, ia2.iac_codigo--inicio actividad no creado haun ???
from	estructura_poa.actividades a
		left join estructura_poa.actividades_continuidad ac on a.act_codigo = ac.act_codigo
		left join ejecucion_actividades.inicios_actividades ia on ac.iac_codigo = ia.iac_codigo
		left join ejecucion_actividades.inicio_actividad_poa iap2 on ac.iac_codigo = iap2.iac_codigo
		left join ejecucion_actividades.inicio_actividad_poa iap on a.act_codigo = iap.act_codigo
		left join ejecucion_actividades.inicios_actividades ia2 on iap.iac_codigo = ia2.iac_codigo
order by a.act_codigo desc
limit 5
;

select * from estructura_poa.actividades a where a.act_codigo = 1380


select *
from ejecucion_actividades.inicios_actividades ia
--where ia.iac_codigo = 310
order by ia.iac_codigo desc
;
-- PAPELES DE TRABAJO E INFORMES DE CONFIABILIDAD REALIZADOS POR LA UAI
-- P5DP09S21


	SELECT	t.tab_nombre, ft.est_codigo_origen, eo.est_nombre, ft.est_codigo_destino, ed.est_nombre
	FROM	control_estados.flujos_tablas ft
			LEFT JOIN parametricas.tablas t ON ft.tab_codigo = t.tab_codigo
			LEFT JOIN parametricas.estados eo ON ft.est_codigo_origen = eo.est_codigo
			LEFT JOIN parametricas.estados ed ON ft.est_codigo_destino = ed.est_codigo
	WHERE	ft.tab_codigo IN (SELECT t.tab_codigo FROM parametricas.tablas t WHERE t.tab_nombre IN (
				--'Poas', 
				--'PoasObjetivos'--,
				'Actividades'--, 
				--'ActividadesViaticos'
			))
	ORDER BY ft.tab_codigo ASC, ft.est_codigo_origen ASC, ft.est_codigo_destino asc


