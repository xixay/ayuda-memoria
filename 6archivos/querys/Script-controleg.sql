--###  --- PROCESO
	select * from controleg.proceso p 
;
--###  --- TIPO DE PROCESO 
select * from parametricas.tipo_proceso tp 
select * from parametricas.estado_tipo_proceso etp 
select * from parametricas.estado_proceso ep 
;
--###  --- INSERTAR TIPO DE PROCESO
INSERT INTO parametricas.estado_tipo_proceso
(esttippro_codigo, tippro_codigo, estpro_codigo, esttippro_estado, usuario_registro, fecha_registro, usuario_modificacion, fecha_modificacion, usuario_baja, fecha_baja)
VALUES(1, 1, 1, 1, 0, CURRENT_TIMESTAMP::timestamp without time zone, 0, '', 0, '');

