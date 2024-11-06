--### 'CREAR AREA UNIDAD'###
INSERT INTO estructura_organizacional.areas_unidades
(aun_codigo, 
aun_nombre, 
aun_numero, 
aun_sigla, 
org_codigo, 
lug_codigo, 
tau_codigo, 
nau_codigo, 
aau_codigo, 
ade_codigo, 
cau_codigo, 
aun_estado, 
usuario_registro, 
fecha_registro, 
aun_inicial 
)
VALUES((select max(aun_codigo)+1 from estructura_organizacional.areas_unidades), 
'Unidad de Transparencia', 
'1802', 
'GDN-GAM',  --aun_sigla
1, --org_codigo
2, --lug_codigo
2, --tau_codigo
3, --nau_codigo
1, --aau_codigo
1, --ade_codigo
1, --cau_codigo
2, --aun_estado
0, 
'2024-02-05 12:04:53.257', 
'N');
--### 'CREAR CARGOS ITEM' EXISTE cargos y item###
INSERT INTO estructura_organizacional.cargos_items
(cit_codigo, cit_descripcion, aun_codigo, car_codigo, ite_codigo, cit_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja)
VALUES(604, 'Cargo item con interino 2/5/2024, 21:48:42', 81, 114, 204, 2, 1914, 1914, 0, '2024-07-26 21:48:42.900', '2024-07-26 21:48:43.039', '1900-01-01 00:00:00.000');

--$$$ 'CREAR CARGOS ITEM' NO EXISTE cargos y item###
--CREAR ITEM
INSERT INTO estructura_organizacional.items
(ite_codigo, ite_numero, ite_descripcion, ite_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja)
VALUES(625, '0625', 'Item 0625', 2, 1914, 1818, 0, '2023-10-25 21:22:10.878', '2023-10-31 19:30:14.647', '1900-01-01 00:00:00.000');

--CREAR CARGO
INSERT INTO estructura_organizacional.cargos
(car_codigo, car_nombre, car_alias, tca_codigo, car_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja)
VALUES(167, 'GERENTE NUEVO', '', 1, 2, 0, 0, 0, '2024-01-26 12:16:56.196', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000');

--RECIEN CREAR EL CARGO ITEM
INSERT INTO estructura_organizacional.cargos_items
(cit_codigo, cit_descripcion, aun_codigo, car_codigo, ite_codigo, cit_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja)
VALUES(604, 'Cargo item con interino 2/5/2024, 21:48:42', 81, 167, 625, 2, 1914, 1914, 0, '2024-07-26 21:48:42.900', '2024-07-26 21:48:43.039', '1900-01-01 00:00:00.000');

--CREAR SU OBJETIVO AREA UNIDAD
INSERT INTO estructura_poa.objetivos_area_unidad
(oau_codigo, oau_descripcion, pobj_codigo, aun_codigo_ejecutora, aun_codigo_supervisora, oau_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja, oau_indicador)
VALUES(2670, NULL, 2365, 81, 81, 8, 1737, 2228, 0, '2024-08-29 19:56:04.817', '2024-08-30 09:11:25.740', '1900-01-01 00:00:00.000', 3);





SELECT 	*
FROM 	estructura_poa.objetivos_area_unidad oau 
--WHERE 	oau.aun_codigo_ejecutora IN (81)
ORDER   BY oau.oau_codigo DESC 
;

SELECT 	*
FROM 	estructura_poa.poas p 
WHERE 	p.ges_codigo IN (2);

SELECT 	*
FROM 	estructura_organizacional.cargos_item_dependencias cid ;



SELECT 	*
FROM 	estructura_organizacional.cargos c 
ORDER BY c.car_codigo DESC 
;

SELECT 	*
FROM 	estructura_organizacional.items i 
ORDER BY i.ite_codigo  DESC 
;

SELECT 	*
FROM 	estructura_organizacional.areas_unidades au 
ORDER BY au.aun_codigo DESC 
;

SELECT 	*
FROM 	estructura_organizacional.cargos_items ci
ORDER  BY ci.cit_codigo DESC;
;

SELECT 	*
FROM 	estructura_poa.area_unidad_responsables aur ;

--actualizar foto
UPDATE 	estructura_poa.area_unidad_responsables
SET 	per_codigo = 1914
WHERE 	poa_codigo = 3
;

UPDATE 	
SET 	estructura_poa.area_unidad_responsables aur