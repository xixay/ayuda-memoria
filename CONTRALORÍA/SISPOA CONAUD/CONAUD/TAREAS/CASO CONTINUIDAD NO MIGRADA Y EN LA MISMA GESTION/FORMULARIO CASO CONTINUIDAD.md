## Consideraciones (rowData, te puede dar la información)
- No migrado
- En la misma gestión
- Es continuidad
## Roles

| _list_ | Doc. Identidad | Nombre Completo                               | Rol                | Estado  |
| ------ | -------------- | --------------------------------------------- | ------------------ | ------- |
|        | 3403668        | ANA MARIA BRIGGITTE DEL CARMEN ARRAZOLA DURAN | FORMULADOR         | EDICION |
|        | 2389409        | OLGA EDITH SUAREZ JIMENEZ                     | SUPERVISOR         | EDICION |
| 1016   | 4385501        | JULIO CARLOS GUERRA VILLARROEL                | APROBADOR          | EDICION |
| 216    | 1397469        | RUTH TARCAYA GALLARDO                         | FORMULADOR GERENTE | EDICION |
|        | 1397469        | RUTH TARCAYA GALLARDO                         | FORMULADOR         | EDICION |


## Ramas
- fix/formulario_continuo_no_migrado_front
- fix/formulario_continuo_no_migrado_back
## base local
- backup_20241210_173544.sql
## Cumple
- Debe guardar su justificacion en donde esta su iap_codigo, donde dice iap_justificacion_ampliacion
## Ubicacion componente
### El que visualiza los componentes
- src/components/inicios-actividades/index.jsx
### Inicios Actividades Form
- src/components/inicios-actividades/component/inicios-actividades.form.jsx
### El para el caso no migrado
- src/components/inicios-actividades/component/inicios-actividades.form-continuo-no-migrado.jsx
## Querys
```sql
SELECT 	--a.*
		iap.iap_codigo, iap.iap_estado,iap.iac_codigo,
		ia.iac_estado,iap.fecha_modificacion, iap.fecha_registro, 
		iapa.iapa_codigo, iapa.iapa_estado,
		a.asi_codigo, a.asi_estado,
		aci.aci_codigo, aci.aci_estado, iap.tia_codigo
FROM 	ejecucion_actividades.inicio_actividad_poa iap
		LEFT JOIN ejecucion_actividades.inicios_actividades ia ON iap.iac_codigo = ia.iac_codigo 
		LEFT JOIN ejecucion_actividades.inicio_actividad_poa_asignaciones iapa ON iap.iap_codigo = iapa.iap_codigo
		LEFT JOIN ejecucion_poa.asignaciones a ON iapa.asi_codigo = a.asi_codigo
		LEFT JOIN ejecucion_poa.asignaciones_cargos_item aci ON a.asi_codigo = aci.asi_codigo  
WHERE 	TRUE
--		AND iap.act_codigo IN (4869)--normal
		AND iap.act_codigo IN (2868)--continuo
ORDER BY iap.act_codigo DESC
;
--###########################
SELECT 	*
FROM 	ejecucion_actividades.inicios_actividades ia
WHERE 	ia.iac_codigo IN (877)
;
--###########################
SELECT 	
		ia.iac_codigo, ia.iac_migrado,
		iap.iap_codigo, iap.act_codigo,
		a.aun_codigo_ejecutora, a.act_numero,
		au.aun_sigla 
FROM 	ejecucion_actividades.inicios_actividades ia
		LEFT JOIN ejecucion_actividades.inicio_actividad_poa iap ON ia.iac_codigo = iap.iac_codigo
		LEFT JOIN estructura_poa.actividades a ON iap.act_codigo = a.act_codigo 
		LEFT JOIN estructura_organizacional.areas_unidades au ON a.aun_codigo_ejecutora = au.aun_codigo 
WHERE 	TRUE
--		AND ia.iac_migrado IN (false)
--		AND ia.ges_codigo IN (2)
		AND iap.act_codigo IN (877)
		--AND au.aun_sigla LIKE 'GDC-GAD'
;
SELECT 	*
FROM 	estructura_poa.actividades a 
WHERE 	a.act_codigo IN (4870)
;
SELECT 	*
FROM 	ejecucion_actividades.inicio_actividad_poa iap 
WHERE 	iap.act_codigo IN (4870)
ORDER BY iap.iap_codigo DESC;
SELECT 	*
FROM 	ejecucion_actividades.inicios_actividades_adicional iaa 
WHERE 	iaa.iac_codigo IN (877)
;

```