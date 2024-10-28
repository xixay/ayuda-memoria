# Hacer
- Hacer un reporte sin datos
- Este reporte recibira un array de objetos
- Cada objeto tendra como atributo un tipo y un array de objetos
- Si es de tipo 1 llamara a el subreporte para tipo 1, si es de tipo 2 llamara a un subreporte de tipo 2
- Cada subreporte debera empezar en cada pagina por separado, no debera continuar al que ya hay
- Los textos deben estar justificados, no deben achicarse, deben empujar a los que estan abajo
- La entidad, se puede sacar del act_codigo, que se obtiene del inicio actividad, que a su ves proviene de un inicio_actividad_poa, el inicio de actividad tiene un informe, que a su ves tiene tipo de informe
- hay un campo que esta unido el iac_codigo_control vista y tipo de informe,
- los informes solo se visualizaran si estan emitidos, en la cuarta pestaña
# Ejms
## Formato 1
![[img0.jpg]]
![[inicial.pdf]]
## Formato 2
![[img1.jpg]]
## Resumen
![[img2.jpg]]
### Tomar en cuenta
- Texto justificado
- Debe aceptar cualquier tipo de caracter
- Es una nueva tabla, Sushy lo esta haciendo
### Servidor
```
npm install -g json-server
```
- reporte.json
```json
{
  "data": [
    {
      "tipo": "example1",
      "items": [
        {"name": "item1", "value": "100"},
        {"name": "item2", "value": "200"}
      ]
    },
    {
      "tipo": "example2",
      "items": [
        {"name": "item3", "value": "300"},
        {"name": "item4", "value": "400"}
      ]
    }
  ]
}

```
- dsdsd
```
json-server --watch reporte.json --port 7008  
```

- acceder
```
GET http://localhost:7008/data HTTP/1.1

Content-Type: application/json
```
- CONAUD
- Las acciones sobre Registro de Informes aún no pueden ser utilizados.
- El usuario debe contar con el rol adecuado
- La actividad debe estar consolidada
- La actividad no cuenta con un inicio actividad POA
- http://192.168.0.13:3002/conaud/inicios-actividades?ges_codigo=2&act_codigo=2837
  
### ejm backup_20241027_211308.sql
- act_codigo=2054
- act_numero=510.1502.23.3.24
#### query
```sql
SELECT 	*
FROM 	ejecucion_actividades.informes_estados ie
WHERE 	ie.eev_codigo IN (38)
;
SELECT 	*
FROM 	ejecucion_actividades.inicio_actividad_poa iap 
WHERE 	iap.iac_codigo IN (187)
;

--tipo evaluacion
SELECT 	*
FROM 	estructura_poa.actividades a 
WHERE 	a.act_numero LIKE 	'520.1502.90.1.24'
;
```

|     | **GDH-GAD** |                                 |                      |         |
| --- | ----------- | ------------------------------- | -------------------- | ------- |
|     | 4088924     | MARY JHOANNA ACUÑA ANIBARRO     | GERENTE CONSOLIDADOR | EDICION |
|     | 1054869     | CARMEN LUANA ARANCIBIA VALVERDE | FORMULADOR           | EDICION |
|     | 2389409     | OLGA EDITH SUAREZ JIMENEZ       | SUPERVISOR           | EDICION |
|     | 4088924     | MARY JHOANNA ACUÑA ANIBARRO     | APROBADOR            | EDICION |
|     | 1054869     | CARMEN LUANA ARANCIBIA VALVERDE | FORMULADOR GERENTE   | EDICION |

![[conau.png]]
### Con formulador gerente se crea el informe
![[conau2.png]]

### Con Gestion institucional
- http://192.168.0.13:3002/conaud/sispoa-actividades-formularios-informes?act_codigo=2054&ges_codigo=2&iac_codigo=187&ges_inst=1&ges_verf=1&aun_codigo_ejecutora=28
- se registra su estado a emision
![[conau3.png]]
![[conau4.png]]
  ### Deberia poderse registrar recomendaciones en formulador gerente
  ![[conau6.png]]


## Tarea a realizar

### considerar
- La entidad, se puede sacar del act_codigo, que se obtiene del inicio actividad, que a su ves proviene de un inicio_actividad_poa, el inicio de actividad tiene un informe, que a su ves tiene tipo de informe
- hay un campo que esta unido el iac_codigo_control vista y tipo de informe,
- Se enviara un inf_codigo
- un informes tine N informe_recomendaciones
- 1 informe_recomendaciones tiene N informe_recomendaciones_seguimientos
- informe_recomendaciones_seguimientos (Formato) aqui esta el formato tre_codigo 1(Formato 1) , 2(Formato 2)
- N° Recomendacion es (informe_recomendaciones.ire_numero_recomendacion)
- Recomendación(informe_recomendaciones.ire_nombre)
- Recomendación, la parte de abajo opocional(informe_recomendaciones.ire_descripcion)
- Aceptacíon(informe_recomendaciones_seguimientos.irs_aceptacion)
- Justificacion(informe_recomendaciones_seguimientos.irs_justificacion)
- Tomar el ultimo de informe_recomendaciones su estado, como la relacion de infome recomendaciones puede tener N informe_recomendaciones_seguimientos
- Periodo de implantación(informe_recomendaciones_seguimientos.irs_fecha_inicio y informe_recomendaciones_seguimientos.irs_fecha_fin )
- Responsable, se le enviara un json con los N responsables(informe_recomendaciones_seguimientos.irs_responsables)

#### datos: backup_20241028_101441.sql
- act_codigo=2054
- act_numero=510.1502.23.3.24
#### query
```sql
SELECT 	*
FROM 	ejecucion_actividades.informes_estados ie
WHERE 	ie.eev_codigo IN (38)
;
SELECT 	*
FROM 	ejecucion_actividades.inicio_actividad_poa iap 
WHERE 	iap.iac_codigo IN (187)
;

--tipo evaluacion
SELECT 	*
FROM 	estructura_poa.actividades a 
WHERE 	a.act_numero LIKE 	'520.1502.90.1.24'
;
```

|     | **GDH-GAD** |                                 |                      |         |
| --- | ----------- | ------------------------------- | -------------------- | ------- |
|     | 4088924     | MARY JHOANNA ACUÑA ANIBARRO     | GERENTE CONSOLIDADOR | EDICION |
|     | 1054869     | CARMEN LUANA ARANCIBIA VALVERDE | FORMULADOR           | EDICION |
|     | 2389409     | OLGA EDITH SUAREZ JIMENEZ       | SUPERVISOR           | EDICION |
|     | 4088924     | MARY JHOANNA ACUÑA ANIBARRO     | APROBADOR            | EDICION |
|     | 1054869     | CARMEN LUANA ARANCIBIA VALVERDE | FORMULADOR GERENTE   | EDICION |

- http://172.16.22.243:7002/informe-recomendaciones?inf_codigo=(375)&iac_codigo=(undefined)
![[db_poa_update_b_-_ejecucion_actividades.png]]

- query
```http
#### LOGIN
# @name login_interno
POST [http://172.16.80.32:4002/api/v1/auth_cge](http://172.16.80.32:4002/api/v1/auth_cge) HTTP/1.1
Content-type: application/json

{
    "usuario": "4755293",
    "password": "Pruebas"
}


#### SERVICES OBJETIVOS-AREA-UNIDAD
@token = {{login_interno.response.body.datos.token}}
@host = [http://172.16.22.234:7001/](http://172.16.22.234:7001/)
@path = informe-recomendaciones

### FindAll
GET {{host}}{{path}}/informe-recomendaciones-seguimientos?ire_estado=(1)&irs_estado=(1)&inf_codigo=(365) HTTP/1.1
Content-Type: application/json
Authorization: {{token}}

### FindOne
GET {{host}}{{path}}/informe-recomendaciones-seguimientos?ire_codigo=(213) HTTP/1.1
Content-Type: application/json
Authorization: {{token}}

### CREATE
POST {{host}}{{path}}/informe-recomendaciones-seguimientos HTTP/1.1
Content-Type: application/json
Authorization: {{token}}

{
    "ire_numero_recomendacion": "1.1",
    "ire_nombre": "Incorporar procedimientos de detección de necesidades referidas a mantenimiento, mejora, conservación de los bienes, ambientes y otros requerimientos para el buen funcionamiento de los hogares y albergues.",
    "ire_descripcion": "Incorporar procedimientos de detección de necesidades referidas a mantenimiento, mejora, conservación de los bienes, ambientes y otros requerimientos para el buen funcionamiento de los hogares y albergues, incorporando actividades de control que garantice la programación anual de los recursos financieros necesarios y se efectúen el mantenimiento, mejora y conservación de la infraestructura y mobiliario de los hogares y albergues de acogida administrados por el Servicio Regional de Gestión Social (SEREGES) - Yacuiba de manera oportuna, a efectos de que se brinde condiciones de habitabilidad para un desarrollo adecuado y una mejor estadía de las niñas, niños y adolescentes que se encuentran en dichos centros de acogida.",
    "inf_codigo": 372,
    "tre_codigo": 2,
    "eir_codigo": 1,
    "irs_fecha_inicio": "28/05/2024",
    "irs_fecha_fin": "01/12/2024",
    "irs_responsables": [
        {
            "per_nombre_completo": "JUAN PEREZ",
            "per_cargo": "CARGO 1"
        },
        {
            "per_nombre_completo": "PEDRO PEREZ",
            "per_cargo": "CARGO 2"
        }
    ],
    "irs_tareas_desarrollar": "El gerente nacional administratvio financiero, emitira ..."
}


### UPDATE
PUT {{host}}{{path}}/informe-recomendaciones-seguimientos HTTP/1.1
Content-Type: application/json
Authorization: {{token}}
```









