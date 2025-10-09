--ACTIVIDADES
select 	a.act_codigo , a.act_ejecucion_conaud, a.act_codigo_anterior ,a.act_numero ,a.cac_codigo ,a.iac_codigo_apoyo, a.act_estado, a.act_descripcion , a.aun_codigo_ejecutora, a.tipact_codigo, a.fecha_registro, a.ttr_codigo, 
		ett.ett_codigo, ett.ett_nombre, 
		au.aun_nombre, au.aun_sigla, au.aun_estado,
		po.pobj_codigo ,po.pobj_nombre, po.pobj_numero, po.pobj_estado,
		p.poa_codigo
--		oau.oau_codigo, oau.oau_descripcion ,oau.oau_estado 
from 	estructura_poa.actividades a
		left join parametricas.tipos_trabajos tt on a.ttr_codigo = tt.ttr_codigo
		left join parametricas.especificacion_tipos_trabajo ett on tt.ett_codigo = ett.ett_codigo 
		left join estructura_organizacional.areas_unidades au on a.aun_codigo_ejecutora = au.aun_codigo 
		left join estructura_poa.poas_objetivos po on a.pobj_codigo = po.pobj_codigo 
		left join estructura_poa.poas p on p.poa_codigo = po.poa_codigo
--		left join estructura_poa.objetivos_area_unidad oau on po.pobj_codigo = oau.pobj_codigo 
where	true 	
--		and a.act_numero = '520.0007.25.1.24'
		and a.act_numero = '510.0007.40.1.24'
--		and a.act_codigo in (14)
--		and a.act_codigo_anterior in (613,609,592,585,580,478,396,219,217,198)
--		and a.act_codigo_anterior in (396,219,217)
--		and au.aun_sigla like 'SCEP'
--		and a.act_estado not in (2,7,9,0,13)
--		and a.act_estado not in (9)
--		and a.iac_codigo_apoyo is not null
--		and a.tipact_codigo in (2)
--		and a.cac_codigo in (1)
--		and po.pobj_codigo in (1145)
--		and p.poa_codigo in (3)
--		and a.act_ejecucion_conaud in (true)
--		AND po.pobj_numero IN (25)
--order by au.aun_estado asc;
order by po.pobj_codigo desc;

SELECT 	*
FROM 	estructura_poa.actividades a
WHERE 	a.act_codigo = 3030
;

SELECT 	*
FROM 	estructura_poa.poas p 
;

SELECT 	*
FROM 	estructura_poa.area_unidad_responsables aur 
;

SELECT
      au.aun_codigo AS aun_codigo_ejecutora, au.aun_nombre, au.aun_sigla, au.cau_codigo, au.aun_numero,
      CONCAT(au.aun_nombre, ' - ', au.aun_sigla) AS nom_ejecutora,
      au.aun_reporte_habilitado,
      COALESCE(
        ARRAY_AGG(
          DISTINCT aur.rol_codigo ORDER BY aur.rol_codigo ASC
        ) FILTER (WHERE aur.per_codigo = 1914),
        '{}'
      ) AS roles,
      COUNT(DISTINCT aur.rol_codigo) AS cantidad_roles
FROM	estructura_poa.area_unidad_responsables aur
      LEFT JOIN estructura_organizacional.areas_unidades au ON aur.aun_codigo_ejecutora = au.aun_codigo
WHERE	aur.aur_estado != 0 -- ESTADO ROL-RESPONSABLE
      AND au.aun_estado IN (2) -- ESTADO AREA-UNIDAD (CONSOLIDADO)
      AND aur.rol_codigo IN (1,2,3,4) -- ROL SELECCIONADO
      AND aur.poa_codigo IN (3) -- POA SELECCIONADO
      --AND au.aun_codigo IN (8)
      -- PER_CODIGO SELECCIONADO
GROUP BY au.aun_codigo, au.aun_nombre, au.aun_sigla, au.cau_codigo, au.aun_numero, au.aun_reporte_habilitado
ORDER BY au.aun_sigla ASC, au.aun_nombre ASC
;





