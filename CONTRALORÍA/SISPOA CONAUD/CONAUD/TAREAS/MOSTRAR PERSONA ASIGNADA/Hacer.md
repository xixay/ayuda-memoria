bd_cge_poa_conaud_local_b
postgres
backup_20240807_155902.sql
backup_20240808_143514.sql(ultimo)


- QUE SE MUESTRE SUS DATOS; AUNQUE SE LE HAYA DADO DE BAJA A LA PERSONA EN EL AUTH
###YA EN EJECUCION
GDB-GAD
formulador_gerente=5491571
510.1903.32.4.24
Gerencia Departamental de Auditoría en Gobiernos Departamentales - GDB-GAD
src/components/inicios-actividades/component/inicios-actividades.view.jsx
iap_codigo=155
asi_codigo=162
iac_codigo=259


GDC- GAD
formulador_gerente=2890573
ANULADO:
    per_codigo: 216
    descripcion: RUTH TARCAYA GALLARDO

###SE CREO NUEVO    
GDC- GAD
formulador_gerente=2890573
http://172.16.75.100:3002/conaud/inicios-actividades?ges_codigo=2&act_codigo=504
520.1302.60.3.24
Gerencia Departamental de Auditoría en Gobiernos Departamentales - GDC- GAD
src/components/asignaciones-cargos-item/component/asignaciones-cargos-item.table.jsx

### OTRO NUEVO
GDC- GAD
formulador_gerente=2890573
520.1302.61.9.24



http://172.16.75.100:3002/conaud/inicios-actividades?ges_codigo=2&act_codigo=499
asi_codigo=1385

###EL QUE NO TIENE DATO
500.1302.54.1.24
Gerencia Departamental de Auditoría en Gobiernos Departamentales - GDC- GAD







- SI SE TIENE QUE USAR ESTE NUEVO AUTH, QUE SE USE
##### USUARIOS
GET http://172.16.80.82:4003/api/v1/externo/usuarios_unidad_completo HTTP/1.1
Content-Type: application/json
Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0aXBvIjoic2lzdGVtYSIsInNpc3RlbWEiOiJTaXN0ZW1hIGRlIGF1dGVudGljYWNpb24iLCJzaWdsYSI6ImF1dGVudGljYWNpb24iLCJpZCI6IjZkNDEzYWE1LWQ2MjMtNGRkNC1hOWMxLTQ0OTVmMzRjOGI3MCIsInNpc3RlbWFzIjpbeyJzaXNjZ2VfY29kaWdvIjowLCJzaXNjZ2Vfc2lnbGEiOiJhdXRlbnRpY2FjaW9uIn1dLCJpYXQiOjE2MjA0MTAwNDN9.cE1CnVUfMf7Nieg0j22MBie9I7V1RRqyuFjngUFMcJfE0Gs3OYdfXTY0ovB_CJMyGLlrWn1TXVLFGXdcGxEnTA
- YA NO TIENE QUE USAR ESTE
##### USUARIOS
GET http://172.16.80.82:4003/api/v1/externo/usuarios_unidad?codigo=(241) HTTP/1.1
Content-Type: application/json
Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0aXBvIjoic2lzdGVtYSIsInNpc3RlbWEiOiJTaXN0ZW1hIGRlIGF1dGVudGljYWNpb24iLCJzaWdsYSI6ImF1dGVudGljYWNpb24iLCJpZCI6IjZkNDEzYWE1LWQ2MjMtNGRkNC1hOWMxLTQ0OTVmMzRjOGI3MCIsInNpc3RlbWFzIjpbeyJzaXNjZ2VfY29kaWdvIjowLCJzaXNjZ2Vfc2lnbGEiOiJhdXRlbnRpY2FjaW9uIn1dLCJpYXQiOjE2MjA0MTAwNDN9.cE1CnVUfMf7Nieg0j22MBie9I7V1RRqyuFjngUFMcJfE0Gs3OYdfXTY0ovB_CJMyGLlrWn1TXVLFGXdcGxEnTA

- QUERYS POSIBLES A USAR
SELECT	*
FROM	ejecucion_poa.asignaciones_cargos_item aci
		LEFT JOIN estructura_organizacional.cargos_items_persona cip ON aci.cit_codigo = cip.cit_codigo
WHERE	TRUE
		AND aci.asi_codigo = 162
;

SELECT *, iapa.asi_codigo 
FROM ejecucion_actividades.inicio_actividad_poa_asignaciones iapa
WHERE iapa.iap_codigo = 155
;





