--ADMINISTRACION ACP
SELECT 	
		oau.oau_codigo,oau_descripcion,oau.aun_codigo_ejecutora, oau.oau_estado,
		au.aun_sigla, 
		po.pobj_codigo, po.pobj_estado
FROM 	estructura_poa.objetivos_area_unidad oau
		LEFT JOIN estructura_organizacional.areas_unidades au ON oau.aun_codigo_ejecutora = au.aun_codigo 
		LEFT JOIN estructura_poa.poas_objetivos po ON oau.pobj_codigo = po.pobj_codigo
WHERE 	TRUE
--		AND oau.pobj_codigo IN (1067)
ORDER BY oau.oau_codigo DESC
;

--HISTORIAL
SELECT 	*
FROM 	control_estados.estados_objetivos_area_unidad eoau
WHERE 	TRUE
		AND eoau.oau_codigo IN (2675)
--		AND eoau.eoau_estado IN (1)
ORDER BY eoau.eoau_codigo DESC
;
--ACTIVIDAD
SELECT 	
		a.act_codigo, a.act_numero, a.act_estado, a.act_descripcion, a.act_justificacion,
		au1.aun_sigla AS aun_sigla_ejecutora, au1.aun_inicial AS aun_inicial_ejecutora,
		au2.aun_sigla AS aun_sigla_supervisora, au2.aun_inicial AS aun_inicial_supervisora,
		a.iac_codigo_apoyo 
FROM 	estructura_poa.actividades a
		LEFT JOIN estructura_organizacional.areas_unidades au1 ON a.aun_codigo_ejecutora = au1.aun_codigo
		LEFT JOIN estructura_organizacional.areas_unidades au2 ON a.aun_codigo_supervisora = au2.aun_codigo
WHERE 	TRUE
--		AND a.act_codigo IN (4789)
ORDER BY a.act_codigo DESC
;
SELECT 	*
FROM 	estructura_poa.actividades a 
WHERE 	a.act_codigo IN (4765)
;
--INICIO DE ACTIVIDAD
SELECT 	*
FROM 	ejecucion_actividades.inicios_actividades ia 
ORDER BY ia.iac_codigo DESC
;
--ACTIVIDAD CONTINUIDAD
SELECT 	*
FROM 	estructura_poa.actividades_continuidad ac 
ORDER BY ac.aco_codigo DESC
;
--INICIO ACTIVIDAD POA
SELECT 	*
FROM 	ejecucion_actividades.inicio_actividad_poa iap
ORDER BY iap.iap_codigo DESC
;
--AREAS UNIDADES
SELECT 	au.aun_codigo ,au.aun_nombre ,au.aun_sigla ,au.aun_inicial 
FROM 	estructura_organizacional.areas_unidades au
WHERE 	TRUE
		AND au.aun_sigla LIKE 'SCGD'
;
-- ESTADOS
SELECT 	*
FROM 	parametricas.estados e
;
--FLUJOS
SELECT 	*
FROM 	control_estados.flujos_tablas ft
WHERE 	ft.tab_codigo IN (1)
;


SELECT 	oau.oau_codigo ,oau.oau_estado ,oau.aun_codigo_ejecutora ,oau.aun_codigo_supervisora 
FROM 	estructura_poa.objetivos_area_unidad oau 
WHERE 	oau.pobj_codigo IN (1365)
;

SELECT 	*
FROM 	estructura_poa.poas_objetivos po 
WHERE 	po.pobj_codigo IN (1365)
;

SELECT 	*
FROM 	estructura_poa.actividades a 
;

SELECT 	*
FROM 	parametricas.tipo_areas ta 
;
/*
Autor: Richard Teran Funez
Fecha: 16/10/2024
Descripcion: Tabla para registro de movimiento de horas
*/
-- object: estructura_poa.tipo_movimientos_horas | type: TABLE --
DROP TABLE IF EXISTS parametricas.tipo_movimientos_horas CASCADE;
CREATE TABLE parametricas.tipo_movimientos_horas (
    tmh_codigo integer NOT NULL,
    tmh_descripcion varchar,
    tmh_estado integer NOT NULL DEFAULT 1,
    usuario_registro integer NOT NULL,
    usuario_modificacion integer NOT NULL DEFAULT 0,
    usuario_baja integer NOT NULL DEFAULT 0,
    fecha_registro timestamp NOT NULL DEFAULT (now())::timestamp without time zone,
    fecha_modificacion timestamp NOT NULL DEFAULT '1900-01-01 00:00:00'::timestamp without time zone,
    fecha_baja timestamp NOT NULL DEFAULT '1900-01-01 00:00:00'::timestamp without time zone,
    CONSTRAINT actividades_movimientos_horas_pkey PRIMARY KEY (tmh_codigo)
);
-- ddl-end --
COMMENT ON TABLE parametricas.tipo_movimientos_horas IS E'Registra el tipo de movimiento de horas';
-- ddl-end --
COMMENT ON COLUMN parametricas.tipo_movimientos_horas.tmh_codigo IS E'Identificador primario, generado por el <sistema>';
-- ddl-end --
COMMENT ON COLUMN parametricas.tipo_movimientos_horas.tmh_descripcion IS E'Registra descripcion, Ej: F21, F24';
-- ddl-end --
COMMENT ON COLUMN parametricas.tipo_movimientos_horas.tmh_estado IS E'Identificador referencial tabla <parametricas.estados>';
-- ddl-end --
COMMENT ON COLUMN parametricas.tipo_movimientos_horas.usuario_registro IS E'Identificador referencial, es el per_codigo del sistema de autenticacion para el registro';
-- ddl-end --
COMMENT ON COLUMN parametricas.tipo_movimientos_horas.usuario_modificacion IS E'Identificador referencial, es el per_codigo del sistema de autenticacion para la modificacion';
-- ddl-end --
COMMENT ON COLUMN parametricas.tipo_movimientos_horas.usuario_baja IS E'Identificador referencial, es el per_codigo del sistema de autenticacion para la baja logica';
-- ddl-end --
COMMENT ON COLUMN parametricas.tipo_movimientos_horas.fecha_registro IS E'Fecha registro';
-- ddl-end --
COMMENT ON COLUMN parametricas.tipo_movimientos_horas.fecha_modificacion IS E'Fecha modificacion';
-- ddl-end --
COMMENT ON COLUMN parametricas.tipo_movimientos_horas.fecha_baja IS E'Fecha baja';
-- ddl-end --
ALTER TABLE parametricas.tipo_movimientos_horas OWNER TO postgres;
-- ddl-end --

-- object: estado_fk | type: CONSTRAINT --
-- ALTER TABLE parametricas.tipo_movimientos_horas DROP CONSTRAINT IF EXISTS estado_fk CASCADE;
ALTER TABLE parametricas.tipo_movimientos_horas ADD CONSTRAINT estado_fk FOREIGN KEY (tmh_estado)
REFERENCES parametricas.estados (est_codigo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: "grant_rawdDxt_4c137bd291" | type: PERMISSION --
GRANT SELECT,INSERT,UPDATE,DELETE,TRUNCATE,REFERENCES,TRIGGER
ON TABLE parametricas.tipo_movimientos_horas
TO postgres;

-- object: estructura_poa.actividades_movimientos_horas | type: TABLE --
DROP TABLE IF EXISTS estructura_poa.actividades_movimientos_horas CASCADE;
CREATE TABLE estructura_poa.actividades_movimientos_horas (
    amh_codigo integer NOT NULL,
    act_codigo_adicion integer NOT NULL,
    act_codigo_disminucion integer NOT NULL,
    amh_horas integer NOT NULL DEFAULT 0,
    tmh_codigo integer NOT NULL,
    amh_estado integer NOT NULL DEFAULT 1,
    usuario_registro integer NOT NULL,
    usuario_modificacion integer NOT NULL DEFAULT 0,
    usuario_baja integer NOT NULL DEFAULT 0,
    fecha_registro timestamp NOT NULL DEFAULT (now())::timestamp without time zone,
    fecha_modificacion timestamp NOT NULL DEFAULT '1900-01-01 00:00:00'::timestamp without time zone,
    fecha_baja timestamp NOT NULL DEFAULT '1900-01-01 00:00:00'::timestamp without time zone,
    CONSTRAINT actividades_movimientos_horas_pkey PRIMARY KEY (amh_codigo)
);
-- ddl-end --
COMMENT ON TABLE estructura_poa.actividades_movimientos_horas IS E'Registra la cantidad de horas disponibles';
-- ddl-end --
COMMENT ON COLUMN estructura_poa.actividades_movimientos_horas.amh_codigo IS E'Identificador primario, generado por el <sistema>';
-- ddl-end --
COMMENT ON COLUMN estructura_poa.actividades_movimientos_horas.act_codigo_adicion IS E'Identificador referencial tabla <estructura_poa.actividades>, se registra la actividad a la cual se le adicionara horas';
-- ddl-end --
COMMENT ON COLUMN estructura_poa.actividades_movimientos_horas.act_codigo_disminucion IS E'Identificador referencial tabla <estructura_poa.actividades>, se registra la actividad a la cual se le adicionara horas';
-- ddl-end --
COMMENT ON COLUMN estructura_poa.actividades_movimientos_horas.amh_horas IS E'Calculo de horas disponibles, para una actividad';
-- ddl-end --
COMMENT ON COLUMN estructura_poa.actividades_movimientos_horas.tmh_codigo IS E'Identificador referencial tabla <parametricas.tipo_movimientos_horas>, se registra el tipo de movimiento de horas de la actividad';
-- ddl-end --
COMMENT ON COLUMN estructura_poa.actividades_movimientos_horas.amh_estado IS E'Identificador referencial tabla <parametricas.estados>';
-- ddl-end --
COMMENT ON COLUMN estructura_poa.actividades_movimientos_horas.usuario_registro IS E'Identificador referencial, es el per_codigo del sistema de autenticacion para el registro';
-- ddl-end --
COMMENT ON COLUMN estructura_poa.actividades_movimientos_horas.usuario_modificacion IS E'Identificador referencial, es el per_codigo del sistema de autenticacion para la modificacion';
-- ddl-end --
COMMENT ON COLUMN estructura_poa.actividades_movimientos_horas.usuario_baja IS E'Identificador referencial, es el per_codigo del sistema de autenticacion para la baja logica';
-- ddl-end --
COMMENT ON COLUMN estructura_poa.actividades_movimientos_horas.fecha_registro IS E'Fecha registro';
-- ddl-end --
COMMENT ON COLUMN estructura_poa.actividades_movimientos_horas.fecha_modificacion IS E'Fecha modificacion';
-- ddl-end --
COMMENT ON COLUMN estructura_poa.actividades_movimientos_horas.fecha_baja IS E'Fecha baja';
-- ddl-end --
ALTER TABLE estructura_poa.actividades_movimientos_horas OWNER TO postgres;
-- ddl-end --

-- object: fk_act_codigo_adicion | type: CONSTRAINT --
-- ALTER TABLE estructura_poa.actividades_movimientos_horas DROP CONSTRAINT IF EXISTS fk_act_codigo_adicion CASCADE;
ALTER TABLE estructura_poa.actividades_movimientos_horas ADD CONSTRAINT fk_act_codigo_adicion FOREIGN KEY (act_codigo_adicion)
REFERENCES estructura_poa.actividades (act_codigo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_fk_act_codigo_disminucion | type: CONSTRAINT --
-- ALTER TABLE estructura_poa.actividades_movimientos_horas DROP CONSTRAINT IF EXISTS fk_act_codigo_disminucion CASCADE;
ALTER TABLE estructura_poa.actividades_movimientos_horas ADD CONSTRAINT fk_act_codigo_disminucion FOREIGN KEY (act_codigo_disminucion)
REFERENCES estructura_poa.actividades (act_codigo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_tmh_codigo | type: CONSTRAINT --
-- ALTER TABLE estructura_poa.actividades_movimientos_horas DROP CONSTRAINT IF EXISTS fk_tmh_codigo CASCADE;
ALTER TABLE estructura_poa.actividades_movimientos_horas ADD CONSTRAINT fk_tmh_codigo FOREIGN KEY (tmh_codigo)
REFERENCES parametricas.tipo_movimientos_horas (tmh_codigo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: estado_fk | type: CONSTRAINT --
-- ALTER TABLE estructura_poa.actividades_movimientos_horas DROP CONSTRAINT IF EXISTS estado_fk CASCADE;
ALTER TABLE estructura_poa.actividades_movimientos_horas ADD CONSTRAINT estado_fk FOREIGN KEY (amh_estado)
REFERENCES parametricas.estados (est_codigo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: "grant_rawdDxt_4c137bd291" | type: PERMISSION --
GRANT SELECT,INSERT,UPDATE,DELETE,TRUNCATE,REFERENCES,TRIGGER
ON TABLE estructura_poa.actividades_movimientos_horas
TO postgres;
--
SELECT 	*
FROM 	parametricas.tipo_movimientos_horas;

INSERT INTO parametricas.tipo_movimientos_horas
(tmh_codigo, tmh_descripcion, usuario_registro)
VALUES(1, 'F21', 0);

INSERT INTO parametricas.tipo_movimientos_horas
(tmh_codigo, tmh_descripcion, usuario_registro)
VALUES(2, 'F26', 0);

INSERT INTO parametricas.tipo_movimientos_horas
(tmh_codigo, tmh_descripcion, usuario_registro)
VALUES(3, 'F21-F24', 0);

INSERT INTO parametricas.tipo_movimientos_horas
(tmh_codigo, tmh_descripcion, usuario_registro)
VALUES(4, 'F26-F24', 0);

INSERT INTO parametricas.tipo_movimientos_horas
(tmh_codigo, tmh_descripcion, usuario_registro)
VALUES(5, 'F24', 0);

SELECT 	*
FROM 	estructura_poa.actividades_movimientos_horas;

INSERT INTO estructura_poa.actividades_movimientos_horas
(amh_codigo, act_codigo_adicion, act_codigo_disminucion, amh_horas, tmh_codigo, amh_estado, usuario_registro)
VALUES(1, 4787, 2606, 950, 1, 1, 0);

INSERT INTO estructura_poa.actividades_bolsas
(amh_codigo, act_codigo, abo_suma_horas_planificadas, abo_horas_auditorias, abo_horas_evaluaciones, abo_horas_disponibles_comision, act_codigo_bolsa, abo_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja)
VALUES(1, 4787, 1454, 120, 0, 954, 2606, 1, 1954, 1954, 1954, now()::timestamp without time zone, '1900-01-01 00:00:00'::timestamp without time zone, '1900-01-01 00:00:00'::timestamp without time zone);

INSERT INTO estructura_poa.actividades_bolsas
(abo_codigo, act_codigo, abo_suma_horas_planificadas, abo_horas_auditorias, abo_horas_evaluaciones, abo_horas_disponibles_comision, act_codigo_bolsa, abo_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja)
VALUES(2, 4793, 1454, 0, 0, 954, 2606, 1, 1954, 1954, 1954, now()::timestamp without time zone, '1900-01-01 00:00:00'::timestamp without time zone, '1900-01-01 00:00:00'::timestamp without time zone);


INSERT INTO estructura_poa.actividades_bolsas
(abo_codigo, act_codigo, abo_suma_horas_planificadas, abo_horas_auditorias, abo_horas_evaluaciones, abo_horas_disponibles_comision, act_codigo_bolsa, abo_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja)
VALUES(3, 4787, 1000, 50, 0, 700, 2605, 1, 1954, 1954, 1954, '2024-10-15 17:24:26.217', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000');

SELECT 	*
FROM 	estructura_poa.actividades_bolsas ab 
;

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
              t.act_horas_real, -- ADICIONADO HORAS REALES SI TIENE BOLSA
              t.act_estado,
              t.act_no_planificado,
              t.act_codigo_anterior,
              t.act_codigo_bolsa,
              --fo.for_codigo, -- COMENTADO PORQUE YA NO SE UTILIZARA LA RELACIÓN
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
              tt.ttr_descripcion,
              ett.ett_nombre,
              t.ume_codigo,
              um.ume_descripcion,
              CONCAT_WS(' - ', um.ume_sigla, t.act_cantidad)AS ume_sigla_act_indicador,
              t.ent_codigo,
              t.ent_descripcion,
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
              t.act_ejecucion_conaud,
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
              aune.cau_codigo,
              t.act_codigo,
              t.caa_codigo,
              caa.caa_nombre,
              t.cfa_codigo,
              cfa.cfa_nombre,
              t.cga_codigo,
              cga.cga_nombre,
              t.cca_codigo,
              cca.cca_nombre
        FROM  (
                SELECT  act.*, act.act_horas_planificadas - COALESCE(SUM(actbolsa.act_horas_planificadas), 0) AS act_horas_real
                FROM  estructura_poa.actividades act
                      LEFT JOIN estructura_poa.actividades actbolsa ON act.act_codigo = actbolsa.act_codigo_bolsa AND actbolsa.act_estado NOT IN (0, 9, 46, 47)
                WHERE   TRUE
                GROUP BY act.act_codigo
              ) t ------------ ADICIONADO PARA CASOS DE ACTIVIDADES CON ACTIVIDADES BOLSA
              LEFT JOIN parametricas.estados e ON e.est_codigo = t.act_estado
              LEFT JOIN parametricas.unidades_medidas um ON t.ume_codigo = um.ume_codigo
              LEFT JOIN parametricas.tipos_actividades ta ON t.tipact_codigo = ta.tipact_codigo
              LEFT JOIN parametricas.clasificacion_actividades ca ON t.cac_codigo = ca.cac_codigo
              LEFT JOIN parametricas.sector se ON t.sec_codigo = se.sec_codigo
              LEFT JOIN parametricas.tipos_trabajos tt ON t.ttr_codigo = tt.ttr_codigo
              LEFT JOIN parametricas.especificacion_tipos_trabajo ett ON tt.ett_codigo = ett.ett_codigo
              LEFT JOIN parametricas.clasificacion_auditoria_actividad caa ON t.caa_codigo = caa.caa_codigo
              LEFT JOIN parametricas.clasificacion_funcion_actividad cfa ON t.cfa_codigo = cfa.cfa_codigo
              LEFT JOIN parametricas.clasificacion_grupo_actividad cga ON t.cga_codigo = cga.cga_codigo
              LEFT JOIN parametricas.clasificacion_control_actividad cca ON t.cca_codigo = cca.cca_codigo
              LEFT JOIN estructura_organizacional.areas_unidades aune ON t.aun_codigo_ejecutora = aune.aun_codigo
              LEFT JOIN estructura_organizacional.areas_unidades auns ON t.aun_codigo_supervisora = auns.aun_codigo
              LEFT JOIN estructura_poa.actividades_viaticos actv ON t.act_codigo = actv.avi_codigo
              LEFT JOIN estructura_poa.actividades_apoyo aa ON t.act_codigo = aa.act_codigo AND aa.aap_estado = 1
              LEFT JOIN estructura_poa.poas_objetivos pobj ON t.pobj_codigo = pobj.pobj_codigo
              LEFT JOIN pei.programas pr ON pobj.pro_codigo = pr.pro_codigo
              LEFT JOIN estructura_poa.poas po ON pobj.poa_codigo = po.poa_codigo
              LEFT JOIN parametricas.gestiones ge ON po.ges_codigo = ge.ges_codigo
              LEFT JOIN ejecucion_actividades.inicios_actividades ia ON t.iac_codigo_apoyo = ia.iac_codigo
              LEFT JOIN parametricas.gestiones ge2 ON ge2.ges_codigo = ia.ges_codigo
        WHERE TRUE
              AND t.pobj_codigo IN (831)
              AND t.cac_codigo IN (2)
              AND t.aun_codigo_ejecutora IN (27) -- PARA FILTRO DE AREA UNIDAD EJECUTORA VIA ACTIVIDAD
               -- PARA FILTRO DE AREA UNIDAD EJECUTORA QUE NO ESTE EN ESTADO 9
        ORDER BY t.act_codigo DESC
        ;
       
SELECT 	*
FROM 	estructura_organizacional.areas_unidades au 
WHERE 	au.aun_codigo IN (27)
;
SELECT 	*
FROM 	estructura_poa.actividades a 
WHERE 	TRUE 
--		AND a.act_codigo IN (2606)
--		AND a.act_codigo IN (4787)
ORDER BY a.act_codigo DESC  
;
SELECT 	*
FROM 	ejecucion_actividades.inicio_actividad_poa iap 
WHERE 	iap.act_codigo IN (4787)
;

        WITH tmp_actividad AS (
          SELECT
                a.act_codigo_bolsa, SUM(a.act_horas_planificadas) AS suma_horas,
                COALESCE(SUM(inicio_auditoria.horas_auditorias), 0) AS horas_auditorias,
                COALESCE(SUM(inicio_evaluacion.horas_evaluaciones), 0) AS horas_evaluaciones,
                COALESCE(SUM(inicio_auditoria.horas_auditorias), 0) + COALESCE(SUM(inicio_evaluacion.horas_evaluaciones), 0) AS horas_comision
          FROM  estructura_poa.actividades a
                LEFT JOIN (
                  SELECT        iap.act_codigo, SUM(aci.aci_horas) AS horas_auditorias
                  FROM  ejecucion_actividades.inicio_actividad_poa iap
                        LEFT JOIN ejecucion_actividades.inicio_actividad_poa_asignaciones iapa ON iap.iap_codigo = iapa.iap_codigo
                        LEFT JOIN ejecucion_poa.asignaciones_cargos_item aci ON iapa.asi_codigo = aci.asi_codigo AND aci.aci_estado NOT IN (0,5,9)
                  WHERE TRUE
                        AND iap.iap_estado NOT IN (0,5,9)
                  GROUP BY iap.act_codigo
                  ORDER BY iap.act_codigo
                ) inicio_auditoria ON a.act_codigo = inicio_auditoria.act_codigo
                LEFT JOIN (
                  SELECT        iu.act_codigo, SUM(aci.aci_horas) AS horas_evaluaciones
                  FROM  ejecucion_informes.informes_uai iu
                        LEFT JOIN ejecucion_informes.inicio_evaluacion_informe iei ON iu.iua_codigo = iei.iua_codigo AND iei.iei_estado NOT IN (0,5,9)
                        LEFT JOIN ejecucion_informes.inicio_evaluacion_informe_asignaciones ieia ON iei.iei_codigo = ieia.iei_codigo
                        LEFT JOIN ejecucion_poa.asignaciones_cargos_item aci ON ieia.asi_codigo = aci.asi_codigo AND aci.aci_estado NOT IN (0,5,9)
                  WHERE TRUE
                        AND iu.iua_estado NOT IN (0,5,9)
                  GROUP BY iu.act_codigo
                  ORDER BY iu.act_codigo
                ) inicio_evaluacion ON a.act_codigo = inicio_evaluacion.act_codigo
          WHERE TRUE
                AND a.act_codigo_bolsa IN (2606)
                AND a.act_estado IN (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18)
          GROUP BY a.act_codigo_bolsa
        )
--        SELECT * FROM tmp_actividad;
        SELECT
              t.act_codigo,
              t.act_numero,
              t.act_descripcion,
              t.act_horas_planificadas AS horas_iniciales,
              COALESCE(ta.suma_horas, 0)::INT AS suma_horas,
              (COALESCE(t.act_horas_planificadas, 0) - COALESCE(ta.suma_horas, 0))::INT AS horas_disponibles,
              (COALESCE(t.act_horas_planificadas, 0) - COALESCE(ta.horas_comision, 0))::INT AS horas_disponibles_comision,
              au.aun_sigla
        FROM    estructura_poa.actividades t
              LEFT JOIN estructura_organizacional.areas_unidades au ON t.aun_codigo_ejecutora = au.aun_codigo
              LEFT JOIN tmp_actividad ta on ta.act_codigo_bolsa = t.act_codigo
        WHERE   TRUE
              AND t.act_codigo IN (2606)
              AND t.act_estado IN (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18)
        ;    
       
       

--Subconsulta inicio_auditoria
--Primero, podemos probar la subconsulta que calcula las horas de auditoría:
SELECT 
    iap.act_codigo, 
    SUM(aci.aci_horas) AS horas_auditorias
FROM ejecucion_actividades.inicio_actividad_poa iap
LEFT JOIN ejecucion_actividades.inicio_actividad_poa_asignaciones iapa ON iap.iap_codigo = iapa.iap_codigo
LEFT JOIN ejecucion_poa.asignaciones_cargos_item aci ON iapa.asi_codigo = aci.asi_codigo AND aci.aci_estado NOT IN (0, 5, 9)
WHERE iap.iap_estado NOT IN (0, 5, 9)
GROUP BY iap.act_codigo
ORDER BY iap.act_codigo;
--Subconsulta inicio_evaluacion
--Luego, prueba la subconsulta que calcula las horas de evaluación:
SELECT 
    iu.act_codigo, 
    SUM(aci.aci_horas) AS horas_evaluaciones
FROM ejecucion_informes.informes_uai iu
LEFT JOIN ejecucion_informes.inicio_evaluacion_informe iei ON iu.iua_codigo = iei.iua_codigo AND iei.iei_estado NOT IN (0, 5, 9)
LEFT JOIN ejecucion_informes.inicio_evaluacion_informe_asignaciones ieia ON iei.iei_codigo = ieia.iei_codigo
LEFT JOIN ejecucion_poa.asignaciones_cargos_item aci ON ieia.asi_codigo = aci.asi_codigo AND aci.aci_estado NOT IN (0, 5, 9)
WHERE iu.iua_estado NOT IN (0, 5, 9)
GROUP BY iu.act_codigo
ORDER BY iu.act_codigo;
--Subconsulta con tmp_actividad
--Después de probar ambas subconsultas, podemos ver cómo se combinan para crear la tabla temporal tmp_actividad. Ahora podemos probar la consulta que une ambas subconsultas con la tabla de actividades:
WITH tmp_actividad AS (
    SELECT
        a.act_codigo_bolsa,
        SUM(a.act_horas_planificadas) AS suma_horas,
        COALESCE(SUM(inicio_auditoria.horas_auditorias), 0) AS horas_auditorias,
        COALESCE(SUM(inicio_evaluacion.horas_evaluaciones), 0) AS horas_evaluaciones,
        COALESCE(SUM(inicio_auditoria.horas_auditorias), 0) + COALESCE(SUM(inicio_evaluacion.horas_evaluaciones), 0) AS horas_comision
    FROM estructura_poa.actividades a
    LEFT JOIN (
        SELECT 
            iap.act_codigo, 
            SUM(aci.aci_horas) AS horas_auditorias
        FROM ejecucion_actividades.inicio_actividad_poa iap
        LEFT JOIN ejecucion_actividades.inicio_actividad_poa_asignaciones iapa ON iap.iap_codigo = iapa.iap_codigo
        LEFT JOIN ejecucion_poa.asignaciones_cargos_item aci ON iapa.asi_codigo = aci.asi_codigo AND aci.aci_estado NOT IN (0, 5, 9)
        WHERE iap.iap_estado NOT IN (0, 5, 9)
        GROUP BY iap.act_codigo
        ORDER BY iap.act_codigo
    ) inicio_auditoria ON a.act_codigo = inicio_auditoria.act_codigo
    LEFT JOIN (
        SELECT 
            iu.act_codigo, 
            SUM(aci.aci_horas) AS horas_evaluaciones
        FROM ejecucion_informes.informes_uai iu
        LEFT JOIN ejecucion_informes.inicio_evaluacion_informe iei ON iu.iua_codigo = iei.iua_codigo AND iei.iei_estado NOT IN (0, 5, 9)
        LEFT JOIN ejecucion_informes.inicio_evaluacion_informe_asignaciones ieia ON iei.iei_codigo = ieia.iei_codigo
        LEFT JOIN ejecucion_poa.asignaciones_cargos_item aci ON ieia.asi_codigo = aci.asi_codigo AND aci.aci_estado NOT IN (0, 5, 9)
        WHERE iu.iua_estado NOT IN (0, 5, 9)
        GROUP BY iu.act_codigo
        ORDER BY iu.act_codigo
    ) inicio_evaluacion ON a.act_codigo = inicio_evaluacion.act_codigo
    WHERE a.act_codigo_bolsa IN (2606)
    AND a.act_estado IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18)
    GROUP BY a.act_codigo_bolsa
)
SELECT * FROM tmp_actividad;
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

