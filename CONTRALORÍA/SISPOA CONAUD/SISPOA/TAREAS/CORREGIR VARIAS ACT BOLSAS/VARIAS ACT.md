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
- Reportes Areas Actividades
- Reporte Poa Anual
- Y en todos los que se vea