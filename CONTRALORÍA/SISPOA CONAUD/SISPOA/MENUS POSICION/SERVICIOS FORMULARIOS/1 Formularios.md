####FORMULARIOS####
GET
http://172.16.75.100:7091/poas-objetivos/formularios?poa_codigo=(3)&cac_codigo=(1,3,4)&with_rol_formulario=0
-src/feature/poas-objetivos/poas-objetivos.controller.ts
--findAllAunEjecutorasOfPerCodigo
--LLEGA
poa_codigo=4
cac_codigo=1
pobj_estado=2,8(NO USA)
rol_codigo=1,2,3,4
middint_roles:.......
middint_per_codigo=2030

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
poa_tpo_nombre:
'Formulación',
poa_tpo_nombre_number: 'Formulación',
poa_estado: 1,
est_color: '#54bebe',
poa_estado_descripcion: 'EDICION', fecha_registro: '11:14 am 08/08/2024'
}

==aumenta variables==> query: GetAllAunEjecutoras { 
poa_codigo: '(4)',
cac_codigo: (1)',
middint_per_codigo: 2030,
usuario: 2030,
pobj_estado: '(2,8)'
rol_codigo:(1,2,3,4)

--trae areas unidades responsables por aun_estado(2),rol_codigo(1,2,3,4),poa_codigo(4),per_codigo(2030)
==AREA UNIDAD RESPONSABLES==>~ resultQuery: [
{
aun_codigo_ejecutora: 8,
aun_nombre: 'Subcontraloría de Empresas Públicas',
aun_sigla: 'SCEP', cau_codigo: 1,
aun_numero: '0007',
nom_ejecutora: 'Subcontraloría de Empresas Públicas SCEP', aun_reporte_habilitado: true,
roles: [ 1 ],
cantidad_roles: '1'
},
{
aun_codigo_ejecutora: 72,
aun_nombre: 'Gerencia de Auditoría de Empresas Publicas',
aun_sigla: 'SCEP-GAEP',
cau_codigo: 1,
aun_numero: '0701',
nom_ejecutora: 'Gerencia de Auditoría de Empresas Publicas-SCEP-GAEP',
aun_reporte_habilitado: false,
roles: [ 1 ],
cantidad roles: '1'
}
]

--obtiene su global ==>checkFormularioGlobalStatusRefactor:poa_codigo(4),cac_codigo(1),aun_codigo_ejecutora(8),pobj_estado(2,8)
globalStatus: {
cantidad_actividades: 2,
cantidad_viaticos: 0,
estado_global: 1,
estado_descripcion_global: 'EDICIÓN',
estado_color_global: '#54bebe',
flagFormulado: false
}

--Si no encuentra ningun registro de accion a corto plazo
estado_global: 2
estado_global_descripcion:'CONSOLIDADO'

==>checkFormularioGlobalStatusRefactor:poa_codigo(4),cac_codigo(1),aun_codigo_ejecutora(72),pobj_estado(2,8)
globalStatus: {
cantidad_actividades: 1,
cantidad_viaticos: 0,
estado_global: 1,
estado_descripcion_global: 'EDICIÓN',
estado_color_global: '#54bebe',
flagFormulado: false
}

--adiciona a cada area unidad los datos del globalStatus
==AREA UNIDAD RESPONSABLES==>~ resultQuery: [
{
aun_codigo_ejecutora: 8,
aun_nombre: 'Subcontraloría de Empresas Públicas',
aun_sigla: 'SCEP', cau_codigo: 1,
aun_numero: '0007',
nom_ejecutora: 'Subcontraloría de Empresas Públicas SCEP', aun_reporte_habilitado: true,
roles: [ 1 ],
cantidad_roles: '1',
cantidad_actividades: 2,
cantidad_viaticos: 0,
estado_global: 1,
estado_descripcion_global: 'EDICIÓN',
estado_color_global: '#54bebe',
flagFormulado: false
},
{
aun_codigo_ejecutora: 72,
aun_nombre: 'Gerencia de Auditoría de Empresas Publicas',
aun_sigla: 'SCEP-GAEP',
cau_codigo: 1,
aun_numero: '0701',
nom_ejecutora: 'Gerencia de Auditoría de Empresas Publicas-SCEP-GAEP',
aun_reporte_habilitado: false,
roles: [ 1 ],
cantidad roles: '1',
cantidad_actividades: 1,
cantidad_viaticos: 0,
estado_global: 1,
estado_descripcion_global: 'EDICIÓN',
estado_color_global: '#54bebe',
flagFormulado: false
}
]
