SOLO HAY LOS ESTADOS:
0 INACTIVO
1 EDICION
2 PROTEGIDO
3 HISTORICO


usuario (usu_estado=2)
usuario_rol (usurol_estado=2)
	usuario (usu_estado=2)
	persona_natural(pernat_estado=1)
	rol (rol_estado=2)
	tiprol (tiprol_estado=2)

usuario_entidad (usuent_estado=1)
	usuario (usu_estado=2)
	persona_natural(pernat_estado=1)
	tipo_documento (tipdoc_estado=1)

#OPCION 1 (Que vaya directamente)
2-0
0-2

#OPCION 2 (Que vaya en un flujo usu_estado)
2-0
0-1
1-2

#OPCION 3(Crear la tabla estado_usuario)
0 INACTIVO
1 EDICION
2 PROTEGIDO
3 HISTORICO
4 INACTIVO EDICION
5 INACTIVO PROTEGIDO
	
usu_estado = 1
1-4
4-1
usu_estado = 2
2-5
5-2

#OPCION 4(Crear la columna estado_anterior)
1-0 (estado_anterior=1)
0-1

2-0 (estado_anterior=2)
0-2



