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
### Listado de ACP
### Reportes en excel, reportes PDF
- Menu reportes
- Reportes Areas Actividades
- Reporte Poa Anual
- Y en todos los que se vea