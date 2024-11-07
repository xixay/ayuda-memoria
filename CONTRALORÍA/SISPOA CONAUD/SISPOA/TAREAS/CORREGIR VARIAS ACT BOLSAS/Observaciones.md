##
### Componente Actividad Horas Movimiento
- Cuando se esta creando la actividad o editando esta en F21, solo debe mostrar los activos
- Se debe agregar por lo menos una bolsa, para poder crear, y debe mostrar un mensaje en ves de que act_horas_planificadas es necesario, y despues de eso se bloquea el boton de seleccionar actividades bolsas
- si se inactiva bolsas, no esta modificando las horas nuevas(MODIFICABA ES EXTRAÑO)
- quitar el nombre, no esta devolviendo ese dato en la tabla movimientos
### Todas las listas y reportes
- Para estas listas solo debe considerar las que estan en estado CONSOLIDADO, talves quieren ver su reporte, o algo

| I                        | C                          | M   | D          |
| ------------------------ | -------------------------- | --- | ---------- |
| Cant. Horas Planificadas | Total Horas PAra Ejecucion |     | Salo Horas |
```sql
SELECT 	a.act_codigo,a.act_estado  
FROM 	estructura_poa.actividades a 
WHERE 	TRUE
		AND a.pobj_codigo IN (779)
		AND a.aun_codigo_ejecutora IN (4)
		AND a.cac_codigo IN (2)
;
--
SELECT 	*
FROM 	estructura_poa.actividades_movimientos_horas amh 
WHERE 	TRUE
--		AND amh.act_codigo_adicion IN (4835)
--		AND amh.act_codigo_adicion IN (4828)
--		AND amh.act_codigo_adicion IN (4829)
--		AND amh.act_codigo_adicion IN (4830)
;
```