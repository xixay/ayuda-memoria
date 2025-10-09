  --
  SELECT 
    DISTINCT
    t.ges_codigo,
    t.ges_anio,
    t.ges_descripcion, 
    t.ges_estado, 
    e.est_color, 
    e.est_nombre AS ges_estado_descripcion,
    TO_CHAR(t.fecha_registro, 'HH24:MI am dd/mm/yyyy') as fecha_registro
  FROM parametricas.gestiones t
  LEFT JOIN parametricas.estados e ON e.est_codigo = t.ges_estado
  INNER JOIN estructura_organizacional.gestiones_organigramas go2 ON go2.ges_codigo  = t.ges_codigo
  WHERE TRUE
  --${query.ges_codigo ? `AND t.ges_codigo IN ${query.ges_codigo}` : ''}
  --	${query.ges_estado ? `AND t.ges_estado IN ${query.ges_estado}` : ''}
  ORDER BY t.ges_anio ASC;
  --
 SELECT *
 FROM 	estructura_poa.area_unidad_responsables aur 
 WHERE 	aur.aun_codigo_ejecutora IN (17)
		AND aur.per_codigo IN (190);--3461
	

SELECT *
FROM 	estructura_organizacional.areas_unidades au 
WHERE 	au.aun_sigla = 'GDC';

SELECT 	*
FROM 	parametricas.tipos_trabajos tt
WHERE 	tt.ett_codigo IN (5);
SELECT 	*
FROM 	parametricas.especificacion_tipos_trabajo ett;
SELECT 	*
FROM 	parametricas.hitos_rutas_criticas hrc
ORDER BY hrc.hrc_codigo ASC;

SELECT 
          t.hrc_codigo, 
          t.hrc_nombre, 
          t.hrc_descripcion,
          t.ttr_codigo,
          tt.ttr_descripcion,
          t.hrc_estado,
          e.est_color, 
          e.est_nombre AS hrc_estado_descripcion,
          TO_CHAR(t.fecha_registro, 'HH24:MI am dd/mm/yyyy') as fecha_registro  
        FROM parametricas.hitos_rutas_criticas t
        LEFT JOIN parametricas.estados e ON e.est_codigo = t.hrc_estado
        LEFT JOIN parametricas.tipos_trabajos tt ON tt.ttr_codigo = t.ttr_codigo
        WHERE TRUE
        AND t.ttr_codigo IN (9)
        AND t.hrc_estado IN (1)
        ORDER BY t.hrc_codigo ASC;
SELECT 
  		* 
FROM 	parametricas.hitos_rutas_criticas t
		LEFT JOIN parametricas.estados e ON e.est_codigo = t.hrc_estado
		LEFT JOIN parametricas.tipos_trabajos tt ON tt.ttr_codigo = t.ttr_codigo
		LEFT JOIN parametricas.especificacion_tipos_trabajo ett ON tt.ett_codigo = ett.ett_codigo 
WHERE TRUE
--      AND t.ttr_codigo IN (9)
		AND ett.ett_codigo IN (5)
		AND t.hrc_estado IN (1)
ORDER BY t.hrc_codigo ASC;
-----------------------------------
INSERT INTO parametricas.tipos_trabajos
(ttr_codigo, ttr_sigla, ttr_descripcion, ttr_bandera_entidad_cge, ett_codigo, ttr_estado, usuario_registro, ttr_inicial)
VALUES(80, 'HRC-EVALUACION', 'HRC-EVALUACION', TRUE, 5, 1, 1914, '');

INSERT INTO parametricas.hitos_rutas_criticas (hrc_codigo, hrc_nombre, hrc_descripcion, ttr_codigo, hrc_estado, usuario_registro) VALUES((SELECT MAX(hrc_codigo) + 1 FROM parametricas.hitos_rutas_criticas), 'Planificación', '', 80, 1, 0);
INSERT INTO parametricas.hitos_rutas_criticas (hrc_codigo, hrc_nombre, hrc_descripcion, ttr_codigo, hrc_estado, usuario_registro) VALUES((SELECT MAX(hrc_codigo) + 1 FROM parametricas.hitos_rutas_criticas), 'Inicio de la evaluación', '', 80, 1, 0);
INSERT INTO parametricas.hitos_rutas_criticas (hrc_codigo, hrc_nombre, hrc_descripcion, ttr_codigo, hrc_estado, usuario_registro) VALUES((SELECT MAX(hrc_codigo) + 1 FROM parametricas.hitos_rutas_criticas), 'Elaboración de informe borrador de evaluación', '', 80, 1, 0);
INSERT INTO parametricas.hitos_rutas_criticas (hrc_codigo, hrc_nombre, hrc_descripcion, ttr_codigo, hrc_estado, usuario_registro) VALUES((SELECT MAX(hrc_codigo) + 1 FROM parametricas.hitos_rutas_criticas), 'Apoyo en la evaluación (técnico o legal) según corresponda', '', 80, 1, 0);
INSERT INTO parametricas.hitos_rutas_criticas (hrc_codigo, hrc_nombre, hrc_descripcion, ttr_codigo, hrc_estado, usuario_registro) VALUES((SELECT MAX(hrc_codigo) + 1 FROM parametricas.hitos_rutas_criticas), 'Aprobación del Informe por el Gerente Departamental o remisión a la SCGM', '', 80, 1, 0);
INSERT INTO parametricas.hitos_rutas_criticas (hrc_codigo, hrc_nombre, hrc_descripcion, ttr_codigo, hrc_estado, usuario_registro) VALUES((SELECT MAX(hrc_codigo) + 1 FROM parametricas.hitos_rutas_criticas), 'Consideración del informe en la SCSL para informes con indicios de responsabilidad civil', '', 80, 1, 0);
INSERT INTO parametricas.hitos_rutas_criticas (hrc_codigo, hrc_nombre, hrc_descripcion, ttr_codigo, hrc_estado, usuario_registro) VALUES((SELECT MAX(hrc_codigo) + 1 FROM parametricas.hitos_rutas_criticas), 'Aprobación del informe inspeccionado', '', 80, 1, 0);
INSERT INTO parametricas.hitos_rutas_criticas (hrc_codigo, hrc_nombre, hrc_descripcion, ttr_codigo, hrc_estado, usuario_registro) VALUES((SELECT MAX(hrc_codigo) + 1 FROM parametricas.hitos_rutas_criticas), 'Finalización del proceso de emisión final de los informes', '', 80, 1, 0);
INSERT INTO parametricas.hitos_rutas_criticas (hrc_codigo, hrc_nombre, hrc_descripcion, ttr_codigo, hrc_estado, usuario_registro) VALUES((SELECT MAX(hrc_codigo) + 1 FROM parametricas.hitos_rutas_criticas), 'Recepción de los informes concluidos para entregar a la entidad', '', 80, 1, 0);
 
 
 
SELECT	*
FROM	ejecucion_poa.asignaciones_horas_usadas ahu ;
SELECT 	*
FROM 	ejecucion_poa.asignaciones_cargos_item aci ;
--
SELECT 	iu.iua_codigo,iu.iua_cite,iu.iua_estado 
FROM 	ejecucion_informes.informes_uai iu
WHERE 	iu.act_codigo IN (1537)
;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 