ELIMINACION INFORMES UAI Y SCAT
- base_a
- NO TOCAR LOS QUE ESTAN EN EJECUCION
- EN EL AREA EJECUTORA, NO SE DEBEN MOSTRAR LOS ANULADOS
- EL BOTON SOLO PUEDE REALIZARLO EL FORMULADOR GERENTE Y INSTITUCIONAL
- TOMAR EN CUENTA INACTIVOS Y ANULADOS
##TABLAS INTERVIENEN####
- informes_uai <--informes_evaluaciones(iua_codigo) <--informes_evaluaciones_estados(iev_codigo)
- informes_uai <--inicio_evaluacion_informe(iua_codigo) <--inicio_evaluacion_informe_asignaciones(iei_codigo)

--inicio_evaluacion_informe_asignaciones(asi_codigo)<--asignaciones
---asignaciones(asi_codigo)<--asignaciones_cargos_item(asi_codigo)

- informes_uai <--informes_uai_reingreso
Gerencia Departamental de Cochabamba - GDC 
00.0013.58
pobj_codigo=33
poa_codigo=2
ett_codigo=5

formulador_gerente=5922785

actividad	|codi_poa	|act_codigo	|iua_codigo	|iua_estado	|
UAI UNO		|00.0013.58.8.24|1512		|796		|1		|
						|797		|1		|
UAI UNO		|00.0013.58.9.24|1513		|798		|1		|
						|799		|1		|
UAI TRES CONT	|00.0013.58.10.24|1514		|800		|2		|
						|801		|1		|
UAI CUATRO	|00.0013.58.11.24|1515		|802		|1		|
						|803		|1		|
UAI FIRMAS	|00.0013.58.12.24|1516		|804		|1		|
						|805		|1		|
UAI CINCO	|00.0013.58.13.24|1517		|806		|1		|
						|807		|1		|
UAI SEIS	|00.0013.58.14.24|1518		|808		|1		|
						|809		|1		|
UAI SIETE	|00.0013.58.15.24|1519		|810		|1		|
						|811		|1		|






