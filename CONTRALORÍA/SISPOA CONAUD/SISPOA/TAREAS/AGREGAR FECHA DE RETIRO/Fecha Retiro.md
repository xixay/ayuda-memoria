## Consideraciones
- Agregar la fecha de retiro justo antes de Retirar Actividad por NORKA
## Ramas
- front:  bugfix/agregar_fecha_aprobacion_retiro
- back: bugfix/agregar_fecha_aprobacion_retiro
## Lugares
- components/sispoa/estructura_poa/ChangeStatus.vue
- components/common/GlobalDateInputPicker.vue
- src/feature/actividades/actividades.service.ts
	- case Operation.STATE_TWO:
		- actividades.act_fecha_aprobacion_retiro = params.act_fecha_aprobacion_retiro;
- src/feature/estados-tablas/estados-tablas.service.ts
	- findAllData
## url
- 
## Base
- ACTIVIDADES REGULARES (F26) (520.1302.62) 520.1302.62.1.24
- ACTIVIDADES REGULARES (F26) (520.1302.61) 520.1302.61.1.24
- ACTIVIDADES REGULARES (F26) (520.1302.61) 520.1302.61.2.24
## Roles

| _list_   | Doc. Identidad | Nombre Completo                               | Rol                | Estado  |
| -------- | -------------- | --------------------------------------------- | ------------------ | ------- |
|          | 3403668        | ANA MARIA BRIGGITTE DEL CARMEN ARRAZOLA DURAN | FORMULADOR         | EDICION |
|          | 2389409        | OLGA EDITH SUAREZ JIMENEZ                     | SUPERVISOR         | EDICION |
| comision | 4385501        | JULIO CARLOS GUERRA VILLARROEL                | APROBADOR          | EDICION |
|          | 1397469        | RUTH TARCAYA GALLARDO                         | FORMULADOR GERENTE | EDICION |
|          | 1397469        | RUTH TARCAYA GALLARDO                         | FORMULADOR         | EDICION |
## Trae Provider Auditorias
## Query
```sql
SELECT 	*
FROM 	estructura_poa.actividades a 
WHERE 	TRUE
--		AND a.act_numero LIKE '520.1302.62.1.24'--act_codigo=2262
--		AND a.act_numero LIKE '500.1302.55.3.24'--act_codigo=3030
		AND a.act_codigo = 2224
--		AND a.act_numero LIKE '520.1302.61.2.24'--act_codigo=2223
ORDER 	BY	a.act_codigo DESC
;

----------- ADD COLUMN PARA AGREGAR LA FECHA DE RETIRO DE LA ACTIVIDAD PARA F24 ----------
ALTER TABLE estructura_poa.actividades ADD COLUMN act_fecha_aprobacion_retiro DATE NULL;
--#####################################################
SELECT	DISTINCT
        fk_tco.table_schema, fk_tco.table_name
FROM 	information_schema.referential_constraints rco
        INNER JOIN information_schema.table_constraints fk_tco ON rco.constraint_name = fk_tco.constraint_name AND rco.constraint_schema = fk_tco.table_schema
		INNER JOIN information_schema.table_constraints pk_tco ON rco.unique_constraint_name = pk_tco.constraint_name AND rco.unique_constraint_schema = pk_tco.table_schema
WHERE   TRUE
		AND fk_tco.table_schema = 'control_estados'
        AND pk_tco.table_name IN ('actividades')
        AND pk_tco.table_schema IN ('estructura_poa')
ORDER BY fk_tco.table_name;

SELECT 	a.act_codigo, a.act_estado, TO_CHAR(a.act_fecha_aprobacion_retiro, 'dd/mm/yyyy') as act_fecha_aprobacion_retiro 
FROM 	estructura_poa.actividades a 
WHERE 	TRUE
		AND a.act_estado IN (46)
		AND a.act_codigo IN (2224)--2082
;
```
## Solucion
```sql
{
    "est_codigo": 30544,
    "tab_codigo": 2223,
    "est_descripcion": "CHANGE_STATE",
    "est_estado": 46,
    "est_estado_descripcion": "RETIRADO",
    "est_usuario_registro": 1914,
    "est_fecha_registro": "17:08:54 pm 18/12/2024",
    "est_color": "#ea5545",
    "est_usuario_registro_descripcion": "NORKA VALERIA CHAVEZ LIMACHI"
},

======>>>> {
  est_codigo: 30539,
  tab_codigo: 2224,
  est_descripcion: 'CHANGE_STATE',
  est_estado: 46,
  est_estado_descripcion: 'RETIRADO',
  est_usuario_registro: 1914,
  est_fecha_registro: '16:55:48 pm 18/12/2024',
  est_detalle: { observacion: 'Retirado' },
  est_color: '#ea5545',
  est_usuario_registro_descripcion: 'NORKA VALERIA CHAVEZ LIMACHI'
}



curl 'http://172.16.22.243:7091/estados-tablas/listado_datos?tab_nombre=(%27Actividades%27)&tab_codigo=(2224)' \
  -H 'Accept: application/json, text/plain, */*' \
  -H 'Accept-Language: es-419,es;q=0.9' \
  -H 'Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJwZXJfY29kaWdvIjoxOTE0LCJzaXN0ZW1hcyI6W3sic2lzY2dlX2NvZGlnbyI6MjUsInNpc2NnZV9zaWdsYSI6InVhaSJ9LHsic2lzY2dlX2NvZGlnbyI6MjksInNpc2NnZV9zaWdsYSI6InBvYWkifSx7InNpc2NnZV9jb2RpZ28iOjMyLCJzaXNjZ2Vfc2lnbGEiOiJjb3JyZXNwb25kZW5jaWFfaW50ZXJuYSJ9LHsic2lzY2dlX2NvZGlnbyI6MzQsInNpc2NnZV9zaWdsYSI6InNpc3BvYSJ9LHsic2lzY2dlX2NvZGlnbyI6MzUsInNpc2NnZV9zaWdsYSI6ImZpX2NvbmF1ZCJ9LHsic2lzY2dlX2NvZGlnbyI6MzcsInNpc2NnZV9zaWdsYSI6ImNvbmF1ZCJ9XSwicm9sZXMiOlt7InNpc2NnZV9jb2RpZ28iOjI1LCJyb2xfY29kaWdvIjoxNTAsInJvbF9kZXNjcmlwY2lvbiI6IlJFVklTT1IgVUFJIn0seyJzaXNjZ2VfY29kaWdvIjoyOSwicm9sX2NvZGlnbyI6MTU4LCJyb2xfZGVzY3JpcGNpb24iOiJST0wgU1VQRVJWSVNJT04ifSx7InNpc2NnZV9jb2RpZ28iOjI5LCJyb2xfY29kaWdvIjoxNTcsInJvbF9kZXNjcmlwY2lvbiI6IlJPTCBSRUdJU1RSTyBSRUNVUlNPUyBIVU1BTk9TIn0seyJzaXNjZ2VfY29kaWdvIjoyOSwicm9sX2NvZGlnbyI6MTU2LCJyb2xfZGVzY3JpcGNpb24iOiJBRE1JTklTVFJBRE9SIFBPQUkifSx7InNpc2NnZV9jb2RpZ28iOjI5LCJyb2xfY29kaWdvIjoxNzMsInJvbF9kZXNjcmlwY2lvbiI6IlJPTCBQTEFOSUZJQ0FDScOTTiJ9LHsic2lzY2dlX2NvZGlnbyI6MzUsInJvbF9jb2RpZ28iOjE5Miwicm9sX2Rlc2NyaXBjaW9uIjoiVkFMSURBRE9SIn0seyJzaXNjZ2VfY29kaWdvIjozNCwicm9sX2NvZGlnbyI6MTk2LCJyb2xfZGVzY3JpcGNpb24iOiJHZXN0acOzbiBJbnN0aXR1Y2lvbmFsIn0seyJzaXNjZ2VfY29kaWdvIjozNCwicm9sX2NvZGlnbyI6MTkwLCJyb2xfZGVzY3JpcGNpb24iOiJPcGVyYWRvciBGb3JtdWxhcmlvIn0seyJzaXNjZ2VfY29kaWdvIjozNywicm9sX2NvZGlnbyI6MjAyLCJyb2xfZGVzY3JpcGNpb24iOiJBZG1pbmlzdHJhZG9yIENPTkFVRCJ9LHsic2lzY2dlX2NvZGlnbyI6MzcsInJvbF9jb2RpZ28iOjIwOCwicm9sX2Rlc2NyaXBjaW9uIjoiT3BlcmFkb3IgRm9ybXVsYXJpbyJ9LHsic2lzY2dlX2NvZGlnbyI6MzIsInJvbF9jb2RpZ28iOjE3NSwicm9sX2Rlc2NyaXBjaW9uIjoiRlVOQ0lPTkFSSU8ifSx7InNpc2NnZV9jb2RpZ28iOjM3LCJyb2xfY29kaWdvIjoyMTksInJvbF9kZXNjcmlwY2lvbiI6IkFwb3lvIn0seyJzaXNjZ2VfY29kaWdvIjozNywicm9sX2NvZGlnbyI6MjA5LCJyb2xfZGVzY3JpcGNpb24iOiJHZXN0acOzbiBJbnN0aXR1Y2lvbmFsIn0seyJzaXNjZ2VfY29kaWdvIjozNCwicm9sX2NvZGlnbyI6MTk4LCJyb2xfZGVzY3JpcGNpb24iOiJWZXJpZmljYWRvciBGb3JtdWxhcmlvIn0seyJzaXNjZ2VfY29kaWdvIjozNCwicm9sX2NvZGlnbyI6MTk3LCJyb2xfZGVzY3JpcGNpb24iOiJHZXN0acOzbiBJbnN0aXR1Y2lvbmFsIEFwcm9iYWRvciJ9LHsic2lzY2dlX2NvZGlnbyI6MzcsInJvbF9jb2RpZ28iOjIxMSwicm9sX2Rlc2NyaXBjaW9uIjoiVmVyaWZpY2Fkb3IgRm9ybXVsYXJpbyJ9XSwiaWQiOiJiMjM4NTMxNi1lZTAwLTQ3MWEtODViZS1lOTA5ZWE3Y2Q2MzciLCJ0aXBvIjoidXN1YXJpbyIsImlhdCI6MTczNDU1NTk2NywiZXhwIjoxNzM0NTg0NzY3LCJtb21lbnQiOiIyMDI0LTEyLTE4VDE3OjA2OjA3LTA0OjAwIn0.DooGaHR9ho7VZYj8LfaxAQv9LhZSDEgFUU1u2SIjC3CUQAmDBp8a--EJ0uC_86e-g2NlsEblRrZ4uI_yGEpq1g' \
  -H 'Connection: keep-alive' \
  -H 'Origin: http://172.16.22.243:3000' \
  -H 'Referer: http://172.16.22.243:3000/' \
  -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36' \
  --insecure
```

## Componentes
- components/sispoa/organigrama/AdministracionHoras.vue
- 
## Revisar
- 