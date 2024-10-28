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

#### Roles

|     | **GDH-GAD** |                                 |                      |         |
| --- | ----------- | ------------------------------- | -------------------- | ------- |
|     | 4088924     | MARY JHOANNA ACUÑA ANIBARRO     | GERENTE CONSOLIDADOR | EDICION |
|     | 1054869     | CARMEN LUANA ARANCIBIA VALVERDE | FORMULADOR           | EDICION |
|     | 2389409     | OLGA EDITH SUAREZ JIMENEZ       | SUPERVISOR           | EDICION |
|     | 4088924     | MARY JHOANNA ACUÑA ANIBARRO     | APROBADOR            | EDICION |
|     | 1054869     | CARMEN LUANA ARANCIBIA VALVERDE | FORMULADOR GERENTE   | EDICION |

#### http://172.16.22.243:7002/informe-recomendaciones?inf_codigo=(375)&iac_codigo=(undefined)
#### base
![[db_poa_update_b_-_ejecucion_actividades.png]]

#### api
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
WHERE 	a.act_codigo IN (2054)
;
SELECT 	*
FROM 	ejecucion_actividades.informe_recomendaciones ir
WHERE 	TRUE
		AND ir.inf_codigo IN (375)
ORDER BY ir.ire_codigo DESC
;
SELECT 	*
FROM 	ejecucion_actividades.inicios_actividades ia 
;

SELECT 	*
FROM 	ejecucion_actividades.informe_recomendaciones_seguimientos irs
--WHERE 	irs.inf_codigo IN (375)
ORDER BY irs.irs_codigo DESC;
INSERT INTO ejecucion_actividades.informe_recomendaciones_seguimientos
(irs_codigo, irs_aceptacion, irs_justificacion, irs_fecha_inicio, irs_fecha_fin, ire_codigo, inf_codigo, eir_codigo, irs_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, irs_responsables, irs_tareas_desarrollar, tre_codigo)
VALUES(217, '1', 'dsdsdsssdsd dsdsd dsdsd', '2024-03-01', '2024-10-31', 217, 375, 1, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', NULL, NULL, 1);
INSERT INTO ejecucion_actividades.informe_recomendaciones_seguimientos
(irs_codigo, irs_aceptacion, irs_justificacion, irs_fecha_inicio, irs_fecha_fin, ire_codigo, inf_codigo, eir_codigo, irs_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, irs_responsables, irs_tareas_desarrollar, tre_codigo)
VALUES(218, '1', 'zzzz zzz zzzzz zzzz', '2024-03-01', '2024-10-31', 218, 375, 1, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', NULL, NULL, 1);
INSERT INTO ejecucion_actividades.informe_recomendaciones_seguimientos
(irs_codigo, irs_aceptacion, irs_justificacion, irs_fecha_inicio, irs_fecha_fin, ire_codigo, inf_codigo, eir_codigo, irs_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, irs_responsables, irs_tareas_desarrollar, tre_codigo)
VALUES(219, '1', 'yyyyyy yyyyyyyyyyyy', '2024-03-01', '2024-10-31', 219, 375, 1, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', NULL, NULL, 1);
INSERT INTO ejecucion_actividades.informe_recomendaciones_seguimientos
(irs_codigo, irs_aceptacion, irs_justificacion, irs_fecha_inicio, irs_fecha_fin, ire_codigo, inf_codigo, eir_codigo, irs_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, irs_responsables, irs_tareas_desarrollar, tre_codigo)
VALUES(220, '1', 'yyyyyy yyyyyyyyyyyy', '2024-03-01', '2024-10-31', 220, 375, 1, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', NULL, NULL, 1);
INSERT INTO ejecucion_actividades.informe_recomendaciones_seguimientos
(irs_codigo, irs_aceptacion, irs_justificacion, irs_fecha_inicio, irs_fecha_fin, ire_codigo, inf_codigo, eir_codigo, irs_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, irs_responsables, irs_tareas_desarrollar, tre_codigo)
VALUES(221, '1', 'yyyyyy yyyyyyyyyyyy', '2024-03-01', '2024-10-31', 221, 375, 1, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', NULL, NULL, 1);
INSERT INTO ejecucion_actividades.informe_recomendaciones_seguimientos
(irs_codigo, irs_aceptacion, irs_justificacion, irs_fecha_inicio, irs_fecha_fin, ire_codigo, inf_codigo, eir_codigo, irs_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, irs_responsables, irs_tareas_desarrollar, tre_codigo)
VALUES(222, '1', 'yyyyyy yyyyyyyyyyyy', '2024-03-01', '2024-10-31', 222, 375, 1, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', NULL, NULL, 1);
INSERT INTO ejecucion_actividades.informe_recomendaciones_seguimientos
(irs_codigo, irs_aceptacion, irs_justificacion, irs_fecha_inicio, irs_fecha_fin, ire_codigo, inf_codigo, eir_codigo, irs_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, irs_responsables, irs_tareas_desarrollar, tre_codigo)
VALUES(223, '1', 'yyyyyy yyyyyyyyyyyy', '2024-03-01', '2024-10-31', 223, 375, 1, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', NULL, NULL, 1);
INSERT INTO ejecucion_actividades.informe_recomendaciones_seguimientos
(irs_codigo, irs_aceptacion, irs_justificacion, irs_fecha_inicio, irs_fecha_fin, ire_codigo, inf_codigo, eir_codigo, irs_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, irs_responsables, irs_tareas_desarrollar, tre_codigo)
VALUES(224, '1', 'yyyyyy yyyyyyyyyyyy', '2024-03-01', '2024-10-31', 224, 375, 1, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', NULL, NULL, 1);
INSERT INTO ejecucion_actividades.informe_recomendaciones_seguimientos
(irs_codigo, irs_aceptacion, irs_justificacion, irs_fecha_inicio, irs_fecha_fin, ire_codigo, inf_codigo, eir_codigo, irs_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, irs_responsables, irs_tareas_desarrollar, tre_codigo)
VALUES(225, '1', 'yyyyyy yyyyyyyyyyyy', '2024-03-01', '2024-10-31', 225, 375, 1, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', NULL, NULL, 1);
INSERT INTO ejecucion_actividades.informe_recomendaciones_seguimientos
(irs_codigo, irs_aceptacion, irs_justificacion, irs_fecha_inicio, irs_fecha_fin, ire_codigo, inf_codigo, eir_codigo, irs_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, irs_responsables, irs_tareas_desarrollar, tre_codigo)
VALUES(226, '1', 'yyyyyy yyyyyyyyyyyy', '2024-03-01', '2024-10-31', 226, 375, 1, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', NULL, NULL, 1);
INSERT INTO ejecucion_actividades.informe_recomendaciones_seguimientos
(irs_codigo, irs_aceptacion, irs_justificacion, irs_fecha_inicio, irs_fecha_fin, ire_codigo, inf_codigo, eir_codigo, irs_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, irs_responsables, irs_tareas_desarrollar, tre_codigo)
VALUES(227, '1', 'yyyyyy yyyyyyyyyyyy', '2024-03-01', '2024-10-31', 227, 375, 1, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', NULL, NULL, 1);
INSERT INTO ejecucion_actividades.informe_recomendaciones_seguimientos
(irs_codigo, irs_aceptacion, irs_justificacion, irs_fecha_inicio, irs_fecha_fin, ire_codigo, inf_codigo, eir_codigo, irs_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, irs_responsables, irs_tareas_desarrollar, tre_codigo)
VALUES(228, '1', 'yyyyyy yyyyyyyyyyyy', '2024-03-01', '2024-10-31', 228, 375, 1, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', NULL, NULL, 1);
INSERT INTO ejecucion_actividades.informe_recomendaciones_seguimientos
(irs_codigo, irs_aceptacion, irs_justificacion, irs_fecha_inicio, irs_fecha_fin, ire_codigo, inf_codigo, eir_codigo, irs_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, irs_responsables, irs_tareas_desarrollar, tre_codigo)
VALUES(229, '1', 'yyyyyy yyyyyyyyyyyy', '2024-03-01', '2024-10-31', 229, 375, 1, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', NULL, NULL, 1);
INSERT INTO ejecucion_actividades.informe_recomendaciones_seguimientos
(irs_codigo, irs_aceptacion, irs_justificacion, irs_fecha_inicio, irs_fecha_fin, ire_codigo, inf_codigo, eir_codigo, irs_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, irs_responsables, irs_tareas_desarrollar, tre_codigo)
VALUES(230, '1', 'yyyyyy yyyyyyyyyyyy', '2024-03-01', '2024-10-31', 230, 375, 1, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', NULL, NULL, 1);
INSERT INTO ejecucion_actividades.informe_recomendaciones_seguimientos
(irs_codigo, irs_aceptacion, irs_justificacion, irs_fecha_inicio, irs_fecha_fin, ire_codigo, inf_codigo, eir_codigo, irs_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, irs_responsables, irs_tareas_desarrollar, tre_codigo)
VALUES(231, '1', 'yyyyyy yyyyyyyyyyyy', '2024-03-01', '2024-10-31', 231, 375, 1, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', NULL, NULL, 1);
INSERT INTO ejecucion_actividades.informe_recomendaciones_seguimientos
(irs_codigo, irs_aceptacion, irs_justificacion, irs_fecha_inicio, irs_fecha_fin, ire_codigo, inf_codigo, eir_codigo, irs_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, irs_responsables, irs_tareas_desarrollar, tre_codigo)
VALUES(232, '1', 'yyyyyy yyyyyyyyyyyy', '2024-03-01', '2024-10-31', 232, 375, 1, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', NULL, NULL, 1);
INSERT INTO ejecucion_actividades.informe_recomendaciones_seguimientos
(irs_codigo, irs_aceptacion, irs_justificacion, irs_fecha_inicio, irs_fecha_fin, ire_codigo, inf_codigo, eir_codigo, irs_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, irs_responsables, irs_tareas_desarrollar, tre_codigo)
VALUES(233, '1', 'yyyyyy yyyyyyyyyyyy', '2024-03-01', '2024-10-31', 233, 375, 1, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', NULL, NULL, 1);
INSERT INTO ejecucion_actividades.informe_recomendaciones_seguimientos
(irs_codigo, irs_aceptacion, irs_justificacion, irs_fecha_inicio, irs_fecha_fin, ire_codigo, inf_codigo, eir_codigo, irs_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, irs_responsables, irs_tareas_desarrollar, tre_codigo)
VALUES(234, '1', 'yyyyyy yyyyyyyyyyyy', '2024-03-01', '2024-10-31', 234, 375, 1, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', NULL, NULL, 1);
SELECT 	*
FROM 	ejecucion_actividades.informes i 
WHERE 	i.inf_codigo IN (375);
INSERT INTO ejecucion_actividades.informe_recomendaciones
(ire_codigo, ire_descripcion, inf_codigo, ire_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, ire_numero_recomendacion, ire_nombre)
VALUES(217, 'R06.	Recomendamos al Director de la Dirección Departamental de Educación  Cochabamba, a través de la Subdirección de Educación Regular, implementar actividades de supervisión y aplicar medidas correctivas oportunas sobre la logística, equipos, requisitos y materiales necesarios para la generación oportuna de los títulos de técnico medio a las y los estudiantes/participantes, que concluyan sus procesos educativos en las Unidades Educativas Técnico Humanística Plenas y Centros de Educación Alternativa, según calendario educativo; a efectos de que los estudiantes acreditados, puedan continuar con la formación en Educación Superior, generar emprendimientos productivos y/o la inserción en el ámbito laboral, para contribuir a la transformación de la matriz productiva con identidad cultural, soberanía alimentaria, científica, tecnológica y la reactivación económica del Estado Plurinacional de Bolivia, que constituye el objetivo del Bachillerato Técnico Humanístico.', 375, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', '', '');
INSERT INTO ejecucion_actividades.informe_recomendaciones
(ire_codigo, ire_descripcion, inf_codigo, ire_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, ire_numero_recomendacion, ire_nombre)
VALUES(218, 'R07.	Recomendamos al Director de la Dirección Departamental de Educación  Cochabamba, a través de la Subdirección de Educación Regular, implementar actividades de supervisión y aplicar medidas correctivas oportunas sobre la logística, equipos, requisitos y materiales necesarios para la generación oportuna de los títulos de técnico medio a las y los estudiantes/participantes, que concluyan sus procesos educativos en las Unidades Educativas Técnico Humanística Plenas y Centros de Educación Alternativa, según calendario educativo; a efectos de que los estudiantes acreditados, puedan continuar con la formación en Educación Superior, generar emprendimientos productivos y/o la inserción en el ámbito laboral, para contribuir a la transformación de la matriz productiva con identidad cultural, soberanía alimentaria, científica, tecnológica y la reactivación económica del Estado Plurinacional de Bolivia, que constituye el objetivo del Bachillerato Técnico Humanístico.', 375, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', '', '');
INSERT INTO ejecucion_actividades.informe_recomendaciones
(ire_codigo, ire_descripcion, inf_codigo, ire_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, ire_numero_recomendacion, ire_nombre)
VALUES(219, 'R09.	Recomendamos al Director de la Dirección Departamental de Educación  Cochabamba, a través de la Subdirección de Educación Regular, implementar actividades de supervisión y aplicar medidas correctivas oportunas sobre la logística, equipos, requisitos y materiales necesarios para la generación oportuna de los títulos de técnico medio a las y los estudiantes/participantes, que concluyan sus procesos educativos en las Unidades Educativas Técnico Humanística Plenas y Centros de Educación Alternativa, según calendario educativo; a efectos de que los estudiantes acreditados, puedan continuar con la formación en Educación Superior, generar emprendimientos productivos y/o la inserción en el ámbito laboral, para contribuir a la transformación de la matriz productiva con identidad cultural, soberanía alimentaria, científica, tecnológica y la reactivación económica del Estado Plurinacional de Bolivia, que constituye el objetivo del Bachillerato Técnico Humanístico.', 375, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', '', '');
INSERT INTO ejecucion_actividades.informe_recomendaciones
(ire_codigo, ire_descripcion, inf_codigo, ire_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, ire_numero_recomendacion, ire_nombre)
VALUES(220, 'R09.	Recomendamos al Director de la Dirección Departamental de Educación  Cochabamba, a través de la Subdirección de Educación Regular, implementar actividades de supervisión y aplicar medidas correctivas oportunas sobre la logística, equipos, requisitos y materiales necesarios para la generación oportuna de los títulos de técnico medio a las y los estudiantes/participantes, que concluyan sus procesos educativos en las Unidades Educativas Técnico Humanística Plenas y Centros de Educación Alternativa, según calendario educativo; a efectos de que los estudiantes acreditados, puedan continuar con la formación en Educación Superior, generar emprendimientos productivos y/o la inserción en el ámbito laboral, para contribuir a la transformación de la matriz productiva con identidad cultural, soberanía alimentaria, científica, tecnológica y la reactivación económica del Estado Plurinacional de Bolivia, que constituye el objetivo del Bachillerato Técnico Humanístico.', 375, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', '', '');
INSERT INTO ejecucion_actividades.informe_recomendaciones
(ire_codigo, ire_descripcion, inf_codigo, ire_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, ire_numero_recomendacion, ire_nombre)
VALUES(221, 'R09.	Recomendamos al Director de la Dirección Departamental de Educación  Cochabamba, a través de la Subdirección de Educación Regular, implementar actividades de supervisión y aplicar medidas correctivas oportunas sobre la logística, equipos, requisitos y materiales necesarios para la generación oportuna de los títulos de técnico medio a las y los estudiantes/participantes, que concluyan sus procesos educativos en las Unidades Educativas Técnico Humanística Plenas y Centros de Educación Alternativa, según calendario educativo; a efectos de que los estudiantes acreditados, puedan continuar con la formación en Educación Superior, generar emprendimientos productivos y/o la inserción en el ámbito laboral, para contribuir a la transformación de la matriz productiva con identidad cultural, soberanía alimentaria, científica, tecnológica y la reactivación económica del Estado Plurinacional de Bolivia, que constituye el objetivo del Bachillerato Técnico Humanístico.', 375, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', '', '');
INSERT INTO ejecucion_actividades.informe_recomendaciones
(ire_codigo, ire_descripcion, inf_codigo, ire_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, ire_numero_recomendacion, ire_nombre)
VALUES(222, 'R09.	Recomendamos al Director de la Dirección Departamental de Educación  Cochabamba, a través de la Subdirección de Educación Regular, implementar actividades de supervisión y aplicar medidas correctivas oportunas sobre la logística, equipos, requisitos y materiales necesarios para la generación oportuna de los títulos de técnico medio a las y los estudiantes/participantes, que concluyan sus procesos educativos en las Unidades Educativas Técnico Humanística Plenas y Centros de Educación Alternativa, según calendario educativo; a efectos de que los estudiantes acreditados, puedan continuar con la formación en Educación Superior, generar emprendimientos productivos y/o la inserción en el ámbito laboral, para contribuir a la transformación de la matriz productiva con identidad cultural, soberanía alimentaria, científica, tecnológica y la reactivación económica del Estado Plurinacional de Bolivia, que constituye el objetivo del Bachillerato Técnico Humanístico.', 375, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', '', '');
INSERT INTO ejecucion_actividades.informe_recomendaciones
(ire_codigo, ire_descripcion, inf_codigo, ire_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, ire_numero_recomendacion, ire_nombre)
VALUES(223, 'R09.	Recomendamos al Director de la Dirección Departamental de Educación  Cochabamba, a través de la Subdirección de Educación Regular, implementar actividades de supervisión y aplicar medidas correctivas oportunas sobre la logística, equipos, requisitos y materiales necesarios para la generación oportuna de los títulos de técnico medio a las y los estudiantes/participantes, que concluyan sus procesos educativos en las Unidades Educativas Técnico Humanística Plenas y Centros de Educación Alternativa, según calendario educativo; a efectos de que los estudiantes acreditados, puedan continuar con la formación en Educación Superior, generar emprendimientos productivos y/o la inserción en el ámbito laboral, para contribuir a la transformación de la matriz productiva con identidad cultural, soberanía alimentaria, científica, tecnológica y la reactivación económica del Estado Plurinacional de Bolivia, que constituye el objetivo del Bachillerato Técnico Humanístico.', 375, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', '', '');
INSERT INTO ejecucion_actividades.informe_recomendaciones
(ire_codigo, ire_descripcion, inf_codigo, ire_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, ire_numero_recomendacion, ire_nombre)
VALUES(224, 'R09.	Recomendamos al Director de la Dirección Departamental de Educación  Cochabamba, a través de la Subdirección de Educación Regular, implementar actividades de supervisión y aplicar medidas correctivas oportunas sobre la logística, equipos, requisitos y materiales necesarios para la generación oportuna de los títulos de técnico medio a las y los estudiantes/participantes, que concluyan sus procesos educativos en las Unidades Educativas Técnico Humanística Plenas y Centros de Educación Alternativa, según calendario educativo; a efectos de que los estudiantes acreditados, puedan continuar con la formación en Educación Superior, generar emprendimientos productivos y/o la inserción en el ámbito laboral, para contribuir a la transformación de la matriz productiva con identidad cultural, soberanía alimentaria, científica, tecnológica y la reactivación económica del Estado Plurinacional de Bolivia, que constituye el objetivo del Bachillerato Técnico Humanístico.', 375, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', '', '');
INSERT INTO ejecucion_actividades.informe_recomendaciones
(ire_codigo, ire_descripcion, inf_codigo, ire_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, ire_numero_recomendacion, ire_nombre)
VALUES(225, 'R09.	Recomendamos al Director de la Dirección Departamental de Educación  Cochabamba, a través de la Subdirección de Educación Regular, implementar actividades de supervisión y aplicar medidas correctivas oportunas sobre la logística, equipos, requisitos y materiales necesarios para la generación oportuna de los títulos de técnico medio a las y los estudiantes/participantes, que concluyan sus procesos educativos en las Unidades Educativas Técnico Humanística Plenas y Centros de Educación Alternativa, según calendario educativo; a efectos de que los estudiantes acreditados, puedan continuar con la formación en Educación Superior, generar emprendimientos productivos y/o la inserción en el ámbito laboral, para contribuir a la transformación de la matriz productiva con identidad cultural, soberanía alimentaria, científica, tecnológica y la reactivación económica del Estado Plurinacional de Bolivia, que constituye el objetivo del Bachillerato Técnico Humanístico.', 375, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', '', '');
INSERT INTO ejecucion_actividades.informe_recomendaciones
(ire_codigo, ire_descripcion, inf_codigo, ire_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, ire_numero_recomendacion, ire_nombre)
VALUES(226, 'R09.	Recomendamos al Director de la Dirección Departamental de Educación  Cochabamba, a través de la Subdirección de Educación Regular, implementar actividades de supervisión y aplicar medidas correctivas oportunas sobre la logística, equipos, requisitos y materiales necesarios para la generación oportuna de los títulos de técnico medio a las y los estudiantes/participantes, que concluyan sus procesos educativos en las Unidades Educativas Técnico Humanística Plenas y Centros de Educación Alternativa, según calendario educativo; a efectos de que los estudiantes acreditados, puedan continuar con la formación en Educación Superior, generar emprendimientos productivos y/o la inserción en el ámbito laboral, para contribuir a la transformación de la matriz productiva con identidad cultural, soberanía alimentaria, científica, tecnológica y la reactivación económica del Estado Plurinacional de Bolivia, que constituye el objetivo del Bachillerato Técnico Humanístico.', 375, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', '', '');
INSERT INTO ejecucion_actividades.informe_recomendaciones
(ire_codigo, ire_descripcion, inf_codigo, ire_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, ire_numero_recomendacion, ire_nombre)
VALUES(227, 'R09.	Recomendamos al Director de la Dirección Departamental de Educación  Cochabamba, a través de la Subdirección de Educación Regular, implementar actividades de supervisión y aplicar medidas correctivas oportunas sobre la logística, equipos, requisitos y materiales necesarios para la generación oportuna de los títulos de técnico medio a las y los estudiantes/participantes, que concluyan sus procesos educativos en las Unidades Educativas Técnico Humanística Plenas y Centros de Educación Alternativa, según calendario educativo; a efectos de que los estudiantes acreditados, puedan continuar con la formación en Educación Superior, generar emprendimientos productivos y/o la inserción en el ámbito laboral, para contribuir a la transformación de la matriz productiva con identidad cultural, soberanía alimentaria, científica, tecnológica y la reactivación económica del Estado Plurinacional de Bolivia, que constituye el objetivo del Bachillerato Técnico Humanístico.', 375, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', '', '');
INSERT INTO ejecucion_actividades.informe_recomendaciones
(ire_codigo, ire_descripcion, inf_codigo, ire_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, ire_numero_recomendacion, ire_nombre)
VALUES(228, 'R09.	Recomendamos al Director de la Dirección Departamental de Educación  Cochabamba, a través de la Subdirección de Educación Regular, implementar actividades de supervisión y aplicar medidas correctivas oportunas sobre la logística, equipos, requisitos y materiales necesarios para la generación oportuna de los títulos de técnico medio a las y los estudiantes/participantes, que concluyan sus procesos educativos en las Unidades Educativas Técnico Humanística Plenas y Centros de Educación Alternativa, según calendario educativo; a efectos de que los estudiantes acreditados, puedan continuar con la formación en Educación Superior, generar emprendimientos productivos y/o la inserción en el ámbito laboral, para contribuir a la transformación de la matriz productiva con identidad cultural, soberanía alimentaria, científica, tecnológica y la reactivación económica del Estado Plurinacional de Bolivia, que constituye el objetivo del Bachillerato Técnico Humanístico.', 375, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', '', '');
INSERT INTO ejecucion_actividades.informe_recomendaciones
(ire_codigo, ire_descripcion, inf_codigo, ire_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, ire_numero_recomendacion, ire_nombre)
VALUES(229, 'R09.	Recomendamos al Director de la Dirección Departamental de Educación  Cochabamba, a través de la Subdirección de Educación Regular, implementar actividades de supervisión y aplicar medidas correctivas oportunas sobre la logística, equipos, requisitos y materiales necesarios para la generación oportuna de los títulos de técnico medio a las y los estudiantes/participantes, que concluyan sus procesos educativos en las Unidades Educativas Técnico Humanística Plenas y Centros de Educación Alternativa, según calendario educativo; a efectos de que los estudiantes acreditados, puedan continuar con la formación en Educación Superior, generar emprendimientos productivos y/o la inserción en el ámbito laboral, para contribuir a la transformación de la matriz productiva con identidad cultural, soberanía alimentaria, científica, tecnológica y la reactivación económica del Estado Plurinacional de Bolivia, que constituye el objetivo del Bachillerato Técnico Humanístico.', 375, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', '', '');
INSERT INTO ejecucion_actividades.informe_recomendaciones
(ire_codigo, ire_descripcion, inf_codigo, ire_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, ire_numero_recomendacion, ire_nombre)
VALUES(230, 'R09.	Recomendamos al Director de la Dirección Departamental de Educación  Cochabamba, a través de la Subdirección de Educación Regular, implementar actividades de supervisión y aplicar medidas correctivas oportunas sobre la logística, equipos, requisitos y materiales necesarios para la generación oportuna de los títulos de técnico medio a las y los estudiantes/participantes, que concluyan sus procesos educativos en las Unidades Educativas Técnico Humanística Plenas y Centros de Educación Alternativa, según calendario educativo; a efectos de que los estudiantes acreditados, puedan continuar con la formación en Educación Superior, generar emprendimientos productivos y/o la inserción en el ámbito laboral, para contribuir a la transformación de la matriz productiva con identidad cultural, soberanía alimentaria, científica, tecnológica y la reactivación económica del Estado Plurinacional de Bolivia, que constituye el objetivo del Bachillerato Técnico Humanístico.', 375, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', '', '');
INSERT INTO ejecucion_actividades.informe_recomendaciones
(ire_codigo, ire_descripcion, inf_codigo, ire_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, ire_numero_recomendacion, ire_nombre)
VALUES(231, 'R09.	Recomendamos al Director de la Dirección Departamental de Educación  Cochabamba, a través de la Subdirección de Educación Regular, implementar actividades de supervisión y aplicar medidas correctivas oportunas sobre la logística, equipos, requisitos y materiales necesarios para la generación oportuna de los títulos de técnico medio a las y los estudiantes/participantes, que concluyan sus procesos educativos en las Unidades Educativas Técnico Humanística Plenas y Centros de Educación Alternativa, según calendario educativo; a efectos de que los estudiantes acreditados, puedan continuar con la formación en Educación Superior, generar emprendimientos productivos y/o la inserción en el ámbito laboral, para contribuir a la transformación de la matriz productiva con identidad cultural, soberanía alimentaria, científica, tecnológica y la reactivación económica del Estado Plurinacional de Bolivia, que constituye el objetivo del Bachillerato Técnico Humanístico.', 375, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', '', '');
INSERT INTO ejecucion_actividades.informe_recomendaciones
(ire_codigo, ire_descripcion, inf_codigo, ire_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, ire_numero_recomendacion, ire_nombre)
VALUES(232, 'R09.	Recomendamos al Director de la Dirección Departamental de Educación  Cochabamba, a través de la Subdirección de Educación Regular, implementar actividades de supervisión y aplicar medidas correctivas oportunas sobre la logística, equipos, requisitos y materiales necesarios para la generación oportuna de los títulos de técnico medio a las y los estudiantes/participantes, que concluyan sus procesos educativos en las Unidades Educativas Técnico Humanística Plenas y Centros de Educación Alternativa, según calendario educativo; a efectos de que los estudiantes acreditados, puedan continuar con la formación en Educación Superior, generar emprendimientos productivos y/o la inserción en el ámbito laboral, para contribuir a la transformación de la matriz productiva con identidad cultural, soberanía alimentaria, científica, tecnológica y la reactivación económica del Estado Plurinacional de Bolivia, que constituye el objetivo del Bachillerato Técnico Humanístico.', 375, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', '', '');
INSERT INTO ejecucion_actividades.informe_recomendaciones
(ire_codigo, ire_descripcion, inf_codigo, ire_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, ire_numero_recomendacion, ire_nombre)
VALUES(233, 'R09.	Recomendamos al Director de la Dirección Departamental de Educación  Cochabamba, a través de la Subdirección de Educación Regular, implementar actividades de supervisión y aplicar medidas correctivas oportunas sobre la logística, equipos, requisitos y materiales necesarios para la generación oportuna de los títulos de técnico medio a las y los estudiantes/participantes, que concluyan sus procesos educativos en las Unidades Educativas Técnico Humanística Plenas y Centros de Educación Alternativa, según calendario educativo; a efectos de que los estudiantes acreditados, puedan continuar con la formación en Educación Superior, generar emprendimientos productivos y/o la inserción en el ámbito laboral, para contribuir a la transformación de la matriz productiva con identidad cultural, soberanía alimentaria, científica, tecnológica y la reactivación económica del Estado Plurinacional de Bolivia, que constituye el objetivo del Bachillerato Técnico Humanístico.', 375, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', '', '');
INSERT INTO ejecucion_actividades.informe_recomendaciones
(ire_codigo, ire_descripcion, inf_codigo, ire_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, ire_numero_recomendacion, ire_nombre)
VALUES(234, 'R09.	Recomendamos al Director de la Dirección Departamental de Educación  Cochabamba, a través de la Subdirección de Educación Regular, implementar actividades de supervisión y aplicar medidas correctivas oportunas sobre la logística, equipos, requisitos y materiales necesarios para la generación oportuna de los títulos de técnico medio a las y los estudiantes/participantes, que concluyan sus procesos educativos en las Unidades Educativas Técnico Humanística Plenas y Centros de Educación Alternativa, según calendario educativo; a efectos de que los estudiantes acreditados, puedan continuar con la formación en Educación Superior, generar emprendimientos productivos y/o la inserción en el ámbito laboral, para contribuir a la transformación de la matriz productiva con identidad cultural, soberanía alimentaria, científica, tecnológica y la reactivación económica del Estado Plurinacional de Bolivia, que constituye el objetivo del Bachillerato Técnico Humanístico.', 375, 1, 216, 0, 0, '2024-10-14 15:03:26.522', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000', '', '');
--
SELECT 	i.*
FROM 	ejecucion_actividades.informes i
		LEFT JOIN ejecucion_actividades.informe_recomendaciones ir ON ir.inf_codigo = i.inf_codigo
		LEFT JOIN ejecucion_actividades.informe_recomendaciones_seguimientos irs ON ir.ire_codigo = irs.ire_codigo 
WHERE 	i.inf_codigo IN (375)
;
SELECT 	--i.*,
		iap.act_codigo, a.ent_codigo ,a.ent_descripcion,
		CONCAT(ia.iac_codigo_control_vista, ' ', i.inf_codigo_control) AS nro_informe_auditoria,
		i.inf_descripcion AS inf_tipo
FROM 	ejecucion_actividades.informes i
		LEFT JOIN ejecucion_actividades.inicios_actividades ia ON i.iac_codigo = ia.iac_codigo
		LEFT JOIN ejecucion_actividades.inicio_actividad_poa iap ON ia.iac_codigo = iap.iac_codigo 
		LEFT JOIN estructura_poa.actividades a ON iap.act_codigo = a.act_codigo
WHERE 	TRUE
		AND i.inf_estado NOT IN (0,5,9)
		AND i.inf_codigo IN (375)
;
--
SELECT
		ir.ire_nombre AS desc_recomendacion,
		ir.ire_descripcion,
		ir.ire_numero_recomendacion AS nro_recomendacion,
		irs.irs_aceptacion AS aceptacion,
		irs.irs_justificacion AS justificacion_no_aceptacion,
		CONCAT('Del ',TO_CHAR(irs.irs_fecha_inicio, 'dd/mm/yyyy'), ' Al ', TO_CHAR(irs.irs_fecha_fin, 'dd/mm/yyyy')) AS periodo_implantacion,
		irs.irs_responsables AS responsable,
		irs.irs_tareas_desarrollar AS tareas_implantacion,
		irs.tre_codigo
FROM 	ejecucion_actividades.informes i
		LEFT JOIN ejecucion_actividades.informe_recomendaciones ir ON ir.inf_codigo = i.inf_codigo
		LEFT JOIN ejecucion_actividades.informe_recomendaciones_seguimientos irs ON ir.ire_codigo = irs.ire_codigo 
WHERE 	i.inf_codigo IN (375)
;
--$$$$$$$$$$$$$$$$$$$$$$
SELECT
    ir.ire_nombre AS desc_recomendacion,
    ir.ire_descripcion,
    ir.ire_numero_recomendacion AS nro_recomendacion,
    irs.irs_aceptacion AS aceptacion,
    irs.irs_justificacion AS justificacion_no_aceptacion,
    CONCAT('Del ', TO_CHAR(irs.irs_fecha_inicio, 'dd/mm/yyyy'), ' Al ', TO_CHAR(irs.irs_fecha_fin, 'dd/mm/yyyy')) AS periodo_implantacion,
    CONCAT('<ul>', 
           STRING_AGG(CONCAT('<li>', responsable ->> 'per_nombre_completo', ' - ', responsable ->> 'per_cargo', '</li>'), ''),
           '</ul>') AS responsable,
    irs.irs_tareas_desarrollar AS tareas_implantacion,
    irs.tre_codigo
FROM ejecucion_actividades.informes i
LEFT JOIN ejecucion_actividades.informe_recomendaciones ir ON ir.inf_codigo = i.inf_codigo
LEFT JOIN ejecucion_actividades.informe_recomendaciones_seguimientos irs ON ir.ire_codigo = irs.ire_codigo 
LEFT JOIN LATERAL jsonb_array_elements(irs.irs_responsables::jsonb) AS responsable ON TRUE
WHERE i.inf_codigo IN (367)
--WHERE i.inf_codigo IN (375)
GROUP BY ir.ire_nombre, ir.ire_descripcion, ir.ire_numero_recomendacion, irs.irs_aceptacion, irs.irs_justificacion, irs.irs_fecha_inicio, irs.irs_fecha_fin, irs.irs_tareas_desarrollar, irs.tre_codigo;
--########################33
SELECT
    	ir.ire_nombre AS desc_recomendacion,
    	ir.ire_descripcion,
    	ir.ire_numero_recomendacion AS nro_recomendacion,
	    CASE 
	        WHEN irs.irs_aceptacion::int = 1 THEN 'SI'
	        ELSE 'NO'
	    END AS aceptacion,
    	irs.irs_justificacion AS justificacion_no_aceptacion,
	    CONCAT('Del ', TO_CHAR(irs.irs_fecha_inicio, 'dd/mm/yyyy'), ' Al ', TO_CHAR(irs.irs_fecha_fin, 'dd/mm/yyyy')) AS periodo_implantacion,
	    -- Subconsulta para la columna 'responsable'
	    (SELECT 
	        CASE 
	            WHEN irs.irs_responsables IS NOT NULL AND jsonb_array_length(irs.irs_responsables::jsonb) > 0 THEN
	                CONCAT('<ul>', 
	                       STRING_AGG(CONCAT('<li>', responsable ->> 'per_nombre_completo', '<br>', responsable ->> 'per_cargo', '</li>'), ''),
	                       '</ul>')
	            ELSE NULL
	        END
	     FROM LATERAL jsonb_array_elements(irs.irs_responsables::jsonb) AS responsable) AS responsable,
	    irs.irs_tareas_desarrollar AS tareas_implantacion,
	    irs.tre_codigo
FROM 	ejecucion_actividades.informes i
		LEFT JOIN ejecucion_actividades.informe_recomendaciones ir ON ir.inf_codigo = i.inf_codigo
		LEFT JOIN ejecucion_actividades.informe_recomendaciones_seguimientos irs ON ir.ire_codigo = irs.ire_codigo 
WHERE 	TRUE
		AND ir.ire_estado NOT IN (0,5,9)
		AND i.inf_codigo IN (375)
		AND irs.tre_codigo IN (2)
--WHERE i.inf_codigo IN (375)
;

--%%%%%%%%%%%%%%%%%%%
SELECT tre_codigo, tre_nombre, tre_descripcion, tre_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja
FROM parametricas.tipo_recomendaciones
;

SELECT 	*
FROM 	ejecucion_actividades.informe_recomendaciones ir
WHERE 	TRUE
		AND ir.inf_codigo IN (375)
ORDER BY ir.ire_codigo ASC
;
SELECT 	*
FROM 	ejecucion_actividades.informe_recomendaciones_seguimientos irs
WHERE 	TRUE
		AND irs.inf_codigo IN (375);
--WHERE 	irs.inf_codigo IN (374);
```
#### Api Rolando
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