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
--##########################################################
        SELECT
              po.pobj_codigo,
              --COALESCE(SUM(a.act_horas_planificadas), 0) AS total_horas_planificadas,
              COALESCE(SUM(a.horas_total), 0) AS total_horas_planificadas
        FROM    estructura_poa.poas_objetivos po
              LEFT JOIN (
                SELECT  act.*, act.act_horas_planificadas - COALESCE(SUM(actbolsa.act_horas_planificadas), 0) AS horas_total
                FROM  estructura_poa.actividades act
                      LEFT JOIN estructura_poa.actividades actbolsa ON act.act_codigo = actbolsa.act_codigo_bolsa
                                                                        AND actbolsa.act_estado NOT IN (0, 9, 46, 47)
                WHERE   TRUE
                GROUP BY act.act_codigo
              ) a ON po.pobj_codigo = a.pobj_codigo
        WHERE   TRUE
              AND po.pobj_codigo IN (779)
              AND a.aun_codigo_ejecutora IN (4)
              AND a.act_estado NOT IN (0, 5, 9, 47)
        GROUP BY po.pobj_codigo
;
--&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&6
        WITH
        tmp_adicion AS (
          SELECT
                amh.act_codigo_adicion AS act_codigo,
                COALESCE(SUM(amh.amh_horas), 0) AS horas_adicion
          FROM  estructura_poa.actividades_movimientos_horas amh
          WHERE TRUE
                AND amh.amh_estado NOT IN (0,5,9)
                AND amh.tmh_codigo NOT IN (1) -- NO SUMA CUANDO ES F21
          GROUP BY amh.act_codigo_adicion
        ),
        tmp_disminucion AS (
          SELECT
                amh.act_codigo_disminucion AS act_codigo,
                COALESCE(SUM(amh.amh_horas), 0) AS horas_disminucion
          FROM  estructura_poa.actividades_movimientos_horas amh
          WHERE TRUE
                AND amh.amh_estado NOT IN (0,5,9)
                AND amh.amh_codigo NOT IN (9) -- CASO EDICIÓN DE HORAS, NO TOMAR EN CUENTA
          GROUP BY amh.act_codigo_disminucion
        )
        SELECT
              t.act_codigo,
              t.act_numero,
              t.aun_codigo_ejecutora,
              au.aun_sigla,
              t.act_horas_planificadas AS horas_planificadas,
              (t.act_horas_planificadas + (COALESCE(tmp_adicion.horas_adicion, 0) - COALESCE(tmp_disminucion.horas_disminucion, 0)))::INT AS horas_calculo_movimiento
        FROM    estructura_poa.actividades t
              LEFT JOIN estructura_organizacional.areas_unidades au ON t.aun_codigo_ejecutora = au.aun_codigo
              LEFT JOIN tmp_adicion ON t.act_codigo = tmp_adicion.act_codigo
              LEFT JOIN tmp_disminucion ON t.act_codigo = tmp_disminucion.act_codigo
        WHERE   TRUE
              AND t.act_codigo IN (1797)
        ORDER BY t.act_codigo
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