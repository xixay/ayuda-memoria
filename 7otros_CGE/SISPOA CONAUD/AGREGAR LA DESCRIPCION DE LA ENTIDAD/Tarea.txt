FORMULADOR	UNIDAD	SISPOA
APROBADOR	UNIDAD	SISPOA-CONAUD
SUPERVISOR	UNIDAD	SISPOA-CONAUD
FORMULADOR GERENTE	UNIDAD	CONAUD
COMISION	UNIDAD	CONAUD
RESPONSABLE	UNIDAD	CONAUD
OFICIAL ADMINISTRATIVO	UNIDAD	SISPOA
GERENTE CONSOLIDADOR	UNIDAD	SISPOA

BASE DE PRUEBA
backup_20240919_102000.sql

-- AGREGAR COLUMNA A ACTIVIDADES
ALTER TABLE estructura_poa.actividades
ADD COLUMN ent_descripcion VARCHAR;

-- COMENTARIO PARA LA COLUMNA ent_descripcion EN estructura_poa.actividades
COMMENT ON COLUMN estructura_poa.actividades.ent_descripcion IS 'Descripción de la entidad relacionada a la actividad';

-- AGREGAR COLUMNA A INFORMES UAIS
ALTER TABLE ejecucion_informes.informes_uai
ADD COLUMN ent_descripcion VARCHAR;

-- COMENTARIO PARA LA COLUMNA ent_descripcion EN ejecucion_informes.informes_uai
COMMENT ON COLUMN ejecucion_informes.informes_uai.ent_descripcion IS 'Descripción de la entidad relacionada al informe UAI';

Área/Unidad Ejecutora Seleccionada: "Despacho del Contralor - DC"
	2468864	NORA HERMINIA MAMANI CABRERA	FORMULADOR 	EDICION
	3457029	RAFAEL MARTIN PORCEL DE LA BARRA	SUPERVISOR 	EDICION
	2468864	NORA HERMINIA MAMANI CABRERA	FORMULADOR GERENTE 	EDICION
		SIN IDENTIFICAR	FORMULADOR 	EDICION
	2468864	NORA HERMINIA MAMANI CABRERA	SUPERVISOR 	EDICION
	2468864	NORA HERMINIA MAMANI CABRERA	APROBADOR 	EDICION
	2573781	ERIKA CAROLINA CARDENAS SALAS	FORMULADOR 	EDICION
	4755293	NORKA VALERIA CHAVEZ LIMACHI	FORMULADOR 	EDICION 


Área/Unidad Ejecutora Seleccionada: "Gerencia de Capacitación - GC
	3457029	RAFAEL MARTIN PORCEL DE LA BARRA	SUPERVISOR 	EDICION
	3457029	RAFAEL MARTIN PORCEL DE LA BARRA	APROBADOR 	EDICION
	6074227	JOSE LUIS LAURA APAZA			FORMULADOR 	EDICION 
	
BASE EN EDICION
backup_20240919_113925.sql

BASE YA CONSOLIDAD
backup_20240919_122128.sql


BASE CON UAIs y FIRMAS CREADAS
backup_20240919_160020.sql

BASE CON UNA ACT EN EDICION EN GC
backup_20240919_170527.sql

REPORTES REVISAR:  backup_20240919_201141.sql

Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJwZXJfY29kaWdvIjo0NjEsInNpc3RlbWFzIjpbeyJzaXNjZ2VfY29kaWdvIjozMiwic2lzY2dlX3NpZ2xhIjoiY29ycmVzcG9uZGVuY2lhX2ludGVybmEifSx7InNpc2NnZV9jb2RpZ28iOjM0LCJzaXNjZ2Vfc2lnbGEiOiJzaXNwb2EifSx7InNpc2NnZV9jb2RpZ28iOjM3LCJzaXNjZ2Vfc2lnbGEiOiJjb25hdWQifV0sInJvbGVzIjpbeyJzaXNjZ2VfY29kaWdvIjozMiwicm9sX2NvZGlnbyI6MTc2LCJyb2xfZGVzY3JpcGNpb24iOiJBU0lTVEVOVEUgQURNSU5JU1RSQVRJVk8ifSx7InNpc2NnZV9jb2RpZ28iOjM0LCJyb2xfY29kaWdvIjoxOTAsInJvbF9kZXNjcmlwY2lvbiI6Ik9wZXJhZG9yIEZvcm11bGFyaW8ifSx7InNpc2NnZV9jb2RpZ28iOjM3LCJyb2xfY29kaWdvIjoyMDgsInJvbF9kZXNjcmlwY2lvbiI6Ik9wZXJhZG9yIEZvcm11bGFyaW8ifV0sImlkIjoiMGViNDQ0NzEtZmEyNS00ZDBhLTgxYjMtMzhiNGUzNDliMWM4IiwidGlwbyI6InVzdWFyaW8iLCJpYXQiOjE3MjY4MzU0NjUsImV4cCI6MTcyNjg2NDI2NSwibW9tZW50IjoiMjAyNC0wOS0yMFQwODozMTowNS0wNDowMCJ9.lz3nobWyThW-xHNGFqU8pSAv7uvlf4-I_-Vs6INe5gotGOrRxhRhE5MekqSTHxE3lgKx0zYrBpXISJwBIlsirw
//SISPOA
RptXlsSispoaCompleto.jrxml  (ya esta)
entidad_descripcion		
poa_codigo=(4)&tin_codigo=(1)&aun_codigo_ejecutora=(2,3,4)
poa_codigo=(3)&aun_codigo_ejecutora=(58)
530.0022.9
/actividades/reporte-actividades-poa?$P{s_query}

RptXlsPoasAreasEjecutoras.jrxml  (ya esta)
Entidad
POST 	http://172.16.22.243:7091/reporte-jasper/poa-areas-unidades-ejecutoras
s_poa_codigo=(3)
s_aun_codigo_padre=(58)
s_aun_codigo_hijos=(58)
/poas/report-poa-areas-unidades-ejec


SrptXlsAccionesAct.jrxml  	ENTIDAD
RptXlsAccionesAct.jrxml
//NUEVOS
s_aun_codigo=(58)
s_cac_codigo=(2)
s_pobj_codigo=(777)
/poas-objetivos/excel_obj?
//ANTIGUOS
s_aun_codigo=(1)
s_cac_codigo=(1,3)
s_pobj_codigo=(1365,1366,1603,1604,1608,1654)



//CONAUD  iap_codigos (2,3,4,5,6,7,8,9,10,11,12,20,30,40,50,60,71,80,90,100,110,120,130,140,150,160,170,180,190,200,210,230,300,360,400,500	)   (1,70 no da)
RptPdfActividadF1_A.jrxml	entidad_nombre
/inicio-actividad-poa/summary-report?iap_codigo=$P{s_iap_codigo}
findSummaryByIapCodeForReport

RptPdfActividadF1.jrxml         entidad_nombre
s_iap_codigo=(515)
/inicio-actividad-poa/summary-report?iap_codigo=$P{s_iap_codigo}


RptPdfActividadF2_A		entidad_nombre

/inicio-actividad-poa/summary-seguimiento-report?iap_codigo=$P{s_iap_codigo}

RptPdfActividadF2		entidad_nombre
/inicio-actividad-poa/summary-seguimiento-report?iap_codigo=$P{s_iap_codigo}


SrptPdfActividadF1_A_Interno.jrxml			entidad_nombre
SrptPdfActividadF1Interno.jrxml				entidad_nombre
SrptPdfActividadF2_A_Interno.jrxml			entidad_nombre
SrptPdfActividadF2Interno.jrxml				entidad_nombre




RptPdfActividadFormularioF14.jrxml	talves






&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& CORRECCION DE SISPOA &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
backup_20240920_110104.sql












%%%%%%%%%%% REVISAR %%%%%%%%%%%%%%%%%%%%%%%%%
http://172.16.22.243:3002/conaud/inicio-evaluacion-informe?act_codigo=4744&iua_codigo=855
