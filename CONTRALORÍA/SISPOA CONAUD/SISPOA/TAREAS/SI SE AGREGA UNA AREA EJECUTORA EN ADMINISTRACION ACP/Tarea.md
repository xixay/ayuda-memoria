######ACCIONES A CORTO PLAZO
##ROL: NORKA

##QUERY:
SELECT 	
	oau.oau_codigo,oau_descripcion,oau.aun_codigo_ejecutora, oau.oau_estado,
	au.aun_sigla, 
	po.pobj_codigo, po.pobj_estado
FROM 	estructura_poa.objetivos_area_unidad oau
	LEFT JOIN estructura_organizacional.areas_unidades au ON oau.aun_codigo_ejecutora = au.aun_codigo 
	LEFT JOIN estructura_poa.poas_objetivos po ON oau.pobj_codigo = po.pobj_codigo
WHERE 	TRUE
	AND oau.pobj_codigo IN (1067)
ORDER BY oau.oau_codigo DESC
;

##COMPONENTE
http://172.16.22.243:3000/sispoa/administracion_acp

##EXISTEN DOS AREAS EJECUTORAS: backup_20240930_085229.sql
1.-GDT-GAD1
2.-GDT-GAM1

##GDT-GAD1: TIENE LA ACCION A CORTO PLAZO
520.1702.112	Emitir 4 Informes Complementarios en Gobiernos Departamentales en la Gerencia Departamental de Tarija en la gestión 2024.

##GDT-GAM1: NO TIENE LA MISMA

##SE VA ASOCIAR DESDE GDT-GAD1 EL ÁREA EJECUTORA GDT-GAM1, PARA LA ACCION :
Emitir 4 Informes Complementarios en Gobiernos Departamentales en la Gerencia Departamental de Tarija en la gestión 2024.

##REALIZA POST:
http://172.16.22.243:7091/objetivos-area-unidad

##ENVIA
{
	"aun_codigo_ejecutora": 39,
	"aun_codigo_supervisora": 39,
	"aun_numero": "1702",
	"aun_sigla": "GDT-GAD1",
	"estado_global": 2,
	"estado_global_color": "#43A047",
	"estado_global_descripcion": "CONSOLIDADO",
	"estado_global_pobj": 2,
	"estado_global_pobj_color": "#43A047",
	"estado_global_pobj_descripcion": "CONSOLIDADO",
	"oau_codigo": 1245,
	"oau_descripcion": "prueba 2",
	"oau_estado": 2,
	"oau_indicador": 111,
	"observacion_detalle": null,
	"pobj_codigo": 1057,
	"pobj_codigo_sigla": "520.1702.112",
	"pobj_estado": 2,
	"pobj_nombre": "Emitir 4 Informes Complementarios en Gobiernos Departamentales en la Gerencia Departamental de Tarija en la gestión 2024.",
	"pobj_numero": 112,
	"pro_codigo": 3,
	"pro_numero": "520"
}

##AL ENVIAR EL pob_estado, se creara con ese estado : backup_20240930_085044.sql
520.1703.112	Emitir 4 Informes Complementarios en Gobiernos Departamentales en la Gerencia Departamental de Tarija en la gestión 2024.
