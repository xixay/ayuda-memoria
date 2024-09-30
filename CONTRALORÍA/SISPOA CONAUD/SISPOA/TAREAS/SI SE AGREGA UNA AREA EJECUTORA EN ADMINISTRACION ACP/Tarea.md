# QUE SE ASIGNE A LA NUEVA AREA CON EL ESTADO EN EL QUE ESTA LA ACCIONES A CORTO PLAZO
## ROL: NORKA

## QUERY:
```sql
SELECT
	oau.oau_codigo,oau_descripcion,oau.aun_codigo_ejecutora, oau.oau_estado,
	au.aun_sigla,
	po.pobj_codigo, po.pobj_estado
FROM 	estructura_poa.objetivos_area_unidad oau
	LEFT JOIN estructura_organizacional.areas_unidades au ON oau.aun_codigo_ejecutora = au.aun_codigo
	LEFT JOIN estructura_poa.poas_objetivos po ON oau.pobj_codigo = po.pobj_codigo
WHERE 	TRUE
	AND oau.pobj_codigo IN (1067)
ORDER BY oau.oau_codigo DESC
;
```
## COMPONENTE
- http://172.16.22.243:3000/sispoa/administracion_acp

## EXISTEN DOS AREAS EJECUTORAS: backup_20240930_085229.sql
- 1.-GDT-GAD1
- 2.-GDT-GAM1

## GDT-GAD1: TIENE LA ACCION A CORTO PLAZO
- 520.1702.112	Emitir 4 Informes Complementarios en Gobiernos Departamentales en la Gerencia Departamental de Tarija en la gestión 2024.

## GDT-GAM1: NO TIENE LA MISMA

## SE VA ASOCIAR DESDE GDT-GAD1 EL ÁREA EJECUTORA GDT-GAM1, PARA LA ACCION :
- Emitir 4 Informes Complementarios en Gobiernos Departamentales en la Gerencia Departamental de Tarija en la gestión 2024.

## REALIZA POST:
- http://172.16.22.243:7091/objetivos-area-unidad

## ENVIA
```json
{
	"aun_codigo_ejecutora": 39,
	"aun_codigo_supervisora": 39,
	"aun_numero": "1702",
	"aun_sigla": "GDT-GAD1",
	"estado_global": 2,
	"estado_global_color": "#43A047",
	"estado_global_descripcion": "CONSOLIDADO",
	"estado_global_pobj": 2,
	"estado_global_pobj_color": "#43A047",
	"estado_global_pobj_descripcion": "CONSOLIDADO",
	"oau_codigo": 1245,
	"oau_descripcion": "prueba 2",
	"oau_estado": 2,
	"oau_indicador": 111,
	"observacion_detalle": null,
	"pobj_codigo": 1057,
	"pobj_codigo_sigla": "520.1702.112",
	"pobj_estado": 2,
	"pobj_nombre": "Emitir 4 Informes Complementarios en Gobiernos Departamentales en la Gerencia Departamental de Tarija en la gestión 2024.",
	"pobj_numero": 112,
	"pro_codigo": 3,
	"pro_numero": "520"
}
```

## AL ENVIAR EL pob_estado, se creara con ese estado : backup_20240930_085044.sql
- 520.1703.112	Emitir 4 Informes Complementarios en Gobiernos Departamentales en la Gerencia Departamental de Tarija en la gestión 2024.

## OTRAS PRUEBAS
- Emitir 2 informes analíticos de Auditorías Operacionales significativos elaborados por las UAI de Entidades Públicas del Nivel Departamental en la Gerencia Departamental de Tarija, recibidos en la gestión 2024.

# CREAR UNA ACTIVIDAD Y CONSOLIDARLA
- Para comprobar su codigo conaud, para ver a quien se refiere como supervisor
## Roles
- GDT-GAM1
```txt
	1782324	CLARA MARIA HIZA ZUÑIGA	GERENTE CONSOLIDADOR 	EDICION
	1078204	OSCAR TORRES LEON	FORMULADOR 	EDICION
	4876199	OSCAR CALLISAYA MONTOYA	FORMULADOR 	EDICION
	4813387	MERY GOMEZ CONDORI	FORMULADOR 	EDICION
	2428708	SANTIAGO MAIDANA QUISPE	SUPERVISOR 	EDICION
	1782324	CLARA MARIA HIZA ZUÑIGA	APROBADOR 	EDICION
	1078204	OSCAR TORRES LEON	FORMULADOR GERENTE 	EDICION 
```
## Crear la actividad: formulador 4813387
- Debe ser de auditoria
- Debe crearse en gdt-gam1, en base a la accion a corto plazo
- La accion a corto plazo es:
	- 520.1703.112 Emitir 4 Informes Complementarios en Gobiernos Departamentales en la Gerencia Departamental de Tarija en la gestión 2024.
- Se creo con la supervisora: Subcontraloría de Gobiernos Municipales y Universidades - SCGM
### Act creada
- 520.1703.112.1.24
- act_codigo = 4763
### Comprobar que se creo Query
```sql
--ACTIVIDAD
SELECT
		a.act_codigo, a.act_numero, a.act_estado, a.act_descripcion,
		au1.aun_sigla AS aun_sigla_ejecutora,
		au2.aun_sigla AS aun_sigla_supervisora
FROM 	estructura_poa.actividades a
		LEFT JOIN estructura_organizacional.areas_unidades au1 ON a.aun_codigo_ejecutora = au1.aun_codigo
		LEFT JOIN estructura_organizacional.areas_unidades au2 ON a.aun_codigo_supervisora = au2.aun_codigo
ORDER BY a.act_codigo DESC
;
```
## Llevarlo hasta consolidar :backup_20240930_104921.sql
## Iniciar el inicio actividad poa: backup_20240930_111727.sql
- Existe una parte en inicios actividades, que crea:
	- const codControl = actividad.aun_inicial_supervisora + '' + actividad.aun_inicial_ejecutora;
- Para Código Poa: 	520.1703.112.1.24
- El CONAUD:		GTFP

|quien es|aun_codigo|aun_nombre|aun_sigla|aun_inicial|
|----------|----------|----------|---------|-----------|
|SUPERVISORA|5|Subcontraloría de Gobiernos Municipales y Universidades|SCGM|G|
|EJECUTORA|39|Gerencia Departamental de Auditoría en Gobiernos Municipales y Universidades|GDT-GAM1|T|

|aun_inicial_super|aun_inicial_ejec|tipo_trab|programacion del poa|
|----------|----------|----------|---------|
|G|T|F|P|

## Otra prueba: backup_20240930_142210.sql
- Se tendra la supervisora GDC, que tiene a su cargo a GDC-GAM1 y GDC-GAD
- Desde GDC-GAD se le asociar una ACP a GDC-GAM1
- En Formularios se creara la actividad, pero se la supervisora sera SCSL
## LA ACP A ASOCIAR DESDE GDC-GAD SERA
- Emitir 3 informe analítico de Auditoría Operacional significativo sobre el IDH elaborado por las UAI de los Gobiernos Autónomos Departamentales en la Gerencia Departamental de Cochabamba en la gestión 2024.
## CREAR LA ACTIVIDAD EN GDC-GAM1
### roles:
```txt
GDC-GAM1
	4385501	JULIO CARLOS GUERRA VILLARROEL	GERENTE CONSOLIDADOR 	EDICION
	4813387	MERY GOMEZ CONDORI		FORMULADOR 		EDICION
	2428708	SANTIAGO MAIDANA QUISPE		SUPERVISOR 		EDICION
	4385501	JULIO CARLOS GUERRA VILLARROEL	APROBADOR 		EDICION
	1054445	EVELYN FERNANDEZ QUIROGA	FORMULADOR GERENTE 	EDICION
	1054445	EVELYN FERNANDEZ QUIROGA	FORMULADOR 		EDICION 
```
### entrar formulador y crear la act en GDC-GAM1
- buscar 1054445
- buscar la ACP
	- Emitir 3 informe analítico de Auditoría Operacional significativo sobre el IDH elaborado por las UAI de los Gobiernos Autónomos Departamentales en la Gerencia Departamental de Cochabamba en la gestión 2024.
- crear la actividad con area unidad supervisora: SCSL
- La act creada :backup_20240930_143400.sql
- 3 actividades creadas:backup_20240930_144014.sql

|act_codigo|act_numero|act_estado|act_descripcion|aun_sigla_ejecutora|aun_inicial_ejecutora|aun_sigla_supervisora|aun_inicial_supervisora|
|----------|----------|----------|---------------|-------------------|---------------------|---------------------|-----------------------|
|4766|500.1303.58.3.24|2|actividad Sup: Subcontraloría del Nivel Central - SCNC|GDC-GAM1|C|SCNC|I|
|4765|500.1303.58.2.24|2|actividad 2 Sup: Subcontraloría de Servicios Legales - SCSL|GDC-GAM1|C|SCGD|E|
|4764|500.1303.58.1.24|2|actividad Sup: Subcontraloría de Auditorías Técnicas - SCAT|GDC-GAM1|C|SCAT|K|

- De GDC-GAD su aun_inicial es :C
## Llevar consolidar
- Se llevo a consolidar: backup_20240930_144353.sql
## Iniciar la actividad CONAUD :backup_20240930_145228.sql
- Las 
