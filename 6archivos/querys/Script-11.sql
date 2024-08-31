INSERT INTO estructura_organizacional.areas_unidades
(aun_codigo, aun_nombre, aun_numero, aun_sigla, aun_copia, aun_supervision_compartida, org_codigo, lug_codigo, tau_codigo, nau_codigo, aau_codigo, ade_codigo, cau_codigo, aun_estado, usuario_registro, aun_inicial)
VALUES
(81, 'UNIDAD TÉCNICA DE TRANSPARENCIA Y LUCHA CONTRA LA CORRUPCIÓN', '0024', 'UTTLCC', false, false, 1, 2, 2, 3, 1, 1, 2, 2, 1914, 'Z');

INSERT INTO estructura_organizacional.areas_unidades_dependencias
(aud_codigo, aud_descripcion, aun_codigo_padre, aun_codigo_hijo, aud_estado, usuario_registro)
VALUES
(80, 'El area/unidad: UTTLCC - UNIDAD TÉCNICA DE TRANSPARENCIA Y LUCHA CONTRA LA CORRUPCIÓN, depende de: DC - Despacho del Contralor', 1, 81, 1, 1914);

INSERT INTO estructura_organizacional.autoridades_funcionales (afu_codigo, afu_descripcion, aun_codigo_supervisado, aun_codigo_supervisor, afu_estado, usuario_registro)
VALUES
(175, 'El area/unidad: UTTLCC - UNIDAD TÉCNICA DE TRANSPARENCIA Y LUCHA CONTRA LA CORRUPCIÓN, esta supervisado funcionalmente por: UTTLCC - UNIDAD TÉCNICA DE TRANSPARENCIA Y LUCHA CONTRA LA CORRUPCIÓN', 81, 81, 1, 1914);

UPDATE estructura_organizacional.cargos_items
SET cit_estado = 0
WHERE cit_codigo = 170;

INSERT INTO estructura_organizacional.cargos
(car_codigo, car_nombre, car_alias, tca_codigo, car_estado, usuario_registro)
VALUES
(167, 'OFICIAL DE TRANSPARENCIA Y LUCHA CONTRA LA CORRUPCIÓN', 'OFICIAL DE TRANSPARENCIA Y LUCHA CONTRA LA CORRUPCIÓN', 1, 2, 1914);

INSERT INTO estructura_organizacional.cargos_items
(cit_codigo, cit_descripcion, aun_codigo, car_codigo, ite_codigo, cit_estado, usuario_registro)
VALUES
(604, 'El cargo: OFICIAL DE TRANSPARENCIA Y LUCHA CONTRA LA CORRUPCIÓN, pertenece al área/unidad: UNIDAD TÉCNICA DE TRANSPARENCIA Y LUCHA CONTRA LA CORRUPCIÓN, con el item: 0039.', 81, 167, 39, 2, 1914);