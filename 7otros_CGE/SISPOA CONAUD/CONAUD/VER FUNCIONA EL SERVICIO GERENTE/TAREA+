http://172.16.22.243:3002/conaud/inicios-actividades?ges_codigo=2&act_codigo=2961

SANTIAGO MAIDANA QUISPE
2428708
SUBCONTRALORÍA DE GOBIERNOS MUNICIPALES Y UNIVERSIDADES

src/feature/sispoa-actividades/service/findAll-sispoa-actividades.service.ts


backup_20240924_201125.sql   :520.1202.54.9.24

GPA2-GAM2
	3386714	GUERY RAMIRO CUENTAS AGUIRRE	GERENTE CONSOLIDADOR 	EDICION
		SIN IDENTIFICAR	FORMULADOR 	EDICION
	3346274	SHIRLEY IRENE VASQUEZ PINTO	FORMULADOR 		EDICION
	2428708	SANTIAGO MAIDANA QUISPE		SUPERVISOR 		EDICION
	2428708	SANTIAGO MAIDANA QUISPE		FORMULADOR GERENTE 	EDICION
	4813387	MERY GOMEZ CONDORI		FORMULADOR 		EDICION
	3386714	GUERY RAMIRO CUENTAS AGUIRRE	APROBADOR 		EDICION
- ENTRA:
ges_codigo:2
act_codigo:2961
usuario:42

-ARRAY:de 1 solo obj:datos act, area ejec,roles,inicio_actividad_poa, array_inicio_actividad_poa(es obj)

### addAsignacionesCargosItem ###
-ingresa el ARRAY de un solo objeto
-busca cargos item persona: per_codigo=42, cip_estado=(2,42) 
	=> encuentra un arrayPer de un solo obj, que ese uno contiene el "cit_codigo=398"

-recorre el ARRAY, pero solo recorre una ves:
	-busca su inicio_actividad_poa_asignaciones para "iap_codigo = 499" y en edicion:
	=> encuentra un objeto ,de donde se extrae el asi_codigo=960
	-busca los datos de esa asignacion para asi_codigo=960 y asi_estado=2
	=> encuentra un obj
	- recorre el arrayPer
		-busca en asignaciones_cargos_item para asi_codigo=960, cit_codigo=398, aci_estado=2 
		=>obtiene un objeto, de donde solo necesita el aci_codigo=2802, si no lo encontrara sera "0"
		-agrega el asi_codigo y el cit_codigo a el ARRAY, a los objetos, a su inicio_actividad_poa 				item.inicio_actividad_poa.asi_codigo
				item.inicio_actividad_poa.aci_codigo
-retorna el ARRAY	
	
### addFormulariosObjetivos ###
-ingresa el ARRAY de un solo objeto
-recorre el ARRAY, pero solo recorre una ves:
	-busca con el unico objeto del ARRAY con el fob_codigo=null
	=>Si lo encuentra agrega a el unico objeto del ARRAY , formularios_objetivos, pero como el fob_codigo es null no lo encuentra y no agrega nada
-retorna el ARRAY




http://172.16.22.243:3002/conaud/inicios-actividades?ges_codigo=2&act_codigo=2961






	
	
