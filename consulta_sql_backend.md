## BACKEND
- Metodo
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
- Url
```txt
http://localhost:7000/autoridades-funcionales?aun_codigo_supervisado=(64)
```
- obtiene
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
- DBEAVER
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
