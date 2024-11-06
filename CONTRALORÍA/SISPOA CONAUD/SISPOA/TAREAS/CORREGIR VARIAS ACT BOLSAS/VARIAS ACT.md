**SCGM**
|   |   |   |   |
|---|---|---|---|
|2428708|SANTIAGO MAIDANA QUISPE|GERENTE CONSOLIDADOR|EDICION|
||2428708|SANTIAGO MAIDANA QUISPE|SUPERVISOR|EDICION|
||2428708|SANTIAGO MAIDANA QUISPE|APROBADOR|EDICION|
||4813387|MERY GOMEZ CONDORI|FORMULADOR|EDICION|
||4813387|MERY GOMEZ CONDORI|FORMULADOR GERENTE|EDICION|
## Servicio
```json
GET {{Host}}/actividades/calculo-horas-varios?act_codigos=(4828,4829)
Content-Type: application/json
Authorization: {{AuthTokenInterno}}
```
## Varios
```json
  "datos": [
    {
      "act_codigo": 1581,
      "act_numero": "520.0004.11.1.24",
      "act_descripcion": "ACTIVIDADES DE APOYO ADMINISTRATIVO",
      "tmh_codigo": 1,
      "horas_planificadas": 7272,
      "horas_comision": 0,
      "aun_sigla": "SCGM",
      "horas_adicionar_disminuir": -92,
      "horas_calculo_movimiento": 7180,
      "horas_disponibles": 7180
    },
    {
      "act_codigo": 1877,
      "act_numero": "500.0004.9.1.24",
      "act_descripcion": "INSPECCIONAR Y EMITIR 10 PRODUCTOS DE AUOPE Y SEGU AUOPE",
      "tmh_codigo": 1,
      "horas_planificadas": 1044,
      "horas_comision": 0,
      "aun_sigla": "SCGM",
      "horas_adicionar_disminuir": -94,
      "horas_calculo_movimiento": 950,
      "horas_disponibles": 950
    },
    {
      "act_codigo": 2404,
      "act_numero": "520.0004.15.1.24",
      "act_descripcion": "INSPECCIONAR Y EMITIR 25 PRODUCTOS DE SUPERVISIÓN",
      "tmh_codigo": 1,
      "horas_planificadas": 1852,
      "horas_comision": 0,
      "aun_sigla": "SCGM",
      "horas_adicionar_disminuir": -52,
      "horas_calculo_movimiento": 1800,
      "horas_disponibles": 1800
    }
  ]
```
## Act1
```json
  "datos": {
    "act_codigo": 4828,
    "act_numero": "520.0004.11.4.24",
    "act_descripcion": "p1",
    "tmh_codigo": 2,
    "horas_planificadas": 116,
    "horas_comision": 0,
    "aun_sigla": "SCGM",
    "horas_adicionar_disminuir": 0,
    "horas_calculo_movimiento": 116,
    "horas_disponibles": 116
  }
```
## Act2
```json
  "datos": {
    "act_codigo": 4829,
    "act_numero": "520.0004.11.5.24",
    "act_descripcion": "p2",
    "tmh_codigo": 2,
    "horas_planificadas": 102,
    "horas_comision": 0,
    "aun_sigla": "SCGM",
    "horas_adicionar_disminuir": 0,
    "horas_calculo_movimiento": 102,
    "horas_disponibles": 102
  }
```
## Ajustes
- Visualizar las horas asignadas, o comprometidas en el F1, F1-A, f2, F2A y las disponibles de cada actividad para mostrar variaciones en el total de horas de las actividades
- Asignadose las horas disponibles para la visibildiad del usuario, tomando el total de horas asignado a la unidad como limite para todos los reportes"
### Ejm
```
ANA MARIA BRIGGITTE DEL CARMEN ARRAZOLA DURAN

_person_  3403668
Subcontraloría de Gobiernos Departamentales - SCGD
```
### Listado  de actividades
#### Servicio
- http://172.16.22.243:7091/actividades/cantidad_viaticos?pobj_codigo=(779)&cac_codigo=(2)&aun_codigo_ejecutora=(4)
- bolsas
```json
[  
	{  
		amh_codigo: 10,  
		act_codigo_adicion: 4834,  
		act_codigo_disminucion: 1797,  
		amh_horas: 20,  
		amh_detalle: {  
		act_codigo: 1797,  
		amh_horas: '20',  
		act_numero:  
		'500.0003.2.1.24',  
		aun_sigla: 'SCGD',  
		horas_planificadas: 1090,  
		horas_comision: 0,  
		horas_calculo_movimiento: 1000,  
		horas_disponibles: 1000,  
		flagNuevo: true,  
		amh_estado: 1,  
		est_color: '#54bebe',  
		amh_estado_descripcion:  'EDICION'  
	},  
	amh_estado: 1,  
	tmh_descripcion: 'F21',  
	est_color: '#54bebe',  
	amh_estado_descripcion:  
	'EDICION',  
	act_codigo: 1797,  
	act_descripcion: undefined,  
	act_numero:  
	'500.0003.2.1.24',  
	aun_sigla: 'SCGD',  
	horas_planificadas: 1090,  
	horas_comision: 0,  
	horas_calculo_movimiento: 1000,  
	horas_disponibles: 1000  
}  
]
```
- querys
```sql
SELECT 	a.act_codigo,a.act_estado  
FROM 	estructura_poa.actividades a 
WHERE 	TRUE
		AND a.pobj_codigo IN (779)
		AND a.aun_codigo_ejecutora IN (4)
		AND a.cac_codigo IN (2)
;
--
SELECT 	*
FROM 	estructura_poa.actividades_movimientos_horas amh 
WHERE 	amh.act_codigo_adicion IN (4835)
;
--&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&6
        SELECT
              a.aun_codigo_ejecutora, au.aun_nombre,
              --SUM(a.act_horas_planificadas) AS hora_total,
              SUM(a.horas_total_bolsa) AS hora_total
        FROM    (
                SELECT  act.*, act.act_horas_planificadas - COALESCE(SUM(actbolsa.act_horas_planificadas), 0) AS horas_total_bolsa
                FROM  estructura_poa.actividades act
                      LEFT JOIN estructura_poa.actividades actbolsa ON act.act_codigo = actbolsa.act_codigo_bolsa AND actbolsa.act_estado NOT IN (0, 9, 46, 47)
                WHERE   TRUE
                GROUP BY act.act_codigo
              ) a
              LEFT JOIN estructura_organizacional.areas_unidades au ON a.aun_codigo_ejecutora = au.aun_codigo
        WHERE   TRUE
              AND a.pobj_codigo IN (787)
              AND a.aun_codigo_ejecutora IN (44)
              AND a.act_estado NOT IN (0, 5, 9, 47)
              AND a.act_codigo NOT IN (
                select act_codigo from public.tmp_hrs_cero
                )
        GROUP BY a.aun_codigo_ejecutora, au.aun_nombre
        ;

--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        SELECT
              a.act_codigo, a.act_estado, a.aun_codigo_ejecutora, au.aun_nombre
        FROM    estructura_poa.actividades a
              LEFT JOIN estructura_organizacional.areas_unidades au ON a.aun_codigo_ejecutora = au.aun_codigo
        WHERE   TRUE
        AND a.pobj_codigo IN (787)
        AND a.aun_codigo_ejecutora IN (44)
        AND a.cac_codigo IN (1,3)
        AND a.act_estado NOT IN (0,5,9,47)
		;
--
SELECT 	a.act_codigo, a.act_estado, a.aun_codigo_ejecutora, a.act_horas_planificadas,
		au.aun_sigla 
FROM 	estructura_poa.actividades a
		LEFT JOIN estructura_organizacional.areas_unidades au ON a.aun_codigo_ejecutora = au.aun_codigo 
WHERE 	TRUE
		AND a.act_codigo IN (1598,1599,1601,1600,1602)
;

--&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
SELECT  a.act_numero , a.act_cantidad,a.act_descripcion, CAST(a.horas_total_bolsa AS INTEGER) AS act_horas_planificadas, a.ent_codigo, a.ent_descripcion,
        a.pobj_codigo, a. aun_codigo_ejecutora,
        tt.ttr_descripcion,
        ett.ett_nombre, a.act_objeto
FROM    (
          SELECT  act.*, act.act_horas_planificadas - COALESCE(SUM(actbolsa.act_horas_planificadas), 0) AS horas_total_bolsa
          			--act.act_codigo,act.act_estado,act.act_horas_planificadas, act.act_horas_planificadas - COALESCE(SUM(actbolsa.act_horas_planificadas), 0) AS horas_total_bolsa
          FROM  estructura_poa.actividades act
                LEFT JOIN estructura_poa.actividades actbolsa ON act.act_codigo = actbolsa.act_codigo_bolsa AND actbolsa.act_estado NOT IN (0, 9, 46, 47)
          WHERE     TRUE
          GROUP BY act.act_codigo
        ) a
        LEFT JOIN parametricas.tipos_trabajos tt ON a.ttr_codigo = tt.ttr_codigo
        LEFT JOIN parametricas.especificacion_tipos_trabajo ett ON tt.ett_codigo = ett.ett_codigo
WHERE       TRUE
        AND a.pobj_codigo IN (787) AND a.aun_codigo_ejecutora IN (44) AND a.act_estado NOT IN (0, 5, 9, 47)
        AND a.act_codigo NOT IN (
        select act_codigo from public.tmp_hrs_cero
        )
        AND a.cac_codigo IN (1,3) -- CLASIF ACT SELECCIONADO
ORDER BY a.act_codigo DESC
;

--
SELECT  --a.act_numero , a.act_cantidad,a.act_descripcion, CAST(a.horas_total_bolsa AS INTEGER) AS act_horas_planificadas, a.ent_codigo, a.ent_descripcion,
		a.act_numero , a.act_cantidad,a.act_descripcion, a.ent_codigo, a.ent_descripcion,
        a.pobj_codigo, a. aun_codigo_ejecutora, au.aun_nombre, 
        tt.ttr_descripcion,
        ett.ett_nombre, a.act_objeto
FROM    estructura_poa.actividades a 
        LEFT JOIN parametricas.tipos_trabajos tt ON a.ttr_codigo = tt.ttr_codigo
        LEFT JOIN parametricas.especificacion_tipos_trabajo ett ON tt.ett_codigo = ett.ett_codigo
        LEFT JOIN estructura_organizacional.areas_unidades au ON a.aun_codigo_ejecutora = au.aun_codigo 
WHERE   TRUE
		AND a.act_estado NOT IN (0, 5, 9, 47)        
		AND a.pobj_codigo IN (787) 
        AND a.aun_codigo_ejecutora IN (44) 
        AND a.cac_codigo IN (1,3) -- CLASIF ACT SELECCIONADO        
        AND a.act_codigo NOT IN (
        select act_codigo from public.tmp_hrs_cero
        )
ORDER BY a.act_codigo DESC
;
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  SELECT
        a.act_codigo, a.act_numero AS actividad_codigo,
        a.act_descripcion AS actividad_sujeto, au.aun_sigla AS actividad_unidad_ejecutora,
        a.act_objeto AS actividad_objeto, CONCAT(tt.ttr_sigla, ' - ', tt.ttr_descripcion) AS actividad_tipo_trabajo,
        a.act_cantidad AS actividad_indicador, CONCAT(um.ume_sigla, ' - ', um.ume_descripcion) AS actividad_unidad_medida,
        CASE
          WHEN a.tipact_codigo = 2 THEN (ac.conaud_detalle->>'trabajo_codigo')::VARCHAR
          ELSE ''
        END AS actividad_codigo_conaud,
        TO_CHAR(a.act_fecha_inicio, 'dd/mm/yyyy') AS actividad_fecha_inicio,
        TO_CHAR(a.act_fecha_fin, 'dd/mm/yyyy') AS actividad_fecha_fin,
        '' AS actividad_horas_hombre_anteriores,
        a.act_horas_planificadas AS actividad_horas_hombre_actuales,
        sec.sec_descripcion AS actividad_sector
  FROM      estructura_poa.actividades a
        LEFT JOIN estructura_organizacional.areas_unidades au ON a.aun_codigo_ejecutora = au.aun_codigo
        LEFT JOIN parametricas.tipos_trabajos tt ON a.ttr_codigo = tt.ttr_codigo
        LEFT JOIN parametricas.unidades_medidas um ON a.ume_codigo = um.ume_codigo
        LEFT JOIN parametricas.sector sec ON a.sec_codigo = sec.sec_codigo
        LEFT JOIN estructura_poa.actividades_continuidad ac ON a.act_codigo = ac.act_codigo
        LEFT JOIN ejecucion_actividades.inicios_actividades ia ON ac.iac_codigo = ia.iac_codigo
  WHERE     TRUE
        AND a.act_estado IN (2,7,48,17,18) -- ESTADOS
        AND a.pobj_codigo IN (1357) -- ACP
        AND a.aun_codigo_ejecutora IN (44) -- EJECUTORAS
  ORDER BY a.act_correlativo ASC
  ;
 --¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡
           SELECT
                a.act_codigo,
                tf.tpo_nombre AS "tipo-formulacion",
                g.ges_anio AS "gestion",
                CONCAT(pr.pro_numero, ' - ', pr.pro_descripcion) AS "programa",
                CONCAT(cp.cpr_numero, ' - ', cp.cpr_descripcion) AS "categoria-programatica",
                CONCAT(ae.aes_numero, ' - ', ae.aes_descripcion) AS "accion-estrategica",
                tacp.tacp_descripcion AS "tipo-accion-corto-plazo",
                CASE
                  WHEN po.aun_codigo_padre IS NOT NULL THEN CONCAT(pr.pro_numero, '.', aunpad.aun_numero, '.', po.pobj_numero)
                  ELSE CONCAT(pr.pro_numero, '.', auneje.aun_numero, '.', po.pobj_numero)
                END AS "accion-corto-plazo-codigo",
                REPLACE(REPLACE(po.pobj_nombre, ';', ''), '     ', '') AS "accion-corto-plazo",
                ti.tin_descripcion AS "tipo-indicador",
                po.pobj_indicador AS "indicador",
                a.act_numero AS "actividad-codigo",
                COALESCE(REGEXP_REPLACE(REPLACE(REPLACE(REPLACE(a.act_descripcion, ';', ''), '  ', ''), '"', ''), E'[\n\r]+', ' ', 'g' ), '') AS "actividad",
                COALESCE((ac.conaud_detalle->>'correlativo_codigo')::VARCHAR, '') AS "correlativo-conaud",
                COALESCE((ac.conaud_detalle->>'trabajo_codigo')::VARCHAR, '') AS "codigo-conaud",
                tact.tipact_descripcion AS "tipo-actividad",
                CASE
                  WHEN a.cac_codigo IN (2) THEN 'INCORPORACIÓN'
                  ELSE 'REGULAR'
                END AS "clasificacion-actividad",
                CASE
                  WHEN a.act_no_planificado THEN 'NO PLANIFICADO'
                  ELSE ''
                END AS "actividad-planificado",
                auneje.aun_nombre AS "actividad-unidad-ejecutora",
                auneje.aun_sigla AS "actividad-unidad-ejecutora-sigla",
                aunsup.aun_nombre AS "actividad-unidad-supervisora",
                aunsup.aun_sigla AS "actividad-unidad-supervisora-sigla",
                COALESCE(aup.aun_nombre, '') AS "actividad-unidad-padre",
                COALESCE(aup.aun_sigla, '') AS "actividad-unidad-padre-sigla",
                ett.ett_nombre AS "actividad-especificacion-tipo-trabajo",
                CONCAT(tt.ttr_sigla, ' - ', tt.ttr_descripcion) AS "actividad-tipo-trabajo",
                sec.sec_descripcion AS "actividad-sector",
                CONCAT(um.ume_sigla, ' - ', um.ume_descripcion) AS "actividad-unidad-medida",
                TO_CHAR(a.act_fecha_inicio, 'dd/mm/yyyy') AS "actividad-fecha-inicio",
                TO_CHAR(a.act_fecha_fin, 'dd/mm/yyyy') AS "actividad-fecha-fin",
                a.act_cantidad AS "actividad-indicador",
                COALESCE(REGEXP_REPLACE(REPLACE(REPLACE(REPLACE(a.act_objeto, ';', ''), '       ', ''), '"', ''), E'[\n\r]+', ' ', 'g' ), '') AS "actividad-objeto",
                COALESCE(REGEXP_REPLACE(REPLACE(REPLACE(REPLACE(a.act_objetivo, ';', ''), '     ', ''), '"', ''), E'[\n\r]+', ' ', 'g' ), '') AS "actividad-objetivo",
                COALESCE(REGEXP_REPLACE(REPLACE(REPLACE(REPLACE(a.act_alcance, ';', ''), '      ', ''), '"', ''), E'[\n\r]+', ' ', 'g' ), '') AS "actividad-alcance",
                a.act_horas_planificadas AS "actividad-horas-hombre",
                caa.caa_nombre AS "clasificacion-auditoria-actividad", cfa.cfa_nombre AS "clasificacion-funcion-actividad", cga.cga_nombre AS "clasificacion-agrupacion-actividad", cca.cca_nombre AS "clasificacion-control-actividad",
                CASE
                  WHEN actr.cac_codigo = 1 AND a.act_estado = 47 THEN 'F24-RETIRADO-FORMULADO'
                  WHEN actr.cac_codigo = 1 THEN 'F26-FORMULADO'
                  WHEN actr.cac_codigo = 2 THEN 'F21-INCORPORADO-FORMULADO'
                  ELSE ''
                END AS "formulacion",
                CASE
                  WHEN po.pobj_estado IN (0) THEN 'ACP-INHABILITADO'
                  WHEN a.act_estado IN (0) AND a.act_codigo_anterior IS NOT NULL THEN 'INHABILITADO'
                  ELSE ''
                END AS "inhabilitado-reformulacion",
                CASE
                  WHEN a.act_codigo_anterior IS NULL THEN 'INCORPORADO'
                  ELSE ''
                END AS "incorporado-reformulacion",
                TO_CHAR(a.fecha_registro, 'HH24:MI am dd/mm/yyyy') AS "actividad-fecha-registro",
                est.est_nombre AS "actividad-estado",
                a.ent_codigo,
                a.ent_descripcion
          FROM  estructura_poa.actividades a
                LEFT JOIN estructura_poa.actividades actr ON a.act_codigo_anterior = actr.act_codigo
                LEFT JOIN estructura_organizacional.areas_unidades auneje ON a.aun_codigo_ejecutora = auneje.aun_codigo
                LEFT JOIN estructura_organizacional.autoridades_funcionales aunfun ON a.aun_codigo_ejecutora = aunfun.aun_codigo_supervisado
                LEFT JOIN estructura_organizacional.areas_unidades aunsup ON aunfun.aun_codigo_supervisor = aunsup.aun_codigo
                LEFT JOIN estructura_organizacional.areas_unidades_dependencias aud ON aud.aun_codigo_hijo = auneje.aun_codigo
                LEFT JOIN estructura_organizacional.areas_unidades aup ON aud.aun_codigo_padre = aup.aun_codigo
                LEFT JOIN parametricas.tipos_trabajos tt ON a.ttr_codigo = tt.ttr_codigo
                LEFT JOIN parametricas.especificacion_tipos_trabajo ett ON tt.ett_codigo = ett.ett_codigo
                LEFT JOIN parametricas.sector sec ON a.sec_codigo = sec.sec_codigo
                LEFT JOIN parametricas.unidades_medidas um ON a.ume_codigo = um.ume_codigo
                LEFT JOIN estructura_poa.actividades_continuidad ac on a.act_codigo = ac.act_codigo AND ac.aco_estado NOT IN (0)
                LEFT JOIN parametricas.tipos_actividades tact on a.tipact_codigo = tact.tipact_codigo
                LEFT JOIN parametricas.clasificacion_actividades ca ON ca.cac_codigo = a.cac_codigo
                LEFT JOIN parametricas.estados est ON a.act_estado = est.est_codigo
                LEFT JOIN parametricas.clasificacion_auditoria_actividad caa ON a.caa_codigo = caa.caa_codigo
                LEFT JOIN parametricas.clasificacion_funcion_actividad cfa ON a.cfa_codigo = cfa.cfa_codigo
                LEFT JOIN parametricas.clasificacion_grupo_actividad cga ON a.cga_codigo = cga.cga_codigo
                LEFT JOIN parametricas.clasificacion_control_actividad cca ON a.cca_codigo = cca.cca_codigo -- END ACTIVIDADES
                LEFT JOIN estructura_poa.poas_objetivos po ON a.pobj_codigo = po.pobj_codigo --AND po.pobj_estado != 0
                LEFT JOIN estructura_organizacional.areas_unidades aunpad ON po.aun_codigo_padre = aunpad.aun_codigo
                LEFT JOIN pei.programas pr on po.pro_codigo = pr.pro_codigo
                LEFT JOIN pei.categorias_programaticas cp on po.cpr_codigo = cp.cpr_codigo
                LEFT JOIN pei.acciones_estrategicas_gestiones aeg on po.aeg_codigo = aeg.aeg_codigo
                LEFT JOIN pei.acciones_estrategicas ae on aeg.aes_codigo = ae.aes_codigo
                LEFT JOIN parametricas.tipo_accion_corto_plazo tacp on po.tacp_codigo = tacp.tacp_codigo
                LEFT JOIN parametricas.tipo_indicador ti on po.tin_codigo = ti.tin_codigo -- END POA-OBJETIVOS
                LEFT JOIN estructura_poa.poas p ON po.poa_codigo = p.poa_codigo AND p.poa_estado != 0
                LEFT JOIN parametricas.gestiones g on p.ges_codigo = g.ges_codigo
                LEFT JOIN parametricas.tipos_formulaciones tf on p.tpo_codigo = tf.tpo_codigo -- END POAS
          WHERE TRUE
                AND p.poa_codigo IN (3) -- END POAS
                 -- END POAS-OBJETIVOS
                AND a.aun_codigo_ejecutora IN (44)
                --
                 -- END ACTIVIDADES
          ORDER BY
                aup.aun_codigo ASC,
                a.aun_codigo_ejecutora ASC,
                po.pro_codigo ASC,
                po.cpr_codigo ASC,
                a.act_correlativo ASC
          ;
```
### Listado de ACP
### Reportes en excel, reportes PDF
- Menu reportes
#### reportes
```json
Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJwZXJfY29kaWdvIjoxOTE0LCJzaXN0ZW1hcyI6W3sic2lzY2dlX2NvZGlnbyI6MjUsInNpc2NnZV9zaWdsYSI6InVhaSJ9LHsic2lzY2dlX2NvZGlnbyI6MjksInNpc2NnZV9zaWdsYSI6InBvYWkifSx7InNpc2NnZV9jb2RpZ28iOjMyLCJzaXNjZ2Vfc2lnbGEiOiJjb3JyZXNwb25kZW5jaWFfaW50ZXJuYSJ9LHsic2lzY2dlX2NvZGlnbyI6MzQsInNpc2NnZV9zaWdsYSI6InNpc3BvYSJ9LHsic2lzY2dlX2NvZGlnbyI6MzUsInNpc2NnZV9zaWdsYSI6ImZpX2NvbmF1ZCJ9LHsic2lzY2dlX2NvZGlnbyI6MzcsInNpc2NnZV9zaWdsYSI6ImNvbmF1ZCJ9XSwicm9sZXMiOlt7InNpc2NnZV9jb2RpZ28iOjI1LCJyb2xfY29kaWdvIjoxNTAsInJvbF9kZXNjcmlwY2lvbiI6IlJFVklTT1IgVUFJIn0seyJzaXNjZ2VfY29kaWdvIjoyOSwicm9sX2NvZGlnbyI6MTU4LCJyb2xfZGVzY3JpcGNpb24iOiJST0wgU1VQRVJWSVNJT04ifSx7InNpc2NnZV9jb2RpZ28iOjI5LCJyb2xfY29kaWdvIjoxNTcsInJvbF9kZXNjcmlwY2lvbiI6IlJPTCBSRUdJU1RSTyBSRUNVUlNPUyBIVU1BTk9TIn0seyJzaXNjZ2VfY29kaWdvIjoyOSwicm9sX2NvZGlnbyI6MTU2LCJyb2xfZGVzY3JpcGNpb24iOiJBRE1JTklTVFJBRE9SIFBPQUkifSx7InNpc2NnZV9jb2RpZ28iOjI5LCJyb2xfY29kaWdvIjoxNzMsInJvbF9kZXNjcmlwY2lvbiI6IlJPTCBQTEFOSUZJQ0FDScOTTiJ9LHsic2lzY2dlX2NvZGlnbyI6MzUsInJvbF9jb2RpZ28iOjE5Miwicm9sX2Rlc2NyaXBjaW9uIjoiVkFMSURBRE9SIn0seyJzaXNjZ2VfY29kaWdvIjozNCwicm9sX2NvZGlnbyI6MTk2LCJyb2xfZGVzY3JpcGNpb24iOiJHZXN0acOzbiBJbnN0aXR1Y2lvbmFsIn0seyJzaXNjZ2VfY29kaWdvIjozNCwicm9sX2NvZGlnbyI6MTkwLCJyb2xfZGVzY3JpcGNpb24iOiJPcGVyYWRvciBGb3JtdWxhcmlvIn0seyJzaXNjZ2VfY29kaWdvIjozNywicm9sX2NvZGlnbyI6MjAyLCJyb2xfZGVzY3JpcGNpb24iOiJBZG1pbmlzdHJhZG9yIENPTkFVRCJ9LHsic2lzY2dlX2NvZGlnbyI6MzcsInJvbF9jb2RpZ28iOjIwOCwicm9sX2Rlc2NyaXBjaW9uIjoiT3BlcmFkb3IgRm9ybXVsYXJpbyJ9LHsic2lzY2dlX2NvZGlnbyI6MzIsInJvbF9jb2RpZ28iOjE3NSwicm9sX2Rlc2NyaXBjaW9uIjoiRlVOQ0lPTkFSSU8ifSx7InNpc2NnZV9jb2RpZ28iOjM3LCJyb2xfY29kaWdvIjoyMTksInJvbF9kZXNjcmlwY2lvbiI6IkFwb3lvIn0seyJzaXNjZ2VfY29kaWdvIjozNywicm9sX2NvZGlnbyI6MjA5LCJyb2xfZGVzY3JpcGNpb24iOiJHZXN0acOzbiBJbnN0aXR1Y2lvbmFsIn0seyJzaXNjZ2VfY29kaWdvIjozNCwicm9sX2NvZGlnbyI6MTk4LCJyb2xfZGVzY3JpcGNpb24iOiJWZXJpZmljYWRvciBGb3JtdWxhcmlvIn0seyJzaXNjZ2VfY29kaWdvIjozNCwicm9sX2NvZGlnbyI6MTk3LCJyb2xfZGVzY3JpcGNpb24iOiJHZXN0acOzbiBJbnN0aXR1Y2lvbmFsIEFwcm9iYWRvciJ9LHsic2lzY2dlX2NvZGlnbyI6MzcsInJvbF9jb2RpZ28iOjIxMSwicm9sX2Rlc2NyaXBjaW9uIjoiVmVyaWZpY2Fkb3IgRm9ybXVsYXJpbyJ9XSwiaWQiOiI0M2EyNjk3NS1mZjY0LTQwN2ItOWE3Ni00MDc2NDZiOGJkNjAiLCJ0aXBvIjoidXN1YXJpbyIsImlhdCI6MTczMDkwMjg4MywiZXhwIjoxNzMwOTMxNjgzLCJtb21lbnQiOiIyMDI0LTExLTA2VDEwOjIxOjIzLTA0OjAwIn0.dlBdcuVsedsMYgRLuu3wp2sw4tCnHjiQ7DkCS8n_Z0OjPOFx-ktzjEGxamgjOzt3AMDbLwKrHJIooRleaArr8A

RptXlsAccionesAct.jrxml
s_aun_codigo: (44)
s_cac_codigo: (1,3)
s_pobj_codigo: (787,1331,1357,1358,1359)


RptXlsPoasAreasEjecutoras.jrxml
{
	"s_aun_codigo_hijos": "(44)",
	"s_aun_codigo_padre": "(44)",
	"s_poa_codigo": "(3)"
}

RptPdfAreasSustantivas.jrxml
{
	"s_aun_codigo": "(44)",
	"s_poa_codigo": "(3)"
}

RptXlsSispoaCompleto.jrxml
{
	"s_query": "poa_codigo=(3)&aun_codigo_ejecutora=(44)"
}
// ESTE ESTA RARO
RptXlsSeguimiento.xlsx
{
	"s_aun_codigo": "(44,45)",
	"s_clasificador": "(1,2,3,4,5)",
	"s_poa_codigo": "(3)"
}
```
- RptPdfAreasSustantivas
```json
🐱==ff7==> ~ accionCortoPlazo: {
  pobj_codigo: 1112,
  acp_codigo: '520..143',
  acp_descripcion: 'Emitir 2 informes de Supervisión de Gobiernos Autónomos Municipales y Universidades, en la Gerencia Departamental del Beni en la gestión 2024.',
  acp_indicador: 2,
  array_ejecutoras: [ 46 ],
  actividades: [
    {
      act_codigo: 2405,
      actividad_codigo: '520.1902.143.1.24',
      actividad_sujeto: 'GOBIERNO AUTÓNOMO MUNICIPAL DE TRINIDAD',
      actividad_unidad_ejecutora: 'GDB-GAM',
      actividad_objeto: 'TRÁMITES DE APROBACIÓN DE URBANIZACIONES Y TRANSFERENCIAS DE PROPIEDADES"',
      actividad_tipo_trabajo: 'SUP - Supervisión a entidades',
      actividad_indicador: 1,
      actividad_unidad_medida: 'INF - INFORME',
      actividad_codigo_conaud: '',
      actividad_fecha_inicio: '01/04/2024',
      actividad_fecha_fin: '27/06/2024',
      actividad_horas_hombre_anteriores: '',
      actividad_horas_hombre_actuales: 800,
      actividad_sector: 'URBANISMO Y VIVIENDA'
    },
    {
      act_codigo: 3075,
      actividad_codigo: '520.1902.143.2.24',
      actividad_sujeto: 'GOBIERNO AUTÓNOMO MUNICIPAL DE TRINIDAD',
      actividad_unidad_ejecutora: 'GDB-GAM',
      actividad_objeto: 'DONACIONES DE LA FUNDACIÓN "MANO A MANO" PARA CENTROS DE SALUD DE PRIMER NIVEL DEL MUNICIPIO DE TRINIDAD.',
      actividad_tipo_trabajo: 'SUP - Supervisión a entidades',
      actividad_indicador: 1,
      actividad_unidad_medida: 'INF - INFORME',
      actividad_codigo_conaud: '',
      actividad_fecha_inicio: '02/09/2024',
      actividad_fecha_fin: '31/12/2024',
      actividad_horas_hombre_anteriores: '',
      actividad_horas_hombre_actuales: 600,
      actividad_sector: 'SALUD'
    }
  ]
}

```
#### Reportes Areas Actividades
```json
{
  total_horas_disponibles: 9333,
  total_horas_planificadas: 9333,
  total_horas_calculo_movimiento: 9333,
  aun_codigo_ejecutora: 44,
  aun_nombre: 
    'Gerencia Departamental de Beni',
  actividades: [
    {
      act_codigo: 1598,
      act_numero: 
        '00.0019.69.5.24',
      act_cantidad: 100,
      act_descripcion: 
        'REUNION NACIONAL DE GERENTES',
      ent_codigo: 54,
      ent_descripcion: null,
      pobj_codigo: 787,
      act_horas_planificadas: 16,
      aun_codigo_ejecutora: 44,
      aun_nombre: 
        'Gerencia Departamental de Beni',
      ttr_descripcion: 
        'Actividades Administrativas',
      ett_nombre: 
        'ADMINISTRACIÓN',
      act_objeto: 
        'REUNION NACIONAL DE GERENTES DEPARTAMENTALES',
      horas_auditorias: 0,
      horas_evaluaciones: 0,
      horas_apoyos: 0,
      horas_planificadas: 16,
      horas_calculo_movimiento: 16,
      horas_comision: 0,
      horas_disponibles: 16
    },
    {
      act_codigo: 1599,
      act_numero: 
        '00.0019.69.4.24',
      act_cantidad: 100,
      act_descripcion: 
        'ACTIVIDADES ADMINISTRATIVAS Y DE GERENCIA',
      ent_codigo: 54,
      ent_descripcion: null,
      pobj_codigo: 787,
      act_horas_planificadas: 8899,
      aun_codigo_ejecutora: 44,
      aun_nombre: 
        'Gerencia Departamental de Beni',
      ttr_descripcion: 
        'Actividades Administrativas',
      ett_nombre: 
        'ADMINISTRACIÓN',
      act_objeto: 
        'COORDINACIÓN CON EL AREA DE GOBIERNOS DEPARTAMENTALES. COORDINACION CON GOBIERNOS MUNICIPALES Y UNIVERSIDADES, COORDINACIÓN CON SERVICIOS  Y ADMINISTRACION',
      horas_auditorias: 0,
      horas_evaluaciones: 0,
      horas_apoyos: 0,
      horas_planificadas: 8899,
      horas_calculo_movimiento: 8899,
      horas_comision: 0,
      horas_disponibles: 8899
    },
    {
      act_codigo: 1601,
      act_numero: 
        '00.0019.69.2.24',
      act_cantidad: 1,
      act_descripcion: 
        'REUNION DE GERENTES DE ÁREAS - SCGD',
      ent_codigo: 54,
      ent_descripcion: null,
      pobj_codigo: 787,
      act_horas_planificadas: 32,
      aun_codigo_ejecutora: 44,
      aun_nombre: 
        'Gerencia Departamental de Beni',
      ttr_descripcion: 
        'Actividades de Gerencia',
      ett_nombre: 
        'ADMINISTRACIÓN',
      act_objeto: 
        'REUNION NACIONAL DE GERENTES',
      horas_auditorias: 0,
      horas_evaluaciones: 0,
      horas_apoyos: 0,
      horas_planificadas: 32,
      horas_calculo_movimiento: 32,
      horas_comision: 0,
      horas_disponibles: 32
    },
    {
      act_codigo: 1600,
      act_numero: 
        '00.0019.69.3.24',
      act_cantidad: 1,
      act_descripcion: 
        'REUNIÓN LEGAL-SCSL',
      ent_codigo: 54,
      ent_descripcion: null,
      pobj_codigo: 787,
      act_horas_planificadas: 16,
      aun_codigo_ejecutora: 44,
      aun_nombre: 
        'Gerencia Departamental de Beni',
      ttr_descripcion: 
        'Actividades Administrativas',
      ett_nombre: 
        'ADMINISTRACIÓN',
      act_objeto: 
        'REUNIÓN  LEGAL',
      horas_auditorias: 0,
      horas_evaluaciones: 0,
      horas_apoyos: 0,
      horas_planificadas: 16,
      horas_calculo_movimiento: 16,
      horas_comision: 0,
      horas_disponibles: 16
    },
    {
      act_codigo: 1602,
      act_numero: 
        '00.0019.69.1.24',
      act_cantidad: 1,
      act_descripcion: 
        'ACTIVIDADES ADMINISTRATIVAS PROPIAS DE LA GERENCIA - SCGD',
      ent_codigo: 54,
      ent_descripcion: null,
      pobj_codigo: 787,
      act_horas_planificadas: 370,
      aun_codigo_ejecutora: 44,
      aun_nombre: 
        'Gerencia Departamental de Beni',
      ttr_descripcion: 
        'Actividades de Gerencia',
      ett_nombre: 
        'ADMINISTRACIÓN',
      act_objeto: 
        'ACTIVIDADES ADMINISTRATIVAS',
      horas_auditorias: 0,
      horas_evaluaciones: 0,
      horas_apoyos: 0,
      horas_planificadas: 370,
      horas_calculo_movimiento: 370,
      horas_comision: 0,
      horas_disponibles: 370
    }
  ]
}
```
##### Servicio
- 
- Reporte Poa Anual
- Y en todos los que se vea