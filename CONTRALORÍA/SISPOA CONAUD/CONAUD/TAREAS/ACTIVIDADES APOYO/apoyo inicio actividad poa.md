## Hacer
- fix: agregando la opcion de cambio de estado solo para actividades apoyo de tipo Scat
## ramas


| back  | fix/cambio_estado_apoyo_inicio_actividad_poa_back  |
| ----- | -------------------------------------------------- |
| front | fix/cambio_estado_apoyo_inicio_actividad_poa_front |

## Querys
```sql
SELECT 	*
FROM 	ejecucion_actividades.apoyo_inicio_actividad_poa aiap 
;

SELECT 	aiap.aiap_codigo,aiap.aiap_estado,aiap.act_codigo, tt.ttr_codigo,  tt.ttr_descripcion 
FROM 	ejecucion_actividades.apoyo_inicio_actividad_poa aiap
		LEFT JOIN estructura_poa.actividades a ON aiap.act_codigo = a.act_codigo
		LEFT JOIN parametricas.tipos_trabajos tt ON tt.ttr_codigo = a.ttr_codigo
		LEFT JOIN parametricas.especificacion_tipos_trabajo ett ON ett.ett_codigo = tt.ett_codigo
;
--
SELECT 	tt.ttr_codigo,tt.ttr_sigla 
FROM 	parametricas.tipos_trabajos tt
;
--
SELECT 	*
FROM 	ejecucion_actividades.inicio_actividad_poa iap
		LEFT JOIN ejecucion_actividades.inicios_actividades ia ON iap.iac_codigo = ia.iac_codigo 
WHERE 	TRUE
		AND iap.iap_codigo IN (933)
;--iac_codigo=685
SELECT 	*
FROM 	estructura_poa.actividades a
WHERE 	a.act_codigo IN (3167)
;

SELECT 	a.act_codigo,a.act_numero, au.aun_sigla, a.ttr_codigo , tt.ttr_codigo,  tt.ttr_descripcion, ett.ett_codigo,  ett.ett_nombre 
FROM 	estructura_poa.actividades a
		LEFT JOIN estructura_organizacional.areas_unidades au ON a.aun_codigo_ejecutora = au.aun_codigo 
		LEFT JOIN parametricas.tipos_trabajos tt ON tt.ttr_codigo = a.ttr_codigo
		LEFT JOIN parametricas.especificacion_tipos_trabajo ett ON ett.ett_codigo = tt.ett_codigo
WHERE 	TRUE
		AND tt.ttr_codigo = 79;
		
SELECT 	*
--		aiap.aiap_codigo, aiap.aiap_estado, aiap.asi_codigo 
FROM 	ejecucion_actividades.apoyo_inicio_actividad_poa aiap 
;

SELECT 	a.asi_codigo, a.asi_estado 
FROM 	ejecucion_poa.asignaciones a
WHERE 	a.asi_codigo IN (2055)
;
--$$$$$$$$$$$$$$$$$$$$$$$
    SELECT
          t.aci_codigo,
          t.aci_estado
    FROM  ejecucion_poa.asignaciones_cargos_item t
          LEFT JOIN parametricas.estados e ON e.est_codigo = t.aci_estado
    WHERE TRUE
          AND t.asi_codigo IN (2055)
     --     AND t.aci_estado IN (1, 21)
    ORDER BY t.fecha_registro DESC
  ;--cit_codigo=(66)


--UPDATE 	ejecucion_actividades.apoyo_inicio_actividad_poa 
--SET 	aiap_estado = 0
--WHERE 	aiap_codigo = 1;


SELECT 	iapa.iapa_codigo,iapa.asi_codigo,iapa.iapa_estado
FROM 	ejecucion_actividades.inicio_actividad_poa_asignaciones iapa
WHERE 	iapa.iap_codigo IN (933)
;

SELECT 	a.asi_codigo ,a.asi_estado 
FROM 	ejecucion_poa.asignaciones a 
WHERE 	a.asi_codigo IN (2054)
;
```
## Bases

| inicio      | backup_20241115_122025.sql |
| ----------- | -------------------------- |
| consolidada | backup_20241115_164130.sql |
## roles
-  SCAT-GAAPIP

| 9945262 | CLAUDIA PARRA MAMANI             | RESPONSABLE          | aci_codigo |
| ------- | -------------------------------- | -------------------- | ---------- |
| 486424  | LUIS FERNANDO SAAVEDRA MORATO    | GERENTE CONSOLIDADOR | -          |
| 486424  | LUIS FERNANDO SAAVEDRA MORATO    | SUPERVISOR           | -          |
| 3445997 | CAROLINA LEA RODRIGUEZ BONIVENTO | FORMULADOR           | 5201       |
| 3445997 | CAROLINA LEA RODRIGUEZ BONIVENTO | FORMULADOR GERENTE   | 5201       |
| 3445997 | CAROLINA LEA RODRIGUEZ BONIVENTO | APROBADOR            | 5201       |

- actividad : 520.0504.38.10.24
- http://172.16.22.243:3002/conaud/inicios-actividades?ges_codigo=2&act_codigo=3167
- componente: src/components/informes/component/informes.table.jsx
- Servicio Sushy: 
## Servicios afectados

| Servicio                                                                                         | lugar                                                                                        | Accion                       |
| ------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------- | ---------------------------- |
| // Todo: DESCONSOLIDAR APOYO INICIO ACTIVIDAD POA y sus ASIGNACIONES y ASIGNACIONES CARGOS ITEMS | src/feature/inicios-actividades/service/create-inicios-actividades.service.ts                | desconsolidar                |
| //Todo: Cambio de estado para apoyo inicio actividad poa                                         | src/feature/inicio-actividad-poa/service/state-inicio-actividad-poa.service.ts               | cambio estado                |
| findAll                                                                                          | src/feature/apoyo-inicio-actividad-poa/service/findAll-apoyo-inicio-actividad-poa.service.ts | se añadio el tipo de trabajo |
## TypeOrm directo
```js
if (resultAiap.length > 0) {
//cambiar estado apoyo inicio actividad poa
try {
const queryUpdateApoyoInicioActividadPoa: ApoyoInicioActividadPoa = new ApoyoInicioActividadPoa();
console.log("🐱==xx-1==> ~ queryUpdateApoyoInicioActividadPoa:", queryUpdateApoyoInicioActividadPoa)
const estados = new Estados();
estados.est_codigo = EstadoPoa.BLOQUEADO;
queryUpdateApoyoInicioActividadPoa.aiap_estado = estados;
queryUpdateApoyoInicioActividadPoa.usuario_modificacion = createIniciosActividadesNuevoDto.usuario;
queryUpdateApoyoInicioActividadPoa.fecha_modificacion = new Date();
console.log("🐱==xx0==> ~ queryUpdateApoyoInicioActividadPoa:", queryUpdateApoyoInicioActividadPoa)
await manager.update(ApoyoInicioActividadPoa, resultAiap[0].aiap_codigo, queryUpdateApoyoInicioActividadPoa)
} catch (error) { }
```
## Considerar Para el Nuevo Componente Calendario
- Entrar con el formulador_gerente
- Deben estar consolidadas o ejecutadas:

| act(Padre) | iap | iac | asi | aci(s) | aiap | asi(apoyo) | aci(apoyo) |
| ---------- | --- | --- | --- | ------ | ---- | ---------- | ---------- |
| 2          | 2   | 22  | 2   | 2      | 2    | 2          | 2          |
- Hacer un nuevo componente calendario, que preferentemente reciba un Prop(asi_codigo), similar a este:
  
| AsignacionesHorasUsadasPlanificador                                                          | AsignacionesHorasUsadasPlanificadorCalendar<br>AsignacionesHorasUsadasPlanificadorSummary | FullCalendar<br>AsignacionesHorasUsadasForm |
| -------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------- | ------------------------------------------- |
| src/components/asignaciones-horas-usadas/component/asignaciones-hora-usadas.planificador.jsx |                                                                                           |                                             |

- Hacer un servicio que te diga de que tipo es ese asi_codigo: auditoria, evaluacion, aipa, para obtener el ttr_codigo, servicio base: findAllHorasComision

| auditoria  | asi-iap-act-ttr  |
| ---------- | ---------------- |
| evaluacion | asi-             |
| apoyo      | asi-iapa-act-ttr |

## query que encuentra datos con asi_codigo
```sql
--################# BASE ########################33
SELECT	
		a.act_codigo, a.act_numero, a.ttr_codigo, a.act_estado, -- ACTIVIDAD
		iap.tia_codigo, iap.iap_codigo,  iap.iap_estado, -- INICIO-ACTIVIDAD-POA
		ia.iac_codigo, ia.iac_codigo_control, ia.iac_correlativo ,ia.iac_estado, -- INICIOS-ACTIVIDADES
		asi.asi_codigo, asi.asi_estado,-- asi.asi_detalle_asignaciones_cargos_items, asi.asi_detalle_asignaciones_horas_usadas, asi.asi_detalle_reposicion_cargos_item,  -- ASIGNACION
		aci.aci_codigo,  aci.aci_estado,aci.aci_horas , -- ASIGNACION-CARGOS-ITEM
		iai.iai_codigo, iai.iai_estado, ---INICIOS ACTIVIDADES INFORMES 
		i.inf_codigo, i.inf_estado , i.iac_codigo AS iac_codigo_inf, ---INFORMES
		iei.iua_codigo, iu.iua_estado 
FROM	estructura_poa.actividades a
		LEFT JOIN ejecucion_actividades.inicio_actividad_poa iap ON a.act_codigo = iap.act_codigo --AND iap.iap_estado NOT IN (5)
		LEFT JOIN ejecucion_actividades.inicios_actividades ia ON iap.iac_codigo = ia.iac_codigo 
		LEFT JOIN ejecucion_actividades.inicio_actividad_informe iai ON ia.iac_codigo = iai.iac_codigo
		LEFT JOIN ejecucion_actividades.informes i ON iai.inf_codigo = i.inf_codigo 
		LEFT JOIN ejecucion_informes.informes_uai iu ON iu.act_codigo = a.act_codigo 
		LEFT JOIN ejecucion_actividades.inicio_actividad_poa_asignaciones iapa ON iap.iap_codigo = iapa.iap_codigo
		LEFT JOIN ejecucion_poa.asignaciones asi ON iapa.asi_codigo = asi.asi_codigo
		LEFT JOIN ejecucion_poa.asignaciones_cargos_item aci ON asi.asi_codigo = aci.asi_codigo 
		LEFT JOIN ejecucion_informes.inicio_evaluacion_informe iei ON iei.iua_codigo = iu.iua_codigo  
WHERE	TRUE
		
		AND a.act_codigo IN (1348);
--############################################################################3333
	        SELECT
              a.act_codigo,
              COALESCE(SUM(inicio_auditoria.horas_auditorias), 0) AS horas_auditorias,
              COALESCE(SUM(inicio_evaluacion.horas_evaluaciones), 0) AS horas_evaluaciones,
              COALESCE(SUM(inicio_apoyos.horas_apoyos), 0) AS horas_apoyos,
              COALESCE(SUM(inicio_auditoria.horas_auditorias), 0) + COALESCE(SUM(inicio_evaluacion.horas_evaluaciones), 0) + COALESCE(SUM(inicio_apoyos.horas_apoyos), 0) AS horas_comision
        FROM 	estructura_poa.actividades a
              LEFT JOIN (
                SELECT
                      iap.act_codigo,
                      SUM(aci.aci_horas) AS horas_auditorias
                FROM	ejecucion_actividades.inicio_actividad_poa iap
                      LEFT JOIN ejecucion_actividades.inicio_actividad_poa_asignaciones iapa ON iap.iap_codigo = iapa.iap_codigo
                      LEFT JOIN ejecucion_poa.asignaciones asi ON iapa.asi_codigo = asi.asi_codigo AND asi.asi_estado NOT IN (0, 5, 9)
                      LEFT JOIN ejecucion_poa.asignaciones_cargos_item aci ON asi.asi_codigo = aci.asi_codigo AND aci.aci_estado NOT IN (0, 5, 9)
                WHERE	iap.iap_estado NOT IN (0, 5, 9)
                GROUP BY iap.act_codigo
              ) inicio_auditoria ON a.act_codigo = inicio_auditoria.act_codigo
              LEFT JOIN (
                SELECT
                      iu.act_codigo,
                      SUM(aci.aci_horas) AS horas_evaluaciones
                FROM	ejecucion_informes.informes_uai iu
                      LEFT JOIN ejecucion_informes.inicio_evaluacion_informe iei ON iu.iua_codigo = iei.iua_codigo AND iei.iei_estado NOT IN (0, 5, 9)
                      LEFT JOIN ejecucion_informes.inicio_evaluacion_informe_asignaciones ieia ON iei.iei_codigo = ieia.iei_codigo
                      LEFT JOIN ejecucion_poa.asignaciones asi ON ieia.asi_codigo = asi.asi_codigo AND asi.asi_estado NOT IN (0, 5, 9)
                      LEFT JOIN ejecucion_poa.asignaciones_cargos_item aci ON asi.asi_codigo = aci.asi_codigo AND aci.aci_estado NOT IN (0, 5, 9)
                WHERE	iu.iua_estado NOT IN (0, 5, 9)
                GROUP BY iu.act_codigo
              ) inicio_evaluacion ON a.act_codigo = inicio_evaluacion.act_codigo
              LEFT JOIN (
                SELECT
                      aiap.act_codigo,
                      SUM(aci.aci_horas) AS horas_apoyos
                FROM	ejecucion_actividades.apoyo_inicio_actividad_poa aiap
                      LEFT JOIN ejecucion_poa.asignaciones asi ON aiap.asi_codigo = asi.asi_codigo
                      LEFT JOIN ejecucion_poa.asignaciones_cargos_item aci ON asi.asi_codigo = aci.asi_codigo AND aci.aci_estado NOT IN (0, 5, 9)
                WHERE	TRUE
                      AND aiap.aiap_estado NOT IN (0,5,9)
                GROUP BY aiap.act_codigo
              ) inicio_apoyos ON a.act_codigo = inicio_apoyos.act_codigo
        WHERE	TRUE
              AND a.act_codigo IN (:act_codigo)
        GROUP BY a.act_codigo
        ;
--UNO
WITH 
inicio_auditoria AS 
(
SELECT 	
		iap.iap_codigo, iap.iap_estado,
		a.act_codigo, a.act_estado,
		iapa.iapa_codigo, iapa.iapa_estado,
		asi.asi_codigo, asi.asi_estado
FROM 	ejecucion_actividades.inicio_actividad_poa iap
		LEFT JOIN estructura_poa.actividades a ON iap.act_codigo = a.act_codigo
		LEFT JOIN ejecucion_actividades.inicio_actividad_poa_asignaciones iapa ON iap.iap_codigo = iapa.iap_codigo
		LEFT JOIN ejec10ucion_poa.asignaciones asi ON iapa.asi_codigo = asi.asi_codigo
)
SELECT 	* 
FROM 	inicio_auditoria
WHERE 	TRUE
		AND inicio_auditoria.iap_estado IN (2)
		--AND inicio_auditoria.asi_codigo IN (7)
		AND inicio_auditoria.act_codigo IN (3176)
;
--################### inicio_auditoria ######################
SELECT 	
		asi.asi_codigo, asi.asi_estado,
		inicio_auditoria.iap_codigo, inicio_auditoria.ttr_codigo
FROM 	ejecucion_poa.asignaciones asi
		LEFT JOIN (
			SELECT 	
					iap.iap_codigo, iap.iap_estado,
					iapa.iapa_codigo, iapa.iapa_estado, iapa.asi_codigo,
					a.ttr_codigo
			FROM 	ejecucion_actividades.inicio_actividad_poa iap
					LEFT JOIN ejecucion_actividades.inicio_actividad_poa_asignaciones iapa ON iap.iap_codigo = iapa.iap_codigo
					LEFT JOIN estructura_poa.actividades a ON iap.act_codigo = a.act_codigo
			WHERE 	iap.iap_estado IN (2)
		) inicio_auditoria ON asi.asi_codigo = inicio_auditoria.asi_codigo
WHERE 	asi.asi_codigo IN (1409)
;
--################### inicio_evaluacion ######################
SELECT 	
		asi.asi_codigo, asi.asi_estado,
		inicio_evaluacion.iua_codigo, inicio_evaluacion.iua_fecha, inicio_evaluacion.iua_fecha_inicio_evaluacion, inicio_evaluacion.ttr_codigo
FROM 	ejecucion_poa.asignaciones asi
		LEFT JOIN (
			SELECT 	
					iu.iua_codigo, iu.iua_estado,iu.iua_fecha,iu.iua_fecha_inicio_evaluacion,
					a.ttr_codigo,	
					iei.iei_codigo, iei.iei_estado,
					ieia.ieia_codigo, ieia.ieia_estado, ieia.asi_codigo
			FROM 	ejecucion_informes.informes_uai iu
					LEFT JOIN estructura_poa.actividades a ON iu.act_codigo = a.act_codigo
					LEFT JOIN ejecucion_informes.inicio_evaluacion_informe iei ON iu.iua_codigo = iei.iua_codigo
					LEFT JOIN ejecucion_informes.inicio_evaluacion_informe_asignaciones ieia ON iei.iei_codigo = ieia.iei_codigo
			WHERE	iu.iua_estado IN (22)
		) inicio_evaluacion ON asi.asi_codigo = inicio_evaluacion.asi_codigo
WHERE 	asi.asi_codigo IN (136)
;
--################### inicio_apoyos ######################
SELECT 	asi.asi_codigo, asi.asi_estado,
		inicio_apoyos.aiap_codigo, inicio_apoyos.ttr_codigo
FROM	ejecucion_poa.asignaciones asi
		LEFT JOIN (
			SELECT	aiap.aiap_codigo, aiap.aiap_estado, aiap.asi_codigo,
					a.ttr_codigo
			FROM	ejecucion_actividades.apoyo_inicio_actividad_poa aiap
					LEFT JOIN estructura_poa.actividades a ON aiap.act_codigo = a.act_codigo
			WHERE 	aiap.aiap_estado IN (2)
		) inicio_apoyos ON asi.asi_codigo = inicio_apoyos.asi_codigo
WHERE 	asi.asi_codigo IN (2055)
;
--##########################################################3333
SELECT 	iu.iua_codigo, iu.iua_estado 
FROM 	ejecucion_informes.informes_uai iu ;

SELECT
		asi.asi_codigo,
		asi.asi_estado,
		COALESCE(inicio_auditoria.ttr_codigo, inicio_evaluacion.ttr_codigo, inicio_apoyos.ttr_codigo) AS ttr_codigo,
		COALESCE(inicio_auditoria.fecha_inicio_po, inicio_evaluacion.fecha_inicio_po, inicio_apoyos.fecha_inicio_po) AS fecha_inicio_po,
		COALESCE(inicio_auditoria.fecha_inicio, inicio_evaluacion.fecha_inicio, inicio_apoyos.fecha_inicio) AS fecha_inicio		
FROM 	ejecucion_poa.asignaciones asi
		LEFT JOIN (
		    SELECT
					iap.iap_codigo,
					iapa.asi_codigo,
					TO_CHAR(a.act_fecha_inicio, 'dd/mm/yyyy') AS fecha_inicio_po,
					TO_CHAR(ia.iac_fecha_inicio, 'dd/mm/yyyy') AS fecha_inicio,
					a.ttr_codigo
		    FROM 	ejecucion_actividades.inicio_actividad_poa iap
		    		LEFT JOIN ejecucion_actividades.inicios_actividades ia ON iap.iac_codigo = ia.iac_codigo
		    		LEFT JOIN ejecucion_actividades.inicio_actividad_poa_asignaciones iapa ON iap.iap_codigo = iapa.iap_codigo
		    		LEFT JOIN estructura_poa.actividades a ON iap.act_codigo = a.act_codigo
		    WHERE 	iap.iap_estado IN (2)
		) inicio_auditoria ON asi.asi_codigo = inicio_auditoria.asi_codigo
		LEFT JOIN (
		    SELECT
		        	iu.iua_codigo,
		        	TO_CHAR(iu.iua_fecha, 'dd/mm/yyyy') AS fecha_inicio_po,
		        	TO_CHAR(iu.iua_fecha_inicio_evaluacion, 'dd/mm/yyyy') AS fecha_inicio,
			        a.ttr_codigo,
			        ieia.asi_codigo
		    FROM 	ejecucion_informes.informes_uai iu
		    		LEFT JOIN estructura_poa.actividades a ON iu.act_codigo = a.act_codigo
		    		LEFT JOIN ejecucion_informes.inicio_evaluacion_informe iei ON iu.iua_codigo = iei.iua_codigo
		    		LEFT JOIN ejecucion_informes.inicio_evaluacion_informe_asignaciones ieia ON iei.iei_codigo = ieia.iei_codigo
		    WHERE 	iu.iua_estado IN (22)
		) inicio_evaluacion ON asi.asi_codigo = inicio_evaluacion.asi_codigo
		LEFT JOIN (
		    SELECT
		        	aiap.aiap_codigo,
		        	aiap.asi_codigo,
		        	TO_CHAR(a.act_fecha_inicio, 'dd/mm/yyyy') AS fecha_inicio_po,
					TO_CHAR(ia.iac_fecha_inicio, 'dd/mm/yyyy') AS fecha_inicio,
		        	a.ttr_codigo
		    FROM 	ejecucion_actividades.apoyo_inicio_actividad_poa aiap
		    		LEFT JOIN ejecucion_actividades.inicios_actividades ia ON aiap.iac_codigo = ia.iac_codigo
		    		LEFT JOIN estructura_poa.actividades a ON aiap.act_codigo = a.act_codigo
		    WHERE 	aiap.aiap_estado IN (2)
		) inicio_apoyos ON asi.asi_codigo = inicio_apoyos.asi_codigo
WHERE 	asi.asi_codigo IN (1409, 136, 2055); -- Sustituye los códigos por los que desees filtrar
--
SELECT	*
FROM 	ejecucion_poa.asignaciones_cargos_item aci
WHERE 	TRUE
		AND aci.asi_codigo = :asi_codigo
		AND aci.cit_codigo IN (
            SELECT 	ci.cit_codigo
            FROM 	estructura_organizacional.cargos_items ci
            WHERE   TRUE
                    AND ci.cit_codigo IN (
                    						SELECT 	cit_codigo
                                            FROM 	estructura_organizacional.cargos_items_persona cip
                                            WHERE 	cip.per_codigo IN (
                                            							SELECT	per_codigo
                                                        				FROM 	estructura_organizacional.cargos_items_persona cip
                                                        				WHERE 	cip.cit_codigo = :cit_codigo
                                                    				  )
                                         )
  							   );
--
SELECT 	*
FROM 	ejecucion_actividades.inicios_actividades ia;
--
WITH 
cargos_items_persona AS (
    SELECT 	per_codigo
    FROM 	estructura_organizacional.cargos_items_persona
    WHERE 	TRUE
--    		AND cit_codigo = :cit_codigo
),
cargos_items_filtrados AS (
    SELECT 	cit_codigo
    FROM 	estructura_organizacional.cargos_items_persona cip
    WHERE 	cip.per_codigo IN (
        		SELECT per_codigo
        		FROM cargos_items_persona
    		)
),
cargos_items AS (
    SELECT 	cit_codigo
    FROM 	estructura_organizacional.cargos_items ci
    WHERE 	ci.cit_codigo IN (
        		SELECT 	cit_codigo
        		FROM 	cargos_items_filtrados
    		)
)
SELECT 	*
FROM 	ejecucion_poa.asignaciones_cargos_item aci
WHERE 	TRUE
		AND aci.aci_estado NOT IN (0,5,9)
  		AND aci.asi_codigo = :asi_codigo
  		AND aci.cit_codigo IN (
      		SELECT 	cit_codigo
      		FROM 	cargos_items
  		)
;
```
- hacer un nuevo page
- hacer un combo te de las areas unidades ejecutoras
- al seleccionar area obtener cargos item
- cada cargo tiene un cit_codigo, con ello obtener los aci_codigo, con aci_codigo obtener los asi_codigo
- con el asi_codigo ver a quien pertenece si es auditoria, evaluacion, apoyo
- obtener su iac_codigo_control
- para mostrar en el calendario:
	(iac_codigo_control)-[ahu_horas] : ahu_descripcion