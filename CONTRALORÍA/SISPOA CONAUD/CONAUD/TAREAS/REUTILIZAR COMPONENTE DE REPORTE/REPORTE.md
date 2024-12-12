## Roles **GDC-GAD**

| _Si es comision_ | Doc. Identidad | Nombre Completo                               | Rol                | per_codigo |
| ---------------- | -------------- | --------------------------------------------- | ------------------ | ---------- |
| NO               | 3403668        | ANA MARIA BRIGGITTE DEL CARMEN ARRAZOLA DURAN | FORMULADOR         | 190        |
| comisión         | 2389409        | OLGA EDITH SUAREZ JIMENEZ                     | SUPERVISOR         | 79         |
| comisión         | 4385501        | JULIO CARLOS GUERRA VILLARROEL                | APROBADOR          | 1016       |
| comisión         | 1397469        | RUTH TARCAYA GALLARDO                         | FORMULADOR GERENTE | 216        |
| comisión         | 1397469        | RUTH TARCAYA GALLARDO                         | FORMULADOR         | 216        |
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
## Solo Comisión

| carnet   | per_codigo |
| -------- | ---------- |
| 7881681  | 1657       |
| 7936263  | 1452       |
| 8679431x | 1991       |
| 5209834  | 692        |
| 2890573  | 691        |
| 4008643  | 431        |
| 973575   | 257        |
| 954671   | 232        |

## Objeto
```json
{
    "s_cit_codigo": "479",
    "s_anio": "2024",
    "s_mes": "04"
}
```
## Incluir
```
<div>DATOS DE LA UNIDAD</div>

<div>DATOS DE LA PERSONA</div>

<div>GESTION</div>

<div>MES</div>
```