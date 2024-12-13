## Consideraciones
- 
## Lugares
- 
## url
- http://172.16.22.243:3002/conaud/inicio-evaluacion-informe?act_codigo=1850&iua_codigo=1048
### Firmas 4803747 [520.0701.176.2.24]
- http://172.16.22.243:3002/conaud/evaluaciones/3007
## Roles

| _list_   | Doc. Identidad | Nombre Completo                               | Rol                | Estado  |
| -------- | -------------- | --------------------------------------------- | ------------------ | ------- |
|          | 3403668        | ANA MARIA BRIGGITTE DEL CARMEN ARRAZOLA DURAN | FORMULADOR         | EDICION |
|          | 2389409        | OLGA EDITH SUAREZ JIMENEZ                     | SUPERVISOR         | EDICION |
| comision | 4385501        | JULIO CARLOS GUERRA VILLARROEL                | APROBADOR          | EDICION |
|          | 1397469        | RUTH TARCAYA GALLARDO                         | FORMULADOR GERENTE | EDICION |
|          | 1397469        | RUTH TARCAYA GALLARDO                         | FORMULADOR         | EDICION |
## Query
```sql
--############# findAll ##################
SELECT	
		t.rtt_codigo, t.rtt_descripcion,t.ttr_codigo_habilita,t.ttr_codigo_habilitado,t.rtt_estado,
		habilita.ttr_descripcion AS ttr_descripcion_habilita, habilita.ttr_sigla AS ttr_sigla_habilita, habilita.ttr_bandera_entidad_cge AS ttr_bandera_entidad_cge_habilita, 
		habilitado.ttr_descripcion AS ttr_descripcion_habilitado, habilitado.ttr_sigla AS ttr_sigla_habilitado, habilitado.ttr_bandera_entidad_cge AS ttr_bandera_entidad_cge_habilitado, 
		e.est_color, 
        e.est_nombre AS rtt_estado_descripcion,
        TO_CHAR(t.fecha_registro, 'HH24:MI am dd/mm/yyyy') as fecha_registro
FROM	parametricas.restricciones_tipos_trabajos t
		LEFT JOIN parametricas.estados e ON e.est_codigo = t.rtt_estado
		LEFT JOIN parametricas.tipos_trabajos habilita ON t.ttr_codigo_habilita = habilita.ttr_codigo 
		LEFT JOIN parametricas.tipos_trabajos habilitado ON  t.ttr_codigo_habilitado = habilitado.ttr_codigo 
WHERE 	TRUE
--		AND t.rtt_codigo IN (1)
--		AND t.ttr_codigo_habilita IN (9)
--		AND t.ttr_codigo_habilitado IN (14)
--		AND t.rtt_estado IN (1)
ORDER BY t.rtt_codigo DESC
;

--############# findAllHabilitados ##################
SELECT	
		t.rtt_codigo, t.rtt_estado, t.ttr_codigo_habilita,t.ttr_codigo_habilitado,
		habilita.ttr_estado AS ttr_estado_habilita,
		CONCAT('(', habilita.ttr_inicial , ') ', habilita.ttr_sigla, ' - ', habilita.ttr_descripcion) AS ttr_habilita_inicial_sigla_descripcion,
		habilitado.ttr_estado AS ttr_estado_habilitado,
		CONCAT('(', habilitado.ttr_inicial , ') ', habilitado.ttr_sigla, ' - ', habilitado.ttr_descripcion) AS ttr_habilitado_inicial_sigla_descripcion
FROM	parametricas.restricciones_tipos_trabajos t
		LEFT JOIN parametricas.tipos_trabajos habilita ON  t.ttr_codigo_habilita = habilita.ttr_codigo
		LEFT JOIN parametricas.tipos_trabajos habilitado ON  t.ttr_codigo_habilitado = habilitado.ttr_codigo 
WHERE 	TRUE
--		AND t.ttr_codigo_habilita IN (9)
		AND habilita.ttr_estado IN (0)
ORDER BY t.rtt_codigo DESC
;
SELECT	*
FROM	parametricas.restricciones_tipos_trabajos
;

SELECT 	*
FROM 	parametricas.tipos_trabajos tt
;

SELECT 	*
FROM 	parametricas.especificacion_tipos_trabajo ett
		LEFT JOIN parametricas.tipos_trabajos tt ON ett.ett_codigo = tt.ett_codigo 
WHERE 	ett.ett_codigo IN (5)
;

-- EMPRESASSSSSSSSSS
SELECT 	*
FROM 	parametricas.empresas e 
WHERE 	TRUE
--		AND e.emp_codigo IN (9)
ORDER BY e.emp_codigo DESC
;

SELECT
  t.emp_codigo,
  t.emp_nombre,
  t.emp_estado,
  t.emp_vigencia,
  CASE
    WHEN t.emp_vigencia = B'1' THEN 'SI'
    ELSE 'NO'
  END AS "emp_vigencia_nombre",
  e.est_color,
  e.est_nombre AS emp_estado_descripcion,
  TO_CHAR(t.fecha_registro, 'HH24:MI am dd/mm/yyyy') as fecha_registro
FROM parametricas.empresas t
LEFT JOIN parametricas.estados e ON e.est_codigo = t.emp_estado
WHERE TRUE;

SELECT 	*
FROM 	ejecucion_poa.asignaciones_cargos_item aci 
ORDER BY aci.aci_codigo ASC
;

SELECT 	a.act_codigo, a. act_numero, a.ttr_codigo, a.aun_codigo_ejecutora, 
		au.aun_sigla, tt.ttr_descripcion 
FROM 	estructura_poa.actividades a
		LEFT JOIN estructura_organizacional.areas_unidades au ON a.aun_codigo_ejecutora = au.aun_codigo 
		LEFT JOIN parametricas.tipos_trabajos tt ON a.ttr_codigo = tt.ttr_codigo 
		LEFT JOIN parametricas.especificacion_tipos_trabajo ett ON tt.ett_codigo = ett.ett_codigo
WHERE 	ett.ett_codigo IN (5)
		AND tt.ttr_codigo IN (77)
;

SELECT
  t.emp_codigo,
  t.emp_nombre,
  CASE 
    WHEN t.emp_vigencia::int = 1 THEN CONCAT(t.emp_nombre, ' [VIGENTE]')
    ELSE CONCAT(t.emp_nombre, ' [NO VIGENTE]')
  END AS emp_nombre_vigencia,
  t.emp_vigencia, 
  t.emp_estado,
  e.est_color,
  e.est_nombre AS emp_estado_descripcion,
  TO_CHAR(t.fecha_registro, 'HH24:MI am dd/mm/yyyy') AS fecha_registro
FROM parametricas.empresas t
LEFT JOIN parametricas.estados e ON e.est_codigo = t.emp_estado
WHERE TRUE
	  AND t.emp_estado IN (1)
--      AND t.emp_vigencia::int IN (1)
;
```
## Cambios realizados
```c

```
## componente
```
src/components/evaluaciones/component/forms/evaluaciones.form.jsx
src/feature/empresas/empresas.service.ts
src/feature/empresas/service/findAll-empresas.service.ts
```