## Hacer
### Componente Actividad Horas Movimiento
- Cuando se esta creando la actividad o editando esta en F21, solo debe mostrar los activos(x)
- Se debe agregar por lo menos una bolsa, para poder crear, y debe mostrar un mensaje en ves de que act_horas_planificadas es necesario, y despues de eso se bloquea el boton de seleccionar actividades bolsas
- si se inactiva bolsas, no esta modificando las horas nuevas(MODIFICABA ES EXTRAÑO)
- quitar el nombre, no esta devolviendo ese dato en la tabla movimientos(x)
### Todas las listas y reportes
- Para estas listas solo debe considerar las que estan en estado CONSOLIDADO, talves quieren ver su reporte, o algo

| I                        | C                          | M   | D           |
| ------------------------ | -------------------------- | --- | ----------- |
| Cant. Horas Planificadas | Total Horas PAra Ejecucion |     | Saldo Horas |
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
### Roles
**SCGM**

|         |                         |                         |                    |         |
| ------- | ----------------------- | ----------------------- | ------------------ | ------- |
| 2428708 | SANTIAGO MAIDANA QUISPE | GERENTE CONSOLIDADOR    | EDICION            |         |
|         | 2428708                 | SANTIAGO MAIDANA QUISPE | SUPERVISOR         | EDICION |
|         | 2428708                 | SANTIAGO MAIDANA QUISPE | APROBADOR          | EDICION |
|         | 4813387                 | MERY GOMEZ CONDORI      | FORMULADOR         | EDICION |
|         | 4813387                 | MERY GOMEZ CONDORI      | FORMULADOR GERENTE | EDICION |
- Estado Consolidado
```
//Todo: Se agrego el estado consolidado
getAllCalculoHorasDto.amh_estado = `(${EstadoPoa.CONSOLIDADO})`;
```
## Accion Corto Plazo
```
//===>>>>src/feature/poas-objetivos/poas-objetivos.service.ts
findAllPoasObjetivosOfAunCodigo
totalHoras
```
## Reportes
```ts

// Actividades
//Horas Movimientos y horas disponibles

//ACP
//Horas Movimientos y horas disponibles

// HorasMovimientos
RptXlsAccionesAct.jrxml
//findAllAccionCorto=====>src/feature/poas-objetivos/poas-objetivos.service.ts
//F26
s_pobj_codigo: (787,1331,1357,1358,1359)
s_cac_codigo: (1,3)
s_aun_codigo: (44)
//F21
s_pobj_codigo: (780)
s_cac_codigo: (2)
s_aun_codigo: (5)


// Horas Movimientos
//getReportProgramaOperacionAnual=============>src/feature/poas/poas.service.ts
RptPdfAreasSustantivas.jrxml
//F26
{
	"s_aun_codigo": "(44)",
	"s_poa_codigo": "(3)"
}
//F21
{
	"s_aun_codigo": "(44)",
	"s_poa_codigo": "(3)"
}

// Horas Iniciales , Horas disponibles
//getReporteActividadesPoa========>src/feature/actividades/actividades.service.ts
RptXlsSispoaCompleto.jrxml
{
	"s_query": "poa_codigo=(3)&aun_codigo_ejecutora=(44)"
}
// ESTE ESTA RARO
RptXlsSeguimiento.xlsx
{
	"s_aun_codigo": "(44,45)",
	"s_clasificador": "(1,2,3,4,5)",
	"s_poa_codigo": "(3)"
}

//CASO EXTRAÑO
RptXlsSispoaCompleto.jrxml
poa_codigo=(3)

//SI SE CONSOLIDA SE TIENE QUE CONSOLIDAR LAS HORAS MOVIMINETO TAMBIEN

//PARA LOS REPORTES TOMAR EN CUENTA SOLO LOS CONSOLIDADOS
```
### Querys
```sql
        WITH
        tmp_adicion AS (
          SELECT
                amh.act_codigo_adicion AS act_codigo,
                COALESCE(SUM(amh.amh_horas), 0) AS horas_adicion
          FROM  estructura_poa.actividades_movimientos_horas amh
          WHERE TRUE
                AND amh.amh_estado NOT IN (0,5,9) -- CASO REPORTES Y LISTAS, NO TOMAR EN CUENTA
                AND amh.tmh_codigo NOT IN (1) -- NO SUMA CUANDO ES F21
          GROUP BY amh.act_codigo_adicion
        ),
        tmp_disminucion AS (
          SELECT
                amh.act_codigo_disminucion AS act_codigo,
                COALESCE(SUM(amh.amh_horas), 0) AS horas_disminucion
          FROM  estructura_poa.actividades_movimientos_horas amh
          WHERE TRUE
                AND amh.amh_estado NOT IN (0,5,9) -- CASO REPORTES Y LISTAS, NO TOMAR EN CUENTA
                 -- CASO EDICIÓN DE HORAS, NO TOMAR EN CUENTA
          GROUP BY amh.act_codigo_disminucion
        )
        SELECT
              t.act_codigo,
              t.act_numero,
              t.aun_codigo_ejecutora,
              au.aun_sigla,
              t.act_horas_planificadas AS horas_planificadas,
              (t.act_horas_planificadas + (COALESCE(tmp_adicion.horas_adicion, 0) - COALESCE(tmp_disminucion.horas_disminucion, 0)))::INT AS horas_calculo_movimiento
        FROM    estructura_poa.actividades t
              LEFT JOIN estructura_organizacional.areas_unidades au ON t.aun_codigo_ejecutora = au.aun_codigo
              LEFT JOIN tmp_adicion ON t.act_codigo = tmp_adicion.act_codigo
              LEFT JOIN tmp_disminucion ON t.act_codigo = tmp_disminucion.act_codigo
        WHERE   TRUE
              AND t.act_codigo IN (2404)
        ORDER BY t.act_codigo
        ;


--%%%%%%%%%%%%%%%% ADICION %%%%%%%%%%%%%%%%%%%%
SELECT 	*
FROM 	estructura_poa.actividades_movimientos_horas amh 
WHERE 	TRUE
		AND amh.act_codigo_adicion IN (4846)
--		AND amh_estado IN (1)
;
--%%%%%%%%%%%%%%%% DISMINUCION %%%%%%%%%%%%%%%%%%%%
SELECT 	*
FROM 	estructura_poa.actividades_movimientos_horas amh 
WHERE 	TRUE
		AND amh.act_codigo_disminucion IN (2404)
--		AND amh_estado IN (1)
;
--&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
SELECT 	a.act_codigo, a.act_estado, a.cac_codigo , a.act_horas_planificadas 
FROM 	estructura_poa.actividades a 
ORDER BY a.act_codigo DESC
;
```