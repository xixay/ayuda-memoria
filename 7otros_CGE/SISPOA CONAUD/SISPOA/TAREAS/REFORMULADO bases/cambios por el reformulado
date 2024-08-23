en ejec=quiere decir que act_estado=2
en edicion=quiere decir que act_estado=1

####ANTES DE REFORMULADO###########
SISPOA				|		CONAUD			|
act1    ejec(si)		|		E1	(70 hrs)	|
act2    ejec(no)		|		X			|

####DEsPUES DE REFORMULADO#########
-LOS CLONES DE LA ACTIVIDAD SE VA A COPIAR CON ESTADO 1, SI ESTA EN EJECUCION EN CONAUD, IGUAL, PERO SI ESTA EN EJECUCION SE REGISTRARA EN LA COLUMNA VERDADERO
---------SISPOA----------
ACTIVIDADES			|		act_ejecucion_conaud	|
act1'    edicion(si)		|		(v)			|
act2'    edicion(si)		|		(f)			|

- SI LA NUEVA COLUMNA ESTA EN VERDADERO, AL MOMENTO DE EDITAR LAS ACTIVIDADES REFORMULADAS EN F26, SOLO SE PODRA EDITAR LAS HORAS,
PERO LAS HORAS a EDITAR DEBEN SER > o = a 70 hrs del conaud(osea la suma de todas las comisiones )

- SI LA NUEVA COLUMNA ESTA EN FALSO, SE LA EDICION NORMAL DE LA ACTIVIDAD REFORMULADA EN F26

- AL ESTAR EN EDICION, YA SEA QUE ESTE EN EJECUCION Ó NO , PUEDE SEGUIR LOS FLUJOS DE (VERIFICADO,APROB, APROBA SUP)

$$$$$$$$$$$$$$$$$$PROBAR$$$$$$$$$$$$
1 ### ESTE TIENE EN INFORMES UAI
informe_uai
-inicio_evaluacion_informe
-inicio_evaluacion_informe_asignaciones(asi_codigo)

GDB-GAM
accion a corto plazo=510.1902
actividad=510.1902.33.5.24

#CONAUD
#INFORMES UAI 
http://172.16.75.100:3002/conaud/informes-uai?act_codigo=1391&ges_codigo=2&rol=0
act_codigo_anterior=1391

GET     http://172.16.75.100:7002/asignaciones-cargos-item?asi_codigo=(743)&aci_estado=(1,2,21)
asi_codigo=743
aci_estado=2
aci_codigo	|	cit_codigo
2884		|	505
2883		|	454
2882		|	541
2880		|	559
2881		|	108
2 ### ESTE TIENE EN INFORMES UAI
act_codigo_anterior=1219
GDT-GAD1
accion a corto plazo=500.1702
actividad=500.1702.98.1.24

3 ### ESTE TIENE EN INFORMES UAI
act_codigo_anterior=1305
GDT-GAD2
accion a corto plazo=500.1704
actividad=500.1704.98.1.24

#### ESTE TIENE EN ADMINISTRATIVAS
act_codigo_anterior=390
#### ESTE TIENE EN INICIO ACTIVIDAD POA
act_codigo_anterior=390


