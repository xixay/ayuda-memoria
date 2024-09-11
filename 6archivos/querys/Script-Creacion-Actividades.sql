SELECT 	*
--		ia.iac_codigo ,ia.iac_codigo_control, ia.iac_estado 
FROM 	ejecucion_actividades.inicios_actividades ia 
WHERE 	TRUE 
--		AND ia.iac_codigo_control LIKE 'LX%'
ORDER BY ia.iac_codigo DESC
;

----------- ADD COLUMN estructura_poa.poas -----------
ALTER TABLE estructura_poa.poas
ADD COLUMN poa_actualizado_conaud BOOLEAN DEFAULT FALSE;
COMMENT ON COLUMN estructura_poa.poas.poa_actualizado_conaud IS 'Valor para verificar si el registro de POA, fue actualizado o enviado a ejecución en sistema CONAUD';
----------- ADD FLUJOS estructura_poa.actividades RETIROS-----------
INSERT INTO control_estados.flujos_tablas (fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro) VALUES((select max(fta_codigo)+1 from control_estados.flujos_tablas), 2, '', 13, 45, 1, 0);
INSERT INTO control_estados.flujos_tablas (fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro) VALUES((select max(fta_codigo)+1 from control_estados.flujos_tablas), 2, '', 45, 14, 1, 0);
INSERT INTO control_estados.flujos_tablas (fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro) VALUES((select max(fta_codigo)+1 from control_estados.flujos_tablas), 2, '', 45, 9, 1, 0);


        SELECT
              t.ttr_codigo,
              t.ett_codigo,
              ett.ett_nombre,
              t.ttr_sigla,
              t.ttr_descripcion,
              CONCAT(t.ttr_sigla, ' - ', t.ttr_descripcion) AS ttr_sigla_descripcion,
              t.ttr_bandera_entidad_cge,
              t.ttr_estado,
              e.est_color,
              e.est_nombre AS ttr_estado_descripcion,
              TO_CHAR(t.fecha_registro, 'HH24:MI am dd/mm/yyyy') AS fecha_registro
        FROM  parametricas.tipos_trabajos t
              LEFT JOIN parametricas.estados e ON e.est_codigo = t.ttr_estado
              LEFT JOIN parametricas.clasificacion_tipos_trabajos ct ON ct.ttr_codigo = t.ttr_codigo
              LEFT JOIN parametricas.clasificaciones_areas_unidades ca ON ca.cau_codigo = ct.cau_codigo
              LEFT JOIN parametricas.especificacion_tipos_trabajo ett ON t.ett_codigo = ett.ett_codigo
        WHERE TRUE
              AND t.ttr_estado IN (1)
              AND ct.cau_codigo IN (2)
        ORDER BY t.fecha_registro DESC;
       
       
       
       
       
        SELECT
              t.ttr_codigo,
              t.ett_codigo,
              ett.ett_nombre,
              t.ttr_sigla,
              t.ttr_descripcion,
              CONCAT(t.ttr_sigla, ' - ', t.ttr_descripcion) AS ttr_sigla_descripcion,
              t.ttr_bandera_entidad_cge,
              t.ttr_estado,
              e.est_color,
              e.est_nombre AS ttr_estado_descripcion,
              TO_CHAR(t.fecha_registro, 'HH24:MI am dd/mm/yyyy') AS fecha_registro
        FROM  parametricas.tipos_trabajos t
              LEFT JOIN parametricas.estados e ON e.est_codigo = t.ttr_estado
              LEFT JOIN parametricas.clasificacion_tipos_trabajos ct ON ct.ttr_codigo = t.ttr_codigo
              LEFT JOIN parametricas.clasificaciones_areas_unidades ca ON ca.cau_codigo = ct.cau_codigo
              LEFT JOIN parametricas.especificacion_tipos_trabajo ett ON t.ett_codigo = ett.ett_codigo
        WHERE TRUE
              AND t.ttr_estado IN (1)
              AND ct.cau_codigo IN (2)
--              AND t.ett_codigo IN (2)
        ORDER BY t.fecha_registro DESC;

       
SELECT 	
		t.ttr_codigo,
        t.ett_codigo,
        t.ttr_sigla,
		t.ttr_descripcion,
		CONCAT(t.ttr_sigla, ' - ', t.ttr_descripcion) AS ttr_sigla_descripcion,
		t.ttr_bandera_entidad_cge,
  		t.ttr_estado,
  		e.est_color,
  		e.est_nombre AS ttr_estado_descripcion,
  		ct.ctt_codigo,
  		ct.ctt_descripcion,
  		cau.cau_codigo,
  		cau.cau_nombre,
  		ett.ett_codigo,
  		ett.ett_nombre 
FROM 	parametricas.tipos_trabajos t
		LEFT JOIN parametricas.estados e ON t.ttr_estado = e.est_codigo
		LEFT JOIN parametricas.clasificacion_tipos_trabajos ct ON t.ttr_codigo = ct.ttr_codigo 
		LEFT JOIN parametricas.clasificaciones_areas_unidades cau ON ct.cau_codigo = cau.cau_codigo 
		LEFT JOIN parametricas.especificacion_tipos_trabajo ett ON t.ett_codigo = ett.ett_codigo 
WHERE 	TRUE 
		AND t.ttr_estado IN (1)
--		AND ct.cau_codigo IN (2)
ORDER BY t.ett_codigo ASC
;

SELECT 	*
FROM 	ejecucion_actividades.inicios_actividades ia
WHERE 	TRUE 
--		AND ia.iac_codigo_control LIKE 'LX%'
ORDER BY ia.iac_codigo DESC
;
       

SELECT 	*
FROM 	estructura_poa.actividades a
ORDER BY a.act_codigo  DESC
;
       
       
