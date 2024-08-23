#####ACCIONES CORTO PLAZO  GNAF
GET
http://172.16.75.100:7091/poas-objetivos/formularios-objetivos?aun_codigo=(8)&poa_codigo=(4)&cac_codigo=(1)
--findAllPoasObjetivosOfAunCodigo
==LLEGA==>
aun_codigo_ejecutora: '(8)',
poa_codigo: '(4)', 
cac_codigo: '(1)',
middint_roles:.......
middint_per_codigo: 1914,

--verifica si tiene el rol de Gestion Institucional, busca en middint_roles:checkIfUserGestionInstitucional
==GESTION INSTITUCIONAL==>true (si encuentra)

--obtiene poa:this.poasService.findAll
==POA==>
poas: {
poa_codigo: 4,
poa_descripcion: null,
ges_codigo: 3,
poa_ges_anio: 2025,
tpo_codigo: 1,
poa_tpo_nombre:'Formulación',
poa_tpo_nombre_number: 'Formulación',
poa_estado: 1,
est_color: '#54bebe',
poa_estado_descripcion: 'EDICION', 
fecha_registro: '11:14 am 08/08/2024'
}

--aumenta variables entrada
==query==> query: GetAllAunEjecutoras { 
aun_codigo: '(8)',
poa_codigo: '(4)',
cac_codigo: (1)',
middint_per_codigo: 1914,
usuario: 1914,
pobj_estado: '(2,8)'

--obtiene los poas-objetivos con sus programa, objetivo area unidad:poa_codigo(4),pobj_estado(2,8),aun_codigo_ejecutora(8),oau_estado(2,8)

{
resultQuery: [
pobj_codigo: 1685,
pobj_estado: 8,
pro_numero: '520', 
aun_numero: '0007',
pobj_numero: 10,
pobj_codigo_sigla: '520.0007.10',
pobj_nombre: 'Cumplir con actividades gerenciales y administrativas',
pro_codigo: 3
}
]

--obtiene su global status:checkFormularioGlobalStatusRefactor
==>checkFormularioGlobalStatusRefactor:poa_codigo(4),cac_codigo(1),aun_codigo_ejecutora(8),pobj_estado(2,8)
, pobj_codigo(1685)
cantidad_actividades:2,
cantidad_viaticos:0,
estado_global:1,
estado_descripcion_global:'EDICIÓN',
estado_color_global: '#54bebe',
flagFormulado:false

--Si no encuentra ningun registro de accion a corto plazo
poas.poa_estado !==5 -->estado_global: 2
poas.poa_estado ==5 -->estado_global: 5
estado_global_descripcion:'CONSOLIDADO'

--Obtiene totalHorasPlanificadas
==horas==> ~ horas:{pobj_codigo:1685, total_horas_planificadas: '4'}"

--adiciona a cada objetivo area unidad los datos del globalStatus
==resultQuery==>

resultQuery: [
{
pobj_codigo: 1685,
pobj_estado: 8,
pro_numero: '520', 
aun_numero: '0007',
pobj_numero: 10,
pobj_codigo_sigla: '520.0007.10',
pobj_nombre: 'Cumplir con actividades gerenciales y administrativas',
pro_codigo: 3,
cantidad_actividades:2,
cantidad_viaticos:0,
estado_global:1,
estado_descripcion_global:'EDICIÓN',
estado_color_global: '#54bebe',
flagFormulado:false
}
]
