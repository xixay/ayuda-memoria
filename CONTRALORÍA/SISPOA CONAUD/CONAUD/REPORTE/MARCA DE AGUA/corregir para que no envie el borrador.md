bd_cge_poa_conaud_local_b
postgres

Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJwZXJfY29kaWdvIjo0NjEsInNpc3RlbWFzIjpbeyJzaXNjZ2VfY29kaWdvIjozMiwic2lzY2dlX3NpZ2xhIjoiY29ycmVzcG9uZGVuY2lhX2ludGVybmEifSx7InNpc2NnZV9jb2RpZ28iOjM0LCJzaXNjZ2Vfc2lnbGEiOiJzaXNwb2EifSx7InNpc2NnZV9jb2RpZ28iOjM3LCJzaXNjZ2Vfc2lnbGEiOiJjb25hdWQifV0sInJvbGVzIjpbeyJzaXNjZ2VfY29kaWdvIjozMiwicm9sX2NvZGlnbyI6MTc2LCJyb2xfZGVzY3JpcGNpb24iOiJBU0lTVEVOVEUgQURNSU5JU1RSQVRJVk8ifSx7InNpc2NnZV9jb2RpZ28iOjM0LCJyb2xfY29kaWdvIjoxOTAsInJvbF9kZXNjcmlwY2lvbiI6Ik9wZXJhZG9yIEZvcm11bGFyaW8ifSx7InNpc2NnZV9jb2RpZ28iOjM3LCJyb2xfY29kaWdvIjoyMDgsInJvbF9kZXNjcmlwY2lvbiI6Ik9wZXJhZG9yIEZvcm11bGFyaW8ifV0sImlkIjoiZjE4NDkyMTctNWE0My00ZmE3LWE5YjMtNTY5MDM5ZTg5YjcyIiwidGlwbyI6InVzdWFyaW8iLCJpYXQiOjE3MjE2NTQxNzcsImV4cCI6MTcyMTY4Mjk3NywibW9tZW50IjoiMjAyNC0wNy0yMlQwOToxNjoxNy0wNDowMCJ9.bIc3PhjrtewFQlQEWD5o_Bk3mLjCqriUcs9T6YOzIlcsRbbGUe6W5E-HFEj_mBf6pKBv2GiDY0or41p1E9h5YQ


- PARA LOS F1, F1-A, F2, F1-A, hacer que ya no dependa de la bandera que se le envia, que directamente se fije en el estado para agregar la marca de agua en borrador
- Fijarse el F26B, para ver ahi no le manda una bandera

4813387 = ROL_GESTION_INSTITUCIONAL_APROBADOR
4385501 = ROL_GESTION_INSTITUCIONAL_VERIFICADOR
(5922785)JUAN CARLOS FLORES ARIAS = FORMULADOR GERENTE 
(5922785)JUAN CARLOS FLORES ARIAS = FORMULADOR
(5922785)JUAN CARLOS FLORES ARIAS = SUPERVISOR
(5922785)JUAN CARLOS FLORES ARIAS= APROBADOR

4813387 = ROL_GESTION_INSTITUCIONAL_APROBADOR
4385501 = ROL_GESTION_INSTITUCIONAL_VERIFICADOR
####  F1  #######
Gerencia Departamental de Servicios Legales - GDS-GSL
(EN VERIFICACIÓN)
act_codigo=1453 			00.1401.100.6.24 	iap_codigo=547

Gerencia Departamental de Auditoría en Gobiernos Departamentales - GDC- GAD
(EN EJECUCION)
act_codigo=2936 			520.1302.237.1.24		iap_codigo=515

SCEP-GAEP
(HISTORICO)
act_codigo=1487 			520.0007.26.3.24 	iap_codigo=481

##### F1-A #######
(EDICION : AMPLIACIÓN)
GDT-GAM1
act_codigo=655 				520.1703.118.1.24 	iap_codigo=534

(EJECUCION)
SCEP-GAEP
act_codigo=495 				520.0007.26.3.24 	iap_codigo=536

(HISTORICO)
SCEP-GAEP
act_codigo=1457 			520.1702.112.3.24 	iap_codigo=510

##### F2 #######
(EDICION)
GDB-GAD
act_codigo=93 				500.1902.110.2.24	iap_codigo=529

(EJECUCION)
Unidad de Auditoría Interna - UAI
act_codigo=1224 			00.0023.77.2.24 	iap_codigo=278

##### F2-A  #####   xxxxxxxxxFALTAxxxxxxxxxxxxxxxxx
(EDICION)
Gerencia Departamental de Auditoría en Gobiernos Departamentales - GDN-GAD
act_codigo=1789 			500.1801.104.1.24 	iap_codigo=573

(EJECUCION)
Gerencia Departamental de Auditoría en Gobiernos Departamentales - GDO-GAD
act_codigo=1788 			500.2002.120.1.24 	iap_codigo=574

################################################
REPORTES F1, F1_A, F2, F2_A
----------------------------------
Detalles de implementacion:
Reportes:
RptPdfActividadF1.jrxml
RptPdfActividadF1_A.jrxml
RptPdfActividadF2.jrxml
RptPdfActividadF2_A.jrxml
Subreportes:
------------

Inputs:
/Data_Source/Input_Control/conaud/s_token
/Data_Source/Input_Control/conaud/s_iap_codigo
/Data_Source/Input_Control/conaud/s_i_bandera_borrador (QUITAR)
/Data_Source/Input_Control/conaud/s_inf_codigo (QUITAR)

Logotipo Institucional: Images/logo_cge.png
################################################


