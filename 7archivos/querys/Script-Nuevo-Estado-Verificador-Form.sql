--###### ACTIVIDADES ##################
--POAS
select 	po.poa_codigo , po.pobj_codigo, po.pobj_estado, 
		a.act_codigo, a.act_codigo_anterior , a.act_estado 
from 	estructura_poa.poas p
		left join estructura_poa.poas_objetivos po on p.poa_codigo = po.poa_codigo
		left join estructura_poa.actividades a on po.pobj_codigo = a.pobj_codigo 
where 	true
		and p.poa_codigo in (3)
order by p.poa_codigo desc;
--POA OBJETIVOS
select	*
from 	estructura_poa.poas_objetivos po 
where 	true 
--		and po.pobj_estado not in (2,9,0,13)
--		and po.pobj_estado in (0)
--		and po.pobj_codigo in (1181)
--		and po.pobj_codigo in (401)
--		and po.pobj_numero in (62)
order by	po.pobj_codigo desc;
--VIATICOS
select 	av.avi_codigo ,av.act_codigo, av.avi_estado, av.fecha_registro ,
		au.aun_sigla, a.pobj_codigo, p.poa_codigo  
from 	estructura_poa.actividades_viaticos av
		left join estructura_poa.actividades a on av.act_codigo = a.act_codigo
		left join estructura_poa.poas_objetivos po on a.pobj_codigo = po.pobj_codigo 
		left join estructura_poa.poas p on po.poa_codigo = p.poa_codigo 
		left join estructura_organizacional.areas_unidades au on a.aun_codigo_ejecutora = au.aun_codigo
where 	true 
--		and av.avi_estado in (1)
		and p.poa_codigo in (2)
--		and av.act_codigo in (1663)
order by av.avi_codigo desc; 
select 	*
from 	estructura_poa.actividades a
where 	a.aun_codigo_ejecutora in (28) --and a.act_ejecucion_conaud in (true)
order by a.act_codigo desc;
select * from estructura_poa.actividades a where a.act_numero like '510.1503.24.1.24';
select a.act_codigo, a.act_ejecucion_conaud, a.act_numero, iap.iap_codigo,iap.act_codigo, a.aun_codigo_ejecutora ,a.pobj_codigo,iap.iap_estado,iu.iua_codigo, iu.iua_estado 
from estructura_poa.actividades a
	left join ejecucion_actividades.inicio_actividad_poa iap on a.act_codigo = iap.act_codigo
	left join ejecucion_informes.informes_uai iu on a.act_codigo = iu.act_codigo 
where a.pobj_codigo in (275) and a.aun_codigo_ejecutora in (64) and a.act_estado not in (0)
;

--ACTIVIDADES
select 	--*
		a.act_codigo , a.act_ejecucion_conaud, a.act_codigo_anterior ,a.act_numero ,a.cac_codigo ,a.iac_codigo_apoyo, a.act_estado, a.act_descripcion , a.aun_codigo_ejecutora, a.tipact_codigo, a.fecha_registro, a.ttr_codigo, 
		ett.ett_codigo, ett.ett_nombre, 
		au.aun_nombre, au.aun_sigla, au.aun_estado,
		po.pobj_codigo ,po.pobj_nombre, po.pobj_estado,
		p.poa_codigo,
		oau.oau_codigo, oau.oau_descripcion ,oau.oau_estado 
from 	estructura_poa.actividades a
		left join parametricas.tipos_trabajos tt on a.ttr_codigo = tt.ttr_codigo
		left join parametricas.especificacion_tipos_trabajo ett on tt.ett_codigo = ett.ett_codigo 
		left join estructura_organizacional.areas_unidades au on a.aun_codigo_ejecutora = au.aun_codigo 
		left join estructura_poa.poas_objetivos po on a.pobj_codigo = po.pobj_codigo 
		left join estructura_poa.poas p on p.poa_codigo = po.poa_codigo
		left join estructura_poa.objetivos_area_unidad oau on po.pobj_codigo = oau.pobj_codigo 
where	true 	
--		and a.act_numero = '510.1202.17.14.24'
--		and a.act_codigo in (2755,2753,2752,2751,2462,2460,2459,1889,2166,2165,2164)
--		and a.act_codigo_anterior in (613,609,592,585,580,478,396,219,217,198)
--		and a.act_codigo_anterior in (396,219,217)
		and au.aun_sigla like 'GDB-GAD'
--		and a.act_estado not in (2,7,9,0,13,17)
--		AND au.aun_estado NOT IN (2)
--		and a.act_estado not in (9)
--		and a.iac_codigo_apoyo is not null
--		and a.tipact_codigo in (2)
--		and a.cac_codigo in (1)
--		and po.pobj_codigo in (1145)
		and p.poa_codigo in (3)
--		and a.act_ejecucion_conaud in (true)
--order by au.aun_estado asc;
order by a.act_codigo desc;
--FLUJOS
SELECT	t.tab_nombre, ft.est_codigo_origen, eo.est_nombre, ft.est_codigo_destino, ed.est_nombre
FROM	control_estados.flujos_tablas ft
		LEFT JOIN parametricas.tablas t ON ft.tab_codigo = t.tab_codigo
		LEFT JOIN parametricas.estados eo ON ft.est_codigo_origen = eo.est_codigo
		LEFT JOIN parametricas.estados ed ON ft.est_codigo_destino = ed.est_codigo
WHERE	ft.tab_codigo IN (SELECT t.tab_codigo FROM parametricas.tablas t WHERE t.tab_nombre IN ('Actividades'))
--WHERE	ft.tab_codigo IN (SELECT t.tab_codigo FROM parametricas.tablas t WHERE t.tab_nombre IN ('ActividadesViaticos'))
ORDER BY ft.tab_codigo ASC, ft.est_codigo_origen ASC, ft.est_codigo_destino ASC
;
SELECT 	*
FROM 	control_estados.flujos_tablas ft
WHERE 	TRUE 
--		AND ft.tab_codigo IN (1)
		AND ft.tab_codigo IN (2)
ORDER BY ft.fta_codigo DESC;
--ACTIVIDAD AGREGAR EL NUEVO FLUJO(7-17)
INSERT INTO control_estados.flujos_tablas
(fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja)
VALUES(365, 1, '', 7, 17, 1, 0, 0, 0, '2024-05-09 18:57:05.209', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000');
--ACTIVIDAD AGREGAR EL NUEVO FLUJO(17-2)
INSERT INTO control_estados.flujos_tablas
(fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja)
VALUES(366, 1, '', 17, 2, 1, 0, 0, 0, '2024-05-09 18:57:05.209', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000');
--VIATICOS AGREGAR EL NUEVO FLUJO(7-17)
INSERT INTO control_estados.flujos_tablas
(fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja)
VALUES(367, 2, '', 7, 17, 1, 0, 0, 0, '2024-01-16 18:16:56.120', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000');
--VIATICOS AGREGAR EL NUEVO FLUJO(7-17)
INSERT INTO control_estados.flujos_tablas
(fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja)
VALUES(368, 2, '', 17, 2, 1, 0, 0, 0, '2024-01-16 18:16:56.120', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000');
--OBSERVAR FLUJOS
--ACTIVIDAD AGREGAR EL NUEVO FLUJO(17-4)
INSERT INTO control_estados.flujos_tablas
(fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja)
VALUES(369, 1, '', 17, 4, 1, 0, 0, 0, '2024-05-09 18:57:05.209', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000');
--VIATICOS AGREGAR EL NUEVO FLUJO(17-4)
INSERT INTO control_estados.flujos_tablas
(fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja)
VALUES(370, 2, '', 17, 4, 1, 0, 0, 0, '2024-01-16 18:16:56.120', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000');
--#######ESTADO GLOBAL
        SELECT
              t.poa_estado, po.pobj_estado, act.act_estado, avi.avi_estado
              ,COALESCE(COUNT(DISTINCT act.act_codigo), 0) AS cantidad_actividades
        FROM	estructura_poa.poas t
              LEFT JOIN estructura_poa.poas_objetivos po ON
                t.poa_codigo = po.poa_codigo
                AND po.pobj_estado IN (4,10,14,11,12,13,1,3,8,7,17,2,5)
              LEFT JOIN (
                SELECT	*
                FROM	estructura_poa.actividades act
                        LEFT JOIN estructura_organizacional.areas_unidades au ON act.aun_codigo_ejecutora = au.aun_codigo
                WHERE	TRUE
                    AND act.act_estado IN (4,10,14,11,12,13,1,3,8,7,17,2,5)
                    AND au.aun_estado NOT IN (9)
              ) act ON po.pobj_codigo = act.pobj_codigo
              LEFT JOIN estructura_poa.actividades_viaticos avi ON
                act.act_codigo = avi.act_codigo
                AND avi.avi_estado IN (4,10,14,11,12,13,1,3,8,7,17,2,5)
        WHERE TRUE
              AND t.poa_codigo IN (3)
        GROUP BY t.poa_estado, po.pobj_estado, act.act_estado, avi.avi_estado
        ORDER BY
          array_position( array[4,10,14,11,12,13,1,3,8,7,17,2,5], avi.avi_estado ),
          array_position( array[4,10,14,11,12,13,1,3,8,7,17,2,5], act.act_estado ),
          array_position( array[4,10,14,11,12,13,1,3,8,7,17,2,5], po.pobj_estado ),
          array_position( array[4,10,14,11,12,13,1,3,8,7,17,2,5], t.poa_estado )
        ;