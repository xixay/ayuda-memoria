4385501
10:10
4813387 = ROL_GESTION_INSTITUCIONAL_APROBADOR
4385501 = ROL_GESTION_INSTITUCIONAL_VERIFICADOR



%%%%%%%%%%%%% RETIROS %%%%%%%%%%%%%%%%%
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

INSERT INTO control_estados.flujos_tablas (fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro) VALUES((select max(fta_codigo)+1 from control_estados.flujos_tablas), 2, '', 13, 45, 1, 0);
INSERT INTO control_estados.flujos_tablas (fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro) VALUES((select max(fta_codigo)+1 from control_estados.flujos_tablas), 2, '', 45, 14, 1, 0);
INSERT INTO control_estados.flujos_tablas (fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro) VALUES((select max(fta_codigo)+1 from control_estados.flujos_tablas), 2, '', 45, 9, 1, 0);

