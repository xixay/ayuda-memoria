## Opción nueva tabla backup_20241016_122056.sql
### Crear Tabla
```sql
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
ALTER TABLE parametricas.tipo_movimientos_horas OWNER TO usr_poa;
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
TO usr_app_poa;

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
TO usr_app_poa;
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
```
### Crear los cruds
```c
npx ts-node src/common/scripts/feature.generator.ts ActividadesMovimientosHoras estructura_poa
```
## Acciones a Realizar
### Crea la actividad bolsa
- Se registra en la tabla actividad_bolsa:
	- se obtiene de que acción estratégica que se selecciono
	- se toma la actividad de donde viene
	- se agrega las horas iniciales
	- se agrega las horas disponibles por comisión
- Se debe validar para que no se pueda registrar la misma  bolsa, osea que tenga los mismos datos que de otra acción estratégica
- el componente en base a su act_codigo, debe traer los datos , solo para el caso de F21(cacCodigo = 2)
- al ir al componente nuevo,verifica si ya tiene un act_codigo_bolsa, de los que eran antes, y si tiene que lo adicione a la tabla actividad_bolsa(pero que esta no este registrada en la tabla actividad_bolsa)
### Modifica la actividad bolsa
- se modifica la acción estratégica
-  se modifica las horas iniciales
- se modifica las horas disponibles por comisión
- al ir al componente nuevo,verifica si ya tiene un act_codigo_bolsa, de los que eran antes, y si tiene que lo adicione a la tabla actividad_bolsa(pero que esta no este registrada en la tabla actividad_bolsa)
### Servicios que se afectarían
#### creación
- que al crear ya no guarde el act_codigo_bolsa, se registraran en la tabla actividades_bolsa , el act_codigo de donde viene
#### Validaciones
- revisar el servicio validateHorasPlanificadasBolsa, considera solo una bolsa, que a su ves usa el servicio: verificarActividadBolsa
#### findAll
- Crear un nuevo findAll que considere para muchas actividades bolsa, tal ves que envié un array de bolsas
- Como en el caso de poas_objetivos, a su findAll de actividades, se podria agregar un array de actiivdades_bolsa, pero que verifique si tiene un act_codigo_bolsa, para agregarlo a la tabla actividades bolsa
#### reportes
- Se debe modificar los servicios que traen los reportes, para que considere muchas bolsas(hay por lo menos 3)
- revisar el servicio getReportActividadesF21, solo considera una bolsa
- revisar el servicio getReporteActividadesPoa, solo considera una bolsa
- revisar el servicio para Excel: findAllAccionCorto, para que considere mas de una bolsa
#### reformulación
- Se debe considerar en la reformulación, para que considere las muchas bolsas,  y ya no solo uno
- Revisar el servicio : createNewActividad, donde usa checkBolsa, solo considera una bolsa para la reformulacion
### Opción array de actividades bolsa
- Se agrega un nuevo campo que tiene act_codigo_bolsa, que representa las actividades bolsa que tiene
```
[2,3,4,5,22,45]
```
- cada ves que se agrega o modifica una actividad bolsa, se actualiza el array
- osea se filtra, o se elimina cada ves.
## Bases de Prueba
- en edicion: backup_20241015_113322.sql
- ya consolidado: backup_20241015_114157.sql
#### query
```sql
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
```
### Área de Prueba GDH-GSL
### Roles 

| 4374363 | EDINO CLAUDIO CLAVIJO PONCE | GERENTE CONSOLIDADOR | EDICION |
| ------- | --------------------------- | -------------------- | ------- |
| 5244166 | FLADIMIR HUARACHI HUARACHI  | FORMULADOR           | EDICION |
| 4374363 | EDINO CLAUDIO CLAVIJO PONCE | SUPERVISOR           | EDICION |
| 4088924 | MARY JHOANNA ACUÑA ANIBARRO | APROBADOR            | EDICION |
| 5244166 | FLADIMIR HUARACHI HUARACHI  | FORMULADOR GERENTE   | EDICION |

### Actividad de Prueba 00.1501.105.9.24
- área unidad = Gerencia Departamental de Servicios Legales - GDH-GSL
- act_codigo = 4787
- accion_estrategica = 00.1501.105
- act_numero = 00.1501.105.9.24
- act_horas_planificadas = 500(DB)
- act_horas_real = 500
- lo que dice en el sistema
	- horas hombre planificadas = 500
### Datos Actividad Bolsa
- area unidad = Gerencia Departamental de Servicios Legales - GDH-GSL
- act_codigo = 2606
- accion_estrategica = 540.1501.51
- act_numero = 540.1501.51.1.24
- act_horas_planificadas = 1074(DB)
- lo que dice en el sistema
	- horas iniciales = 1074(es lo mismo horas planificadas)
	- horas disponibles comision = 1074
lo que trae el servicio
```json
{ "codigo": 0, "error_existente": 0, "error_mensaje": "SE OBTUVIERON DATOS DE FORMA CORRECTA.", "error_codigo": 2001, "trace_id": "1527b3cd-5ad1-4bfe-ac1a-689c36a8c76a", 
 "datos": 
 { "act_codigo": 1539, 
 "act_numero": "520.1202.270.1.24", 
 "act_descripcion": "GOBIERNO AUTÓNOMO MUNICIPAL DE ACHACACHI", "horas_iniciales": 400, 
 "suma_horas": 0, 
 "horas_disponibles": 400, 
 "horas_disponibles_comision": 400, 
 "aun_sigla": "GPA2-GAM1" } }
```
#### query que trae los datos de la bolsa
```sql
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

```
### La bolsa escogida
![[bolsa0.png]]
#### Bolsa
![[bolsa.png]]


### Inicio Actividad Poa 00.1501.105.9.24
#### antes de agregar comision  00.1501.105.9.24
![[antes de crear comision.png]]
#### Inicio act poa despues de agregar comision
![[actividad despues de crear comision y añadir horas.png]]
#### Despues de agregar comision actividad
![[despues de crear comision y añadir horas.png]]
### Datos Actividad Bolsa despues de agregar comisoines
- area unidad = Gerencia Departamental de Servicios Legales - GDH-GSL
- act_codigo = 2606
- accion_estrategica = 540.1501.51
- act_numero = 540.1501.51.1.24
- act_horas_planificadas = 1074(DB)
- lo que dice en el sistema
	- horas iniciales = 1074(es lo mismo horas planificadas)
	- horas disponibles comision = 954
### me creo otra actividad backup_20241015_152820.sql
![[bolsa0.png]]

|           | Unidad x       |                 |
| --------- | -------------- | --------------- |
| Actividad | hr planificada | quedan          |
| a         | 50             | 50              |
| b         | 100            | 90(usadas 10)   |
| c         | 200            | 100(usadas 100) |
| d         | 150            |                 |


hacer un componente nuevo
se debe buscar uno y agregarle las horas
para F21 debe estar bloqueado esas horas
### bolsas sin comisiones: backup_20241017_105934.sql

| Actividades | numero            | act_codigo |
| ----------- | ----------------- | ---------- |
| Act1        | 00.1501.105.4.24  | 2840       |
| Act2        | 00.1501.105.3.24  | 2839       |
| Act3        | 00.1501.105.2.24  | 2838       |
| Act4        | 00.1501.105.10.24 | 4793       |
| Act5        | 00.0202.19.6.24   | 4792       |
| Act6        | 00.1601.110.17.24 | 4791       |

### bolsas con comisiones: backup_20241017_135434.sql