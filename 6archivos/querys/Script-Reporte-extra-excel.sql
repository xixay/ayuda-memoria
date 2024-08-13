WITH codigo AS (
SELECT 	au.aun_codigo, au.aun_numero
FROM 	estructura_organizacional.areas_unidades au
WHERE 	au.aun_codigo IN (58)
)
--SELECT  * FROM    codigo
SELECT 	po.pobj_codigo,pr.pro_numero ,po.pobj_nombre, po.pobj_indicador, po.pobj_numero
FROM 	  estructura_poa.poas_objetivos po
        LEFT JOIN pei.programas pr on po.pro_codigo = pr.pro_codigo
WHERE   TRUE
        AND po.pobj_codigo IN (777,1180,1181,1182,1183,1184,1185,1186,1187,1188,1189,1190,1191,1192,1193,1194,1195,1196,1197,1198,1199,1200,1201,1202,1203,1204,1205,1206,1207,1208,1209,1210)
        ;
--PADRE
SELECT 	*
FROM 	estructura_organizacional.areas_unidades au
WHERE 	TRUE 
		AND au.aun_codigo IN (17)--padre
;
--HIJOS
SELECT 	aud.aud_codigo ,aud.aun_codigo_padre, aud.aun_codigo_hijo, au.aun_numero, au.aun_sigla 
FROM 	estructura_organizacional.areas_unidades_dependencias aud 
		LEFT JOIN estructura_organizacional.areas_unidades au ON aud.aun_codigo_hijo = au.aun_codigo 
WHERE 	aud.aun_codigo_padre IN (17)
;

SELECT *
FROM estructura_organizacional.autoridades_funcionales af
WHERE 	af.aun_codigo_supervisor IN (2)
;

  WITH order_values AS (
  SELECT unnest(array[2,59]) AS aun_codigo_ejecutora, generate_series(1, array_length(array[2,59], 1)) AS orden
  ),
  numered_activities AS (
      SELECT a.act_codigo, a.act_descripcion,a.act_codigo_anterior,a.act_estado, a.act_numero, cca.cca_nombre, cga.cga_nombre, cfa.cfa_nombre, af.aun_codigo_supervisor, au2.aun_sigla AS aun_sigla_supervisor,au.aun_codigo, au.aun_sigla, a.ent_codigo, a.act_objetivo, a.ttr_codigo, tt.ttr_descripcion, tt.ett_codigo, ett.ett_nombre, a.caa_codigo, caa.caa_nombre, ov.orden,
            row_number() OVER (ORDER BY ov.orden) AS numero_dato, CASE WHEN a.act_estado = 0 AND a.act_codigo_anterior IS NOT NULL THEN 'inhabilitado' ELSE '' END AS inhabilitado
      FROM estructura_poa.actividades a
      LEFT JOIN estructura_poa.poas_objetivos po ON a.pobj_codigo = po.pobj_codigo
      LEFT JOIN estructura_poa.poas p ON po.poa_codigo = p.poa_codigo
      LEFT JOIN estructura_organizacional.areas_unidades au ON a.aun_codigo_ejecutora = au.aun_codigo
      LEFT JOIN parametricas.tipos_trabajos tt ON a.ttr_codigo = tt.ttr_codigo
      LEFT JOIN parametricas.especificacion_tipos_trabajo ett ON tt.ett_codigo = ett.ett_codigo
      LEFT JOIN parametricas.clasificacion_auditoria_actividad caa ON a.caa_codigo = caa.caa_codigo
      LEFT JOIN parametricas.clasificacion_funcion_actividad cfa ON a.cfa_codigo = cfa.cfa_codigo
      LEFT JOIN parametricas.clasificacion_grupo_actividad cga ON a.cga_codigo = cga.cga_codigo
      LEFT JOIN parametricas.clasificacion_control_actividad cca ON a.cca_codigo = cca.cca_codigo
      LEFT JOIN estructura_organizacional.autoridades_funcionales af ON au.aun_codigo = af.aun_codigo_supervisado
      LEFT JOIN estructura_organizacional.areas_unidades au2 ON af.aun_codigo_supervisor = au2.aun_codigo 
      JOIN order_values ov ON a.aun_codigo_ejecutora = ov.aun_codigo_ejecutora
      WHERE true
        AND a.aun_codigo_ejecutora IN (2,59)
        AND a.act_estado NOT IN (0, 9)
        AND p.poa_codigo IN (3)
  )
  SELECT * FROM numered_activities
  ORDER BY orden;
 SELECT *
 FROM parametricas.clasificacion_funcion_actividad cfa ;

SELECT *
FROM parametricas.clasificacion_grupo_actividad cga ;

SELECT *
FROM parametricas.clasificacion_control_actividad cca ;
SELECT  *
FROM 	estructura_poa.actividades a ;


