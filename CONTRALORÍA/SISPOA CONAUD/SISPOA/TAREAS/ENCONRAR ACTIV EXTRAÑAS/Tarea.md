#########CASO SON ACTIVIDAD RETIRADA CON VIATICOS EN EDICION
SELECT	DISTINCT 
		au.aun_sigla,a.act_numero, a.act_codigo, a.act_codigo_anterior,a.act_correlativo, a.act_estado,
		av.avi_codigo ,av.avi_estado, 
		p.poa_codigo, p.poa_estado,
		po.pobj_nombre ,po.fecha_modificacion ,po.pobj_codigo ,po.pobj_estado,
		oau.oau_codigo ,oau.oau_estado
FROM 	estructura_poa.poas p
		LEFT JOIN estructura_poa.poas_objetivos po ON p.poa_codigo = po.poa_codigo
		LEFT JOIN estructura_poa.objetivos_area_unidad oau ON po.pobj_codigo = oau.pobj_codigo
		LEFT JOIN estructura_poa.actividades a ON po.pobj_codigo = a.pobj_codigo
		LEFT JOIN estructura_organizacional.areas_unidades au ON a.aun_codigo_ejecutora = au.aun_codigo 
		LEFT JOIN estructura_poa.actividades_viaticos av ON a.act_codigo = av.act_codigo 
WHERE 	TRUE 
		AND p.poa_codigo IN (3)
--		AND po.pobj_estado NOT IN (0)
		AND oau.oau_estado NOT IN (0)
		AND av.avi_codigo NOTNULL 
		AND a.act_codigo NOTNULL 
		AND a.act_estado IN (0)
--		AND av.avi_codigo NOTNULL 
ORDER BY au.aun_sigla DESC
;
|aun_sigla  |act_codigo|
|-----------|----------|
|SCEP-GAEP  |2.747     |
|SCAT-GAPIP |1.949     |
|SCAT-GAPIP |1.951     |
|SCAT-GAPIP |1.952     |
|SCAT-GAPIP |1.954     |
|SCAT-GAPIP |1.958     |
|SCAT-GAPIP |1.986     |
|SCAT-GAPIP |3.171     |
|SCAT-GAPIP |3.173     |
|SCAT-GAPIP |3.203     |
|SCAT-GAPIP |3.210     |
|SCAT-GAPIP |3.212     |
|SCAT-GAAPIP|2.738     |
|SCAT- GAA  |1.947     |
|SCAT- GAA  |1.964     |
|SCAT- GAA  |1.968     |
|SCAT- GAA  |1.972     |
|SCAT- GAA  |1.973     |
|SCAT- GAA  |3.118     |
|SCAT- GAA  |3.119     |
|SCAT- GAA  |3.122     |
|SCAT- GAA  |3.126     |
|SCAT- GAA  |3.129     |
|GDT-GAD2   |2.195     |
|GDT-GAD1   |2.194     |
|GDS        |1.643     |
|GDS        |1.644     |
|GDP-GAM    |2.420     |
|GDP-GAD    |2.187     |
|GDO-GAD    |1.806     |
|GDO-GAD    |2.180     |
|GDO        |1.618     |
|GDO        |1.619     |
|GDN-GAM    |2.341     |
|GDN-GAM    |2.342     |
|GDN-GAD    |2.183     |
|GDN-GAD    |2.184     |
|GDN        |1.628     |
|GDN        |1.632     |
|GDH-GAD    |2.226     |
|GDC-GAM2   |1.880     |
|GDC-GAM1   |2.307     |
|GDC-GAD    |2.172     |
|GDC-GAD    |2.218     |
|GDC-GAD    |2.220     |
|GDC-GAD    |2.222     |

SCEP-GAEP
Emitir 8 informes de Supervisión en Entidades y Empresas Públicas a nivel nacional en la gestión 2024.
520.0701.161
520.0007.161.8.24
act_codigo= 2747

SCAT-GAPIP
Emitir 10 Informe de supervisión en temas de Proyectos de Inversión Pública a nivel nacional en la gestión 2024.
500.0501.25
500.0501.25.10.24
act_codigo=1949

##########CASO CON POA OBJETIVO ACTIVADO y OAU INACTIVADO
SELECT	DISTINCT 
		au.aun_sigla,a.act_codigo
FROM 	estructura_poa.poas p
		LEFT JOIN estructura_poa.poas_objetivos po ON p.poa_codigo = po.poa_codigo
		LEFT JOIN estructura_poa.objetivos_area_unidad oau ON po.pobj_codigo = oau.pobj_codigo
		LEFT JOIN estructura_poa.actividades a ON po.pobj_codigo = a.pobj_codigo
		LEFT JOIN estructura_organizacional.areas_unidades au ON a.aun_codigo_ejecutora = au.aun_codigo 
		LEFT JOIN estructura_poa.actividades_viaticos av ON a.act_codigo = av.act_codigo 
WHERE 	TRUE 
		AND p.poa_codigo IN (3)
		AND po.pobj_estado NOT IN (0)
		AND oau.oau_estado IN (0)
ORDER BY au.aun_sigla DESC
;

|aun_sigla|act_codigo|
|---------|----------|
|GC       |2.553     |
|GC       |2.558     |
|GC       |2.566     |


GC
Elaborar o actualizar al menos 4 carpetas PDECE para eventos de capacitación relacionados a la Responsabilidad por la Función Pública a nivel nacional en la gestión 2024
530.0022.27
530.0022.27.1.24
act_codigo=2553


###########CASO CON POA OBJETIVO INACTIVADO y OAU ACTIVADO
GNAF-SGAF
Elaborar (1) una propuesta para la construcción de un inmueble para la CGE a nivel nacional al 2024.
00.0801.131
pobj_codigo=1514
oau_codigo=1762 
SIN ACTIVIDADES

###########CASO ACTIVIDAD RETIRADA CON VIATICOS EN VERIFICACION
GDN
Cumplir con la coordinación y ejecución de actividades gerenciales y administrativas vinculadas al control gubernamental en la gestión 2024.
00.0018.63
00.0018.63.1.24
act_codigo=1632			,act_codigo_otro=2222








