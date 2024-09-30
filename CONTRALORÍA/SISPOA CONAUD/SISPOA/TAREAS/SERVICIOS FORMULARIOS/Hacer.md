####FORMULARIOS####
GET
http://172.16.75.100:7091/poas-objetivos/formularios?poa_codigo=(3)&cac_codigo=(1,3,4)&with_rol_formulario=0
-src/feature/poas-objetivos/poas-objetivos.controller.ts
--findAllAunEjecutorasOfPerCodigo
poa_codigo=3
cac_codigo=1,3,4
pobj_estado=2,8
rol_codigo=1,2,3,4
middint_per_codigo=2030

--trae areas unidades responsables por per_codigo
=>resultQuery

==ZZ1==> ~ resultQuery: [
{
aun_codigo_ejecutora: 72,
aun_nombre: 'Gerencia de Auditoría de Empresas Publicas',
aun_sigla: 'SCEP-GAEP',
cau_codigo: 1,
aun_numero: '0701',
nom_ejecutora: 'Gerencia de Auditoría de Empresas Publicas SCEP-GAEP',
aun_reporte_habilitado: false,
roles: [1],
cantidad roles: '1'
}
]
--obtiene su global status:checkFormularioGlobalStatusRefactor  talvez?????
==zz2==>
globalStatus: {
cantidad_actividades: 100,
cantidad_viaticos: 20,
estado_global: 17,
estado_descripcion_global: 'VERIFICADO GI', estado_color_global: '#3390FF',
flagFormulado: true
}
--adiciona a cada area unidad los datos del globalStatus

==ZZ3==>~ resultQuery: [
{
aun_codigo_ejecutora: 72,
aun_nombre: 'Gerencia de Auditoría de Empresas Publicas', aun_sigla: 'SCEP-GAEP',
cau_codigo: 1,
aun_numero: '0701',
nom_ejecutora: 'Gerencia de Auditoría de Empresas Publicas SCEP-GAEP',
aun_reporte_habilitado: false,
roles: [ 1 ],
cantidad roles: '1',
cantidad_actividades: 100,
cantidad_viaticos: 20,
estado_global: 17,
estado_global_descripcion: 'VERIFICADO GI',
estado_global_color: '#3390FF',
flagFormulado: true
}



#####ACCIONES CORTO PLAZO  GNAF
GET
http://172.16.75.100:7091/poas-objetivos/formularios-objetivos?aun_codigo=(9)&poa_codigo=(3)&cac_codigo=(1,3)
--findAllPoasObjetivosOfAunCodigo
--entra
==xX1==>
aun_codigo: '(9)',
poa_codigo: '(3)', cac_codigo: '(1,3)',
middint_per_codigo: 1914,

--obtiene poa
==xX2==>
poas: {
poa_codigo: 3,
poa_descripcion: null,
ges_codigo: 2,
poa_ges_anio: 2024,
tpo_codigo: 2,
poa_tpo_nombre:
'Reformulación',
}
poa_tpo_nombre_number: 'Reformulación (1)',
poa_estado: 1,
est_color: '#54bebe',
poa_estado_descripcion: 'EDICION', fecha_registro: '11:14 am 08/08/2024'

--aumenta variables entrada

==xx3==> query: GetAllAunEjecutoras { 
aun_codigo: '(9)',
poa_codigo: '(3)',
cac_codigo: (1,3)',
middint_per_codigo: 1914,
usuario: 1914,
pobj_estado: '(2,8)'

--obtiene los poas-objetivos con sus programa, pbjetivo area unidad

{
resultQuery: [
pobj_codigo: 757,
pobj_estado: 8,
pro_numero: '00', aun_numero: '0008',
pobj_numero: 26,
pobj_codigo_sigla: '00.0008.26',
pobj_nombre: 'Mantener en un 100% la tasa de eficacia de los servicios administrativos de la CGE a nivel nacional en la ge stión 2024',
pro_codigo: 10
},
{
pobj_codigo: 775,
pobj_estado: 8,
pro_numero: '00',
aun_numero: '0008',
pobj_numero: 27,
pobj_codigo_sigla: '00.0008.27',
pobj_nombre: 'Cumplir con la coordinación y ejecución de actividades gerenciales y administrativas vinculadas al control g ubernamental en la gestión 2024.',
pro_codigo: 10
}
]

--obtiene su global status:checkFormularioGlobalStatusRefactor  talvez?????
cantidad_actividades:1,
cantidad_viaticos:1,
estado_global:17,
estado_descripcion_global:'VERIFICADO GI',
estado_color_global: '#3390FF',
flagFormulado:true

--Obtiene totalHorasPlanificadas
==ss3==> ~ horas:{pobj_codigo:775, total_horas_planificadas: '7272'}"

--adiciona a cada objetivo area unidad los datos del globalStatus

==yy1==>

resultQuery: [
{
pobj_codigo: 757,
pobj_estado: 8,
pro_numero: '00', aun_numero: '0008',
pobj_numero: 26,
pobj_codigo_sigla: '00.0008.26',
pobj_nombre: 'Mantener en un 100% la tasa de eficacia de los servicios administrativos de la CGE a nivel nacional en la ge stión 2024',
pro_codigo: 10,
cantidad_actividades: 0,
cantidad_viaticos: 0,
estado_global: 2,
estado_global_descripcion: 'CONSOLIDADO',
estado_global_color: '#43A047'
},
{
pobj_codigo: 775,
pobj_estado: 8,
pro_numero: '00', aun_numero: '0008',
pobj_numero: 27,
pobj_codigo_sigla: '00.0008.27',
pobj_nombre: 'Cumplir con la coordinación y ejecución de actividades gerenciales y administrativas vinculadas al control g ubernamental en la gestión 2024.',
pro_codigo: 10,
cantidad_actividades: 1,
cantidad_viaticos: 1,
estado_global: 17,
estado_global_descripcion: 'VERIFICADO GI',
estado_global_color: '#3390FF',
total_horas_planificadas: '7272'
}

#######checkFormularioGlobalStatusRefactor
--allFormularioStatus (findAllAunEjecutoraStatusModule)
entra 1:
mm1==>
{
poa_codigo:'(3)',
cac_codigo:'(1,3)',
aun_codigo_ejecutora:'(9)',
pobj_estado:'(2,8)',
pobj_codigo:'(757)'
}

--busca acciones a corto plazo:findAllAunEjecutoraStatusModule
no tiene 

entra 2:
mm1==>
{
poa_codigo:'(3)',
cac_codigo:'(1,3)',
aun_codigo_ejecutora:'(9)',
pobj_estado:'(2,8)',
pobj_codigo:'(775)'
}
--busca acciones a corto plazo:findAllAunEjecutoraStatusModule
mm2==>
{
act_estado:17,
act_codigo_anterior:84,
avi_estado:17,
cantidad_actividades:'1',
cantidad_viaticos:'1',
}

--obtiene el global status:checkLevelStatus
mm3==>
globalStatus = 17
--busca el estado caracteristicas:this.estadosService.findAll
nn1==>
{
est_codigo:17,
est_nombre:'VERIFICADO GI',
est_descripcion:'Estado de verificacion por parte de Gestión Institucional',
est_color:'#3390FF',
}
tt1= for => obtener cantidad actividades:1
tt2= for => obtener cantidad viaticos:1
--envia el objeto con el estado global
{
cantidad_actividades:1,
cantidad_viaticos:1,
estado_global:17,
estado_descripcion_global:'VERIFICADO GI',
estado_color_global:'#3390FF',
flagFormulado:true
}






