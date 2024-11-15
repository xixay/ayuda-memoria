## Querys
```sql
SELECT 	*
FROM 	ejecucion_actividades.apoyo_inicio_actividad_poa aiap 
;

SELECT 	*
FROM 	ejecucion_actividades.inicio_actividad_poa iap
		LEFT JOIN ejecucion_actividades.inicios_actividades ia ON iap.iac_codigo = ia.iac_codigo 
WHERE 	TRUE
		AND iap.iap_codigo IN (933)
;--iac_codigo=685
SELECT 	*
FROM 	estructura_poa.actividades a
WHERE 	a.act_codigo IN (3167)
;

SELECT 	a.act_codigo,a.act_numero, au.aun_sigla, a.ttr_codigo , tt.ttr_codigo,  tt.ttr_descripcion, ett.ett_codigo,  ett.ett_nombre 
FROM 	estructura_poa.actividades a
		LEFT JOIN estructura_organizacional.areas_unidades au ON a.aun_codigo_ejecutora = au.aun_codigo 
		LEFT JOIN parametricas.tipos_trabajos tt ON tt.ttr_codigo = a.ttr_codigo
		LEFT JOIN parametricas.especificacion_tipos_trabajo ett ON ett.ett_codigo = tt.ett_codigo
WHERE 	TRUE
		AND tt.ttr_codigo = 79;
		
SELECT 	*
FROM 	ejecucion_actividades.apoyo_inicio_actividad_poa aiap 
;
```
## Bases

| inicio | backup_20241115_122025.sql |
| ------ | -------------------------- |
|        |                            |
## roles
-  SCAT-GAAPIP

| 9945262 | CLAUDIA PARRA MAMANI             | RESPONSABLE          | EDICION |
| ------- | -------------------------------- | -------------------- | ------- |
| 486424  | LUIS FERNANDO SAAVEDRA MORATO    | GERENTE CONSOLIDADOR | EDICION |
| 486424  | LUIS FERNANDO SAAVEDRA MORATO    | SUPERVISOR           | EDICION |
| 3445997 | CAROLINA LEA RODRIGUEZ BONIVENTO | FORMULADOR           | EDICION |
| 3445997 | CAROLINA LEA RODRIGUEZ BONIVENTO | FORMULADOR GERENTE   | EDICION |
| 3445997 | CAROLINA LEA RODRIGUEZ BONIVENTO | APROBADOR            | EDICION |

- actividad : 520.0504.38.10.24
- http://172.16.22.243:3002/conaud/inicios-actividades?ges_codigo=2&act_codigo=3167
- componente: src/components/informes/component/informes.table.jsx
- Servicio Sushy: 
## Servicios afectados

| Servicio                                                                                         | lugar                                                                          | Accion        |
| ------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------ | ------------- |
| // Todo: DESCONSOLIDAR APOYO INICIO ACTIVIDAD POA y sus ASIGNACIONES y ASIGNACIONES CARGOS ITEMS | src/feature/inicios-actividades/service/create-inicios-actividades.service.ts  | desconsolidar |
| //Todo: Cambio de estado para apoyo inicio actividad poa                                         | src/feature/inicio-actividad-poa/service/state-inicio-actividad-poa.service.ts | cambio estado |
