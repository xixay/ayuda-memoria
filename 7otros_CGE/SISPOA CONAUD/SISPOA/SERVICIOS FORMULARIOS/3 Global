#######checkFormularioGlobalStatusRefactor
--allFormularioStatus (findAllAunEjecutoraStatusModule)
ENTRA==>
{
poa_codigo:'(4)',
cac_codigo:'(1)',
aun_codigo_ejecutora:'(8)',
pobj_estado:'(2,8)',
pobj_codigo:'(1685)'//solo llega cuando viene de findAllPoasObjetivosOfAunCodigo
}

--busca poa_objetivos(relacionado obj_area_unidad,actividades y viaticos) plazo:findAllAunEjecutoraStatusModule:poa_codigo(4),pobj_estado(2,8),pobj_codigo(1685),aun_codigo_ejecutora(8)
cac_codigo(1)
{
act_estado:1,
act_codigo_anterior:null,
avi_estado:null,
cantidad_actividades:'3',
cantidad_viaticos:'0',
}

--obtiene el global status:checkLevelStatus
globalStatus = 1

--busca el estado caracteristicas:this.estadosService.findAll
ESTADO==>
{
est_codigo:1,
est_nombre:'EDICION',
est_descripcion:'EDICION',
est_color:'#54bebe',
flagFormulado:false,
}

tt1= itera en un for => obtener cantidad actividades:1
tt2= itera en un for => obtener cantidad viaticos:0

--envia el objeto con el estado global
{
cantidad_actividades:1,
cantidad_viaticos:0,
estado_global:1,
estado_descripcion_global:'EDICION',
estado_color_global:'#54bebe',
flagFormulado:false
}

