## Base de Prueba
- backup_20241004_183710.sql
## Rama de trabajo
- En la rama fix/refactoricion_reportes_F_conaud
## Archivo a trabajar
- src/feature/inicio-actividad-poa/service/findAll-inicio-actividad-poa.service.ts
## Nuevo servicio de reportes
- findSummaryByIapCodeForReportNuevo
## Reporte a imprimir
![[reporte_F1-A.pdf]]
## Datos de entrada:
```
iap_codigo= 262
```
## Propuesta de query para obtener los valores iniciales
```sql
--inicio_actividad_poa
SELECT  iap.iap_codigo,
        ia.iac_codigo, ia.iac_codigo_control, ia.iac_codigo_control_vista,
        a.act_codigo, a.act_numero,
        iap.per_codigo_gerente, iap.per_codigo_responsable,
        CONCAT_WS('.', 
            split_part(a.act_numero, '.', 1),
            split_part(a.act_numero, '.', 2),
            split_part(a.act_numero, '.', 3)
        ) AS cod_areas,
        split_part(a.act_numero, '.', 4) AS cod_correlativo,
        split_part(a.act_numero, '.', 5) AS cod_gestion,
        a.ent_descripcion AS entidad_nombre,
        a.act_denuncia,
        ia.iac_objeto,
        ia.iac_objetivo,
        ia.iac_alcance,
        TO_CHAR(ia.iac_fecha_inicio, 'dd/mm/yyyy') AS iac_fecha_inicio,
        ia.iac_dias_habiles,
        ia.iac_dias_calendario,
        TO_CHAR(ia.iac_mes_inicio, 'MM/YYYY') AS mes_inicio,  -- Formato MM/YYYY
        TO_CHAR(ia.iac_fecha_borrador, 'dd/mm/yyyy') AS iac_fecha_borrador,
        TO_CHAR(ia.iac_fecha_emision, 'dd/mm/yyyy') AS iac_fecha_emision,
        TO_CHAR(ia.iac_mes_fin, 'MM/YYYY') AS mes_fin,  -- Formato MM/YYYY
        g.ges_anio,
        tt.ttr_sigla,
        (
        	CASE
	        	WHEN (a.tipact_codigo = 2 ) THEN 1
	        	ELSE 0 END
        ) AS bandera_continuidad,
        tt.ttr_descripcion, 
        iap.iap_justificacion_ampliacion,
        iap.iap_observaciones,
        ia.iac_observaciones, 
        iap.iap_estado
FROM    ejecucion_actividades.inicio_actividad_poa iap
        LEFT JOIN ejecucion_actividades.inicios_actividades ia ON iap.iac_codigo = ia.iac_codigo
        LEFT JOIN estructura_poa.actividades a ON iap.act_codigo = a.act_codigo
        LEFT JOIN parametricas.gestiones g ON ia.ges_codigo = g.ges_codigo
        LEFT JOIN parametricas.tipos_trabajos tt ON a.ttr_codigo = tt.ttr_codigo 
WHERE   TRUE
        AND iap.iap_codigo IN (262);
```
- El resultado es:

|iap_codigo|iac_codigo|iac_codigo_control|iac_codigo_control_vista|act_codigo|act_numero|per_codigo_gerente|per_codigo_responsable|cod_areas|cod_correlativo|cod_gestion|entidad_nombre|act_denuncia|iac_objeto|iac_objetivo|iac_alcance|iac_fecha_inicio|iac_dias_habiles|iac_dias_calendario|mes_inicio|iac_fecha_borrador|iac_fecha_emision|mes_fin|ges_anio|ttr_sigla|bandera_continuidad|ttr_descripcion|iap_justificacion_ampliacion|iap_observaciones|iac_observaciones|iap_estado|
|----------|----------|------------------|------------------------|----------|----------|------------------|----------------------|---------|---------------|-----------|--------------|------------|----------|------------|-----------|----------------|----------------|-------------------|----------|------------------|-----------------|-------|--------|---------|-------------------|---------------|----------------------------|-----------------|-----------------|----------|
|262|330|EPDP200A24|EP/DP200/A24|2068|510.1602.25.2.24|401|240|510.1602.25|2|24|||EL INFORME DE CONFIABILIDAD DE REGISTROS, INFORME DE CONFIABILIDAD DE ESTADOS FINANCIEROS Y PAPELES DE TRABAJO DE AUDITORÍA DE CONFIABILIDAD DE REGISTROS Y ESTADOS FINANCIEROS EN LO QUE CORRESPONDA|EVALUAR SI LOS INFORMES DE AUDITORÍA DE CONFIABILIDAD DE REGISTROS Y ESTADOS FINANCIEROS SE AJUSTAN A LAS NORMAS DE AUDITORÍA DE CONFIABILIDAD DE REGISTROS Y ESTADOS FINANCIEROS|AL 31 DE DICIEMBRE DE 2023|20/03/2024|30|42|04/2024|18/04/2024|03/05/2024|07/2024|2024|EVINF|0|EVALUACIÓN EEFF - UNIDADES DE AUDITORÍA INTERNA|PARA INCORPORAR HORAS A LA GERENTE DE ÁREA|||2|

