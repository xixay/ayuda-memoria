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
        
SELECT 	*
FROM 	estructura_organizacional.areas_unidades au
WHERE 	TRUE 
		AND au.aun_codigo IN (17)--padre
;

