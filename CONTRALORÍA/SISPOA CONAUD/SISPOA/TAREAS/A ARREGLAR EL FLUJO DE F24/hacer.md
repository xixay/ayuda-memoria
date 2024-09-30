- PONER A EL NUEVO ESTADO INTERMEDIO LA OPCION DE 

Subcontraloría General - SCG
00.0001.4(accion corto plazo)
00.0001.4.1.24(actividad)

 

FORMULADOR GERENTE(4281948)=DAVID FREDDY YUJRA SEGALES
FORMULADOR(3755032)=MARTIN AYLLON QUINTEROS
APROBADOR(4314752)=VIVIAN GRETEL MICHEL ZAMBRANA
SUPERVISOR(5896756)=ROCIO HEIDY SALDIAS PADILLA

4813387 = ROL_GESTION_INSTITUCIONAL_APROBADOR
4385501 = ROL_GESTION_INSTITUCIONAL_VERIFICADOR

############F-21###############
act_estado=2(Actividad Consolidada)
#formulador, formulador gerente ====>>>>consolidar
#formulador, formulador gerente ====>>>>solicitar retiro

act_estado=11
#aprobador ====>>>>aprobar retiro(aprobador)
#aprobador ====>>>>observar retiro

act_estado=12
#supervisor ====>>>>aprobar retiro(supervisor)
#supervisor ====>>>>observar retiro

act_estado=13
Gestion Institucional(NORKA) ====>>>>retirar actividad
Gestion Institucional(NORKA) ====>>>>observar retiro

Actividad observar actividad --Formulador Gerente --consolidar

una vez retirado no se muestra como actividad

--ESTADO RETIRO
INSERT INTO parametricas.estados
(est_codigo, est_nombre, est_color, est_descripcion, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja)
VALUES(44, 'RETIRO APROBADO GI.', '#ea5545', 'Retiro Aprobado por Gestión Institucional.', 0, 0, 0, '2024-05-09 18:53:52.462', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000');
--ACTIVIDAD AGREGAR EL NUEVO FLUJO(13-44)
INSERT INTO control_estados.flujos_tablas
(fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja)
VALUES(371, 1, '', 13, 44, 1, 0, 0, 0, '2024-05-09 18:57:05.209', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000');
--ACTIVIDAD AGREGAR EL NUEVO FLUJO(44-14)
INSERT INTO control_estados.flujos_tablas
(fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja)
VALUES(372, 1, '', 44, 14, 1, 0, 0, 0, '2024-05-09 18:57:05.209', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000');
--ACTIVIDAD AGREGAR EL NUEVO FLUJO(44-9)
INSERT INTO control_estados.flujos_tablas
(fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja)
VALUES(373, 1, '', 44, 9, 1, 0, 0, 0, '2024-05-09 18:57:05.209', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000');
