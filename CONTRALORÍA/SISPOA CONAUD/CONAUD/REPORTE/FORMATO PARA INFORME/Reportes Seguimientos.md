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
  