## Consideraciones
- Solo se debe traer a los informes pertenecientes a una familia de areas, por ejm: GDC(PADRE), GDC-GSL(HIJO), GDC-GAD(HIJO), etc
- 
## Ramas
- CONAUD
	- front: bugfix/actividades_informes_corregir  base ambiente_pruebas
	- back: bugfix/actividades_informes_corregir  base ambiente_pruebas
- SISPOA
	- back: bugfix/actividades_informes_corregir  base ambiente_pruebas
## Lugares
- src/feature/poas-objetivos/poas-objetivos.service.ts
	- obtieneFamiliaAreas
- src/feature/actividades-informes/service/findAll-actividades-informes.service.ts
	- findAllInformesPorActividad
- src/components/actividades-informes/component/actividades-informes.form.jsx
## url
- http://172.16.22.243:3002/conaud/actividades-informes
## Base

## Roles
- NORKA

| _list_   | Doc. Identidad | Nombre Completo                               | Rol                | Estado  |
| -------- | -------------- | --------------------------------------------- | ------------------ | ------- |
|          | 3403668        | ANA MARIA BRIGGITTE DEL CARMEN ARRAZOLA DURAN | FORMULADOR         | EDICION |
|          | 2389409        | OLGA EDITH SUAREZ JIMENEZ                     | SUPERVISOR         | EDICION |
| comision | 4385501        | JULIO CARLOS GUERRA VILLARROEL                | APROBADOR          | EDICION |
|          | 1397469        | RUTH TARCAYA GALLARDO                         | FORMULADOR GERENTE | EDICION |
|          | 1397469        | RUTH TARCAYA GALLARDO                         | FORMULADOR         | EDICION |
|          | 1397469        | RUTH TARCAYA GALLARDO                         | APROBADOR          | EDICION |

## Query
```sql
SELECT 	*
FROM 	estructura_organizacional.areas_unidades_dependencias aud
WHERE 	aud.aun
;

SELECT 	*
FROM 	estructura_organizacional.areas_unidades au
WHERE 	au.aun_sigla LIKE 'GDC'
ORDER BY au.aun_codigo DESC
;

--GDC=17
--GDC-GSL=14
SELECT
      	aud.aun_codigo_padre, au.aun_codigo, CONCAT(au.aun_nombre, ' - ', au.aun_sigla) AS aun_codigo_descripcion
FROM	estructura_organizacional.areas_unidades_dependencias aud
      	LEFT JOIN estructura_organizacional.areas_unidades au ON aud.aun_codigo_hijo = au.aun_codigo
WHERE   TRUE
      	AND aud.aud_estado NOT IN (0, 9)
      	AND au.aun_estado IN (2, 5, 8)
      	AND aud.aun_codigo_padre IN (14)
--      	AND aud.aun_codigo_padre IN (14)
ORDER BY aud.aun_codigo_hijo ASC
;

SELECT
      	aud.aun_codigo_padre, au.aun_codigo, CONCAT(au.aun_nombre, ' - ', au.aun_sigla) AS aun_codigo_descripcion
FROM	estructura_organizacional.areas_unidades_dependencias aud
      	LEFT JOIN estructura_organizacional.areas_unidades au ON aud.aun_codigo_hijo = au.aun_codigo
WHERE   TRUE
      	AND aud.aud_estado NOT IN (0, 9)
      	AND au.aun_estado IN (2, 5, 8)
      	AND aud.aun_codigo_hijo IN (14)
--      	AND aud.aun_codigo_padre IN (14)
ORDER BY aud.aun_codigo_hijo ASC
;

SELECT
      aud.aun_codigo_padre, au.aun_codigo, CONCAT(au.aun_nombre, ' - ', au.aun_sigla) AS aun_codigo_descripcion
FROM    estructura_organizacional.areas_unidades_dependencias aud
      LEFT JOIN estructura_organizacional.areas_unidades au ON aud.aun_codigo_hijo = au.aun_codigo
WHERE   TRUE
      AND aud.aud_estado NOT IN (0, 9)
      AND au.aun_estado IN (2, 5, 8)
      AND aud.aun_codigo_padre IN (17)
      AND aud.aun_codigo_hijo NOT IN (14)
ORDER BY aud.aun_codigo_hijo ASC
;

SELECT 	*
FROM 	estructura_poa.actividades a 
;
SELECT
		CONCAT(a.act_numero, ' - ', a.act_descripcion) AS "act_numero_descripcion",
		a.act_codigo, a.act_estado
FROM 	estructura_poa.poas_objetivos po
		LEFT JOIN estructura_poa.actividades a ON po.pobj_codigo = a.pobj_codigo 
WHERE 	TRUE
		AND po.poa_codigo IN (3)
		AND a.act_estado IN (2)
		AND a.aun_codigo_ejecutora IN (17,14,20,18,19)
ORDER BY a.aun_codigo_ejecutora DESC
;

WITH informes_estados_unicos AS (
  SELECT
        ie.inf_codigo,
        ie.ies_codigo,
        ie.ies_estado,
        ie.eev_codigo,
        ee.eev_estado,
        ee.eev_sigla,
        ROW_NUMBER() OVER (PARTITION BY ie.inf_codigo ORDER BY ie.ies_codigo DESC) AS row_num
  FROM ejecucion_actividades.informes_estados ie
  LEFT JOIN parametricas.estados_evolucion ee ON ie.eev_codigo = ee.eev_codigo
)
SELECT
      inf.inf_codigo,
      inf.inf_estado,
      CONCAT('(', inf.inf_codigo_control, ')', ' - (', ia.iac_codigo_control, ') - (',  COALESCE(ieu.eev_sigla, '-'), ')') AS informe,
      inf.iac_codigo,
      ia.iac_estado,
      ia.iac_codigo_control_vista
FROM  ejecucion_actividades.informes inf
      LEFT JOIN ejecucion_actividades.inicios_actividades ia ON inf.iac_codigo = ia.iac_codigo
      -- Unir solo el último registro de la tabla informes_estados
      LEFT JOIN informes_estados_unicos ieu ON inf.inf_codigo = ieu.inf_codigo AND ieu.row_num = 1
      LEFT JOIN parametricas.estados e ON inf.inf_estado = e.est_codigo
WHERE TRUE
      AND inf.inf_estado NOT IN (0, 9)
      AND ia.ges_codigo IN (2)
;
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
WITH informes_estados_unicos AS (
  SELECT
        ie.inf_codigo,
        ie.ies_codigo,
        ie.ies_estado,
        ie.eev_codigo,
        ee.eev_estado,
        ee.eev_sigla,
        ROW_NUMBER() OVER (PARTITION BY ie.inf_codigo ORDER BY ie.ies_codigo DESC) AS row_num
  FROM ejecucion_actividades.informes_estados ie
  LEFT JOIN parametricas.estados_evolucion ee ON ie.eev_codigo = ee.eev_codigo
)
SELECT
	  DISTINCT
      inf.inf_codigo,
      inf.inf_estado,
      CONCAT('(', inf.inf_codigo_control, ')', ' - (', ia.iac_codigo_control, ') - (',  COALESCE(ieu.eev_sigla, '-'), ')') AS informe,
      inf.iac_codigo,
      ia.iac_estado,
      ia.iac_codigo_control_vista,
      p.act_codigo
FROM  ejecucion_actividades.informes inf
      LEFT JOIN ejecucion_actividades.inicios_actividades ia ON inf.iac_codigo = ia.iac_codigo
      LEFT JOIN ejecucion_actividades.inicio_actividad_poa p ON ia.iac_codigo = p.iac_codigo
      -- Unir solo el último registro de la tabla informes_estados
      LEFT JOIN informes_estados_unicos ieu ON inf.inf_codigo = ieu.inf_codigo AND ieu.row_num = 1
      LEFT JOIN parametricas.estados e ON inf.inf_estado = e.est_codigo
WHERE TRUE
      AND inf.inf_estado NOT IN (0, 9)
      AND ia.ges_codigo IN (2)
--      AND p.act_codigo IN (1981)
--      AND p.act_codigo IN (4843)
--      AND p.act_codigo IN (2759)
        AND p.act_codigo IN (1557)--NO hay la actividad
--ORDER BY a.act_codigo DESC
;

SELECT 	a.act_numero, a.aun_codigo_ejecutora 
FROM 	estructura_poa.actividades a 
WHERE 	a.act_codigo IN (2759)
;
```
## Solucion A
```ts
  @LoggerMethod
  async obtieneFamiliaAreas(query: GetAllObjetivosAreaUnidadDependientesDto, manager: EntityManager): Promise<any[]> {
    try {
      let ArrayFamiliaAreaUnidad: any = [];
      // ----------- FIND UNIDAD
      const Unidad = await manager.findOne(AreasUnidades, {
        relations: { nau_codigo: true },
        where: { aun_codigo: query.aun_codigo_ejecutora },
      });
      console.log("🐱==xx0==> ~ Unidad:", Unidad)
      // ----------- ADD SELF AREA-UNIDAD
      ArrayFamiliaAreaUnidad.push({
          aun_codigo_padre: 0,
          aun_codigo: Unidad.aun_codigo,
          aun_codigo_descripcion: `${Unidad.aun_nombre} - ${Unidad.aun_sigla}`
      });
      console.log("🐱==xx1==> ~ ArrayFamiliaAreaUnidad:", ArrayFamiliaAreaUnidad)
      // ----------- CHECK NAU-CODIGO (NIVELES-AREAS-UNIDADES)
      if (Unidad.aun_numero == '00' || [NivelAreaUnidad.DIRECTIVO].includes(Unidad.nau_codigo.nau_codigo)) {
        // console.log('DESPACHO');
      } else if ([NivelAreaUnidad.EJECUTIVO, NivelAreaUnidad.OPERATIVO].includes(Unidad.nau_codigo.nau_codigo)) {
        // ----------- FIND AREA-UNIDADES-FAMILIA WITH AUN_PADRE
        let ArraySqlFamilia: any = [];
        try {
          let sql = `
            SELECT
                  aud.aun_codigo_padre, au.aun_codigo, CONCAT(au.aun_nombre, ' - ', au.aun_sigla) AS aun_codigo_descripcion
            FROM	estructura_organizacional.areas_unidades_dependencias aud
                  LEFT JOIN estructura_organizacional.areas_unidades au ON aud.aun_codigo_hijo = au.aun_codigo
            WHERE	TRUE
                  AND aud.aud_estado NOT IN (0, 9)
                  AND au.aun_estado IN (2, 5, 8)
                  AND aud.aun_codigo_padre IN (${query.aun_codigo_ejecutora})
            ORDER BY aud.aun_codigo_hijo ASC
            ;
          `;
          console.log("🐱==xx2==> ~ sql:", sql)
          ArraySqlFamilia = await manager.query(sql);
          console.log("🐱==xx3==> ~ ArraySqlFamilia:", ArraySqlFamilia)
        } catch (error) {}
        // ----------- VER SI ES PADRE
        let ArraySqlFamiliaExtra: any = [];
        try {
          let sql = `
            SELECT
                  aud.aun_codigo_padre, au.aun_codigo, CONCAT(au.aun_nombre, ' - ', au.aun_sigla) AS aun_codigo_descripcion
            FROM	estructura_organizacional.areas_unidades_dependencias aud
                  LEFT JOIN estructura_organizacional.areas_unidades au ON aud.aun_codigo_hijo = au.aun_codigo
            WHERE	TRUE
                  AND aud.aud_estado NOT IN (0, 9)
                  AND au.aun_estado IN (2, 5, 8)
                  AND aud.aun_codigo_hijo IN (${query.aun_codigo_ejecutora})
            ORDER BY aud.aun_codigo_hijo ASC
            ;
          `;
          console.log("🐱==xx4==> ~ sql:", sql)
          ArraySqlFamiliaExtra = await manager.query(sql);
          console.log("🐱==xx5==> ~ ArraySqlFamiliaExtra:", ArraySqlFamiliaExtra)
        } catch (error) { }
        // ----------- UNIR EL DE FAMILIA EXTRA A EL GENERAL
        // Combina ambos arrays
        const combinados = [...ArraySqlFamilia, ...ArraySqlFamiliaExtra];

        // Crea un Map para eliminar duplicados basados en aun_codigo
        const sinDuplicados = Array.from(
          new Map(combinados.map(item => [item.aun_codigo, item])).values()
        );

        console.log("🐱==xx6==> ~ ArraySqlFamilia:", sinDuplicados);
        for (const item of sinDuplicados) {
          ArrayFamiliaAreaUnidad.push(item);
        }
      }
      return ArrayFamiliaAreaUnidad;
    } catch (error) {
      return [];
    }
  }
```
## Sol 2
```ts
  @LoggerMethod
  async obtieneFamiliaAreas(query: GetAllObjetivosAreaUnidadDependientesDto, manager: EntityManager): Promise<any[]> {
    try {
      let ArrayFamiliaAreaUnidad: any = [];
      // ----------- FIND UNIDAD
      const Unidad = await manager.findOne(AreasUnidades, {
        relations: { nau_codigo: true },
        where: { aun_codigo: query.aun_codigo_ejecutora },
      });
      console.log("🐱==xx0==> ~ Unidad:", Unidad)
      // ----------- ADD SELF AREA-UNIDAD
      ArrayFamiliaAreaUnidad.push({
          aun_codigo_padre: 0,
          aun_codigo: Unidad.aun_codigo,
          aun_codigo_descripcion: `${Unidad.aun_nombre} - ${Unidad.aun_sigla}`
      });
      console.log("🐱==xx1==> ~ ArrayFamiliaAreaUnidad:", ArrayFamiliaAreaUnidad)
      // ----------- CHECK NAU-CODIGO (NIVELES-AREAS-UNIDADES)
      if (Unidad.aun_numero == '00' || [NivelAreaUnidad.DIRECTIVO].includes(Unidad.nau_codigo.nau_codigo)) {
        // console.log('DESPACHO');
      } else if ([NivelAreaUnidad.EJECUTIVO, NivelAreaUnidad.OPERATIVO].includes(Unidad.nau_codigo.nau_codigo)) {
        // ----------- FIND AREA-UNIDADES-FAMILIA WITH AUN_PADRE
        let ArraySqlFamilia: any = [];
        try {
          let sql = `
            SELECT
                  aud.aun_codigo_padre, au.aun_codigo, CONCAT(au.aun_nombre, ' - ', au.aun_sigla) AS aun_codigo_descripcion
            FROM	estructura_organizacional.areas_unidades_dependencias aud
                  LEFT JOIN estructura_organizacional.areas_unidades au ON aud.aun_codigo_hijo = au.aun_codigo
            WHERE	TRUE
                  AND aud.aud_estado NOT IN (0, 9)
                  AND au.aun_estado IN (2, 5, 8)
                  AND aud.aun_codigo_padre IN (${query.aun_codigo_ejecutora})
            ORDER BY aud.aun_codigo_hijo ASC
            ;
          `;
          console.log("🐱==xx2==> ~ sql:", sql)
          ArraySqlFamilia = await manager.query(sql);
          console.log("🐱==xx3==> ~ ArraySqlFamilia:", ArraySqlFamilia)
        } catch (error) {}
        let ArraySqlFamiliaPadre: any = [];
        // ----------- BUSCAR PADRE SI LO TIENE
        if (ArraySqlFamilia.length == 0) {
          try {
            let sql = `
              SELECT
                    aud.aun_codigo_padre
              FROM	estructura_organizacional.areas_unidades_dependencias aud
                    LEFT JOIN estructura_organizacional.areas_unidades au ON aud.aun_codigo_hijo = au.aun_codigo
              WHERE	TRUE
                    AND aud.aud_estado NOT IN (0, 9)
                    AND au.aun_estado IN (2, 5, 8)
                    AND aud.aun_codigo_hijo IN (${query.aun_codigo_ejecutora})
              ORDER BY aud.aun_codigo_hijo ASC
              ;
            `;
            console.log("🐱==xx4==> ~ sql:", sql)
            ArraySqlFamiliaPadre = await manager.query(sql);
            console.log("🐱==xx5==> ~ ArraySqlFamiliaExtra:", ArraySqlFamiliaPadre)
          } catch (error) { }
          if (ArraySqlFamiliaPadre.length > 0) {
            // ----------- FIND UNIDAD
            const UnidadPadre = await manager.findOne(AreasUnidades, {
              relations: { nau_codigo: true },
              where: { aun_codigo: ArraySqlFamiliaPadre[0].aun_codigo_padre },
            });
            console.log("🐱==xx6==> ~ UnidadPadre:", UnidadPadre)
            // ----------- ADD SELF AREA-UNIDAD
            ArrayFamiliaAreaUnidad.push({
              aun_codigo_padre: 0,
              aun_codigo: UnidadPadre.aun_codigo,
              aun_codigo_descripcion: `${UnidadPadre.aun_nombre} - ${UnidadPadre.aun_sigla}`
            });
            // ----------- BUSCA SUS HIJOS
            try {
              let sql = `
                SELECT
                      aud.aun_codigo_padre, au.aun_codigo, CONCAT(au.aun_nombre, ' - ', au.aun_sigla) AS aun_codigo_descripcion
                FROM	estructura_organizacional.areas_unidades_dependencias aud
                      LEFT JOIN estructura_organizacional.areas_unidades au ON aud.aun_codigo_hijo = au.aun_codigo
                WHERE	TRUE
                      AND aud.aud_estado NOT IN (0, 9)
                      AND au.aun_estado IN (2, 5, 8)
                      AND aud.aun_codigo_padre IN (${UnidadPadre.aun_codigo})
                      AND aud.aun_codigo_hijo NOT IN (${query.aun_codigo_ejecutora})
                ORDER BY aud.aun_codigo_hijo ASC
                ;
              `;
              console.log("🐱==xx7==> ~ sql:", sql)
              ArraySqlFamilia = await manager.query(sql);
              console.log("🐱==xx8==> ~ ArraySqlFamilia:", ArraySqlFamilia)
            } catch (error) { }
          }
        }
        // ----------- ADD ARRAY OF DEPENDIENTES
        for (const item of ArraySqlFamilia) {
          ArrayFamiliaAreaUnidad.push(item);
        }
      }
      /*
      let sql = `
          WITH tmp_area_unidad AS (
              SELECT
                  au.aun_codigo,
                  o.org_codigo,
                  go2.ges_codigo,
                  CONCAT_WS(' - ', au.aun_nombre, au.aun_sigla) AS aun_concatenado_invert
                FROM estructura_organizacional.areas_unidades au
                INNER JOIN estructura_organizacional.organigramas o ON o.org_codigo = au.org_codigo
                INNER JOIN estructura_organizacional.gestiones_organigramas go2 ON go2.org_codigo = o.org_codigo
                INNER JOIN parametricas.gestiones g on go2.ges_codigo = g.ges_codigo
                INNER JOIN estructura_poa.poas p on p.ges_codigo = g.ges_codigo
                WHERE TRUE
                AND au.aun_estado not in (0,9,5)
                AND go2.gor_estado > 0
                AND p.poa_codigo in ${query.poa_codigo}
              ),
              tmp_dependientes_area AS (
              SELECT
                DISTINCT
                  aud.aun_codigo_padre,
                  aud.aun_codigo_hijo,
                  tau_padre.aun_concatenado_invert,
                  tau_hijo.aun_concatenado_invert AS aun_concatenado_invert_hijo,
                  tau_padre.org_codigo
                FROM estructura_organizacional.areas_unidades_dependencias aud
                INNER JOIN tmp_area_unidad tau_padre ON tau_padre.aun_codigo = aud.aun_codigo_padre
                INNER JOIN tmp_area_unidad tau_hijo ON tau_hijo.aun_codigo = aud.aun_codigo_hijo
                WHERE aud.aud_estado > 0 and aud.aud_estado <> 9
              )
              ,
              tmp_area_unidad_top_padre AS ( -- Areas/Uniades que no tienen padre pero tienen hijos
                SELECT
                  tau.aun_codigo
                FROM tmp_area_unidad tau
                WHERE tau.aun_codigo NOT IN (SELECT tda.aun_codigo_hijo FROM tmp_dependientes_area tda)
                AND tau.aun_codigo IN (SELECT tda.aun_codigo_padre FROM tmp_dependientes_area tda)
              ),
              tmp_area_unidad_sueltos AS (
                SELECT DISTINCT
                  aud.aun_codigo_padre,
                  aud.aun_codigo_hijo ,
                  tau_padre.aun_concatenado_invert,
                  tau_padre.org_codigo
                FROM estructura_organizacional.areas_unidades_dependencias aud
                INNER JOIN tmp_area_unidad tau_padre ON tau_padre.aun_codigo = aud.aun_codigo_hijo
                INNER JOIN tmp_area_unidad_top_padre top ON aud.aun_codigo_padre = top.aun_codigo
                LEFT JOIN tmp_dependientes_area tpa ON tpa.aun_codigo_padre = aud.aun_codigo_hijo --los que NO son padres y son hijo de aun codigo 1
                WHERE aud.aud_estado IN (1,2,3,4,5,8)
                AND tpa.aun_codigo_padre IS null
              )`
      if (query.aun_codigo_ejecutora == 1) {
        sql += `
                ----SI AUN CODIGO ES 1
                SELECT DISTINCT 0 as aun_codigo_padre, aun_codigo_padre AS aun_codigo,
                aun_concatenado_invert
                FROM tmp_dependientes_area
                where aun_codigo_padre in (${query.aun_codigo_ejecutora});
                `
      } else {
        sql += `
              -----SI AUN CODIGO ES <> 1
              SELECT DISTINCT aun_codigo_padre AS aun_codigo_padre, aun_codigo_hijo aun_codigo,
              aun_concatenado_invert_hijo as aun_codigo_descripcion
              FROM tmp_dependientes_area
              WHERE case when aun_codigo_padre not in (1) then aun_codigo_padre IN (${query.aun_codigo_ejecutora}) else false end
              union all
              SELECT DISTINCT  0 AS aun_codigo_padre , aun_codigo,
              aun_concatenado_invert as aun_codigo_descripcion
              FROM tmp_area_unidad
              WHERE case when aun_codigo not in (1) then aun_codigo IN (${query.aun_codigo_ejecutora}) else false end
              ORDER BY aun_codigo asc;`
      }
      ;
      const resultQuery = await CustomService.queryFormat(manager, query, sql)
      return resultQuery;
      */
      return ArrayFamiliaAreaUnidad;
    } catch (error) {
      return [];
    }
  }
```
## Revisar

|        |     |
| ------ | --- |
| GNRH   | 10  |
| SG     | 11  |
| GCI    | 57  |
| GC     | 58  |
| UAI    | 68  |
| UTTLCC | 81  |
