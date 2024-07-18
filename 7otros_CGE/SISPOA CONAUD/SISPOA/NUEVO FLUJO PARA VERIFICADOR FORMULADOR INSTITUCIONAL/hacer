bd_cge_poa_conaud_local_b
postgres
 "Gerencia Departamental de Cochabamba - GDC"
GDC
  * Paso 1 Formulador Gerente (Registro, Enviar a aprobar) 4314752 VIVIAN GRETEL MICHEL ZAMBRANA
  * Paso 2 Aprobador (Aprobar) 4841730 CECILIA GLADYS LOZA CHOQUE
  * Paso 3 Supervisor (Consolidar)" 5922785 JUAN CARLOS FLORES ARIAS
- SOLO PARA F21 osea cac_codigo=2
- AHORA EL ROL DE GESTION INSTITUCIONAL PARA EL CASO DE F-21 YA NO PASA A CONSOLIDAR, SINOs PASA AL NUEVO ESTADO INTERMEDIO VERIFICADO GI el 17
7-17 VERIFICADO POR GI
17-2 CONSOLIDADO

ROL_GESTION_INSTITUCIONAL_FORMULADOR = 196[Verificado Gestion Institucional pasa a 17]
ROL_GESTION_INSTITUCIONAL_APROBADOR = 197[Consolidar pasa de 17 a 2]
ROL_GESTION_INSTITUCIONAL_VERIFICADOR = 198[Consolidar pasa de 17 a 2]
530.0013.1

ROLES QUE SOLO CONSOLIDADN
4813387 = ROL_GESTION_INSTITUCIONAL_APROBADOR
4385501 = ROL_GESTION_INSTITUCIONAL_VERIFICADOR
###PARA CAMBIOS DE ESTADO GLOBALES
--Cambio de estado Global FORMULARIO:'SISPOA',`/poas/estado-all`,
---Cambio de estado Global ACCIONES ESTRATEGICAS:'SISPOA',`/poas-objetivos/estado-all`,
###ESTADO GLOBAL
'SISPOA',
  'formularios/estado-global-refactor?poa_codigo=(3)'
##FORMULARIOS
          <div>
            <p>rolGestionInstitucional{{ rolGestionInstitucional }}</p>
            <p>PoaRecordSelected.poa_estado{{ PoaRecordSelected.poa_estado }}</p>
            <p>CacCodigo{{ CacCodigo }}</p>
            <p>item.estado_global{{ item.estado_global }}</p>
          </div>
####ACTIVIDADES
<div>
  <p>rolGestionInstitucional{{ rolGestionInstitucional }}</p>
  <p>objectPoaObjetivo.pobj_estado{{ objectPoaObjetivo.pobj_estado }}</p>
  <p>item.cac_codigo{{ item.cac_codigo }}</p>
  <p>item.act_estado{{ item.act_estado }}</p>
  <p>item.estados_check{{ item.estados_check }}</p>
 </div>
####QUERYS AGREGAR DE FLUJOS#####
--ACTIVIDAD AGREGAR EL NUEVO FLUJO(7-17)
INSERT INTO control_estados.flujos_tablas
(fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja)
VALUES(365, 1, '', 7, 17, 1, 0, 0, 0, '2024-05-09 18:57:05.209', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000');
--ACTIVIDAD AGREGAR EL NUEVO FLUJO(17-2)
INSERT INTO control_estados.flujos_tablas
(fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja)
VALUES(366, 1, '', 17, 2, 1, 0, 0, 0, '2024-05-09 18:57:05.209', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000');
--VIATICOS AGREGAR EL NUEVO FLUJO(7-17)
INSERT INTO control_estados.flujos_tablas
(fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja)
VALUES(367, 2, '', 7, 17, 1, 0, 0, 0, '2024-01-16 18:16:56.120', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000');
--VIATICOS AGREGAR EL NUEVO FLUJO(7-17)
INSERT INTO control_estados.flujos_tablas
(fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja)
VALUES(368, 2, '', 17, 2, 1, 0, 0, 0, '2024-01-16 18:16:56.120', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000');
--OBSERVAR FLUJOS
--ACTIVIDAD AGREGAR EL NUEVO FLUJO(17-4)
INSERT INTO control_estados.flujos_tablas
(fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja)
VALUES(369, 1, '', 17, 4, 1, 0, 0, 0, '2024-05-09 18:57:05.209', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000');
--VIATICOS AGREGAR EL NUEVO FLUJO(17-4)
INSERT INTO control_estados.flujos_tablas
(fta_codigo, tab_codigo, fta_descripcion, est_codigo_origen, est_codigo_destino, fta_estado, usuario_registro, usuario_modificacion, usuario_baja, fecha_registro, fecha_modificacion, fecha_baja)
VALUES(370, 2, '', 17, 4, 1, 0, 0, 0, '2024-01-16 18:16:56.120', '1900-01-01 00:00:00.000', '1900-01-01 00:00:00.000');


