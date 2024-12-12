## Roles **GDC-GAD**

| _list_   | Doc. Identidad | Nombre Completo                               | Rol                | per_codigo |
| -------- | -------------- | --------------------------------------------- | ------------------ | ---------- |
|          | 3403668        | ANA MARIA BRIGGITTE DEL CARMEN ARRAZOLA DURAN | FORMULADOR         | 190        |
| comision | 2389409        | OLGA EDITH SUAREZ JIMENEZ                     | SUPERVISOR         | 79         |
| comision | 4385501        | JULIO CARLOS GUERRA VILLARROEL                | APROBADOR          | 1016       |
| comision | 1397469        | RUTH TARCAYA GALLARDO                         | FORMULADOR GERENTE | 216        |
| comision | 1397469        | RUTH TARCAYA GALLARDO                         | FORMULADOR         | 216        |
## Query
```sql
SELECT
		aur.per_codigo, aur.aun_codigo_ejecutora,
		r.rol_nombre ,
		au.aun_sigla 
FROM 	estructura_poa.area_unidad_responsables aur
		LEFT JOIN parametricas.roles r ON aur.rol_codigo = r.rol_codigo
		LEFT JOIN estructura_organizacional.areas_unidades au ON aur.aun_codigo_ejecutora = au.aun_codigo 
WHERE 	TRUE 
		AND aur.aur_estado IN (1)
		AND aur.rol_codigo IN (5)
		AND aur.poa_codigo IN (3)
--		AND aur.per_codigo IN (1016)
--		AND au.aun_sigla LIKE 'GDC-GAD'
		AND au.aun_codigo IN (18)
ORDER BY aur.aun_codigo_ejecutora DESC
;
```
## Comisión
- 7881681
- 7936263
- 8679431
- 6526093
- 4008643
- 973575
- 