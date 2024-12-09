## Consideraciones Auditoria
- IntervienenFlujos
- Que pasa si se cierra, se puede seguir registrando horas
## Roles

| _list_ | Doc. Identidad | Nombre Completo                               | Rol                | Estado  |
| ------ | -------------- | --------------------------------------------- | ------------------ | ------- |
|        | 3403668        | ANA MARIA BRIGGITTE DEL CARMEN ARRAZOLA DURAN | FORMULADOR         | EDICION |
|        | 2389409        | OLGA EDITH SUAREZ JIMENEZ                     | SUPERVISOR         | EDICION |
|        | 4385501        | JULIO CARLOS GUERRA VILLARROEL                | APROBADOR          | EDICION |
|        | 1397469        | RUTH TARCAYA GALLARDO                         | FORMULADOR GERENTE | EDICION |
|        | 1397469        | RUTH TARCAYA GALLARDO                         | FORMULADOR         | EDICION |

- 520.1302.237.1.24 
- 520.1302.61.10.24
- 510.1302.18.4.24
- 500.1302.54.4.24(NO deja solicitar cierre) 
	- Las acciones sobre Cierre de Actividad aún no pueden ser utilizados.
	- Los informes de la auditoria deben estar en estado de emisión o anulación.)
- 520.1302.62.1.24(ampliado)
## Antes Cierre
|iap_codigo|iap_estado|iac_codigo|iac_estado|iapa_codigo|iapa_estado|asi_codigo|asi_estado|aci_codigo|aci_estado|aci_horas|cit_codigo|ahu_codigos|ahu_horas|ahu_estados|inf_codigos|inf_descripciones|inf_estados|
|----------|----------|----------|----------|-----------|-----------|----------|----------|----------|----------|---------|----------|-----------|---------|-----------|-----------|-----------------|-----------|
|515|2|515|22|512|1|1004|2|3737|2|5|564|{9.514,9.515,9.516}|{1,2}|{1}|{391,392}|{p1,p2}|{1}|
|515|2|515|22|512|1|1004|2|3738|2|2|64|{NULL}|{NULL}|{NULL}|{391,392}|{p1,p2}|{1}|
|515|2|515|22|512|1|1004|2|3739|2|2|393|{NULL}|{NULL}|{NULL}|{391,392}|{p1,p2}|{1}|
|515|2|515|22|512|1|1004|2|3740|2|24|525|{NULL}|{NULL}|{NULL}|{391,392}|{p1,p2}|{1}|
|515|2|515|22|512|1|1004|2|3741|2|7|501|{NULL}|{NULL}|{NULL}|{391,392}|{p1,p2}|{1}|


## Solicitud cierre
|iap_codigo|iap_estado|iac_codigo|iac_estado|iapa_codigo|iapa_estado|asi_codigo|asi_estado|aci_codigo|aci_estado|aci_horas|cit_codigo|
|----------|----------|----------|----------|-----------|-----------|----------|----------|----------|----------|---------|----------|
|515|2|515|23|512|1|1004|2|3741|2|7|501|
|515|2|515|23|512|1|1004|2|3740|2|24|525|
|515|2|515|23|512|1|1004|2|3739|2|2|393|
|515|2|515|23|512|1|1004|2|3737|2|5|564|
|515|2|515|23|512|1|1004|2|3738|2|2|64|
- Cuando se esta en ejecucion:
  - Los roles formulador gerente, aprobador, supervisor
	  - ven la pestaña Registrar Horas
	  - pueden agregar o modificar horas
- cuando se esta en estado solicitud de cierre
	- ninguno puede ver la pestaña Registrar Horas
- cuando se esta en los estados posteriores, osea aprobar cierre por parte del aprobador, supervisor y en estado de cierre:
  - ven la pestaña Registrar horas
  - aunque les aparece la opcion de agregar o modificar horas, da error, solo les funciona la opcion inactivar
- Cuando se amplia cuando se hace el proceso para consolidar, la hora que se registro en la pestaña Registrar Horas, antes de ampliar vuelve aparecer