## Hacer
- fix: agregando la opcion de cambio de estado solo para actividades apoyo de tipo Scat
## Querys
```sql
SELECT 	*
FROM 	ejecucion_actividades.apoyo_inicio_actividad_poa aiap 
;

SELECT 	aiap.aiap_codigo,aiap.aiap_estado,aiap.act_codigo, tt.ttr_codigo,  tt.ttr_descripcion 
FROM 	ejecucion_actividades.apoyo_inicio_actividad_poa aiap
		LEFT JOIN estructura_poa.actividades a ON aiap.act_codigo = a.act_codigo
		LEFT JOIN parametricas.tipos_trabajos tt ON tt.ttr_codigo = a.ttr_codigo
		LEFT JOIN parametricas.especificacion_tipos_trabajo ett ON ett.ett_codigo = tt.ett_codigo
;
--
SELECT 	tt.ttr_codigo,tt.ttr_sigla 
FROM 	parametricas.tipos_trabajos tt
;
--
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
--		aiap.aiap_codigo, aiap.aiap_estado, aiap.asi_codigo 
FROM 	ejecucion_actividades.apoyo_inicio_actividad_poa aiap 
;

SELECT 	a.asi_codigo, a.asi_estado 
FROM 	ejecucion_poa.asignaciones a
WHERE 	a.asi_codigo IN (2055)
;
--$$$$$$$$$$$$$$$$$$$$$$$
    SELECT
          t.aci_codigo,
          t.aci_estado
    FROM  ejecucion_poa.asignaciones_cargos_item t
          LEFT JOIN parametricas.estados e ON e.est_codigo = t.aci_estado
    WHERE TRUE
          AND t.asi_codigo IN (2055)
     --     AND t.aci_estado IN (1, 21)
    ORDER BY t.fecha_registro DESC
  ;--cit_codigo=(66)


--UPDATE 	ejecucion_actividades.apoyo_inicio_actividad_poa 
--SET 	aiap_estado = 0
--WHERE 	aiap_codigo = 1;


SELECT 	iapa.iapa_codigo,iapa.asi_codigo,iapa.iapa_estado
FROM 	ejecucion_actividades.inicio_actividad_poa_asignaciones iapa
WHERE 	iapa.iap_codigo IN (933)
;

SELECT 	a.asi_codigo ,a.asi_estado 
FROM 	ejecucion_poa.asignaciones a 
WHERE 	a.asi_codigo IN (2054)
;
```
## Bases

| inicio      | backup_20241115_122025.sql |
| ----------- | -------------------------- |
| consolidada | backup_20241115_164130.sql |
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

| Servicio                                                                                         | lugar                                                                                        | Accion                       |
| ------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------- | ---------------------------- |
| // Todo: DESCONSOLIDAR APOYO INICIO ACTIVIDAD POA y sus ASIGNACIONES y ASIGNACIONES CARGOS ITEMS | src/feature/inicios-actividades/service/create-inicios-actividades.service.ts                | desconsolidar                |
| //Todo: Cambio de estado para apoyo inicio actividad poa                                         | src/feature/inicio-actividad-poa/service/state-inicio-actividad-poa.service.ts               | cambio estado                |
| findAll                                                                                          | src/feature/apoyo-inicio-actividad-poa/service/findAll-apoyo-inicio-actividad-poa.service.ts | se añadio el tipo de trabajo |
## TypeOrm directo
```js
if (resultAiap.length > 0) {
//cambiar estado apoyo inicio actividad poa
try {
const queryUpdateApoyoInicioActividadPoa: ApoyoInicioActividadPoa = new ApoyoInicioActividadPoa();
console.log("🐱==xx-1==> ~ queryUpdateApoyoInicioActividadPoa:", queryUpdateApoyoInicioActividadPoa)
const estados = new Estados();
estados.est_codigo = EstadoPoa.BLOQUEADO;
queryUpdateApoyoInicioActividadPoa.aiap_estado = estados;
queryUpdateApoyoInicioActividadPoa.usuario_modificacion = createIniciosActividadesNuevoDto.usuario;
queryUpdateApoyoInicioActividadPoa.fecha_modificacion = new Date();
console.log("🐱==xx0==> ~ queryUpdateApoyoInicioActividadPoa:", queryUpdateApoyoInicioActividadPoa)
await manager.update(ApoyoInicioActividadPoa, resultAiap[0].aiap_codigo, queryUpdateApoyoInicioActividadPoa)
} catch (error) { }
```
## Considerar Para el Calendario
- Deben estar consolidadas o ejecutadas:

| act(Padre) | iap | iac | asi | aci(s) | aiap | asi(apoyo) | aci(apoyo) |
| ---------- | --- | --- | --- | ------ | ---- | ---------- | ---------- |
| 2          | 2   | 22  | 2   | 2      | 2    | 2          | 2          |
- Hacer un nuevo componente calendario, que preferentemente reciba un Prop(asi_codigo)
- Hacer un servicio que te diga de que tipo es ese asi_codigo: auditoria, evaluacion, aipa, para obtener el ttr_codigo

| auditoria  | asi-iap-act-ttr  |
| ---------- | ---------------- |
| evaluacion | asi-             |
| apoyo      | asi-iapa-act-ttr |
## query
```sql
SELECT	
		a.act_codigo, a.act_numero, a.ttr_codigo, a.act_estado, -- ACTIVIDAD
		iap.tia_codigo, iap.iap_codigo,  iap.iap_estado, -- INICIO-ACTIVIDAD-POA
		ia.iac_codigo, ia.iac_codigo_control, ia.iac_correlativo ,ia.iac_estado, -- INICIOS-ACTIVIDADES
		asi.asi_codigo, asi.asi_estado,-- asi.asi_detalle_asignaciones_cargos_items, asi.asi_detalle_asignaciones_horas_usadas, asi.asi_detalle_reposicion_cargos_item,  -- ASIGNACION
		aci.aci_codigo,  aci.aci_estado,aci.aci_horas , -- ASIGNACION-CARGOS-ITEM
		iai.iai_codigo, iai.iai_estado, ---INICIOS ACTIVIDADES INFORMES 
		i.inf_codigo, i.inf_estado , i.iac_codigo AS iac_codigo_inf, ---INFORMES
		iei.iua_codigo, iu.iua_estado 
FROM	estructura_poa.actividades a
		LEFT JOIN ejecucion_actividades.inicio_actividad_poa iap ON a.act_codigo = iap.act_codigo --AND iap.iap_estado NOT IN (5)
		LEFT JOIN ejecucion_actividades.inicios_actividades ia ON iap.iac_codigo = ia.iac_codigo 
		LEFT JOIN ejecucion_actividades.inicio_actividad_informe iai ON ia.iac_codigo = iai.iac_codigo
		LEFT JOIN ejecucion_actividades.informes i ON iai.inf_codigo = i.inf_codigo 
		LEFT JOIN ejecucion_informes.informes_uai iu ON iu.act_codigo = a.act_codigo 
		LEFT JOIN ejecucion_actividades.inicio_actividad_poa_asignaciones iapa ON iap.iap_codigo = iapa.iap_codigo
		LEFT JOIN ejecucion_poa.asignaciones asi ON iapa.asi_codigo = asi.asi_codigo
		LEFT JOIN ejecucion_poa.asignaciones_cargos_item aci ON asi.asi_codigo = aci.asi_codigo 
		LEFT JOIN ejecucion_informes.inicio_evaluacion_informe iei ON iei.iua_codigo = iu.iua_codigo  
WHERE	TRUE
		
		AND a.act_codigo IN (1348);
```