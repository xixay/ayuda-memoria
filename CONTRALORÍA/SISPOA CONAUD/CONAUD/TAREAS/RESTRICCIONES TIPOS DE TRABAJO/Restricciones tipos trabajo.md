## Consideraciones
- 
## Lugares
- src/components/evaluaciones/component/forms/evaluaciones.form.jsx
- src/hooks/restricciones-tipos-trabajos.hook.jsx
## url
- http://172.16.22.243:3002/conaud/evaluaciones/2281
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
ORDER BY t.rtt_codigo DESC;
;

SELECT	
		t.ttr_codigo_habilita,t.ttr_codigo_habilitado,
		habilitado.ttr_estado AS ttr_estado_habilitado,
		CONCAT('(', habilitado.ttr_inicial , ') ', habilitado.ttr_sigla, ' - ', habilitado.ttr_descripcion) AS ttr__habilitado_inicial_sigla_descripcion
FROM	parametricas.restricciones_tipos_trabajos t
		LEFT JOIN parametricas.tipos_trabajos habilitado ON  t.ttr_codigo_habilitado = habilitado.ttr_codigo 
WHERE 	TRUE
		AND t.rtt_estado NOT IN (0)
		AND t.ttr_codigo_habilita IN (9)
;
```
## Cambios realizados
```c
Actualizando 5d36754..1f4dd56
Fast-forward
 src/components/evaluaciones/component/forms/evaluaciones.form.jsx |  3 +++
 src/components/evaluaciones/index.jsx                             |  2 +-
 src/hooks/restricciones-tipos-trabajos.hook.jsx                   | 40 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 src/hooks/restricciones-tipos-trabajos.hook.jsx

```
## componente
```
  const { restriccionesTiposTrabajos, fetchFindAllRestriccionesTiposTrabajos } = useRestriccionesTiposTrabajos(
    `/obtener-habilitados?ttr_codigo_habilita=(9)`
  ); // -- TODO: COMPLETAR CON SERVICIO YHAMIL
  console.log('🐱====> ~ restriccionesTiposTrabajos:', restriccionesTiposTrabajos);
```