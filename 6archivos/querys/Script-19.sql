      SELECT  iac.*, ges.ges_anio
      FROM        ejecucion_actividades.inicios_actividades iac
              LEFT JOIN parametricas.gestiones ges ON iac.ges_codigo = ges.ges_codigo
      WHERE     TRUE
      AND iac.iac_estado IN (22)
--      AND iac.iac_codigo_control LIKE 'ALCP25M07'
;
--$$$$$$$$$$$$$$$$$$$$$$$$$$$
SELECT 	*
FROM 	ejecucion_actividades.inicios_actividades ia
WHERE 	TRUE
--		AND ia.iac_codigo_control LIKE 'ALCP25M07'
--		AND ia.iac_estado IN (22)
ORDER BY ia.iac_codigo DESC
;
--&&&&&&&&&&&&&&&&&&&&&&&&&&&
SELECT
		a.act_codigo, a.act_numero, a.iac_codigo_apoyo,a.act_descripcion, a.ttr_codigo, a.tipact_codigo, 
		tt.ttr_descripcion, ta.tipact_descripcion, ac.iac_codigo, ac.aco_estado 
FROM 	estructura_poa.actividades a 
		LEFT JOIN parametricas.tipos_trabajos tt ON a.ttr_codigo = tt.ttr_codigo
		LEFT JOIN parametricas.tipos_actividades ta ON a.tipact_codigo = ta.tipact_codigo
		LEFT JOIN estructura_poa.actividades_continuidad ac ON a.act_codigo = ac.act_codigo
WHERE 	a.fecha_registro::date = CURRENT_DATE
ORDER BY a.act_codigo DESC
;




SELECT 	*
FROM 	estructura_poa.actividades_continuidad ac ;

























