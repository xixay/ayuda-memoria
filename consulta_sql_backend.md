## BACKEND

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
# Consultas
## OBTENER CARGOS ITE solo de 1 y 2
```sql
select 
ci.cit_codigo,
cid.cid_codigo
from estructura_organizacional.cargos_items ci  
left join estructura_organizacional.cargos_item_dependencias cid on cid.cit_codigo_hijo =ci.cit_codigo 
where cit_codigo in (1,2);
```
## OBTENER LOS CARGOS ITEMS DE ESOS CODIGOS
```sql
select *
from estructura_organizacional.cargos_items ci 
where ci.cit_codigo in (48,49,50,52)
```
|cit_codigo|cit_descripcion|car_codigo|ite_codigo|cit_estado|usuario_registro|usuario_modificacion|usuario_baja|fecha_registro|fecha_modificacion|fecha_baja|aun_codigo|
|----------|---------------|----------|----------|----------|----------------|--------------------|------------|--------------|------------------|----------|----------|
|48|El cargo: SECRETARIA COMERCIAL, pertenece al área/unidad: DESPACHO DEL CONTROLADOR, con el item: 0001.|57|47|1|1791|1791|0|2023-04-05 11:10:06.509|2023-04-05 11:18:34.266|1900-01-01 00:00:00.000|61|
|50|El cargo: AYUDANTE SECRETARIA, pertenece al área/unidad: DESPACHO DEL CONTROLADOR, con el item: 0003.|59|49|1|1791|1791|0|2023-04-05 11:14:54.418|2023-04-05 11:22:05.975|1900-01-01 00:00:00.000|60|
|52|El cargo: LIMPIEZA, pertenece al área/unidad: DESPACHO DEL CONTROLADOR, con el item: 0034.|62|52|1|1791|0|0|2023-04-06 15:34:27.239|1900-01-01 00:00:00.000|1900-01-01 00:00:00.000|60|
|49|El cargo: COMUNICACION, pertenece al área/unidad: DESPACHO DEL CONTROLADOR, con el item: 0002.|58|48|1|1791|1791|0|2023-04-05 11:12:33.909|2023-04-05 11:22:05.908|1900-01-01 00:00:00.000|60|
## OBTENER NIVELES AREAS UNIDADES
```sql
select *
from parametricas.niveles_areas_unidades nau
order by nau.nau_codigo 
asc;
```
|nau_codigo|nau_nombre|nau_descripcion|nau_estado|usuario_registro|usuario_modificacion|usuario_baja|fecha_registro|fecha_modificacion|fecha_baja|nau_nivel|
|----------|----------|---------------|----------|----------------|--------------------|------------|--------------|------------------|----------|---------|
|1|DIRECTIVO|Definición para áreas Directivas|1|0|0|0|2023-03-16 16:13:33.930|1900-01-01 00:00:00.000|1900-01-01 00:00:00.000|1|
|2|EJECUTIVO|Definición para Áreas/Unidades Ejecutivas|1|0|0|0|2023-03-16 16:13:33.930|1900-01-01 00:00:00.000|1900-01-01 00:00:00.000|2|
|3|OPERATIVO|Definición para Áreas/Unidades Operativas|1|0|0|0|2023-03-16 16:13:33.930|1900-01-01 00:00:00.000|1900-01-01 00:00:00.000|3|
## OBTENER AREAS UNIDADES CON SU RESPECTIVA DIRECTIVA usando WHERE(mas pesado menos recomendado)
```sql
select 
au.aun_codigo,
au.aun_nombre,
au.nau_codigo,
nau.nau_nombre
from estructura_organizacional.areas_unidades au, parametricas.niveles_areas_unidades nau  
where au.nau_codigo =nau.nau_codigo
order by au.aun_codigo;
```
|aun_codigo|aun_nombre|nau_codigo|nau_nombre|
|----------|----------|----------|----------|
|1|Despacho Contralor|2|EJECUTIVO|
|2|Gerencia Recursos Humanos|2|EJECUTIVO|
|3|Gerencia Nacional Administrativa financiera|2|EJECUTIVO|
|7|Subcontraloria General|2|EJECUTIVO|
|8|Unidad  de Planificacion|3|OPERATIVO|
|16|BBBB|2|EJECUTIVO|
|21|PRUEBA11|2|EJECUTIVO|
|22|PRUEBA12|2|EJECUTIVO|
|34|PRUEBA25|2|EJECUTIVO|
|37|PRUEBA28|2|EJECUTIVO|
|41|PRUEBA30|2|EJECUTIVO|
|44|PRUEBA33|2|EJECUTIVO|
|48|Area Unidad Descripcion|2|EJECUTIVO|
|59|ffffffffffffffffffffff|2|EJECUTIVO|
|60|DESPACHO DEL CONTROLADOR|1|DIRECTIVO|
|61|GERENCIA NACIONAL DE RECURSOS HUMANOS|2|EJECUTIVO|
|62|GERENCIA NACIONAL ADMINISTRATIVA FINANCIERA|2|EJECUTIVO|
## OBTENER AREAS UNIDADES CON SU RESPECTIVA DIRECTIVA usando LEFT JOIN
```sql
select 
au.aun_codigo,
au.aun_nombre,
au.nau_codigo,
nau.nau_nombre 
from estructura_organizacional.areas_unidades au  
left join parametricas.niveles_areas_unidades nau on au.nau_codigo  =nau.nau_codigo
order by au.aun_codigo;
```
|aun_codigo|aun_nombre|nau_codigo|nau_nombre|
|----------|----------|----------|----------|
|1|Despacho Contralor|2|EJECUTIVO|
|2|Gerencia Recursos Humanos|2|EJECUTIVO|
|3|Gerencia Nacional Administrativa financiera|2|EJECUTIVO|
|7|Subcontraloria General|2|EJECUTIVO|
|8|Unidad  de Planificacion|3|OPERATIVO|
|16|BBBB|2|EJECUTIVO|
|21|PRUEBA11|2|EJECUTIVO|
|22|PRUEBA12|2|EJECUTIVO|
|34|PRUEBA25|2|EJECUTIVO|
|37|PRUEBA28|2|EJECUTIVO|
|41|PRUEBA30|2|EJECUTIVO|
|44|PRUEBA33|2|EJECUTIVO|
|48|Area Unidad Descripcion|2|EJECUTIVO|
|59|ffffffffffffffffffffff|2|EJECUTIVO|
|60|DESPACHO DEL CONTROLADOR|1|DIRECTIVO|
|61|GERENCIA NACIONAL DE RECURSOS HUMANOS|2|EJECUTIVO|
|62|GERENCIA NACIONAL ADMINISTRATIVA FINANCIERA|2|EJECUTIVO|