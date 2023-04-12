## BACKEND
```txt

-- OBTENER CARGOS ITE
select 
ci.cit_codigo,
cid.cid_codigo
from estructura_organizacional.cargos_items ci  
left join estructura_organizacional.cargos_item_dependencias cid on cid.cit_codigo_hijo =ci.cit_codigo 
where cit_codigo in (1,2);
--OBTENER LOS CARGOS ITEMS DE ESOS CODIGOS
select *
from estructura_organizacional.cargos_items ci 
where ci.cit_codigo in (48,49,50,52)
--|cit_codigo|cit_descripcion                                                                                                           |car_codigo|ite_codigo|cit_estado|usuario_registro|usuario_modificacion|usuario_baja|fecha_registro         |fecha_modificacion     |fecha_baja             |aun_codigo|
--|----------|--------------------------------------------------------------------------------------------------------------------------|----------|----------|----------|----------------|--------------------|------------|-----------------------|-----------------------|-----------------------|----------|
--|48        |El cargo: SECRETARIA COMERCIAL, pertenece al área/unidad: DESPACHO DEL CONTROLADOR, con el item: 0001.                    |57        |47        |1         |1.791           |1.791               |0           |2023-04-05 11:10:06.509|2023-04-05 11:18:34.266|1900-01-01 00:00:00.000|61        |
--|50        |El cargo: AYUDANTE SECRETARIA, pertenece al área/unidad: DESPACHO DEL CONTROLADOR, con el item: 0003.                     |59        |49        |1         |1.791           |1.791               |0           |2023-04-05 11:14:54.418|2023-04-05 11:22:05.975|1900-01-01 00:00:00.000|60        |
--|52        |El cargo: GERENTE DE RECURSOS HUMANOS, pertenece al área/unidad: GERENCIA NACIONAL DE RECURSOS HUMANOS, con el item: 0006.|61        |51        |4         |1.791           |1.791               |0           |2023-04-05 11:18:17.333|2023-04-05 15:16:25.446|1900-01-01 00:00:00.000|67        |
--|49        |El cargo: COMUNICACION, pertenece al área/unidad: DESPACHO DEL CONTROLADOR, con el item: 0002.                            |58        |48        |1         |1.791           |1.791               |0           |2023-04-05 11:12:33.909|2023-04-05 11:22:05.908|1900-01-01 00:00:00.000|60        |


-- Pruebas
--AREAS UNIDADES
select *
from estructura_organizacional.areas_unidades au
order by au.aun_codigo;
--|aun_codigo|aun_nombre                                 |aun_sigla|nau_codigo|aau_codigo|cau_codigo|aun_estado|usuario_registro|usuario_modificacion|usuario_baja|fecha_registro         |fecha_modificacion     |fecha_baja             |org_codigo|
--|----------|-------------------------------------------|---------|----------|----------|----------|----------|----------------|--------------------|------------|-----------------------|-----------------------|-----------------------|----------|
--|1         |Despacho Contralor                         |DC       |2         |2         |1         |1         |0               |1.791               |0           |2023-03-17 14:45:08.369|2023-03-29 17:39:13.110|1900-01-01 00:00:00.000|1         |
--|2         |Gerencia Recursos Humanos                  |GNRH     |2         |2         |2         |1         |0               |1.791               |0           |2023-03-17 14:45:08.369|2023-03-23 10:54:57.984|1900-01-01 00:00:00.000|1         |
--|3         |Gerencia Nacional Administrativa financiera|GNAF     |2         |2         |2         |1         |0               |0                   |0           |2023-03-17 14:45:08.369|1900-01-01 00:00:00.000|1900-01-01 00:00:00.000|1         |
--|7         |Subcontraloria General                     |SCG      |2         |2         |1         |1         |0               |0                   |0           |2023-03-17 14:45:08.369|1900-01-01 00:00:00.000|1900-01-01 00:00:00.000|1         |
--|8         |Unidad  de Planificacion                   |UPL      |3         |2         |2         |1         |0               |0                   |0           |2023-03-17 14:45:08.369|1900-01-01 00:00:00.000|1900-01-01 00:00:00.000|1         |
--|16        |BBBB                                       |BBBB     |2         |1         |1         |1         |1.791           |0                   |0           |2023-03-21 09:09:20.920|1900-01-01 00:00:00.000|1900-01-01 00:00:00.000|2         |
--|21        |PRUEBA11                                   |P11      |2         |2         |1         |1         |1.791           |0                   |0           |2023-03-22 14:24:12.348|1900-01-01 00:00:00.000|1900-01-01 00:00:00.000|1         |
--|22        |PRUEBA12                                   |P12      |2         |2         |1         |1         |1.791           |0                   |0           |2023-03-22 14:27:17.243|1900-01-01 00:00:00.000|1900-01-01 00:00:00.000|1         |
--|34        |PRUEBA25                                   |P25      |2         |2         |1         |1         |1.791           |0                   |0           |2023-03-23 18:31:48.403|1900-01-01 00:00:00.000|1900-01-01 00:00:00.000|1         |
--|37        |PRUEBA28                                   |P28      |2         |2         |2         |1         |1.791           |0                   |0           |2023-03-24 10:43:54.213|1900-01-01 00:00:00.000|1900-01-01 00:00:00.000|1         |
--|41        |PRUEBA30                                   |P30      |2         |2         |2         |1         |1.791           |0                   |0           |2023-03-24 13:19:47.968|1900-01-01 00:00:00.000|1900-01-01 00:00:00.000|1         |
--|44        |PRUEBA33                                   |P33      |2         |1         |1         |1         |1.791           |0                   |0           |2023-03-24 14:54:48.126|1900-01-01 00:00:00.000|1900-01-01 00:00:00.000|3         |
--|48        |Area Unidad Descripcion                    |AUD      |2         |2         |2         |1         |1.791           |0                   |0           |2023-03-28 10:12:40.106|1900-01-01 00:00:00.000|1900-01-01 00:00:00.000|3         |
--|59        |ffffffffffffffffffffff                     |FF       |2         |2         |2         |1         |1.791           |0                   |0           |2023-03-30 15:31:30.878|1900-01-01 00:00:00.000|1900-01-01 00:00:00.000|6         |
--|60        |DESPACHO DEL CONTROLADOR                   |DC       |1         |1         |1         |1         |1.791           |0                   |0           |2023-04-05 10:53:21.587|1900-01-01 00:00:00.000|1900-01-01 00:00:00.000|7         |
--|61        |GERENCIA NACIONAL DE RECURSOS HUMANOS      |GNRH     |2         |1         |1         |1         |1.791           |0                   |0           |2023-04-05 10:58:06.295|1900-01-01 00:00:00.000|1900-01-01 00:00:00.000|7         |
--|62        |GERENCIA NACIONAL ADMINISTRATIVA FINANCIERA|GNAF     |2         |1         |1         |1         |1.791           |0                   |0           |2023-04-05 11:02:40.413|1900-01-01 00:00:00.000|1900-01-01 00:00:00.000|7         |
--|63        |GERENCIA EJECUTIVA                         |GE       |2         |2         |2         |1         |1.791           |0                   |0           |2023-04-05 11:23:33.046|1900-01-01 00:00:00.000|1900-01-01 00:00:00.000|7         |
--|64        |GERENCIA DEPORTIVA                         |GDEP     |2         |2         |3         |1         |1.791           |0                   |0           |2023-04-05 11:29:58.610|1900-01-01 00:00:00.000|1900-01-01 00:00:00.000|7         |
--|65        |SISTEMAS INFORMATICO                       |SISINF   |2         |1         |2         |1         |1.791           |0                   |0           |2023-04-05 11:31:21.477|1900-01-01 00:00:00.000|1900-01-01 00:00:00.000|7         |
--|66        |GERENCIA DE REGULACION                     |GERE     |1         |1         |2         |1         |1.791           |0                   |0           |2023-04-05 11:50:43.717|1900-01-01 00:00:00.000|1900-01-01 00:00:00.000|10        |
--|67        |aa                                         |a        |1         |1         |1         |4         |1.791           |1.791               |0           |2023-04-05 12:22:45.098|2023-04-05 15:16:25.385|1900-01-01 00:00:00.000|8         |

--NIVELES AREAS UNIDADES
select *
from parametricas.niveles_areas_unidades nau ;
--|nau_codigo|nau_nombre|nau_descripcion                          |nau_estado|usuario_registro|usuario_modificacion|usuario_baja|fecha_registro         |fecha_modificacion     |fecha_baja             |nau_nivel|
--|----------|----------|-----------------------------------------|----------|----------------|--------------------|------------|-----------------------|-----------------------|-----------------------|---------|
--|1         |DIRECTIVO |Definición para áreas Directivas         |1         |0               |0                   |0           |2023-03-16 16:13:33.930|1900-01-01 00:00:00.000|1900-01-01 00:00:00.000|1        |
--|2         |EJECUTIVO |Definición para Áreas/Unidades Ejecutivas|1         |0               |0                   |0           |2023-03-16 16:13:33.930|1900-01-01 00:00:00.000|1900-01-01 00:00:00.000|2        |
--|3         |OPERATIVO |Definición para Áreas/Unidades Operativas|1         |0               |0                   |0           |2023-03-16 16:13:33.930|1900-01-01 00:00:00.000|1900-01-01 00:00:00.000|3        |

--OBTENER AREAS UNIDADES CON SU RESPECTIVA DIRECTIVA con WHERE
select 
au.aun_codigo,
au.aun_nombre,
au.nau_codigo,
nau.nau_nombre
from estructura_organizacional.areas_unidades au, parametricas.niveles_areas_unidades nau  
where au.nau_codigo =nau.nau_codigo
order by au.aun_codigo;

--OBTENER AREAS UNIDADES CON SU RESPECTIVA DIRECTIVA con LEFT JOIN
select 
au.aun_codigo,
au.aun_nombre,
au.nau_codigo,
nau.nau_nombre 
from estructura_organizacional.areas_unidades au  
left join parametricas.niveles_areas_unidades nau on au.nau_codigo  =nau.nau_codigo
order by au.aun_codigo;
-- PARA AMBAS FORMAS
--|aun_codigo|aun_nombre                                 |nau_codigo|nau_nombre|
--|----------|-------------------------------------------|----------|----------|
--|1         |Despacho Contralor                         |2         |EJECUTIVO |
--|2         |Gerencia Recursos Humanos                  |2         |EJECUTIVO |
--|3         |Gerencia Nacional Administrativa financiera|2         |EJECUTIVO |
--|7         |Subcontraloria General                     |2         |EJECUTIVO |
--|8         |Unidad  de Planificacion                   |3         |OPERATIVO |
--|16        |BBBB                                       |2         |EJECUTIVO |
--|21        |PRUEBA11                                   |2         |EJECUTIVO |
--|22        |PRUEBA12                                   |2         |EJECUTIVO |
--|34        |PRUEBA25                                   |2         |EJECUTIVO |
--|37        |PRUEBA28                                   |2         |EJECUTIVO |
--|41        |PRUEBA30                                   |2         |EJECUTIVO |
--|44        |PRUEBA33                                   |2         |EJECUTIVO |
--|48        |Area Unidad Descripcion                    |2         |EJECUTIVO |
--|59        |ffffffffffffffffffffff                     |2         |EJECUTIVO |
--|60        |DESPACHO DEL CONTROLADOR                   |1         |DIRECTIVO |
--|61        |GERENCIA NACIONAL DE RECURSOS HUMANOS      |2         |EJECUTIVO |
--|62        |GERENCIA NACIONAL ADMINISTRATIVA FINANCIERA|2         |EJECUTIVO |
--|63        |GERENCIA EJECUTIVA                         |2         |EJECUTIVO |
--|64        |GERENCIA DEPORTIVA                         |2         |EJECUTIVO |
--|65        |SISTEMAS INFORMATICO                       |2         |EJECUTIVO |
--|66        |GERENCIA DE REGULACION                     |1         |DIRECTIVO |
--|67        |aa                                         |1         |DIRECTIVO |
```
- Metodo para obtener la lista por aun_codigo_supervisor
```ts
  @LoggerMethod
  async findAll(query: GetAllAutoridadesFuncionalesDto, manager: EntityManager) {
    try {
      let sql = `
      SELECT 
        t.afu_codigo, 
        t.aun_codigo_supervisado, 
        t.aun_codigo_supervisor, 
        t.afu_descripcion, 
        t.afu_estado, 
        e.est_color, 
        e.est_nombre AS afu_estado_descripcion 
      FROM estructura_organizacional.autoridades_funcionales t
      LEFT JOIN parametricas.estados e ON e.est_codigo = t.afu_estado
      WHERE TRUE
      ${query.aun_codigo_supervisor ? `AND t.aun_codigo_supervisor IN ${query.aun_codigo_supervisor}` : ''}
      ${query.afu_estado ? `AND t.afu_estado IN ${query.afu_estado}` : ''};`;

      const resultQuery = await manager.query(sql);
      return CustomService.verifyingDataResult(resultQuery, this.message_custom);
    } catch (error) {
      throwError(400, error.message);
    }
  }
```
- Url que envia el get por aun_codigo_supervisado=64
```txt
http://localhost:7000/autoridades-funcionales?aun_codigo_supervisado=(64)
```
- La respuesta que se obtiene en el backend
```json
{
  "codigo": 0,
  "error_existente": 0,
  "error_mensaje": "SE OBTUVIERON DATOS DE FORMA CORRECTA.",
  "error_codigo": 2001,
  "trace_id": "66e73ac8-35e4-43a1-abf1-ca95273315dd",
  "datos": [
    {
      "afu_codigo": 100,
      "aun_codigo_supervisado": 64,
      "aun_codigo_supervisor": 63,
      "afu_descripcion": "El area/unidad: GDEP - GERENCIA DEPORTIVA, esta supervisado funcionalmente por: GE - GERENCIA EJECUTIVA",
      "afu_estado": 1,
      "est_color": "#54bebe",
      "afu_estado_descripcion": "EDICIÓN"
    },
    {
      "afu_codigo": 99,
      "aun_codigo_supervisado": 64,
      "aun_codigo_supervisor": 62,
      "afu_descripcion": "El area/unidad: GDEP - GERENCIA DEPORTIVA, esta supervisado funcionalmente por: GNAF - GERENCIA NACIONAL ADMINISTRATIVA FINANCIERA",
      "afu_estado": 1,
      "est_color": "#54bebe",
      "afu_estado_descripcion": "EDICIÓN"
    },
    {
      "afu_codigo": 98,
      "aun_codigo_supervisado": 64,
      "aun_codigo_supervisor": 61,
      "afu_descripcion": "El area/unidad: GDEP - GERENCIA DEPORTIVA, esta supervisado funcionalmente por: GNRH - GERENCIA NACIONAL DE RECURSOS HUMANOS",
      "afu_estado": 1,
      "est_color": "#54bebe",
      "afu_estado_descripcion": "EDICIÓN"
    },
    {
      "afu_codigo": 97,
      "aun_codigo_supervisado": 64,
      "aun_codigo_supervisor": 60,
      "afu_descripcion": "El area/unidad: GDEP - GERENCIA DEPORTIVA, esta supervisado funcionalmente por: DC - DESPACHO DEL CONTROLADOR",
      "afu_estado": 1,
      "est_color": "#54bebe",
      "afu_estado_descripcion": "EDICIÓN"
    }
  ]
}
```
## DBEAVER
- El codigo del metodo findAll(), es equivalente hacer:
```sql
SELECT 
	t.afu_codigo, 
	t.aun_codigo_supervisado, 
	t.aun_codigo_supervisor, 
	t.afu_descripcion, 
	t.afu_estado, 
	e.est_color, 
	e.est_nombre AS afu_estado_descripcion 
FROM estructura_organizacional.autoridades_funcionales t
LEFT JOIN parametricas.estados e ON e.est_codigo = t.afu_estado
WHERE t.aun_codigo_supervisado=64 ;
```

|afu_codigo|aun_codigo_supervisado|aun_codigo_supervisor|afu_descripcion|afu_estado|est_color|afu_estado_descripcion|
|----------|----------------------|---------------------|---------------|----------|---------|----------------------|
|100|64|63|El area/unidad: GDEP - GERENCIA DEPORTIVA, esta supervisado funcionalmente por: GE - GERENCIA EJECUTIVA|1|#54bebe|EDICIÓN|
|99|64|62|El area/unidad: GDEP - GERENCIA DEPORTIVA, esta supervisado funcionalmente por: GNAF - GERENCIA NACIONAL ADMINISTRATIVA FINANCIERA|1|#54bebe|EDICIÓN|
|98|64|61|El area/unidad: GDEP - GERENCIA DEPORTIVA, esta supervisado funcionalmente por: GNRH - GERENCIA NACIONAL DE RECURSOS HUMANOS|1|#54bebe|EDICIÓN|
|97|64|60|El area/unidad: GDEP - GERENCIA DEPORTIVA, esta supervisado funcionalmente por: DC - DESPACHO DEL CONTROLADOR|1|#54bebe|EDICIÓN|
