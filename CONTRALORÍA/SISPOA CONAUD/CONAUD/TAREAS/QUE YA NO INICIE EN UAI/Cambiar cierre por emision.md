## Consideraciones
- en ves de cierre->emision
- en ves de cerrado->emitido
- Estado el est_codigo = 23 SOLICITUD CIERRE
## Lugares
- src/components/evaluaciones/method/state-actions.jsx
- src/components/evaluaciones/method/asistente-gestion-actions.jsx
- src/components/evaluaciones/method/change-status.buttons.jsx
## url
- http://172.16.22.243:3002/conaud/evaluaciones/2281
## Informe
- AIC/463/24
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
		aur.per_codigo, aur.aun_codigo_ejecutora,
		r.rol_nombre 
FROM 	estructura_poa.area_unidad_responsables aur
		LEFT JOIN parametricas.roles r ON aur.rol_codigo = r.rol_codigo
WHERE 	TRUE 
		AND aur.aur_estado IN (1)
		AND aur.rol_codigo IN (5)
		AND aur.poa_codigo IN (3)
		AND aur.per_codigo IN (1016)
;
```
