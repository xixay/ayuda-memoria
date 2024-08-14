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
SELECT 	au.aun_codigo, au.aun_sigla, au.aun_numero 
FROM 	estructura_organizacional.areas_unidades au
WHERE 	TRUE 
		AND au.aun_codigo IN (74)--padre
;
SELECT 	*
FROM 	estructura_organizacional.areas_unidades_dependencias aud 
WHERE 	aud.aun_codigo_padre IN (13);
--HIJOS
SELECT 	aud.aud_codigo ,aud.aun_codigo_padre, au2.aun_estado,au2.aun_numero ,au2.aun_sigla ,aud.aun_codigo_hijo, au.aun_estado,au.aun_numero, au.aun_sigla 
FROM 	estructura_organizacional.areas_unidades_dependencias aud 
		LEFT JOIN estructura_organizacional.areas_unidades au ON aud.aun_codigo_hijo = au.aun_codigo
		LEFT JOIN estructura_organizacional.areas_unidades au2 ON aud.aun_codigo_padre = au2.aun_codigo 
WHERE 	aud.aun_codigo_padre IN (44)
;

SELECT 	*
FROM 	estructura_poa.objetivos_area_unidad oau
WHERE 	oau.aun_codigo_ejecutora IN (17)
;

SELECT *
FROM estructura_organizacional.autoridades_funcionales af
WHERE 	af.aun_codigo_supervisor IN (2)
;

WITH order_values AS (
	 SELECT unnest(array[2,59]) AS aun_codigo_ejecutora, generate_series(1, array_length(array[2,59], 1)) AS orden
),
numered_activities AS (
	SELECT	row_number() OVER (ORDER BY ov.orden) AS numero_dato, a.act_numero AS numero_actividad,au.aun_sigla AS area_unidad_sigla,
			au2.aun_sigla AS area_unidad_sigla_supervisor, a.ent_codigo, a.act_codigo, a.act_descripcion AS descripcion_actividad,
			a.act_objetivo AS objetivo_actividad,
  			caa.caa_nombre AS nombre_auditoria_actividad,
  			cfa.cfa_nombre AS nombre_funcion_actividad,
          	cga.cga_nombre AS nombre_grupo_actividad ,
          	cca.cca_nombre  AS nombre_control_calidad,
          	ett.ett_codigo,
          	ett.ett_nombre AS especificacion_tipo_trab_nombre,
          	tt.ttr_descripcion AS tipo_trab_descripcion,
        	CASE WHEN a.act_estado = 0 AND a.act_codigo_anterior IS NOT NULL THEN 'inhabilitado' ELSE '' END AS inhabilitado,
            ov.orden
    FROM 	estructura_poa.actividades a
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
	WHERE 	TRUE 
        	AND a.aun_codigo_ejecutora IN (2,59)
        	AND a.act_estado NOT IN (9)
        	AND p.poa_codigo IN (3)
  )
  SELECT * 	FROM numered_activities
  ORDER BY orden;
 SELECT *
 FROM parametricas.clasificacion_funcion_actividad cfa ;

SELECT *
FROM parametricas.clasificacion_grupo_actividad cga ;

SELECT *
FROM parametricas.clasificacion_control_actividad cca ;
SELECT  *
FROM 	estructura_poa.actividades a ;

--
SELECT	 
    	row_number() OVER (ORDER BY au.aun_sigla, a.act_numero) AS numero_dato, 
    	a.act_numero AS numero_actividad,
    	au.aun_sigla AS area_unidad_sigla,
    	au2.aun_sigla AS area_unidad_sigla_supervisor, 
    	a.ent_codigo, 
    	a.act_codigo, 
    	a.act_descripcion AS descripcion_actividad,
    	a.act_objetivo AS objetivo_actividad,
    	caa.caa_nombre AS nombre_auditoria_actividad,
    	cfa.cfa_nombre AS nombre_funcion_actividad,
    	cga.cga_nombre AS nombre_grupo_actividad,
    	cca.cca_nombre AS nombre_control_calidad,
    	ett.ett_codigo,
    	ett.ett_nombre AS especificacion_tipo_trab_nombre,
    	tt.ttr_descripcion AS tipo_trab_descripcion,
    	CASE WHEN a.act_estado = 0 AND a.act_codigo_anterior IS NOT NULL THEN 'inhabilitado' ELSE '' END AS inhabilitado
FROM 	estructura_poa.actividades a
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
WHERE 	TRUE 
		AND a.aun_codigo_ejecutora IN (2, 59)
    	AND a.act_estado NOT IN (9)
    	AND p.poa_codigo IN (3)
ORDER BY au.aun_sigla, a.act_numero;

--
SELECT 	a.act_codigo, a.act_estado, a.act_correlativo,a.act_codigo_anterior, a2.act_correlativo 
FROM 	estructura_poa.actividades a
		LEFT JOIN estructura_poa.actividades a2 ON a.act_codigo_anterior = a2.act_codigo
WHERE 	a.act_correlativo != a2.act_correlativo
		--AND a.act_codigo_anterior NOTNULL 
;

WITH actividades_anterior AS (
SELECT 	a.act_codigo, a.act_estado, a.act_correlativo,a.act_codigo_anterior, a2.act_correlativo 
FROM 	estructura_poa.actividades a
		LEFT JOIN estructura_poa.actividades a2 ON a.act_codigo_anterior = a2.act_codigo
WHERE 	a.act_correlativo != a2.act_correlativo
		AND a.act_codigo_anterior NOTNULL 
)
SELECT * FROM actividades_anterior;
WITH actividades_anterior AS (
    SELECT 
        a.act_codigo, 
        a.act_estado, 
        a.act_correlativo,
        a.act_codigo_anterior, 
        a2.act_correlativo AS nuevo_correlativo
    FROM 
        estructura_poa.actividades a
    LEFT JOIN 
        estructura_poa.actividades a2 ON a.act_codigo_anterior = a2.act_codigo
    WHERE 
        a.act_correlativo != a2.act_correlativo
        AND a.act_codigo_anterior IS NOT NULL 
)
UPDATE estructura_poa.actividades
SET act_correlativo = aa.nuevo_correlativo
FROM actividades_anterior aa
WHERE estructura_poa.actividades.act_codigo = aa.act_codigo;

--
UPDATE estructura_poa.actividades a
SET act_correlativo = (
    SELECT a2.act_correlativo
    FROM estructura_poa.actividades a2
    WHERE a.act_codigo_anterior = a2.act_codigo
)
WHERE EXISTS (
    SELECT 1
    FROM estructura_poa.actividades a2
    WHERE a.act_codigo_anterior = a2.act_codigo
      AND a.act_correlativo != a2.act_correlativo
      AND a.act_codigo_anterior IS NOT NULL
);








SELECT 	a.act_codigo, a.aun_codigo_ejecutora , au.aun_sigla 
FROM 	estructura_poa.actividades a
		LEFT JOIN estructura_organizacional.areas_unidades au ON a.aun_codigo_ejecutora = au.aun_codigo 
WHERE 	a.act_codigo IN (2864,2862,2453,2388,1984,1983,1982,1981,1980,1979,1978,1977,1976,1975,1974,1971,1970,1969,1967,1966,1965,1963,1962,1961,1958,1956,1955,1954,1953,1952,1951,1950,1949,2863,3992,2175,2178,2381)
		AND au.aun_sigla = 'SCAT- GATIC'
;



      SELECT act_codigo
        FROM  public.tmp_hrs_cero
        ;
       
        SELECT
              t.act_codigo,
              t.act_descripcion,
              t.act_cantidad,
              TO_CHAR(t.act_fecha_inicio, 'dd/mm/yyyy') as act_fecha_inicio,
              TO_CHAR(t.act_fecha_fin, 'dd/mm/yyyy') as act_fecha_fin,
              t.act_objeto,
              t.act_objetivo,
              t.act_alcance,
              t.act_horas_planificadas,
              t.act_estado,
              t.act_no_planificado,
              t.act_codigo_anterior,
              t.act_codigo_bolsa,
              --fo.for_codigo, -- COMENTADO PORQUE YA NO SE UTILIZARA LA RELACIÓN
              ge.ges_codigo,
              pobj.pobj_numero,
              aune.aun_numero,
              aune.aun_estado,
              pr.pro_numero,
              t.act_correlativo,
              ge.ges_anio,
              t.act_numero,
              CONCAT_WS(' - ', t.act_numero, t.act_descripcion)AS act_num_desc,
              e.est_color,
              e.est_nombre AS act_estado_descripcion,
              t.ttr_codigo,
              tt.ttr_sigla,
              tt.ttr_inicial,
              tt.ett_codigo,
              ett.ett_nombre,
              t.ume_codigo,
              um.ume_descripcion,
              t.ent_codigo,
              t.fob_codigo,
              t.tipact_codigo,
              ta.tipact_descripcion AS act_tipact_descripcion,
              t.cac_codigo,
              t.sec_codigo,
              se.sec_descripcion,
              ca.cac_descripcion AS act_cac_descripcion,
              t.aun_codigo_supervisora,
              auns.aun_sigla AS aun_sigla_supervisora,
              auns.aun_inicial AS aun_inicial_supervisora,
              CONCAT_WS(' - ', auns.aun_nombre, auns.aun_sigla)AS aun_nombre_supervisora,
              t.act_ejecucion_conaud,
              t.aun_codigo_ejecutora,
              t.aun_codigo_ejecutora AS aun_codigo_ejecutora_actividad,
              t.pobj_codigo,
              aune.aun_sigla AS aun_sigla_ejecutora,
              aune.aun_inicial AS aun_inicial_ejecutora,
              aune.lug_codigo,
              CONCAT_WS(' - ', aune.aun_nombre, aune.aun_sigla)AS aun_nombre_ejecutora,
              COALESCE(aa.act_codigo_apoyo, 0) AS act_codigo_apoyo,
              COALESCE(aa.act_codigo_ejecucion, 0) AS act_codigo_ejecucion,
              t.act_justificacion,
              t.iac_codigo_apoyo,
              CONCAT_WS(' | ', ge2.ges_anio, ia.iac_codigo_control, ia.iac_objetivo) AS iac_concatenado,
              ia.iac_codigo_control,
              actv.avi_estado,
              TO_CHAR(t.fecha_registro, 'HH24:MI am dd/mm/yyyy') as fecha_registro,
              t.act_denuncia,
              pobj.poa_codigo,
              aune.cau_codigo,
              t.act_codigo,
              t.caa_codigo,
              caa.caa_nombre,
              t.cfa_codigo,
              cfa.cfa_nombre,
              t.cga_codigo,
              cga.cga_nombre,
              t.cca_codigo,
              cca.cca_nombre
        FROM  estructura_poa.actividades t
              LEFT JOIN parametricas.estados e ON e.est_codigo = t.act_estado
              LEFT JOIN parametricas.unidades_medidas um ON t.ume_codigo = um.ume_codigo
              LEFT JOIN parametricas.tipos_actividades ta ON t.tipact_codigo = ta.tipact_codigo
              LEFT JOIN parametricas.clasificacion_actividades ca ON t.cac_codigo = ca.cac_codigo
              LEFT JOIN parametricas.sector se ON t.sec_codigo = se.sec_codigo
              LEFT JOIN parametricas.tipos_trabajos tt ON t.ttr_codigo = tt.ttr_codigo
              LEFT JOIN parametricas.especificacion_tipos_trabajo ett ON tt.ett_codigo = ett.ett_codigo
              LEFT JOIN parametricas.clasificacion_auditoria_actividad caa ON t.caa_codigo = caa.caa_codigo
              LEFT JOIN parametricas.clasificacion_funcion_actividad cfa ON t.cfa_codigo = cfa.cfa_codigo
              LEFT JOIN parametricas.clasificacion_grupo_actividad cga ON t.cga_codigo = cga.cga_codigo
              LEFT JOIN parametricas.clasificacion_control_actividad cca ON t.cca_codigo = cca.cca_codigo
              LEFT JOIN estructura_organizacional.areas_unidades aune ON t.aun_codigo_ejecutora = aune.aun_codigo
              LEFT JOIN estructura_organizacional.areas_unidades auns ON t.aun_codigo_supervisora = auns.aun_codigo 
              LEFT JOIN estructura_poa.actividades_viaticos actv ON t.act_codigo = actv.avi_codigo
              LEFT JOIN estructura_poa.actividades_apoyo aa ON t.act_codigo = aa.act_codigo AND aa.aap_estado = 1
              LEFT JOIN estructura_poa.poas_objetivos pobj ON t.pobj_codigo = pobj.pobj_codigo
              LEFT JOIN pei.programas pr ON pobj.pro_codigo = pr.pro_codigo
              LEFT JOIN estructura_poa.poas po ON pobj.poa_codigo = po.poa_codigo
              LEFT JOIN parametricas.gestiones ge ON po.ges_codigo = ge.ges_codigo
              LEFT JOIN ejecucion_actividades.inicios_actividades ia ON t.iac_codigo_apoyo = ia.iac_codigo
              LEFT JOIN parametricas.gestiones ge2 ON ge2.ges_codigo = ia.ges_codigo
        WHERE TRUE
              AND t.act_estado IN (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18)
              AND t.pobj_codigo IN (1540,998,1001,1005,995,1007,1377,1006)
			  AND t.cac_codigo IN (1,3)
              AND t.aun_codigo_ejecutora IN (55) -- PARA FILTRO DE AREA UNIDAD EJECUTORA VIA ACTIVIDAD
              AND t.act_codigo NOT IN (2864,2862,2453,2388,1984,1983,1982,1981,1980,1979,1978,1977,1976,1975,1974,1971,1970,1969,1967,1966,1965,1963,1962,1961,1958,1956,1955,1954,1953,1952,1951,1950,1949,2863,2992,2175,2178,2381)
        ORDER BY t.act_codigo DESC
      ;

