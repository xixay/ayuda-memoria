Token
- Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJwZXJfY29kaWdvIjo0NjEsInNpc3RlbWFzIjpbeyJzaXNjZ2VfY29kaWdvIjozMiwic2lzY2dlX3NpZ2xhIjoiY29ycmVzcG9uZGVuY2lhX2ludGVybmEifSx7InNpc2NnZV9jb2RpZ28iOjM0LCJzaXNjZ2Vfc2lnbGEiOiJzaXNwb2EifSx7InNpc2NnZV9jb2RpZ28iOjM3LCJzaXNjZ2Vfc2lnbGEiOiJjb25hdWQifV0sInJvbGVzIjpbeyJzaXNjZ2VfY29kaWdvIjozMiwicm9sX2NvZGlnbyI6MTc2LCJyb2xfZGVzY3JpcGNpb24iOiJBU0lTVEVOVEUgQURNSU5JU1RSQVRJVk8ifSx7InNpc2NnZV9jb2RpZ28iOjM0LCJyb2xfY29kaWdvIjoxOTAsInJvbF9kZXNjcmlwY2lvbiI6Ik9wZXJhZG9yIEZvcm11bGFyaW8ifSx7InNpc2NnZV9jb2RpZ28iOjM3LCJyb2xfY29kaWdvIjoyMDgsInJvbF9kZXNjcmlwY2lvbiI6Ik9wZXJhZG9yIEZvcm11bGFyaW8ifV0sImlkIjoiZjZkMTA0ZmYtMTM2YS00N2ZhLThlOTYtZWU2MjNiMDliNDAzIiwidGlwbyI6InVzdWFyaW8iLCJpYXQiOjE3MjgyNTgxMDMsImV4cCI6MTcyODI4NjkwMywibW9tZW50IjoiMjAyNC0xMC0wNlQxOTo0MTo0My0wNDowMCJ9.fbMmaZg-wk_EAbfuJ6OM4gqwOU_wPbA_sbzWBhcP8BqUUo-QQx_SIAg5W2Q3GIg5dtaA6hNjvZkTZdJ6H7zYbg
## F1 y F1-A
- Servicio jasper ambos
```c
/inicio-actividad-poa/summary-report?iap_codigo=$P{s_iap_codigo}
```
- Ruta
```c
src/feature/inicio-actividad-poa/controller/inicio-actividad-poa.controller.ts
```
- Método
```
findSummaryByIapCodeForReport
```
### Hace
- busca inicioActividadPoa, cualquier estado ==iap_codigo=262==
- busca iniciosActividades, con el ==iac_codigo =330== de inicioActividadPoa
- busca si es de tipo apoyo, ett_codigo = 2, no tiene inicioActividadPoa
- busca la actividad con ==act_codigo =2068==
- busca la entidad de la descripcion, en la actividad encontrada, si no tiene encontrar con el provider entidad
- busca el persona gerente con el per_nombre_gerente, de inicio actividad_poa, con el provider
-  busca el persona responsable con el per_nombre_responsable, de inicio actividad_poa, con el provider
- pregunta si el ==iap_estado = 5== y tia_codigo es 1 o 2, si cumple buscara los inicio actividadPoaAsignaciones con estado = 0, para este caso no cumple busca los de estado en 1
	- encuentra el inicioActividadPoa con:

| iapa_codigo | asi_codigo | iap_codigo | iac_codigo | iapa_estado |
| ----------- | ---------- | ---------- | ---------- | ----------- |
| 262         | 294        | 626        | 330        | 1           |

- busca la asignación con el ==**asi_codigo = 294**==
- de la anterior búsqueda solo usa el asi_codigo, para buscar en asignacionesCargoItem con ==asi_estado (1,2,5,9,21)== y ==act_horas_planificadas = 350== de inicioActividadPoa
- luego hace un filtrado de aquellos que tienen el aci_estado != 9 o que su aci_horas es mayor a 0
- tendria que obtener las AsignacionesCargosItemsPasadas, si su ==asi_estado = 5== y ==inicioAtividadPoa.tia_codigo sea 1==
- busca otro actividad poa, con ==act_codigo = 2065==, el cual es con ==iap_codigo = 240==
- si no encontrara buscaria un inicioActividadPoa con el ==act_codigo = 2068==, y el ==iap_codigo = 262== 
- busca el inicioActividadPoaAsignaciones con ese ==iap_codigo = 240==
```js
{  
iapa_codigo: 240,  
asi_codigo: 256,  
asi_descripcion: null,  
iap_codigo: 240,  
iap_descripcion: null,  
iac_codigo: 330,  
iapa_estado: 0,  
est_color: '#ea5545',  
iapa_estado_descripcion: 'INACTIVO',  
fecha_registro: '10:27 am 17/04/2024',  
asi_estado: 5  
}
```
luego busca el la asignacion con es ==asi_codigo = 256==, encontrado
```js
[  
	{  
	asi_codigo: 256,  
	asi_descripcion: null,  
	asi_detalle_asignaciones_cargos_items: [  
		{  
		aci_codigo: 1103,  
		aci_horas: 2,  
		aci_descripcion: null,  
		cit_codigo: 393,  
		asi_codigo: 256,  
		aci_estado: 2,  
		aci_responsable: false,  
		est_color: '#43A047',  
		aci_estado_descripcion: 'CONSOLIDADO',  
		fecha_registro: '10:28 am 17/04/2024',  
		horas_asignadas_acumuladas: 350,  
		horas_planificadas: null,  
		cit_obj: {  
			cit_codigo: 393,  
			cit_descripcion:  
			'El cargo: SUBCONTRALOR DE GOBIERNOS DEPARTAMENTALES, pertenece al área/unidad: Subcontraloría de Gobiernos Departamentales, con el item: 0171.',  
			car_codigo: 152,  
			ite_codigo: 171,  
			aun_codigo: 4,  
			cit_estado: 2,  
			aun_nombre: 'Subcontraloría de Gobiernos Departamentales',  
			aun_sigla: 'SCGD',  
			aun_concatenado: 'SCGD - Subcontraloría de Gobiernos Departamentales',  
			aun_concatenado_invert:  
			'Subcontraloría de Gobiernos Departamentales - SCGD',  
			aun_numero: '0003',  
			car_nombre: 'SUBCONTRALOR DE GOBIERNOS DEPARTAMENTALES',  
			car_alias: 'SCGD',  
			tca_nombre: 'SUSTANTIVO',  
			ite_descripcion: 'Item 0171',  
			ite_numero: '0171',  
			bandera_padre_suelto: 0,  
			car_nombre_item: '0171 - SUBCONTRALOR DE GOBIERNOS DEPARTAMENTALES',  
			cip_codigo: 18,  
			cip_estado: 2,  
			per_codigo: 79,  
			est_color: '#43A047',  
			cit_estado_descripcion: 'CONSOLIDADO',  
			nombre_persona_asignada: 'OLGA EDITH SUAREZ JIMENEZ',  
			per_docidentidad: '2389409',  
			item_nombre_persona_asignada: '0171 - OLGA EDITH SUAREZ JIMENEZ',  
			per_asignado_nivel: '3º',  
			item_persona_asignada_completo:  
			'0171 - OLGA EDITH SUAREZ JIMENEZ - SUBCONTRALOR DE GOBIERNOS DEPARTAMENTALES '  
			}  
		},  
		{  
		aci_codigo: 1102,  
		aci_horas: 138,  
		aci_descripcion: null,  
		cit_codigo: 524,  
		asi_codigo: 256,  
		aci_estado: 2,  
		aci_responsable: false,  
		est_color: '#43A047',  
		aci_estado_descripcion: 'CONSOLIDADO',  
		fecha_registro: '10:28 am 17/04/2024',  
		horas_asignadas_acumuladas: 350,  
		horas_planificadas: null,  
		cit_obj: {  
			cit_codigo: 524,  
			cit_descripcion:  
			'El cargo: SUPERVISOR B, pertenece al área/unidad: Gerencia Departamental de Auditoría en Gobiernos Departamentales, con el item: 0527.',  
			car_codigo: 69,  
			ite_codigo: 527,  
			aun_codigo: 33,  
			cit_estado: 2,  
			aun_nombre:  
			'Gerencia Departamental de Auditoría en Gobiernos Departamentales',  
			aun_sigla: 'GDP-GAD',  
			aun_concatenado:  
			'GDP-GAD - Gerencia Departamental de Auditoría en Gobiernos Departamentales',  
			aun_concatenado_invert:  
			'Gerencia Departamental de Auditoría en Gobiernos Departamentales - GDP-GAD',  
			aun_numero: '1602',  
			car_nombre: 'SUPERVISOR B',  
			car_alias: 'SUP.B',  
			tca_nombre: 'SUSTANTIVO',  
			ite_descripcion: 'Item 0527',  
			ite_numero: '0527',  
			bandera_padre_suelto: 0,  
			car_nombre_item: '0527 - SUPERVISOR B',  
			cip_codigo: 29,  
			cip_estado: 2,  
			per_codigo: 135,  
			est_color: '#43A047',  
			cit_estado_descripcion: 'CONSOLIDADO',  
			nombre_persona_asignada: 'ROCIO SERRUDO ACHACOLLO',  
			per_docidentidad: '3689828',  
			item_nombre_persona_asignada: '0527 - ROCIO SERRUDO ACHACOLLO',  
			per_asignado_nivel: '13º',  
			item_persona_asignada_completo:  
			'0527 - ROCIO SERRUDO ACHACOLLO - SUPERVISOR B '  
			}  
		},  
		{  
		aci_codigo: 1100,  
		aci_horas: 200,  
		aci_descripcion: null,  
		cit_codigo: 426,  
		asi_codigo: 256,  
		aci_estado: 2,  
		aci_responsable: true,  
		est_color: '#43A047',  
		aci_estado_descripcion: 'CONSOLIDADO',  
		fecha_registro: '10:27 am 17/04/2024',  
		horas_asignadas_acumuladas: 350,  
		horas_planificadas: null,  
		cit_obj: {  
			cit_codigo: 426,  
			cit_descripcion:  
			'El cargo: AUDITOR A, pertenece al área/unidad: Gerencia Departamental de Auditoría en Gobiernos Departamentales, con el item: 0529.',  
			car_codigo: 10,  
			ite_codigo: 529,  
			aun_codigo: 33,  
			cit_estado: 2,  
			aun_nombre:  
			'Gerencia Departamental de Auditoría en Gobiernos Departamentales',  
			aun_sigla: 'GDP-GAD',  
			aun_concatenado:  
			'GDP-GAD - Gerencia Departamental de Auditoría en Gobiernos Departamentales',  
			aun_concatenado_invert:  
			'Gerencia Departamental de Auditoría en Gobiernos Departamentales - GDP-GAD',  
			aun_numero: '1602',  
			car_nombre: 'AUDITOR A',  
			car_alias: 'AUD. A',  
			tca_nombre: 'SUSTANTIVO',  
			ite_descripcion: 'Item 0529',  
			ite_numero: '0529',  
			bandera_padre_suelto: 0,  
			car_nombre_item: '0529 - AUDITOR A',  
			cip_codigo: 55,  
			cip_estado: 2,  
			per_codigo: 240,  
			est_color: '#43A047',  
			cit_estado_descripcion: 'CONSOLIDADO',  
			nombre_persona_asignada: 'LUISA JEANNETTE CALBIMONTE ALIZARES',  
			per_docidentidad: '3703760',  
			item_nombre_persona_asignada:  
			'0529 - LUISA JEANNETTE CALBIMONTE ALIZARES',  
			per_asignado_nivel: '9º',  
			item_persona_asignada_completo:  
			'0529 - LUISA JEANNETTE CALBIMONTE ALIZARES - AUDITOR A '  
			}  
		},  
		{  
		aci_codigo: 1101,  
		aci_horas: 10,  
		aci_descripcion: null,  
		cit_codigo: 33,  
		asi_codigo: 256,  
		aci_estado: 2,  
		aci_responsable: false,  
		est_color: '#43A047',  
		aci_estado_descripcion: 'CONSOLIDADO',  
		fecha_registro: '10:27 am 17/04/2024',  
		horas_asignadas_acumuladas: 350,  
		horas_planificadas: null,  
		cit_obj: {  
			cit_codigo: 33,  
			cit_descripcion:  
			'El cargo: GERENTE DE SERVICIOS LEGALES, pertenece al área/unidad: Gerencia Departamental de Servicios Legales, con el item: 0519.',  
			car_codigo: 78,  
			ite_codigo: 519,  
			aun_codigo: 32,  
			cit_estado: 2,  
			aun_nombre: 'Gerencia Departamental de Servicios Legales',  
			aun_sigla: 'GDP-GSL',  
			aun_concatenado: 'GDP-GSL - Gerencia Departamental de Servicios Legales',  
			aun_concatenado_invert:  
			'Gerencia Departamental de Servicios Legales - GDP-GSL',  
			aun_numero: '1601',  
			car_nombre: 'GERENTE DE SERVICIOS LEGALES',  
			car_alias: 'GER.SERV.LEG.',  
			tca_nombre: 'SUSTANTIVO',  
			ite_descripcion: 'Item 0519',  
			ite_numero: '0519',  
			bandera_padre_suelto: 0,  
			car_nombre_item: '0519 - GERENTE DE SERVICIOS LEGALES',  
			cip_codigo: 90,  
			cip_estado: 2,  
			per_codigo: 401,  
			est_color: '#43A047',  
			cit_estado_descripcion: 'CONSOLIDADO',  
			nombre_persona_asignada: 'CLAUDIA JIMENA CRUZ OTONDO',  
			per_docidentidad: '8654053',  
			item_nombre_persona_asignada: '0519 - CLAUDIA JIMENA CRUZ OTONDO',  
			per_asignado_nivel: '9º',  
			item_persona_asignada_completo:  
			'0519 - CLAUDIA JIMENA CRUZ OTONDO - GERENTE DE SERVICIOS LEGALES '  
			}  
		}  
	],  
	asi_detalle_asignaciones_horas_usadas: [],  
	asi_detalle_reposicion_cargos_item: [],  
	asi_estado: 5,  
	est_color: '#BDBDBD',  
	asi_estado_descripcion: 'HISTORICO',  
	fecha_registro: '10:27 am 17/04/2024'  
	}  
]
```
- de la asignacion encontrada, agarra el asi_detalle_asignaciones_cargos_items y lo llama asigancionesCargosItemRetrievedAntiguo, el de arriba
- A cada uno le agrega del inicioActividadPoa hallado al inicio con ==iap_codigo = 262== y su ==act_horas planificadas = 350== 
- Tambien ase una sumatoria con todos los aci_horas

| aci_horas |
| --------- |
| 2         |
| 138       |
| 200       |
| 10        |
|           |
- para cada uno busca el cargoitem, con un provider, con el cit_codigo proporcionado: item.cit_obj.cit_codigo

| cit_codigo |
| ---------- |
| 393        |
| 524        |
| 426        |
| 33         |
- para cada uno busca el per_nombre_responsable, con el per_codigo proporcionado, item.cit_obj.per_codigo, devolviendo el asigancionesCargosItemRetrievedAntiguo
- con el inicioActividadPoa de iap_codigo = 262, halla la fecha de aprobación
- luego con el asigancionesCargosItemRetrieved y el asigancionesCargosItemRetrievedAntiguo, realiza solo si el tia_codigo es 2 delo sgte
- si asigancionesCargosItemRetrieved es mayor al asigancionesCargosItemRetrievedAntiguo
	- recorre el array actual que es de ampliacion : asigancionesCargosItemRetrieved y los llama ampliacion
		- filtra en los antiguos: asigancionesCargosItemRetrievedAntiguo, cuales tienen el aci_codigo del array asigancionesCargosItemRetrieved, y los llama auditoria
			- y si existen datos de auditoria le agrega, asi como el de ampliacion, luego lo agrega al array asigancionesCargosItemCombinadosAmpliacion

| auditoria    |                      | ampliacion   |                      |
| ------------ | -------------------- | ------------ | -------------------- |
| horas_f1     | auditoria.aci_horas  | horas_f1     | 0                    |
| horas_amp    | ampliacion.aci_horas | horas_amp    | ampliacion.aci_horas |
| horas_presup | auditoria.horas_amp  | horas_presup | ampliacion.horas_amp |
- si asigancionesCargosItemRetrieved NO ES mayor al asigancionesCargosItemRetrievedAntiguo, ase lo mismo pero al reves:
	- filtra en los actuales: asigancionesCargosItemRetrieved, cuales tienen el aci_codigo del array asigancionesCargosItemRetrievedAntiguo, y los llama ampliacion
			- y si existen datos de ampliacion le agrega, asi como el de auditoria, luego lo agrega al array asigancionesCargosItemCombinadosAmpliacion

| ampliacion   |                      | auditoria    |                     |
| ------------ | -------------------- | ------------ | ------------------- |
| horas_f1     | auditoria.aci_horas  | horas_f1     | auditoria.aci_horas |
| horas_amp    | ampliacion.aci_horas | horas_amp    | 0                   |
| horas_presup | ampliacion.horas_amp | horas_presup | auditoria.horas_amp |
- luego realiza sumatorias para encontrar total de horas_f1 y total_horas_amp y total_horas_presup, y lo agrega a cada uno de los item de asigancionesCargosItemCombinadosAmpliacion
- para ampiaciones de continuidades (MIGRADAS) tomar observacion como justificacion
```js
if (inicioActividadPoa.iac_migrado !== undefined && inicioActividadPoa.iac_migrado === true) {

inicioActividadPoa.iap_justificacion_ampliacion = inicioActividadPoa.iac_observaciones;
inicioActividadPoa:", inicioActividadPoa)

}
```
- luego corrige el string de inicioActividades y de entidades descripcion
```
	corregirStringParaInicioActividades
	corregirStringParaJSON
```
- finalmente devuelve el objeto con los siguiente
```js
const final_result = {
...inicioActividadPoa,
cod_areas: cod_areas,
cod_correlativo: cod_correlativo,
cod_gestion: cod_gestion,
iac_codigo_control: inicioActividadPoa.iac_codigo_control_vista,
entidad_nombre: entidadDescripcion,
per_nombre_gerente: per_nombre_gerente.per_nombre_completo,
per_nombre_responsable: per_nombre_responsable.per_nombre_completo,
cod_trabajo_apoyar: cod_trabajo_apoyar,
cod_po_apoyo: cod_po_apoyo,
fecha_aprobacion: fecha_aprobacion,
asignaciones_cargos_item: [...asigancionesCargosItemRetrieved],
asignaciones_cargos_item_antiguo: [...asigancionesCargosItemRetrievedAntiguo],
asignaciones_cargos_item_ampliacion: [...asigancionesCargosItemCombinadosAmpliacion]
}
```
## F2 y F2-A
- Servicio jasper ambos
```c
/inicio-actividad-poa/summary-seguimiento-report?iap_codigo=$P{s_iap_codigo}
```
- Ruta
```c
src/feature/inicio-actividad-poa/controller/inicio-actividad-poa.controller.ts
```
- Método
```
findSummaryByIapCodeSeguimientoforReport
```
## Base de Prueba
- backup_20241004_183710.sql
## Rama de trabajo
- En la rama fix/refactoricion_reportes_F_conaud
## Archivo a trabajar
- src/feature/inicio-actividad-poa/service/findAll-inicio-actividad-poa.service.ts
## Nuevo servicio de reportes
- findSummaryByIapCodeForReportNuevo
## Datos de entrada:
```c
F1:
iap_codigo= 152
F1-A:
iap_codigo= 262
F2:
iap_codigo= 678
F2-A:
iap_codigo= 750
```
## Propuesta de query para obtener los valores iniciales
```sql
--inicio_actividad_poa
SELECT
		iap.iap_codigo,
		iap.per_codigo_gerente,
		iap.per_codigo_responsable,
		iap.iap_justificacion_ampliacion,
		iap.iap_observaciones,
		iap.tia_codigo,
		ia.iac_codigo,
		ia.iac_codigo_control_vista AS iac_codigo_control,
		ia.iac_objeto,
		ia.iac_objetivo,
		ia.iac_alcance,
		ia.iac_dias_habiles, ia.iac_dias_calendario,
		TO_CHAR(ia.iac_fecha_inicio, 'dd/mm/yyyy') AS iac_fecha_inicio,
		TO_CHAR(ia.iac_mes_inicio, 'MM/YYYY') AS mes_inicio, -- Formato MM/YYYY
		TO_CHAR(ia.iac_fecha_borrador, 'dd/mm/yyyy') AS iac_fecha_borrador,
		TO_CHAR(ia.iac_fecha_emision, 'dd/mm/yyyy') AS iac_fecha_emision,
		TO_CHAR(ia.iac_mes_fin, 'MM/YYYY') AS mes_fin, -- Formato MM/YYYY
		ia.iac_observaciones,
		ia.iac_recomendacion_seguir,
		ia.iac_migrado,
		a.act_codigo,
		a.act_numero,
		CONCAT_WS('.',
			split_part(a.act_numero, '.', 1),
			split_part(a.act_numero, '.', 2),
			split_part(a.act_numero, '.', 3)
		) AS cod_areas,
		split_part(a.act_numero, '.', 4) AS cod_correlativo,
		split_part(a.act_numero, '.', 5) AS cod_gestion,
		a.ent_codigo,
		a.ent_descripcion AS entidad_nombre,
		a.act_denuncia,
		a.act_horas_planificadas,
		g.ges_anio,
		tt.ttr_sigla,
		(
			CASE
				WHEN (a.tipact_codigo = 2 ) THEN 1
				ELSE 0 END
		) AS bandera_continuidad,
		tt.ttr_descripcion,
		tt.ett_codigo,
		iap.iap_estado
FROM    ejecucion_actividades.inicio_actividad_poa iap
        LEFT JOIN ejecucion_actividades.inicios_actividades ia ON iap.iac_codigo = ia.iac_codigo
        LEFT JOIN estructura_poa.actividades a ON iap.act_codigo = a.act_codigo
        LEFT JOIN parametricas.gestiones g ON ia.ges_codigo = g.ges_codigo
        LEFT JOIN parametricas.tipos_trabajos tt ON a.ttr_codigo = tt.ttr_codigo 
WHERE   TRUE
        AND iap.iap_codigo IN (262);
```
- El resultado es:

|iap_codigo|iac_codigo|iac_codigo_control|iac_codigo_control_vista|act_codigo|act_numero|per_codigo_gerente|per_codigo_responsable|cod_areas|cod_correlativo|cod_gestion|entidad_nombre|act_denuncia|iac_objeto|iac_objetivo|iac_alcance|iac_fecha_inicio|iac_dias_habiles|iac_dias_calendario|mes_inicio|iac_fecha_borrador|iac_fecha_emision|mes_fin|ges_anio|ttr_sigla|bandera_continuidad|ttr_descripcion|iap_justificacion_ampliacion|iap_observaciones|iac_observaciones|iap_estado|
|----------|----------|------------------|------------------------|----------|----------|------------------|----------------------|---------|---------------|-----------|--------------|------------|----------|------------|-----------|----------------|----------------|-------------------|----------|------------------|-----------------|-------|--------|---------|-------------------|---------------|----------------------------|-----------------|-----------------|----------|
|262|330|EPDP200A24|EP/DP200/A24|2068|510.1602.25.2.24|401|240|510.1602.25|2|24|||EL INFORME DE CONFIABILIDAD DE REGISTROS, INFORME DE CONFIABILIDAD DE ESTADOS FINANCIEROS Y PAPELES DE TRABAJO DE AUDITORÍA DE CONFIABILIDAD DE REGISTROS Y ESTADOS FINANCIEROS EN LO QUE CORRESPONDA|EVALUAR SI LOS INFORMES DE AUDITORÍA DE CONFIABILIDAD DE REGISTROS Y ESTADOS FINANCIEROS SE AJUSTAN A LAS NORMAS DE AUDITORÍA DE CONFIABILIDAD DE REGISTROS Y ESTADOS FINANCIEROS|AL 31 DE DICIEMBRE DE 2023|20/03/2024|30|42|04/2024|18/04/2024|03/05/2024|07/2024|2024|EVINF|0|EVALUACIÓN EEFF - UNIDADES DE AUDITORÍA INTERNA|PARA INCORPORAR HORAS A LA GERENTE DE ÁREA|||2|

## Servicio de prueba jasper
- Antes(F1 y F1-A)
```c
/inicio-actividad-poa/summary-report?iap_codigo=$P{s_iap_codigo}
```
- Nuevo
```c
/inicio-actividad-poa/summary-report-nuevo?iap_codigo=$P{s_iap_codigo}
```

## Reporte a imprimir F1 (Edicion iap_codigo = 20)
![[F1_edicion.pdf]]
## Reporte a imprimir F1 (Consolidado iap_codigo =494 )
![[F1_consolidado.pdf]]
## Reporte a imprimir F1 (Historico iap_codigo =179 )
![[F1_historico.pdf]]
## Problema ejm
- query
```sql
SELECT 	
		au.aun_sigla,
		ia.iac_codigo, ia.iac_estado,
		iap.iap_codigo, iap.iap_estado, iap.tia_codigo,
		a.act_codigo, a.act_estado, a.act_numero 
FROM 	ejecucion_actividades.inicios_actividades ia
		LEFT JOIN ejecucion_actividades.inicio_actividad_poa iap ON ia.iac_codigo = iap.iac_codigo 
		LEFT JOIN estructura_poa.actividades a ON iap.act_codigo = a.act_codigo 
		LEFT JOIN estructura_organizacional.areas_unidades au ON a.aun_codigo_ejecutora = au.aun_codigo 
WHERE 	ia.iac_codigo_control LIKE 'IXDP290Y24'
;
```
- tabla

| aun_sigla | iac_codigo | iac_estado | iap_codigo | iap_estado | tia_codigo | act_codigo | act_estado | act_numero        |
| --------- | ---------- | ---------- | ---------- | ---------- | ---------- | ---------- | ---------- | ----------------- |
| GPA-GA1   | 443        | 22         | 396        | 2          | 1          | 2910       | 2          | 510.1101.15.13.24 |
- reporte
![[F1_problema.png]]


## Hacer para historicos
- Hallar asignacionesCargosItem con inicio actividad poa asignaciones en estado cero, para F1 y F1-A
- Pero para F1 y F2 solamente hallar //Obtiene las asignaciones cargos items pasados, si es que no se encontro
## Codigos de prueba para Historicos

| iap_codigo |                                    |
| ---------- | ---------------------------------- |
| 70         | no da                              |
| 282        | su marca de agua no dice historico |
| 179        | su marca de agua no dice historico |
| 101        |                                    |
| 104        |                                    |
| 123        |                                    |
| 120        |                                    |
| 108        |                                    |
| 122        |                                    |
| 118        |                                    |
| 124        |                                    |
| 114        |                                    |
| 147        |                                    |
| 85         |                                    |
| 96         |                                    |
| 96         |                                    |
| 242        |                                    |
| 246        |                                    |
| 246        |                                    |
| 242        |                                    |
| 241        |                                    |
| 389        |                                    |

## Reporte a imprimir F2 (Edicion iap_codigo = 25)
![[F2_edicion.pdf]]

## Reporte a imprimir F2 (Consolidado iap_codigo =24 )
![[F2_consolidado.pdf]]
## Reporte a imprimir F1-A (Edicion iap_codigo =734 )
![[F1-A_edicion.pdf]]
## Reporte a imprimir F1-A (Consolidado iap_codigo =293 )
![[F1-A_consolidado.pdf]]
## Reporte a imprimir F1-A (Consolidado especial iap_codigo =518 )
![[F1-A_consolidado_especial.pdf.pdf]]
## Reporte a imprimir F1-A (Historico iap_codigo =508 )
![[F1-A_historico.pdf]]
## Pruebas de F1-A

| iap_codigo | error                               |
| ---------- | ----------------------------------- |
| 301        | no sale los car_nombre_items        |
| 681        | no aparce mes conclusion PO         |
| 534        | no tiene asignaciones cargos item   |
| 559        | no tiene asignaciones cargos item   |
| 560        | no tiene asignaciones cargos item   |
| 558        | no tiene asignaciones cargos item   |
| 719        | santiago maidana  le falta el cargo |
|            |                                     |


## Codigos de prueba para Historicos

| iap_codigo |                                    |
| ---------- | ---------------------------------- |
| 70         | no da                              |
| 282        | su marca de agua no dice historico |
| 179        | su marca de agua no dice historico |
| 101        |                                    |
| 104        |                                    |
| 123        |                                    |
| 120        |                                    |
| 108        |                                    |
| 122        |                                    |
| 118        |                                    |
| 124        |                                    |
| 114        |                                    |
| 147        |                                    |
| 85         |                                    |
| 96         |                                    |
| 96         |                                    |
| 242        |                                    |
| 246        |                                    |
| 246        |                                    |
| 242        |                                    |
| 241        |                                    |
| 389        |                                    |

## Codigo Sugerido
```ts
let asignacionesCargosItemCombinadosAmpliacion: any[] = [];

if (asignacionesCargosItem.length > asignacionesCargosItemAntiguo.length) {
  console.log('============> entro 1', asignacionesCargosItem);
  for (const ampliacion of asignacionesCargosItem) {
    // AMPLIACION
    let auditoria = asignacionesCargosItemAntiguo.filter(audi => audi.aci_codigo == ampliacion.aci_codigo)[0]; // AUDITORIA F1
    console.log("🐱==18a==> ~ auditoria:", auditoria);

    if (auditoria) {
      auditoria.horas_f1 = auditoria.aci_horas;
      auditoria.horas_amp = ampliacion.aci_horas;
      auditoria.horas_presup = auditoria.horas_amp;
      asignacionesCargosItemCombinadosAmpliacion.push(auditoria);
    } else {
      ampliacion.horas_f1 = 0;
      ampliacion.horas_amp = ampliacion.aci_horas;
      ampliacion.horas_presup = ampliacion.horas_amp;
      asignacionesCargosItemCombinadosAmpliacion.push(ampliacion);
    }
  }
} else {
  for (const auditoria of asignacionesCargosItemAntiguo) {
    console.log('============> entro 2');
    // AUDITORIA F1
    let ampliacion = asignacionesCargosItem.filter(ampli => ampli.aci_codigo == auditoria.aci_codigo)[0]; // AMPLIACION
    console.log("🐱==18b==> ~ ampliacion:", ampliacion);

    if (ampliacion) {
      ampliacion.horas_f1 = auditoria.aci_horas;
      ampliacion.horas_amp = ampliacion.aci_horas;
      ampliacion.horas_presup = ampliacion.horas_amp;
      asignacionesCargosItemCombinadosAmpliacion.push(ampliacion);
    } else {
      auditoria.horas_f1 = auditoria.aci_horas;
      auditoria.horas_amp = 0;
      auditoria.horas_presup = auditoria.horas_amp;
      asignacionesCargosItemCombinadosAmpliacion.push(auditoria);
    }
  }
}

// Acumula horas directamente en el bucle
let total_horas_f1 = 0;
let total_horas_amp = 0;
let total_horas_presup = 0;

for (const item of asignacionesCargosItemCombinadosAmpliacion) {
  console.log("🐱==zzzzz==> ~ item:", item);
  total_horas_f1 += item.horas_f1;
  total_horas_amp += item.horas_amp;
  total_horas_presup += item.horas_presup;
  
  // Agregamos las propiedades de totales directamente
  item.total_horas_f1 = total_horas_f1;
  item.total_horas_amp = total_horas_amp;
  item.total_horas_presup = total_horas_presup;
}

console.log("🐱==xx19==> ~ asignacionesCargosItemCombinadosAmpliacion:", asignacionesCargosItemCombinadosAmpliacion);
resultInicial.asignaciones_cargos_item_ampliacion = asignacionesCargosItemCombinadosAmpliacion;


```